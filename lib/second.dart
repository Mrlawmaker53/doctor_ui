import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.doctorName, required this.post});
  final String doctorName;
  final String post;
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
                      doctorName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(post,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                  _buildRowCard(context),
                  _buildAboutDoctor(context)
                ],
              ),
            )
          ],
        ));
  }
}

Widget _buildRowCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: 80,
      child: Card(
        color: Colors.blue.withOpacity(0.2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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

_buildAboutDoctor(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Text(
      'About Doctor',
      style: TextStyle(color: Colors.black, fontSize: 24),
    ),
  );
}
