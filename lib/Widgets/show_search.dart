import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:get/get.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Views/watch/components/moviedetail_view.dart';
import 'package:movieapp/Widgets/search_movie_card.dart';
import 'package:movieapp/Widgets/showsuggestion.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final controller = Get.put(MovieController());

  CustomSearchDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          // searchFieldStyle: h14HeadingBlackSimple,
          searchFieldDecorationTheme: InputDecorationTheme(
            hintStyle: h14HeadingBlackSimple,
            border: InputBorder.none,
            isDense: true,
            fillColor: greyColor.withOpacity(0.2),
            labelStyle: h13HeadingBlackSimple,
          ),
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          close(context, '');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    controller.searchMovies(query);

    super.showResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 4.0.w,
            runSpacing: 4.0.h,
            direction: Axis.horizontal,
            children: controller.searchResults.map((movie) {
              return SearchMovieCard(
                title: movie['title'],
                onTap: () {
                  controller.fetchMovieDetails(movie['id']);
                  Get.to(MovieDetailView());
                },
                img: 'https://image.tmdb.org/t/p/w185${movie['backdrop_path']}',
              );
            }).toList(),
          ),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ShowSuggestion();
  }
}
