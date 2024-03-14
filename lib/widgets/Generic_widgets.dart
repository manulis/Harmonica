import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/screens/Home.dart';
import 'package:harmonica/objects/User.dart' as UserObject;

//Cabecera con Logo:
Widget headLogo(double height){
  return SizedBox(
     height: height/4,
      child:  
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/LogoPositivo.png", width: 300),
      ]),
  );
}



//Botones:
Widget buildButton(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      
      padding: const EdgeInsets.all(20.0),
      minimumSize: const Size(191.0, 60.0),
      backgroundColor: Color.fromRGBO(102, 61, 168, 1),
      foregroundColor: Colors.white,
      
    ),
    child: Text(text),
  );
}

Widget buildButton2(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
      padding: const EdgeInsets.all(15.0),
      minimumSize: const Size(300.0, 60.0),
      backgroundColor: Color.fromRGBO(102, 61, 168, 1),
      foregroundColor: Colors.white,
    ),
    child: Text(text),
  );
}

Widget buildClickableText(String text, VoidCallback onTap) {
  return Material(
    child: InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(color: const Color.fromRGBO(59, 6, 69, 1), fontSize: 12),
        
      ),
    ),
  );
}


//Pop up
void GenericPopUp(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center,),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}


void GenericPopUpWithIcon(BuildContext context, VoidCallback onContinuePressed, Icon icon, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: icon,
        content: Text(content, textAlign:TextAlign.center,),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onContinuePressed(); 
            },
            child: const Text("Continuar"),
          ),
        ],
      );
    },
  );
}

//Form widgets
class GenericTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator; // Modificado el tipo del parámetro
  final String labelText;
  final String hintText;
  final IconData suffixIcon;
  final void Function(String) onChanged;

  GenericTextField({
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.onChanged,
  });

  @override
  _GenericTextFieldState createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (text) => widget.validator(text ?? ''),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        hintText: widget.hintText,
        suffixIcon: Icon(widget.suffixIcon),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 172, 172, 172),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final void Function(bool) onToggleObscureText;
  final void Function(String) onChanged;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.onToggleObscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 172, 172, 172),
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            onToggleObscureText(!obscureText);
          },
        ),
      ),
      onChanged: onChanged,
    );
  }
}


//Loading widgets

final spinkit = SpinKitFadingFour(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      
      decoration: BoxDecoration(
        color: index.isEven ? Color.fromRGBO(59, 6, 69, 1): Color.fromRGBO(102, 61, 168, 1),
      ),
    );
  },
);


class loadingPage extends StatefulWidget{
  @override
  _loadingPage createState() => _loadingPage();
}
class _loadingPage extends State<loadingPage>{
  @override
  Widget build(BuildContext context){
    final screenheight = MediaQuery.of(context).size.height;
    return Container(
      height: screenheight/2,
      child:  
      Padding(padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: SpinKitWave(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.white : Color.fromRGBO(102, 61, 168, 1),
                ),
              );
            },
       ),
      )
    ); 
  }
}

//Drawers

Widget drawerProfile(UserObject.User user, context){
  return Drawer(
    child: Column(
      children: <Widget>[
        Container(
          height: 200,
          color:  Color.fromRGBO(40, 4, 64, 1),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                userHandler.user.image != null ? 
                CircleAvatar(
                  radius: 30, 
                  backgroundImage: 
                  NetworkImage( user.image!
                  ),
                ):
                const CircleAvatar(
                  radius: 30, 
                  backgroundImage: 
                  AssetImage('assets/images/userGenericImage.jpg'),
                ),

                SizedBox(height: 8),
                Text(user.name, style: TextStyle(color: Colors.white),),
                
              ],
            ),
          ),
        ),
        ListTile(
          title: const Row(children: [ Icon(Icons.person), 
            SizedBox(width: 20,),
            Text('Profile')
            ],
          ),
          onTap: () {
            userHandler.UserProfileView = userHandler.user.name;
            nav('Profile', context);
          },
        ),
        ListTile(
          title: const Row(children: [ Icon(Icons.logout_outlined), 
            SizedBox(width: 20,),
            Text('Logout')
            ],
          ),
          onTap: () {
           userHandler.logoutUser(context);
          },
        ),
      ],
    ),
  );
}



//SearchAnchor


class CustomSearchBar extends StatefulWidget {
  final SearchController controller;
  final EdgeInsetsGeometry padding;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final String hintText;
  final Widget leading;

  CustomSearchBar({

    required this.controller,
    this.padding = const EdgeInsets.symmetric(horizontal: 15.0),
    required this.onTap,
    required this.onChanged,
    required this.hintText,
    required this.leading,
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      hintText: widget.hintText,
      leading: widget.leading,
    );
  }
}