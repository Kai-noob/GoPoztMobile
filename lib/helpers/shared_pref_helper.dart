import 'dart:convert';



import 'package:mengo_delivery/models/parcel_model.dart';
import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _token = 'token';

  static const String _userId = 'userId';

  static const String _lightThemeKey = 'is_theme_light';
  static const String _senderForm = 'senderForm';
  static const String _receiverForm = 'receiverForm';
  static const String _parcelDetails = 'parcelDetails';

  static const String _pickUpTime = 'pickUpTime';

  /// init get storage services
  static Future<void> init(SharedPreferences sharedPreferences) async {
    _sharedPreferences = sharedPreferences;
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ??
      true; // todo set the default theme (true for light, false for dark)

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  // /// get current locale
  // static Locale getCurrentLocal(){
  //     String? langCode = _sharedPreferences.getString(_currentLocalKey);
  //     // default language is english
  //     if(langCode == null){
  //       return LocalizationService.defaultLanguage;
  //     }
  //     return LocalizationService.supportedLanguages[langCode]!;
  // }

  static Future<void> setToken(String token) =>
      _sharedPreferences.setString(_token, token);

  static String? getToken() => _sharedPreferences.getString(_token);

  static Future<void> setUserId(int userId) =>
      _sharedPreferences.setInt(_userId, userId);

  static int? getUserId() => _sharedPreferences.getInt(_userId);

  /// save generated fcm token
  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  
  static Future<void> setSenderForm(SenderModel senderModel) {
    final jsonString = jsonEncode(senderModel.toJson());
    return _sharedPreferences.setString(_senderForm, jsonString);
  }

  
  static Future<void> setPickUpTime(String pickUpTime) =>
      _sharedPreferences.setString(_pickUpTime, pickUpTime);

  /// get authorization token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);


  static String? getPickUpTime() {
    final String? jsonString = _sharedPreferences.getString(_pickUpTime);
    if (jsonString != null) {
      return jsonString;
    } else {
      return null;
    }
  }

 
  static SenderModel? getSenderFrom() {
    final jsonString = _sharedPreferences.getString(_senderForm);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return SenderModel.fromJson(jsonMap);
    } else {
      return null;
    }
  }

  

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();
  static Future<void> clearForm() async {
    await _sharedPreferences.remove(_senderForm);
    await _sharedPreferences.remove(_receiverForm);
    await _sharedPreferences.remove(_parcelDetails);
    await _sharedPreferences.remove(_pickUpTime);
  }
}
