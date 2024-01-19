import 'package:email_validator/email_validator.dart';

//Funciones de validación

bool emailValidate(String? value){
  bool isValid = EmailValidator.validate(value!);
  return isValid;
}

bool phoneValidate(String? value){
  if(value == ''){
    return true;
  }
  RegExp regExp = RegExp(r'^\d{9}$');
  return regExp.hasMatch(value!);
}

bool passwordValidate(String? value){
    
  value = value!;

  if (value.length < 8) {
    return false;
  }

  if (!value.contains(RegExp(r'[a-z]'))) {
    return false;
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return false;
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return false;
  }

  if(value == ''){
    return false;
  }

  return true;

}


//Funciones que en el caso de que un parametro no sea valido o este vacio lo indique en el formulario
String?  FocusEmail(String? value){
  if(value == ''){
    return 'The field is required';
  }
  if(!emailValidate(value)){
    return 'Email invalido';
  }
  return null;
}

String? FocusPhone(String? value){
  if(!phoneValidate(value)){
    return 'Telefono invalido';
  }
}

String? FocusName(String? value) {
  if (value == null || value.isEmpty){
    return 'The field is required';
  }
  return null;
}

String? FocusPassword(String? value){



}