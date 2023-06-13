class MoviesModels {
  final String title;
  final String overview;
  final String voteAverage;
  final String posterPath;
  final String backdropPath;

  MoviesModels({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
  });
  
  factory MoviesModels.fromMap(Map<String, dynamic> map) => 
    MoviesModels(
      title: map['title'],
      overview: map['overview'],
      voteAverage: map['vote_average'],
      posterPath: map['https://image.tmdb.org/t/p/original/posterPath'],
      backdropPath: map['https://image.tmdb.org/t/p/original/backdropPath'],
    );
}
