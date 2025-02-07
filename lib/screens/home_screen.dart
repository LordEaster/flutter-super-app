import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  final String firstName;
  final String lastName;

  HomePage({required this.title, required this.firstName, required this.lastName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedTab = 0; // 0 = สถานที่ท่องเที่ยว, 1 = ธรรมชาติ

  final List<Map<String, String>> travelPosts = [
    {
      "name": "Filipa Gaspar",
      "image": "assets/images/listpic-01.png",
      "desc": "I'm Going to Shake Your Hand Way Too Hard",
    },
    {
      "name": "Jeremías del Pozo",
      "image": "assets/images/listpic-02.png",
      "desc": "I'm Going to Shake Your Hand Way Too Hard",
    },
    {
      "name": "Ngô Hải Giang",
      "image": "assets/images/listpic-03.png",
      "desc": "I'm Going to Shake Your Hand Way Too Hard",
    },
  ];

  final List<Map<String, String>> naturePosts = [
    {
      "name": "Nature Explorer",
      "image": "assets/images/listpic-03.png",
      "desc": "Discover the beauty of untouched landscapes.",
    },
    {
      "name": "Wildlife Enthusiast",
      "image": "assets/images/listpic-03.png",
      "desc": "Exploring the wonders of nature.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedPosts = _selectedTab == 0 ? travelPosts : naturePosts;

    final statusList = [
      {
        "status": 'สถานที่ทำงาน',
        "image": 'assets/images/happy-face.png',
        "color": Colors.yellow[50],
      },
      {
        "status": 'กีฬา',
        "image": 'assets/images/basketball.png',
        "color": Colors.orange[50],
      },
      {
        "status": 'การแต่งกาย',
        "image": 'assets/images/polo-shirt.png',
        "color": Colors.blue[50],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Page 2', style: TextStyle(fontFamily: 'Kanit')),
        backgroundColor: Color(0xFFF0D9F6),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${widget.title}${widget.firstName} ${widget.lastName}',
                    style: TextStyle(
                      fontFamily: 'Kanit', 
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                'สถานะ',
                style: TextStyle(fontFamily: 'Kanit', fontSize: 16),
              ),
            ),
            SizedBox(height: 10),

            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                children: statusList.map((status) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 125,
                      height: 150,
                      decoration: BoxDecoration(
                        color: status["color"] as Color?,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 5,
                                    child: Image.asset(
                                      status["image"] as String,
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            child: Text(
                              status["status"] as String,
                              style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          DefaultTabController(
            length: 2, 
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], 
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    indicator: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(20),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.blue[900], 
                    unselectedLabelColor: Colors.grey, 
                    labelStyle: TextStyle(
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                    ),
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: "สถานที่ท่องเที่ยว"),
                      Tab(text: "ธรรมชาติ"),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: displayedPosts.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      displayedPosts[index]["image"] as String,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          displayedPosts[index]["name"] as String,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 16,
                                            color: Colors.blue[900],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            displayedPosts[index]["desc"] as String,
                                            style: TextStyle(
                                              fontFamily: 'Kanit',
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: displayedPosts.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      displayedPosts[index]["image"] as String,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          displayedPosts[index]["name"] as String,
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 16,
                                            color: Colors.blue[900],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            displayedPosts[index]["desc"] as String,
                                            style: TextStyle(
                                              fontFamily: 'Kanit',
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),

      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () => _onItemTapped(0)),
                IconButton(icon: Icon(Icons.search), onPressed: () => _onItemTapped(1)),
                SizedBox(width: 40),
                IconButton(icon: Icon(Icons.message), onPressed: () => _onItemTapped(3)),
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => _onItemTapped(4)),
              ],
            ),
          ),

          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: () => _onItemTapped(2),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}