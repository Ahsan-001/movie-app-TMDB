import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Views/watch/components/moviedetail_view.dart';
import 'package:movieapp/Widgets/show_search.dart';

class WatchView extends StatelessWidget {
  final MovieController movieController = Get.find();

  WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "Watch",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  hintText: "TV shows, movies and more...",
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: movieController.movieList.length,
          itemBuilder: (context, index) {
            var movie = movieController.movieList[index];
            return GestureDetector(
              onTap: () {
                movieController.fetchMovieDetails(movie['id']);
                Get.to(MovieDetailView());
              },
              child: Card(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    movie['backdrop_path'] != null
                        ? Image.network(
                            scale: 0.55,
                            'https://image.tmdb.org/t/p/w185${movie['backdrop_path']}',
                            fit: BoxFit.fitHeight,
                          )
                        : Container(),
                    Container(
                      height: ScreenUtil().setHeight(70.0),
                      width: ScreenUtil().setWidth(350.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withAlpha(0),
                            Colors.black54,
                            Colors.black87,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(20),
                      bottom: ScreenUtil().setHeight(15),
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: ScreenUtil().setWidth(300),
                          child: Text(
                            movie['title'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.white,
                              // Other styles as needed
                            ),
                          ),
                        ),
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
}
