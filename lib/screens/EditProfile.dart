import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/functions/validateFormsCamps.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget{
 @override
  State<EditProfile> createState() => _EditProfile();
}


class _EditProfile extends State<EditProfile>{
  TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   String name = '';

late ImagePicker _picker;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _imagePath = null;
  }

  Future<void> _getImageFromGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
      });
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: const Color.fromRGBO(40, 4, 64, 1),
         appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              nav('Profile', context);
            },
          ),
          centerTitle: true,
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ), // Puedes cambiar este texto por el nombre deseado
        ),

      body: 
      Center(child: Column(
        children: [

          SizedBox(height: 20,),

          GestureDetector(
            onTap: _getImageFromGallery,
            child: 
              Container(
                width: 150, // Tamaño deseado para la imagen
                height: 150, 
                child:  userHandler.user.image != null && _imagePath==null ? 
                    CircleAvatar(
                      radius: 30, 
                      backgroundImage: 
                      NetworkImage( userHandler.user.image!
                      ),
                    ): _imagePath == null ?
                    const CircleAvatar(
                      radius: 30, 
                      backgroundImage: 
                      
                      AssetImage('assets/images/userGenericImage.jpg'),
                    ): CircleAvatar(
                        radius: 30,
                        backgroundImage: 
                          FileImage(File(_imagePath!))
                            
                      ),
            ),
          
          ),
        

          SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                  const SizedBox(height: 15),
                                  GenericTextField(
                                    controller: _nameController, 
                                    validator:  FocusName, 
                                    labelText: 'User Name', 
                                    hintText: 'New User Name', 
                                    suffixIcon: Icons.person, 
                                    onChanged: (text){
                                      setState(() {
                                        name = text;
                                      });
                                    } ,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                    ],
                  ),
                ),
              ),

        ],)
      )
    );
  }


  void _save() {
    if (_formKey.currentState!.validate()) print('Okey');
    print('Error');
  }

}