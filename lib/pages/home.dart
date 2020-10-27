import 'package:flutter/material.dart';
import 'package:pill_project_app/category/category.dart';
import 'package:pill_project_app/myMedicine/myMedicine.dart';
import '../camera/camera.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    MyMedicinePage(),
    CategoryPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyMedicinePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_enhance),
        onPressed: () {
//          Camera();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyStatefulWidget()
//                    builder: (context) => MyApp()
              ));
        },
        backgroundColor: Colors.teal[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        MyMedicinePage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.teal[300] : Colors.grey,
                    ),
                    Text(
                      '홈',
                      style: TextStyle(
                        color: currentTab == 0 ? Colors.teal[300] : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(left: width*0.1)),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        CategoryPage(); // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
//                onPressed: () {
//
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => Category()
////                    builder: (context) => MyApp()
//                      ));
//                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: currentTab == 1 ? Colors.teal[300] : Colors.grey,
                    ),
                    Text(
                      '카테고리',
                      style: TextStyle(
                        color: currentTab == 1 ? Colors.teal[300] : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}