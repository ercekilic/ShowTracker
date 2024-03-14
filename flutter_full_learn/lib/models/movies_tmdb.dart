

class MoviesTMDB {
String title;
String originalTitle;
String backDropPath;
String overview;
String posterPath;
String releaseDate;
int id;
  MoviesTMDB({
    required this.title,
    required this.originalTitle,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,

  });

  factory MoviesTMDB.fromJson(Map<String, dynamic> json){
    return MoviesTMDB(
      title: json["title"]?? "", 
      originalTitle: json["original_title"]?? "", 
      backDropPath: json["backdrop_path"]?? "", 
      overview: json["overview"]?? "", 
      posterPath: json["poster_path"]?? "", 
      releaseDate: json["release_date"]?? "", 
      id: json["id"]?? "",
      );
  }

  

}
