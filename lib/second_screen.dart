import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key, required this.doctorName, required this.post});
  final String doctorName;
  final String post;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedDate = '08';

  List week = ['Mon', 'Tue', 'Wed', 'Thrus', 'Fri', 'Sat'];

  List date = [
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
  ];
  List Time = [
    '08:30 am',
    '09:00 am',
    '10:15 am',
    '11:45 am',
    '12:08 am',
    '1:30 am',
  ];
  String selectedTime = '10:15 am';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            // Container(height: 200, color: Colors.blue),
            Positioned(
              top: 150,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 5000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Text(''),
              ),
            ),
            Positioned(
                top: 100,
                left: (MediaQuery.of(context).size.width - 100) / 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  width: 100,
                  height: 100,
                  child: Text(''),
                )),
            Positioned(
              top: 200,
              left: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      widget.doctorName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(widget.post,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                  _buildRowCard(context),
                  _buildAboutDoctor(context, 'About Doctor'),
                  _buildDoctorDecr(context),
                  _buildAboutDoctor(context, 'Select Schedule'),
                  _buildDateRow(),
                  _buildMoringTitle(),
                  _buildTimeRow()
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildRowCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        height: 80,
        child: Card(
          color: Colors.blue.withOpacity(0.2),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Patient',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.8), fontSize: 20),
                ),
                Text(
                  '1,560',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.8), fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 2,
                color: Colors.black,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Experience',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.8), fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                          color: Colors.blue.withOpacity(0.8), fontSize: 20),
                    ),
                    Text(
                      'gm',
                      style: TextStyle(
                          color: Colors.blue.withOpacity(0.8), fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 2,
                color: Colors.black,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.8), fontSize: 20),
                ),
                Text(
                  '4.8',
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.8), fontSize: 20),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  _buildAboutDoctor(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }

  Widget _buildDoctorDecr(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
            'Dr kabuto is a well-know and experienced\ndoctor in the field of liver specialists. He comes\nfrom Japan and is widely know... Read more',
            maxLines: 3,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            )));
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        for (int i = 0; i < 6; i++)
          _buildDate(date[i], week[i], 60, 90, 'Date'),
      ],
    );
  }

  Widget _buildTimeRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 6; i++)
            _buildDate(Time[i], week[i], 60, 50, 'Time'),
        ],
      ),
    );
  }

  Widget _buildDate(
      String date, String week, double width, double height, String Type) {
    return GestureDetector(
      onTap: () {
        if (Type == 'Date')
          setSetectedDate(date);
        else
          setSetectedTime(date);
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: setColor(date, Type == 'Date' ? 'Date' : 'Time')),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: Type == 'Time'
                    ? EdgeInsets.symmetric(horizontal: 10)
                    : EdgeInsets.zero,
                child: Text(date),
              ),
              Type == 'Date' ? Text(week) : SizedBox()
            ],
          )),
    );
  }

  Color setColor(String date, String type) {
    if (date == (type == 'Date' ? selectedDate : selectedTime)) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  setSetectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  setSetectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  Widget _buildMoringTitle() {
    return Container(
        width: MediaQuery.of(context).size.width, child: Text('Morning'));
  }
}
