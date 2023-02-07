import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/movie_model.dart';

class MoviesScreen extends StatefulWidget {
  static const String screenName = '/movies_screen';

  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<MovieModel> moviesList = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: moviesList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final movie = moviesList[index];
            return Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.network(
                          movie.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            movie.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> fetchMovies() async {
    try {
      final url = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(url);

      final moviesListJson = jsonDecode(response.body);

      moviesList = moviesListJson['results']
          .map<MovieModel>((movieJson) => MovieModel.fromjson(movieJson))
          .toList();
      setState(() {});
    } catch (_) {}
  }
}
