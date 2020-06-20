import 'package:the_third/index.dart';

class Storage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<SignInInfoType> getInfo() async {
    SignInInfoType info;
    try {
      final SharedPreferences prefs = await _prefs;
      var _info = prefs.getString(KEY_INFO);
      if (_info != null) {
        info = SignInInfoType.fromJson(json.decode(_info));
      } else {
        print("Can not get info data");
      }

      print("Storage => getInfo => Result => ${json.encode(info)}");
      return info;
    } catch (err) {
      showShortToast("Error: ${err.toString()}");
      print("MainScript => getInfo => Err ${err.toString()} ");
      return null;
    }
  }

  Future<bool> saveInfo(SignInInfoType _input) async {
    try {
      final SharedPreferences prefs = await _prefs;
      var _storage = json.encode(_input);
      prefs.setString(KEY_INFO, _storage);
      print("MainScript => saveInfo => _input $_storage ");
      return true;
    } catch (err) {
      return false;
    }
  }
}

class StringHandler {
  String handlePhoneNo(String input) {
    String _result = input;

    if (input.substring(0, 1) == "0") {
      return "+84${_result.substring(1)}";
    }

    return "+84$_result";
  }
}
