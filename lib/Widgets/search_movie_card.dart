import 'package:flutter/material.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';

class SearchMovieCard extends StatelessWidget {
  final String title;
  final String img;

  final VoidCallback onTap;
  const SearchMovieCard({
    required this.title,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
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
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Image.network(
              img,
              fit: BoxFit.fitHeight,
              height: 90,
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    title,
                    style: h15HeadingBlackSimple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
