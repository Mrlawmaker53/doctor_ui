import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchbar(),
            //   _buildListRow(),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0)
                    return _buildListRow(true, false);
                  else
                    return _buildListRow(false, true);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget _buildDot() {
  return Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    width: 15 / 2,
    height: 15 / 2,
  );
}

Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Chat',
        style: TextStyle(fontSize: 30),
      ),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              //  color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildDot(), _buildDot(), _buildDot()],
          ))
    ],
  );
}

Widget _buildSearchbar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: 305,
          height: 50,
          child: TextField(
              decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            hintText: 'Search here..',
            iconColor: Colors.grey,
            prefixIcon: Icon(Icons.search, size: 40, color: Colors.grey),
            border: InputBorder.none,
          )),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: 50,
          height: 50,
          child: Icon(Icons.person_pin_circle),
        )
      ],
    ),
  );
}

Widget _buildListRow(
  bool notifcationflag,
  bool online,
) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))),
    padding: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              width: 70,
              height: 70,
              color: Colors.black,
              child: Text('h'),
            ),
            Positioned(top: 20, child: _buildDot())
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dr. Ino Yamanaka',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Ready to check out today?')
          ],
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '10:20 AM',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              notifcationflag
                  ? Container(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(child: Text('1')))
                  : SizedBox()
            ],
          ),
        )
      ],
    ),
  );
}
