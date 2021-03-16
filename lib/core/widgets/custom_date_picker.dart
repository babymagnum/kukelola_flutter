import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';

class CustomTimePicker extends CommonPickerModel {
  final bool showSecondsColumn;

  int _currentLeftIndex;
  int _currentMiddleIndex;
  int _currentRightIndex;

  CustomTimePicker({DateTime currentTime, LocaleType locale, this.showSecondsColumn: true})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();

    _currentLeftIndex = this.currentTime.hour;
    _currentMiddleIndex = this.currentTime.minute;
    _currentRightIndex = this.currentTime.second;
  }

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  @override
  int currentLeftIndex() {
    super.currentLeftIndex();

    return _currentLeftIndex;
  }

  @override
  int currentMiddleIndex() {
    super.currentMiddleIndex();

    return _currentMiddleIndex;
  }

  @override
  int currentRightIndex() {
    super.currentRightIndex();

    return _currentRightIndex;
  }

  @override
  void setLeftIndex(int index) {
    // TODO: implement setLeftIndex
    super.setLeftIndex(index);

    currentTime = DateTime(currentTime.year, currentTime.month, currentTime.day, index, currentTime.minute, currentTime.second);
  }

  @override
  void setMiddleIndex(int index) {
    // TODO: implement setMiddleIndex
    super.setMiddleIndex(index);

    currentTime = DateTime(currentTime.year, currentTime.month, currentTime.day, currentTime.hour, index, currentTime.second);
  }

  @override
  void setRightIndex(int index) {
    // TODO: implement setRightIndex
    super.setRightIndex(index);

    currentTime = DateTime(currentTime.year, currentTime.month, currentTime.day, currentTime.hour, currentTime.minute, index);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return ":";
  }

  @override
  String rightDivider() {
    if (showSecondsColumn)
      return ":";
    else
      return "";
  }

  @override
  List<int> layoutProportions() {
    if (showSecondsColumn)
      return [1, 1, 1];
    else
      return [1, 1, 0];
  }

  @override
  DateTime finalTime() {
    return currentTime;
  }
}

class CustomDatePicker extends CommonPickerModel {
  DateTime maxTime;
  DateTime minTime;
  int _currentLeftIndex;
  int _currentMiddleIndex;
  int _currentRightIndex;

