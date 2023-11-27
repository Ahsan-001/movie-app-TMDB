import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movieapp/Controllers/movie_controller.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Views/watch/components/seatbook/seatbook_view.dart';
import 'package:movieapp/Views/watch/components/watchtrailer_view.dart';

class MovieDetailView extends StatelessWidget {
  final MovieController movieController = Get.find();

  MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: ScreenUtil().setHeight(420),
                  child: Image.network(
                    movieController.getPosterUrl(
                      movieController.selectedMovie['poster_path'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: ScreenUtil().setHeight(200.0),
                    width: Get.width,
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
                ),
                Positioned(
                  top: ScreenUtil().setHeight(10),
                  left: ScreenUtil().setWidth(5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                      const Text(
                        "Watch",
                        style: h16HeadingWhiteSimple,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: ScreenUtil().setHeight(180),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movieController.selectedMovie['title'],
                          textAlign: TextAlign.center,
                          style: h18HeadingWhiteBold.copyWith(
                            color: goldenColor,
                          ),
                        ),
                        const Text(
                          "In theaters december 22, 2021",
                          style: h14HeadingWhiteSimple,
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          height: ScreenUtil().setHeight(50),
                          minWidth: ScreenUtil().setWidth(250),
                          onPressed: () {
                            Get.to(const SeatBookingScreen());
                          },
                          color: secondaryColor,
                          textColor: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Get Tickets',
                            style: h16HeadingWhiteSimple,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: ScreenUtil().setHeight(50),
                          width: ScreenUtil().setWidth(250),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              movieController.fetchTrailerUrl(
                                movieController.selectedMovie['id'],
                              );
                              Get.to(const WatchTrailerView());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_arrow, color: whiteColor),
                                Text(
                                  ' Watch Trailer',
                                  style: h16HeadingWhiteSimple,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Genres',
                    style: h16HeadingBlackSimple,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(25),
                        width: ScreenUtil().setWidth(60),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Action',
                            style: h12HeadingWhiteSimple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: ScreenUtil().setHeight(25),
                        width: ScreenUtil().setWidth(60),
                        decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Thriller',
                            style: h12HeadingWhiteSimple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: ScreenUtil().setHeight(25),
                        width: ScreenUtil().setWidth(70),
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Science',
                            style: h12HeadingWhiteSimple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: ScreenUtil().setHeight(25),
                        width: ScreenUtil().setWidth(60),
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Fiction',
                            style: h12HeadingWhiteSimple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    'Overview',
                    style: h16HeadingBlackSimple,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
                    style: h12HeadingBlackSimple.copyWith(color: greyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
