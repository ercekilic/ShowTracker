class MoviesTMDB {
String title;
String originalTitle;
String backDropPath;
String overview;
String posterPath;
String releaseDate;
String mediaType;
int id;

  MoviesTMDB({
    required this.title,
    required this.originalTitle,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.mediaType,
  });

  factory MoviesTMDB.fromJson(Map<String, dynamic> json){
    return MoviesTMDB(
      title: json["title"]?? json["name"]?? '', 
      originalTitle: json["original_title"]?? json["original_name"]??  "", 
      backDropPath: json["backdrop_path"]?? "", 
      overview: json["overview"]?? "", 
      posterPath: json["poster_path"]?? "", 
      releaseDate: json["release_date"]?? json["first_air_date"]?? "", 
      id: json["id"]?? "",
      mediaType: json["media_type"]?? "",
      );
  }
  Map<String, dynamic> toJson() {
  return {
    "title": title,
    "original_title": originalTitle,
    "backdrop_path": backDropPath,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "id": id,
    "media_type": mediaType,
  };
}
  

}
