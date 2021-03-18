import 'dart:convert';
import 'dart:io';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:get/get.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class WorkflowApprovalDetailController extends GetxController {
  var loadingAttachment = false.obs;
  var errorAttachment = false.obs;
  var attachmentData = FileAttachmentData().obs;

  setAttachmentData(FileAttachmentData value) => attachmentData.value = value;

  getAttachment(String attachmentId) async {
    loadingAttachment.value = true;
    final data = await Service().fileAttachment(attachmentId);
    loadingAttachment.value = false;

    if (data?.data != null) {
      errorAttachment.value = false;
      attachmentData.value = data.data;
    } else {
      errorAttachment.value = true;
    }
  }
}