import 'package:email_validator/email_validator.dart';




bool emailValidate(String email){
  if(email.isEmpty){
    return false;
  }else{
    bool isValid = EmailValidator.validate(email);
    return isValid;
  }
}

bool phoneValidate(String phone){
  RegExp regExp = RegExp(r'^\+34\s\d{3}\s\d{3}\s\d{3}$');
  return regExp.hasMatch(phone);
}