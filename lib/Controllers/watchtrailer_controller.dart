// import 'package:get/get.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class WatchTrailerController extends GetxController {
//   late VideoPlayerController videoPlayerController;
//   late ChewieController chewieController;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   Future<void> initializeTrailer(String movieId) async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=80d30f2b8a9c224e01c41892207bf8ed"),
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         final List<dynamic> results = data['results'];

//         if (results.isNotEmpty) {
//           final String trailerKey = results[0]['key'];
//           final String trailerUrl =
//               'https://www.youtube.com/watch?v=$trailerKey';

//           videoPlayerController =
//               VideoPlayerController.networkUrl(Uri.parse(trailerUrl));
//           chewieController = ChewieController(
//             fullScreenByDefault: true,
//             videoPlayerController: videoPlayerController,
//             aspectRatio: 16 / 9,
//             autoPlay: true,
//             looping: false,
//           );

//           videoPlayerController.addListener(() {
//             if (videoPlayerController.value.position ==
//                 videoPlayerController.value.duration) {
//               Get.back(); // Automatically close the player when the trailer finishes
//             }
//           });
//         } else {
//           // Handle the case where no trailers are available
//           Get.snackbar('Error', 'No trailers available for this movie.');
//         }
//       } else {
//         // Handle the case where the API call fails
//         Get.snackbar('Error', 'Failed to fetch trailer information.');
//       }
//     } catch (error) {
//       // Handle any unexpected errors
//       Get.snackbar('Error', 'An unexpected error occurred.');
//     }
//   }

//   void disposeControllers() {
//     videoPlayerController.dispose();
//     chewieController.dispose();
//   }
// }
