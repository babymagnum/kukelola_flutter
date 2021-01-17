# Satu Pos Flutter

# Getting Started

1. Change the name of the folder
2. Change the git remote url with your current repo url `git remote set-url origin https://github.com/USERNAME/REPOSITORY.git`
3. run `flutter channel master` in terminal -> change to channel master to best support
4. run `flutter pub get` in terminal -> get the packages defined in pubspec.yaml class
5. run `flutter clean` in terminal -> clean the flutter project
6. Change Information Android -> change `package`, `android:label` from `android/app/src/main/AndroidManifest.xml` -> then change `applicationId` from `android/app/build.gradle` -> search file of `MainActivity.kt` or `MainActivity.java`, then change the package value to desired package name -> change file path of `MainActivity.kt` or `MainActivity.java`, example is like this `android\app\src\main\kotlin\id\ndonproject\agenparkir`
7. For iOS change it from info.plist file located in `ios/Runner/info.plist`
7. Change app icon -> set url of the icon you want to use in pubspec.yaml file, then run `flutter pub run flutter_launcher_icons:main`

# Basic packages used

1. getx for state management, route management, dependency injection
2. get_it for dependency injection
3. dio for http request, http package use for optionally call request that doesnt support serialize with dio
4. shimmer for create shimmer loading like facebook
5. connectivity for check the device connection
6. shared_preferences for save local data
7. etc

# Networking schema

1. Create class for response model, example in `success.dart`
2. Register model class that we wrote before to `base_service.dart` so we can easily parse the json with class model (look at the fromJson method in `base_service.dart`) 
3. Create class service (example in `user_service.dart`) for call the http method writen in `base_service.dart`
4. Create method in `user_service.dart` for example you can look doLogin method, in there we pass `success.dart` class to the generics class to, which mean we want the result of the http request to that class model.
5. Call `user_service.dart` class anywhere you want to do http request, in the example we call it in `base_stores.dart`, because we use mobx for state management wen can place the http transaction in the stores class so it can be modular.

