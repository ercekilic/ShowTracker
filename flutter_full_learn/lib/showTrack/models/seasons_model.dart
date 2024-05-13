class SeasonsModel {
  String backdropPath;
  int id;
  String name;
  int numberOfEpisodes;
  int numberOfSeasons;
  String overview;
  String posterPath;
  List<Season> seasons;

  SeasonsModel({
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.posterPath,
    required this.seasons,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    var seasonList = json['seasons'] as List;
    List<Season> seasons = seasonList.map((season) => Season.fromJson(season)).toList();

    return SeasonsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      seasons: seasons,
    );
  }

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'id': id,
        'name': name,
        'number_of_episodes': numberOfEpisodes,
        'number_of_seasons': numberOfSeasons,
        'overview': overview,
        'poster_path': posterPath,
        'seasons': seasons.map((season) => season.toJson()).toList(),
      };
}

class Season {
  DateTime airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;
  double voteAverage;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate: DateTime.parse(json['air_date']),
      episodeCount: json['episode_count'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
  Map<String, dynamic> toJson() => {
        'air_date': airDate.toIso8601String(),
        'episode_count': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };
}
