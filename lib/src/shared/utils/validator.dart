
import 'package:app_demo/src/shared/utils/email_validator.dart';

class Validator {

  static bool isValidEmail(String? value){
    if(value == null){
      return false;
    }
    if(value.isEmpty){
      return false;
    }
    if(value.length < 4){
      return false;
    }
    return EmailValidator.validate(value);
  }

  static bool isValidPassword(String? value){
    if(value == null){
      return false;
    }
    if(value.isEmpty){
      return false;
    }
    if(value.length < 5){
      return false;
    }
    // bool passValid = RegExp(
    //         "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
    //     .hasMatch(value);
    // if(!passValid){
    //   return false;
    // }

    return true;

  }
}