  List<int> _leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];

  CustomDatePicker({
    DateTime currentTime,
    DateTime maxTime,
    DateTime minTime,
    LocaleType locale
  }): super(locale: locale) {
    this.maxTime = maxTime ?? DateTime(2049, 12, 31);
    this.minTime = minTime ?? DateTime(1970, 1, 1);

    currentTime = currentTime ?? DateTime.now();
    if (currentTime != null) {
      if (currentTime.compareTo(this.maxTime) > 0) {
        currentTime = this.maxTime;
      } else if (currentTime.compareTo(this.minTime) < 0) {
        currentTime = this.minTime;
      }
    }
    this.currentTime = currentTime;

    _fillLeftLists();
    _fillMiddleLists();
    _fillRightLists();
    int minMonth = _minMonthOfCurrentYear();
    int minDay = _minDayOfCurrentMonth();
    _currentRightIndex = this.currentTime.year - this.minTime.year;
    _currentMiddleIndex = this.currentTime.month - minMonth;
    _currentLeftIndex = this.currentTime.day - minDay;
  }

  @override
  int currentLeftIndex() {
    super.currentLeftIndex();

    return _currentLeftIndex;
  }

  @override
  int currentMiddleIndex() {
    super.currentMiddleIndex();

    return _currentMiddleIndex;
  }

  @override
  int currentRightIndex() {
    super.currentRightIndex();

    return _currentRightIndex;
  }

  int calcDateCount(int year, int month) {
    if (_leapYearMonths.contains(month)) {
      return 31;
    } else if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }

  void _fillLeftLists() {
    int maxDay = _maxDayOfCurrentMonth();
    int minDay = _minDayOfCurrentMonth();
    this.leftList = List.generate(maxDay - minDay + 1, (int index) {
      return '${minDay + index}${_localeDay()}';
    });
  }

  int _maxMonthOfCurrentYear() {
    return currentTime.year == maxTime.year ? maxTime.month : 12;
  }

  int _minMonthOfCurrentYear() {
    return currentTime.year == minTime.year ? minTime.month : 1;
  }

  int _maxDayOfCurrentMonth() {
    int dayCount = calcDateCount(currentTime.year, currentTime.month);
    return currentTime.year == maxTime.year &&
        currentTime.month == maxTime.month
        ? maxTime.day
        : dayCount;
  }

  int _minDayOfCurrentMonth() {
    return currentTime.year == minTime.year &&
        currentTime.month == minTime.month
        ? minTime.day
        : 1;
  }

  void _fillMiddleLists() {
    int minMonth = _minMonthOfCurrentYear();
    int maxMonth = _maxMonthOfCurrentYear();

    this.middleList = List.generate(maxMonth - minMonth + 1, (int index) {
      return '${_localeMonth(minMonth + index)}';
    });
  }

  void _fillRightLists() {
    this.rightList =
        List.generate(maxTime.year - minTime.year + 1, (int index) {
          return '${minTime.year + index}${_localeYear()}';
        });
  }

  @override
  void setLeftIndex(int index) {
    super.setLeftIndex(index);

    int minDay = _minDayOfCurrentMonth();
    currentTime = currentTime.isUtc
        ? DateTime.utc(
      currentTime.year,
      currentTime.month,
      minDay + index,
    )
        : DateTime(
      currentTime.year,
      currentTime.month,
      minDay + index,
    );
  }

  @override
  void setMiddleIndex(int index) {
    super.setMiddleIndex(index);
    //adjust right
    int minMonth = _minMonthOfCurrentYear();
    int destMonth = minMonth + index;
    DateTime newTime;
    //change date time
    int dayCount = calcDateCount(currentTime.year, destMonth);
    newTime = currentTime.isUtc
        ? DateTime.utc(
      currentTime.year,
      destMonth,
      currentTime.day <= dayCount ? currentTime.day : dayCount,
    )
        : DateTime(
      currentTime.year,
      destMonth,
      currentTime.day <= dayCount ? currentTime.day : dayCount,
    );
    //min/max check
    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
    } else {
      currentTime = newTime;
    }

    _fillLeftLists();
  }

  @override
  void setRightIndex(int index) {
    super.setRightIndex(index);

    //adjust middle
    int destYear = index + minTime.year;
    DateTime newTime;
    //change date time
    if (currentTime.month == 2 && currentTime.day == 29) {
      newTime = currentTime.isUtc
          ? DateTime.utc(
        destYear,
        currentTime.month,
        calcDateCount(destYear, 2),
      )
          : DateTime(
        destYear,
        currentTime.month,
        calcDateCount(destYear, 2),
      );
    } else {
      newTime = currentTime.isUtc
          ? DateTime.utc(
        destYear,
        currentTime.month,
        currentTime.day,
      )
          : DateTime(
        destYear,
        currentTime.month,
        currentTime.day,
      );
    }
    //min/max check
    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
    } else {
      currentTime = newTime;
    }

    _fillMiddleLists();
    _fillLeftLists();
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < leftList.length) {
      return leftList[index];
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < middleList.length) {
      return middleList[index];
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < rightList.length) {
      return rightList[index];
    } else {
      return null;
    }
  }

  String _localeYear() {
    if (locale == LocaleType.zh) {
      return '年';
    } else if (locale == LocaleType.ko) {
      return '년';
    } else {
      return '';
    }
  }

  String _localeMonth(int month) {
    if (locale == LocaleType.zh) {
      return '$month月';
    } else if (locale == LocaleType.ko) {
      return '$month월';
    } else {
      List monthStrings = i18nObjInLocale(locale)['monthLong'];
      return monthStrings[month - 1];
    }
  }

  String _localeDay() {
    if (locale == LocaleType.zh) {
      return '日';
    } else if (locale == LocaleType.ko) {
      return '일';
    } else {
      return '';
    }
  }

  @override
  DateTime finalTime() {
    return currentTime;
  }
}

enum DateTimePickerType {
  dayMonthYear, monthYear, year, hourMinuteSecond, hourMinute
}

class DateTimePickerComponent extends StatefulWidget {
  DateTimePickerComponent({Key key, this.onChanged, this.pickerModel, this.onPick, this.pickerType});

  final DateChangedCallback onChanged;
  final BasePickerModel pickerModel;
  final Function onPick;
  final DateTimePickerType pickerType;

  @override
  State<StatefulWidget> createState() {
    return DateTimePickerState();
  }
}

