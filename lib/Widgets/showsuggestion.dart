import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Views/watch/components/moviedetail_view.dart';

class ShowSuggestion extends StatelessWidget {
  final MovieController movieController = Get.find();

  ShowSuggestion({super.key});

  int calculateItemsPerRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const itemWidth = 150.0;
    const spacing = 4.0;

    final itemsPerRow =
        ((screenWidth - spacing) / (itemWidth + spacing)).floor();
    return itemsPerRow;
  }

  @override
  Widget build(BuildContext context) {
    final itemsPerRow = calculateItemsPerRow(context);

    return Center(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 4.0.w,
          runSpacing: 4.0.h,
          direction: Axis.horizontal,
          children: movieController.movieList.map((movie) {
            return GestureDetector(
              onTap: () {
                movieController.fetchMovieDetails(movie['id']);
                Get.to(MovieDetailView());
              },
              child: Container(
                width:
                    (MediaQuery.of(context).size.width - 4.0.w) / itemsPerRow,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: Offset(1, 3),
                      color: Colors.black12,
                    )
                  ],
                ),
                padding: EdgeInsets.all(4.0.w),
                child: Column(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w185${movie['backdrop_path']}',
                      fit: BoxFit.fitHeight,
                      height: 90.h,
                    ),
                    Center(
                      child: SizedBox(
                        width: 200.w,
                        child: Center(
                          child: Text(
                            movie['title'],
                            style: h15HeadingBlackSimple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
