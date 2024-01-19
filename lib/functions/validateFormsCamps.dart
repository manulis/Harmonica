import 'package:email_validator/email_validator.dart';

//Funciones de validación

bool emailValidate(String? email){
  bool isValid = EmailValidator.validate(email!);
  return isValid;
}

bool phoneValidate(String? phone){
  if(phone == ''){
    return true;
  }
  RegExp regExp = RegExp(r'^\d{9}$');
  return regExp.hasMatch(phone!);
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