class DateTimePickerState extends State<DateTimePickerComponent> {
  FixedExtentScrollController leftScrollCtrl, middleScrollCtrl, rightScrollCtrl;

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
    leftScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentLeftIndex());
    middleScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentMiddleIndex());
    rightScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentRightIndex());
  }

  @override
  Widget build(BuildContext context) {
    DatePickerTheme theme = DatePickerTheme(
      itemHeight: (41.8).h,
      itemStyle: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp),
    );
    return _renderItemView(theme);
  }

  _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged(widget.pickerModel.finalTime());
    }
  }

  Widget _leftColumn(DatePickerTheme theme) {
    return _renderColumnView(
        ValueKey(widget.pickerModel.currentLeftIndex()),
        theme,
        widget.pickerModel.leftStringAtIndex,
        leftScrollCtrl, (index) {
      widget.pickerModel.setLeftIndex(index);
    }, (index) {
      setState(() {
        refreshScrollOffset();
        _notifyDateChanged();
      });
    });
  }

  Widget _midColumn(DatePickerTheme theme) {
    return _renderColumnView(
        ValueKey(widget.pickerModel.currentLeftIndex()),
        theme,
        widget.pickerModel.middleStringAtIndex,
        middleScrollCtrl, (index) {
      widget.pickerModel.setMiddleIndex(index);
    }, (index) {
      setState(() {
        refreshScrollOffset();
        _notifyDateChanged();
      });
    });
  }

  Widget _rightColumn(DatePickerTheme theme) {
    return _renderColumnView(
        ValueKey(widget.pickerModel.currentMiddleIndex() +
            widget.pickerModel.currentLeftIndex()),
        theme,
        widget.pickerModel.rightStringAtIndex,
        rightScrollCtrl, (index) {
      widget.pickerModel.setRightIndex(index);
    }, (index) {
      setState(() {
        refreshScrollOffset();
        _notifyDateChanged();
      });
    });
  }

  Widget _rowPicker(DatePickerTheme theme) {
    if (widget.pickerType == DateTimePickerType.dayMonthYear) {
      return Row(
        children: <Widget>[
          _leftColumn(theme),
          _midColumn(theme),
          _rightColumn(theme),
        ],
      );
    } else if (widget.pickerType == DateTimePickerType.monthYear) {
      return Row(
        children: <Widget>[
          _midColumn(theme),
          _rightColumn(theme),
        ],
      );
    } else if (widget.pickerType == DateTimePickerType.hourMinuteSecond) {
      return Row(
        children: <Widget>[
          _leftColumn(theme),
          _midColumn(theme),
          _rightColumn(theme),
        ],
      );
    } else if (widget.pickerType == DateTimePickerType.hourMinute) {
      return Row(
        children: <Widget>[
          _leftColumn(theme),
          _midColumn(theme),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          _rightColumn(theme)
        ],
      );
    }
  }

  Widget _renderItemView(DatePickerTheme theme) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 4.h,
              width: 30.w,
              decoration: BoxDecoration(
                  color: ThemeColor.textGrey7b,
                  borderRadius: BorderRadius.all(Radius.circular(1000))),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  alignment: Alignment.center,
                ),
                _rowPicker(theme),
                IgnorePointer(
                  child: Container(
                    height: 230,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.white.withOpacity(0.7),
                            )),
                        Container(
                          height: 41.8,
                          color: Colors.transparent,
                        ),
                        Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.white.withOpacity(0.7),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 36.w, right: 36.w, bottom: 16.h),
              child: ButtonLoading(
                backgroundColor: ThemeColor.primary,
                disable: false,
                title: 'Pick',
                loading: false,
                verticalPadding: 5.h,
                onTap: widget.onPick,
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 16.ssp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderColumnView(
      ValueKey key,
      DatePickerTheme theme,
      StringAtIndexCallBack stringAtIndexCB,
      ScrollController scrollController,
      ValueChanged<int> selectedChangedWhenScrolling,
      ValueChanged<int> selectedChangedWhenScrollEnd) {
    return Expanded(
      child: Container(
          height: 230,
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    selectedChangedWhenScrollEnd != null &&
                    notification is ScrollEndNotification &&
                    notification.metrics is FixedExtentMetrics) {
                  final FixedExtentMetrics metrics = notification.metrics;
                  final int currentItemIndex = metrics.itemIndex;
                  selectedChangedWhenScrollEnd(currentItemIndex);
                }
                return false;
              },
              child: CupertinoPicker.builder(
                  key: key,
                  backgroundColor: Colors.transparent,
                  scrollController: scrollController,
                  itemExtent: theme.itemHeight,
                  onSelectedItemChanged: (int index) {
                    selectedChangedWhenScrolling(index);
                  },
                  useMagnifier: true,
                  itemBuilder: (BuildContext context, int index) {
                    final content = stringAtIndexCB(index);
                    if (content == null) {
                      return null;
                    }
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        style: theme.itemStyle,
                        textAlign: TextAlign.start,
                      ),
                    );
                  }))),
    );
  }
}