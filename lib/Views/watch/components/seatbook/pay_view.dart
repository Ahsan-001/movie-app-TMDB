import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Widgets/curveline.dart';

class PayView extends StatefulWidget {
  const PayView({super.key});

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  var countSeatLeft = 4 * 6;
  var countSeatCenter = 4 * 10;
  var countSeatRight = 4 * 6;
  var listSeatLeft = [];
  var listSeatCenter = [];
  var listSeatRight = [];
  late TransformationController transformationController;

  @override
  void initState() {
    initSeatValueToList(listSeatLeft, countSeatLeft, "l");
    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    initSeatValueToList(listSeatRight, countSeatRight, "r");
    setVisiblitySeat();
    transformationController = TransformationController();
    super.initState();
  }

  initSeatValueToList(List data, count, side) {
    Map<String, dynamic> objectData;

    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };

      setState(() {
        data.add(objectData);
      });
    }
    print(data);
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[0]["isVisible"] = false;
      listSeatLeft[1]["isVisible"] = false;
      listSeatLeft[3]["isVisible"] = false;
      listSeatRight[1]["isVisible"] = false;
      listSeatRight[2]["isVisible"] = false;
      listSeatRight[5]["isVisible"] = false;
    });
  }

  setSelectedToBooked() {
    for (var seat in listSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in listSeatCenter) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
    for (var seat in listSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    }
  }

  double scale = 1.0;

  void zoomIn() {
    setState(() {
      scale += 0.5;
    });
  }

  void zoomOut() {
    setState(() {
      scale -= 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('The King\'s Man'),
            Text(
              'In Theaters December 22, 2021',
              style: h12HeadingBlackSimple.copyWith(color: secondaryColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
        child: Column(
          children: [
            CustomPaint(
              size: Size(300.w, 40.h),
              painter: CurvePainter(),
            ),
            const Text("Screen", style: h16HeadingBlackSimple),
            Container(
              color: secondaryColor.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: InteractiveViewer(
                  transformationController: transformationController,
                  boundaryMargin: EdgeInsets.all(20.w),
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widgetSeat(listSeatLeft, false),
                      SizedBox(width: 20.w),
                      Expanded(child: widgetSeat(listSeatCenter, true)),
                      SizedBox(width: 20.w),
                      widgetSeat(listSeatRight, false),
                    ],
                  ),
                ),
              ),
            ),
            const Text("You can zoom in/out the Cinema room",
                style: h16HeadingBlackSimple),
            SizedBox(height: 30.h),
            const Divider(),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.asset(
                  "assets/icons/chair.png",
                  height: 30.h,
                  color: orangeColor,
                ),
                SizedBox(width: 5.w),
                const Text("Selected", style: h13HeadingBlackSimple),
                SizedBox(width: 50.w),
                Image.asset(
                  "assets/icons/chair.png",
                  height: 30.h,
                  color: greyColor,
                ),
                SizedBox(width: 5.w),
                const Text("Not Available", style: h13HeadingBlackSimple),
              ],
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                Image.asset(
                  "assets/icons/chair.png",
                  height: 30.h,
                  color: Colors.purple,
                ),
                SizedBox(width: 5.w),
                const Text("VIP (150\$)", style: h13HeadingBlackSimple),
                SizedBox(width: 43.w),
                Image.asset(
                  "assets/icons/chair.png",
                  height: 30.h,
                  color: secondaryColor,
                ),
                SizedBox(width: 5.w),
                const Text("Regular (50\$)", style: h13HeadingBlackSimple),
              ],
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 40.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: '4 / ', style: h18HeadingBlackBold),
                          TextSpan(
                            text: '3 row',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.close,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Price",
                        style: h13HeadingBlackSimple,
                      ),
                      Text(
                        "\$ 50",
                        style: h18HeadingBlackBold,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  height: 70.h,
                  minWidth: double.minPositive,
                  onPressed: () {},
                  color: secondaryColor,
                  textColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Proceed to Pay',
                    style: h18HeadingWhiteSimple,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.83,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter ? 4 : 3,
          childAspectRatio: isCenter ? 1 : 1,
        ),
        itemCount: dataSeat.length,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: dataSeat[index]["isVisible"],
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dataSeat[index]["isSelected"] =
                      !dataSeat[index]["isSelected"];
                });
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: dataSeat[index]["isBooked"]
                      ? Colors.grey
                      : dataSeat[index]["isSelected"]
                          ? Colors.white
                          : Colors.transparent,
                  border: Border.all(
                    color: secondaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
