import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieController extends GetxController {
  var movieList = [].obs;
  var selectedMovie = {}.obs;
  var trailerUrl = ''.obs;
  final searchResults = [].obs;

  final apiKey = '80d30f2b8a9c224e01c41892207bf8ed';

  @override
  void onInit() {
    super.onInit();
    fetchMovieList();
  }

  Future<void> fetchMovieList() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        movieList.value = data['results'];
      } else {
        print('Failed to load movie list');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> fetchMovieDetails(int movieId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        selectedMovie.value = data;
      } else {
        print('Failed to load movie details');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> fetchTrailerUrl(int movieId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'].isNotEmpty) {
          trailerUrl.value =
              'https://www.youtube.com/watch?v=${data['results'][0]['key']}';
        }
      } else {
        print('Failed to load trailer URL');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  String getPosterUrl(String posterPath) {
    if (posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w185$posterPath';
    } else {
      return '';
    }
  }

  Future<void> searchMovies(String query) async {
    const apiUrl = 'https://api.themoviedb.org/3/search/movie';

    try {
      final response = await http.get(
        Uri.parse('$apiUrl?api_key=$apiKey&query=$query'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        searchResults.assignAll(data['results']);
      } else {
        print('Error fetching search results');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
