import 'package:doctor_ui/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHome(),
          );
        });
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildListHeader(),
              _buildHeaderLine('Appointment Today', 'Sell All'),
              _buildCard(),
              _buildHeaderLine('Top Doctor\'s for you', 'Sell All'),
              _buildsSecondCard()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Padding(
    padding: EdgeInsets.only(bottom: 18.0.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Luke,',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 40.sp),
            ),
            Text(
              'How do you feel today?',
              style: TextStyle(color: Colors.grey, fontSize: 22.sp),
            )
          ],
        ),
        SizedBox(
          width: 70.w,
          height: 70.h,
          child: CircleAvatar(
            child: Image.asset(
              'asset/person.png',
              width: 50.w,
              height: 50.h,
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0.h),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      height: 50.h,
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          hintText: 'Search here..',
          iconColor: Colors.grey,
          prefixIcon: Icon(Icons.search, size: 40, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget _buildListHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildReapated('Hospital', Icons.local_hospital, Colors.red),
      _buildReapated('Consutant', Icons.monitor_heart, Colors.blue),
      _buildReapated('Recipe', Icons.calendar_view_day_rounded, Colors.yellow),
      _buildReapated('Appointment', Icons.folder, Colors.green),
    ],
  );
}

Widget _buildReapated(String title, IconData icon, Color color) {
  return Column(
    children: [
      SizedBox(
        width: 70.w,
        height: 100.h,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}

Widget _buildHeaderLine(String title, String seeAll) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          seeAll,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

Widget _buildCard() {
  return Container(
    height: 180.h,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(
          20.r,
        ),
      ),
    ),
    width: double.infinity,
    child: _buildCardDetail(),
  );
}

Widget _buildCardDetail() {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 10.h,
      horizontal: 20.w,
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 8.0.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70.h,
                child: CircleAvatar(
                  child: Image.asset('asset/female.png'),
                ),
              ),
              SizedBox(
                height: 70.h,
                child: const CircleAvatar(
                  child: Icon(
                    Icons.message,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringResource.doctorName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
            ),
            Text(
              StringResource.time1030,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dental Specialist',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20.sp,
                ),
              ),
              Text(
                '01.10.2022',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildsSecondCard() {
  return Container(
    height: 180.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(
          20.r,
        ),
      ),
    ),
    width: double.infinity,
    child: _buildSecondCardDetail(),
  );
}

_buildSecondCardDetail() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 100.w,
            child: Image.asset('asdf'),
            height: 120.w,
            color: Colors.grey),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Text('Heart Specialist',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 20.sp)),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Text('dr.Kabuto Yakushi',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text('4.8 127 Reviews',
                    style: TextStyle(color: Colors.black, fontSize: 20.sp))
              ],
            )
          ],
        )
      ],
    ),
  );
}

//..screen two
class MyscendScreen extends StatelessWidget {
  const MyscendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('Chat'),
              Icon(
                Icons.donut_small,
              ),
            ],
          ),
          Row(
            children: [
              _buildSearchBar(),
              Container(
                width: 50,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
