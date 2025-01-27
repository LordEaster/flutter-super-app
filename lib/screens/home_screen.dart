import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final String firstName;
  final String lastName;

  HomePage({required this.title, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    final statusList = [
      {
        "status": 'สถานที่ทำงาน',
        "emoji": '😄',
        "color": Colors.yellow[50],
      },
      {
        "status": 'กีฬา',
        "emoji": '🏀',
        "color": Colors.orange[50],
      },
      {
        "status": 'การแต่งกาย',
        "emoji": '👕',
        "color": Colors.blue[50],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Page 2', style: TextStyle(fontFamily: 'Kanit')),
        backgroundColor: Colors.pink[200],
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 32),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 8),
                Text(
                  '$title$firstName $lastName',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'สถานะ:',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 32),
              child: Row(
                children: statusList.map((status) {
                  return Container(
                    height: 150,
                    width: 125,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: status["color"] as Color?,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                status["emoji"] as String,
                                style: TextStyle(fontSize: 30, shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 15,
                                    offset: Offset(0, 10),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            status["status"] as String,
                            style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // TAP SECTION
          SizedBox(height: 20),
          
        ],
      ),
    );
  }
}