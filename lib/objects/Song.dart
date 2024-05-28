
class Song {
  String song_id, song_name, song_image_url, song_artist, song_album, song_preview;

  Song({
    required this.song_id,
    required this.song_name,
    required this.song_image_url,
    required this.song_artist,
    required this.song_album,
    required this.song_preview,
   
  });

  factory Song.fromJson(Map<String, dynamic> json){
    try {
      var items =  json["tracks"]["items"] as List<dynamic>;
      if (items.isNotEmpty) {
        var track = items[0];
        return Song(
          song_id: track["id"] as String? ?? "",
          song_name: track["name"] as String? ?? "",
          song_image_url: track["album"]["images"][1]["url"] as String? ?? "",
          song_artist: track["artists"][0]["name"] as String? ?? "",
          song_album: track["album"]["name"] as String? ?? "",
          song_preview: track["preview_url"]
         
        );
      } else {
        throw Exception("no se ha encontrado canciones en la respuesta");
      }
    } catch (e) {
      throw Exception("fallo de parse JSON: $e");
    }
  }
  void printInfo() {
    print('Song ID: $song_id');
    print('Song Name: $song_name');
    print('Song Image URL: $song_image_url');
    print('Song Artist: $song_artist');
    print('Song Album: $song_album');
    print('Song Preview: $song_preview');
    
  }
}