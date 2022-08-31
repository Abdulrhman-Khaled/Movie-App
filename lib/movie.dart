class Movie {
  int id;
  String title;
  String imageUrl = "https://image.tmdb.org/t/p/w500/";
  String overview;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required String path}) {
    this.imageUrl = "${this.imageUrl}${path}";
  }
}
