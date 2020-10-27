import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Container(
        width: 100,
        height: 100,
        color: Colors.teal
    ),
    Column(
      children: <Widget>[
        FlatButton(
          color: Colors.teal,
          onPressed: () {},
          child: Text('Camera'),
        ),
        FlatButton(
          color: Colors.teal,
          onPressed: () {
          },
          child: Text('Gallery'),
        ),
      ],
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}







/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Camera extends StatefulWidget {
  _CameraState createState() => _CameraState();
}

//class _CameraState extends State<Camera> {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('Camera',
//              style: TextStyle(
//                  fontSize: 16.5,
//                  fontWeight: FontWeight.bold,
//                  color: Colors.white)),
//          centerTitle: true,
//          elevation: 0.0,
////        backgroundColor: Colors.tealAccent[100],
//          backgroundColor: Colors.teal[200],
//          leading: IconButton(
//              icon: Icon(Icons.arrow_back, color: Colors.white),
//              onPressed: () {
//                Navigator.pop(context);
//                print("Go back button is clicked");
//              }),
//        ),
//
//        body: GestureDetector(
//          onTap: () {
//            FocusScope.of(context).unfocus();
//          },
//        )
//    );
//  }
//}




//void main() => runApp(MyApp());



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Container(
        width: 100,
        height: 100,
        color: Colors.teal
    ),
    Column(
      children: <Widget>[
        FlatButton(
          color: Colors.teal,
          onPressed: () {},
          child: Text('Camera'),
        ),
        FlatButton(
          color: Colors.teal,
          onPressed: () {

          },
          child: Text('Gallery'),
        ),
      ],
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('BottomNavigationBar',
//            style: TextStyle(
//              color: Colors.teal,
//              fontSize: 16.5,
////            fontWeight: FontWeight.bold,
//            )
//        ),
//        backgroundColor: Colors.white,
//        centerTitle: true,
//      ),
//      body: Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.photo_camera),
//            title: Text('Camera'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.menu),
//            title: Text('Category'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),
//    );
//  }
}

*/