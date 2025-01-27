import 'package:flutter/material.dart';
import 'package:super_app/screens/home_screen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String title = 'นาย';
  String firstName = '';
  String lastName = '';
  String phone = '';
  String birthDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Page 1', style: TextStyle(fontFamily: 'Kanit')),
        backgroundColor: Colors.pink[200],
        centerTitle: false,
      ),
      body: SingleChildScrollView( // Makes the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'สมัครสมาชิก',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 14,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'คำนำหน้าชื่อ',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.blue[900],
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                    hintStyle: TextStyle(fontFamily: 'Kanit'),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'นาย',
                      child: Text('นาย', style: TextStyle(fontFamily: 'Kanit')),
                    ),
                    DropdownMenuItem(
                      value: 'นางสาว',
                      child: Text('นางสาว', style: TextStyle(fontFamily: 'Kanit')),
                    ),
                    DropdownMenuItem(
                      value: 'นาง',
                      child: Text('นาง', style: TextStyle(fontFamily: 'Kanit')),
                    ),
                  ],
                  onChanged: (value) => setState(() => title = value!),
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 12),
                Text(
                  'ชื่อจริง',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.blue[900],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ชื่อจริง',
                    hintStyle: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onChanged: (value) => firstName = value,
                ),
                SizedBox(height: 12),
                Text(
                  'นามสกุล',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.blue[900],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'นามสกุล',
                    hintStyle: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onChanged: (value) => lastName = value,
                ),
                SizedBox(height: 12),
                Text(
                  'เบอร์โทร',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.blue[900],
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'เบอร์โทร',
                    hintStyle: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onChanged: (value) => phone = value,
                ),
                SizedBox(height: 12),
                Text(
                  'วัน/เดือน/ปีเกิด',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16,
                    color: Colors.blue[900],
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'dd/mm/yyyy',
                    hintStyle: TextStyle(fontFamily: 'Kanit'),
                  ),
                  onChanged: (value) => birthDate = value,
                ),
                SizedBox(height: 12),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'บันทึก',
                        style: TextStyle(fontFamily: 'Kanit', color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              title: title,
                              firstName: firstName,
                              lastName: lastName,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}