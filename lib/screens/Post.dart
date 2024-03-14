import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harmonica/functions/databasePetitions.dart';
import 'package:harmonica/functions/navigator.dart';
import 'package:harmonica/widgets/Generic_widgets.dart';
import 'package:harmonica/objects/Song.dart';
import 'package:flutter/rendering.dart';

class Post extends StatefulWidget{
  @override
  State<Post> createState() => _Post();
}

class _Post extends State<Post> {
  String songName = '';
  String image = '';
  String artist = '';
  Song track = new Song(
      song_id: '',
      song_name: '',
      song_image_url: '',
      song_artist: '',
      song_album: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 4, 64, 1),
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            nav('NavigatorBar', context);
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 38,
          ),
        ),
        backgroundColor: Color.fromRGBO(40, 4, 64, 1),
        title: const Text(
          'Post Song',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            iconSize: 38,
            onPressed: () async {
             await songHandler.postSong(track);

             nav('Home', context);
             
            },
            icon: const Icon(Icons.check, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  SearchBar(
                    hintText: 'Buscar Canción',
                    onChanged: (text) async {
                      setState(() async {
                        songName = text;
                        String token = await songHandler.getToken();
                        print('Nombre Canción: ' + songName);
                        final response =
                            await songHandler.searchSong(songName, token);
                        print("Data received: $response");
                        final data = await jsonDecode(response.body);
                        track = Song.fromJson(data);
                        track.printInfo();
                        setState(() {
                          image = track.song_image_url;
                          songName = track.song_name;
                          artist = track.song_artist;
                        });
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  if (image != '')
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Image.network(image),
                          Text(
                            artist,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            songName,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}