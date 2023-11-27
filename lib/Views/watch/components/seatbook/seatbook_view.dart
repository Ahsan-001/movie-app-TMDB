import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_colors.dart';
import 'package:movieapp/Utils/App%20Themes%20&%20Styles/app_textstyle.dart';
import 'package:movieapp/Views/watch/components/seatbook/pay_view.dart';

class SeatBookingScreen extends StatefulWidget {
  const SeatBookingScreen({super.key});

  @override
  State<SeatBookingScreen> createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  var countSeatLeft = 4 * 6;
  var countSeatCenter = 4 * 10;
  var countSeatRight = 4 * 6;
  var listSeatLeft = [];
  var listSeatCenter = [];
  var listSeatRight = [];

  @override
  void initState() {
    initSeatValueToList(listSeatLeft, countSeatLeft, "l");
    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    initSeatValueToList(listSeatRight, countSeatRight, "r");
    setVisiblitySeat();
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
        padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Date',
              style: h18HeadingBlackBold,
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: secondaryColor,
                    textColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '5 Mar',
                      style: h16HeadingWhiteBold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '6 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '7 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '8 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '9 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '10 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '11 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                  const SizedBox(width: 5),
                  MaterialButton(
                    elevation: 0,
                    height: 30,
                    minWidth: 50,
                    onPressed: () {},
                    color: greyColor.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      '12 Mar',
                      style: h16HeadingBlackSimple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "12:30",
                        style: h16HeadingBlackSimple,
                      ),
                      Text(
                        "  Cinetech + hall 1",
                        style: h16HeadingBlackSimple.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widgetSeat(listSeatLeft, false),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: widgetSeat(listSeatCenter, true),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          widgetSeat(listSeatRight, false),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "FROM",
                        style: h16HeadingBlackSimple.copyWith(color: greyColor),
                      ),
                      const Text(
                        "  \$50 ",
                        style: h16HeadingBlackBold,
                      ),
                      Text(
                        "or",
                        style: h16HeadingBlackSimple.copyWith(color: greyColor),
                      ),
                      const Text(
                        " 2500 bonus",
                        style: h16HeadingBlackBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     setSelectedToBooked();
            //   },
            //   child: const Text("Booking"),
            // ),
            const Spacer(),
            MaterialButton(
              height: ScreenUtil().setHeight(50),
              minWidth: ScreenUtil().screenWidth,
              onPressed: () {
                Get.to(const PayView());
              },
              color: secondaryColor,
              textColor: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Select Seats',
                style: h16HeadingWhiteSimple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return SizedBox(
      width: ScreenUtil().screenWidth / 3.83,
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
