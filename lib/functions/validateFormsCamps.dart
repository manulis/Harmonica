import 'package:email_validator/email_validator.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//Funciones de validación
bool emailValidate(String? value) => EmailValidator.validate(value!);
bool phoneValidate(String? value) => value == '' ? true : RegExp(r'^\d{9}$').hasMatch(value!);

class PasswordValidate {
  static bool charactersNum(String? value) => value!.length >= 8;
  static bool LowerCase(String? value) => value!.contains(RegExp(r'[a-z]'));
  static bool UpperCase(String? value) => value!.contains(RegExp(r'[A-Z]'));
  static bool containNumber(String? value) => value!.contains(RegExp(r'[0-9]'));
  static bool GoodPassword(String value) => charactersNum(value) && LowerCase(value) && UpperCase(value) && containNumber(value) && value.isNotEmpty;
}

//Funciones que en el caso de que un parámetro no sea válido o esté vacío lo indique en el formulario
String? FocusName(String? value){
  if(value == null || value.isEmpty){
    return 'This field is required';
  }
  if(userHandler.NameExists){
    return 'This name is alredy used';
  }
  return null;
} 
String? FocusEmail(String? value) {
 if(value == null || value.isEmpty){
    return 'This field is required';
  }
  if(!emailValidate(value)){
    return 'This email is invalid';
  }
  if(userHandler.EmailExists){
    return 'This email is alredy used';
  }
  return null;
}
String? FocusPhone(String? value) {
  if(!phoneValidate(value)){
    return 'Invalid Phone';
  }
  if(userHandler.PhoneExists){
    return 'This phone is alredy used';
  }
  return null;
} 

String? FocusPassword(String? value) {
  if (value == null || value.isEmpty) return 'This field is required';
  if (!PasswordValidate.charactersNum(value)) return '8 characters minimum';
  if (!PasswordValidate.LowerCase(value)) return 'At least one lowercase character';
  if (!PasswordValidate.UpperCase(value)) return 'At least one uppercase character';
  if (!PasswordValidate.containNumber(value)) return 'At least one number';
  return null;
}
