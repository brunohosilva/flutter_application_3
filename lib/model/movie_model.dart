class MovieModel {
  final String title;
  final String description;
  final String image;

  MovieModel(
      {required this.title, required this.description, required this.image});

  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
        title: json['original_title'],
        description: json['overview'],
        image: json['poster_path'],
      );
}
