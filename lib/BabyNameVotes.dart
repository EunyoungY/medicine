import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pill_project_app/BabyNameVotes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review Page',
      //home: ReviewPage(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var index = 8;
  int _counter = 0;

  int _rating = 0;
  bool _favoriteSelected = false;
  int _noFavorite = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: _appbar(context),
        //body: _review(size),
        body: _buildBody(context));
  }

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  void favorite(bool favoriteSelected, noFavorite) {
    setState(() {
      _favoriteSelected = !favoriteSelected;
      if (!favoriteSelected == true)
        _noFavorite++;
      else
        _noFavorite--;
    });
  }

  Widget _appbar(BuildContext context) {
    return AppBar(
      title: Text('Review Page',
          style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
              color: Colors.teal[300])),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal[300]),
          onPressed: () {
            print("Go back button is clicked");
          }),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search, color: Colors.teal[300]),
            onPressed: () {
              print("Go back button is clicked");
            })
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return LinearProgressIndicator();
          return _buildList(context, snapshot.data.documents);
        }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Container(
        key: ValueKey(record.name),
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                BorderSide(width: 0.6, color: Colors.grey[300]))),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _starAndId(record),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          height: 28,
                          width: 70,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[400], width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("효과", style: TextStyle(fontSize: 14.5, color: Colors.grey[600])),
                              Padding(padding: EdgeInsets.all(2.5)),
                              //Container(width: size.width * 0.015),
                              Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      shape: BoxShape.circle)),
                            ],
                          )),
                      //Container(width: size.width * 0.025),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(record.effect, style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 6.0)),
                  Row(
                    children: <Widget>[
                      Container(
                          height: 28,
                          width: 80,
                          //width: 5, height: 5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[400], width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("부작용", style: TextStyle(fontSize: 14.5, color: Colors.grey[600])),
                              Padding(padding: EdgeInsets.all(2.5)),
                              Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent[100],
                                      shape: BoxShape.circle)),
                            ],
                          )),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(record.sideEffect, style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 6.0)),

                  Row(
                    children: <Widget>[
                      Container(
                          height: 25,
                          width: 45,
                          //width: 5, height: 5,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey[400], width: 1.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(6.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("총평", style: TextStyle(fontSize: 14.5, color: Colors.grey[600])),
                            ],
                          )),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(record.overall, style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 6.0)),
                ],
              ),
              //Container(height: size.height * 0.01),
              _dateAndLike(record),
            ]));
  }
}

*/


/*



  /*
  Widget d(BuildContext context) {
    int _effectColor;
    int _sideEffectColor;

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("총 평점",
                          style: TextStyle(
                              fontSize: 16.5, fontWeight: FontWeight.bold)),
                      //Container(height: size.height * 0.02),
                      Padding(padding: EdgeInsets.only(top: 14.0)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.amber[300], size: 35),
                          Text("4.26", style: TextStyle(fontSize: 35)),
                          Text("/5",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[500])),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 84.0)),
                      Text("탭해서 평가하기",
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[700])),
                      Padding(padding: EdgeInsets.only(top: 7.0)),
                      /*Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: Colors.amber[300], size: 35),
                              Container(width: size.width * 0.017),
                              Icon(Icons.star,
                                  color: Colors.amber[300], size: 35),
                              Container(width: size.width * 0.017),
                              Icon(Icons.star,
                                  color: Colors.amber[300], size: 35),
                              Container(width: size.width * 0.017),
                              Icon(Icons.star,
                                  color: Colors.amber[300], size: 35),
                              Container(width: size.width * 0.017),
                              Icon(Icons.star,
                                  color: Colors.grey[300], size: 35),
                            ],
                          )*/
                      Container(
                        child: RatingBar(
                          itemSize: 30,
                          glow: false,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber[300],
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 4,
                color: Colors.grey[200],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('리뷰 360개',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                          child: Text('전체리뷰 보기',
                              style: TextStyle(
                                fontSize: 14.5,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllReview()));
                          }),
                    ],
                  )),
              //Card
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 20, right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, size: 30),
                    hintText: "어떤 리뷰를 찾고계세요?",
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
//                        filled: true,
//                        fillColor: Colors.white
                    //contentPadding: EdgeInsets.only(left: 5)
                  ),
                ),
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(width: 0.6, color: Colors.grey[300]))),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _starAndId(size),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _reviewEffect(size, _effectColor),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                            _reviewSideEffect(size, _sideEffectColor),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                            _reviewOverall(size),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 7.0)),
                        _dateAndLike(size),
                      ])),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(width: 0.6, color: Colors.grey[300]))),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _starAndId(size),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 28,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("효과"),
                                        Padding(padding: EdgeInsets.only(top: 10.5)),
                                        Container(
                                            width: 17,
                                            height: 17,
                                            decoration: BoxDecoration(
                                                color: Colors.green[200],
                                                shape: BoxShape.circle)),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("headache is gone", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 28,
                                    width: 80,
                                    //width: 5, height: 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("부작용"),
                                        Padding(padding: EdgeInsets.all(3.0)),
                                        Container(
                                            width: 17,
                                            height: 17,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent[100],
                                                shape: BoxShape.circle)),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("still got a fever", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 25,
                                    width: 45,
                                    //width: 5, height: 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("총평"),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("still got a fever", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 7.0)),
                        _dateAndLike(size),
                      ])),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(width: 0.6, color: Colors.grey[300]))),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _starAndId(size),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 28,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("효과"),
                                        Padding(padding: EdgeInsets.all(3.0)),
                                        Container(
                                            width: 17,
                                            height: 17,
                                            decoration: BoxDecoration(
                                                color: Colors.green[200],
                                                shape: BoxShape.circle)),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("headache is gone", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 28,
                                    width: 80,
                                    //width: 5, height: 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("부작용"),
                                        Container(width: size.width * 0.015),
                                        Container(
                                            width: 17,
                                            height: 17,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent[100],
                                                shape: BoxShape.circle)),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("still got a fever", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),

                            Row(
                              children: <Widget>[
                                Container(
                                    height: 25,
                                    width: 45,
                                    //width: 5, height: 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[400], width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("총평"),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.all(6.0)),
                                Text("still got a fever", style: TextStyle(fontSize: 17.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 6.0)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 7.0)),
                        _dateAndLike(size),
                      ])),


            ],
          ),
          /*
            child: ListView.separated(
              //padding: const EdgeInsets.all(15.0), //listview seprated bar size
                itemBuilder: (BuildContext context, int index){
                  return Container(
                      padding: const EdgeInsets.only(left: 15, right:15, top:5),
                      //child: Center(child: Text('Color is $index'))
                      //padding: const EdgeInsets.symmetric(vertical: 10),
                      //width: 200.0, height: 180.0,
                      //padding: new EdgeInsets.fromLTRB(12.0, 12.0, 10.0, 10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _starAndId(size),
                            Container(height: size.height * 0.013),
                            _effectBox(size),
                            Container(height: size.height * 0.008),
                            _sideEffectBox(size),
                            Container(height: size.height * 0.008),
                            _evalBox(size),
                            Container(height: size.height * 0.01),
                            _dateAndLike(size),
                          ]
                      )
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: 4
            ),*/
        ),
      ],
    );
    /*
      ListView.builder(
        scrollDirection: Axis.vertical ,
        padding: EdgeInsets.all(20),
        itemBuilder: (BuildContext context, int index) {
          return Container(width: 200, height: 200, margin: EdgeInsets.only(bottom: 10), color: Colors.red);
        },
      )*/
  }*/

  Widget _reviewEffect(Size size, EffectColor) {
    return Row(
      children: <Widget>[
        Container(
            height: 28,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[400], width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("효과"),
                Padding(padding: EdgeInsets.all(2.5)),
                Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        shape: BoxShape.circle)),
              ],
            )),
        Container(width: size.width * 0.025),
        Text("headache is gone", style: TextStyle(fontSize: 17.0)),
      ],
    );
  }

  Widget _reviewSideEffect(Size size, sideEffectColor) {
    return Row(
      children: <Widget>[
        Container(
            height: 28,
            width: 80,
            //width: 5, height: 5,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[400], width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("부작용"),
                Padding(padding: EdgeInsets.all(2.5)),
                Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                        color: Colors.redAccent[100],
                        shape: BoxShape.circle)),
              ],
            )),
        Container(width: size.width * 0.025),
        Text("still got a fever", style: TextStyle(fontSize: 17.0)),
      ],
    );
  }

  Widget _reviewOverall(size) {
    return Row(
      children: <Widget>[
        Container(
            height: 25,
            width: 45,
            //width: 5, height: 5,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[400], width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(6.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("총평"),
              ],
            )),
        Container(width: size.width * 0.025),
        Text("still got a fever", style: TextStyle(fontSize: 17.0)),
      ],
    );
  }

  Widget _dateAndLike(record) {
    return Row(
      children: <Widget>[
        //Container(height: size.height * 0.05),

        Text("2020.08.11",
            style: TextStyle(color: Colors.grey[500], fontSize: 13)),
//        Container(width: size.width * 0.63),
        Padding(padding: EdgeInsets.all(18)),
        Padding(padding: EdgeInsets.only(left: 240)),
        Icon(Icons.favorite, color: Colors.redAccent, size: 18),
        Padding(padding: EdgeInsets.only(left: 3)),
        Text("1"),
        //star
        /*Container(
          //width: 500.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /*new GestureDetector(
                child: new Icon(
                  Icons.favorite,
                  //color: _rating >= 1 ? Colors.orange : Colors.grey,
                  color: _favoriteSelected == true
                      ? Colors.redAccent[200]
                      : Colors.grey[300],
                  size: 21,
                ),
                onTap: () {
                  favorite(_favoriteSelected, _noFavorite);
                },
              )*/
            ],
          ),
        ),*/

        /*IconButton(
            icon: Icon(
                !_favoriteSelected ? Icons.favorite : Icons.favorite_border,
                color: Colors.red
                //color: _favoriteSelected ? Colors.red: null ,
                ),
            onPressed: () {
              setState(() {
                _counter++;
                !_favoriteSelected;
              });
            }) ,*/
        /*Text("$_noFavorite",
            style: TextStyle(fontSize: 14, color: Colors.black)), */
//            Text("309", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _starAndId(record) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Icon(Icons.star, color: Colors.grey[300], size: 16),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(record.id, style: TextStyle(color: Colors.grey[500], fontSize: 13)),],
        ),

        //Padding(padding: EdgeInsets.only(left: 100)),
        MySnackBar(),
      ],
    );
  }

  Widget _review(Size size) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 200),
      children: <Widget>[
        Container(
          width: 10, height: 10,
          //decoration: BoxDecoration(border:Border.all(color: Colors.grey[300], width: 1.0)),
        ),
        Container(
            width: 200.0,
            height: 150.0,
            padding: new EdgeInsets.fromLTRB(12.0, 12.0, 10.0, 10.0),
            //color: Colors.blueAccent[100],
            //decoration: BoxDecoration(border:Border.all(color: Colors.grey[300], width: 1.0)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.grey[300], size: 14),
                      Container(width: size.width * 0.02),
                      Text("jk****",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 12)),
                      Container(width: size.width * 0.6),
                      Icon(Icons.more_horiz, color: Colors.grey[700], size: 17),
                    ],
                  )),
                  Container(height: size.height * 0.01),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.bubble_chart),
                      Text("headache is gone",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  )),
                  Container(height: size.height * 0.005),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.bubble_chart),
                      Text("still got a fever"),
                    ],
                  )),
                  Container(height: size.height * 0.005),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(Icons.bubble_chart),
                      Text("I'll try another one"),
                    ],
                  )),
                  Container(height: size.height * 0.01),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text("2019.08.11",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 11)),
                      Container(width: size.width * 0.69),
                      Icon(Icons.favorite, size: 16, color: Colors.redAccent),
                      Container(width: size.width * 0.005),
                      Text("309", style: TextStyle(fontSize: 12)),
                    ],
                  )),
                ])),
//        seperatorBuilder: (BuildContext context, int index) => const Divider(),
      ],
    );
  }

/*Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 32),
          child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please input correct Email.";
                        }
                        return null;
                      }),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please input correct password.";
                        }
                        return null;
                      }),
                  Container(height:8),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }*/


class Record {
  final String name;
  final int votes;
  final DocumentReference reference;
  final String effect;
  final String sideEffect;
  final String overall;
  final String id;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        assert(map['effect'] != null),
        assert(map['sideEffect'] != null),
        assert(map['overall'] != null),
        assert(map['id'] != null),
        name = map['name'],
        votes = map['votes'],
        effect = map['effect'],
        sideEffect = map['sideEffect'],
        overall = map['overall'],
        id = map['id'];


  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}


class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.more_horiz, color: Colors.grey[700], size: 19
            //color: _favoriteSelected ? Colors.red: null ,
            ),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Hello',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal),
              ),
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 5000),
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))));
        },
      );
  }
}

class AllReview extends StatefulWidget {
  @override
  _AllReviewState createState() => _AllReviewState();
}

class _AllReviewState extends State<AllReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back'))));
  }
}

class WriteReview extends StatefulWidget {
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back'))));
  }
}

*/



/*
// listview builder stream connecting
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Baby Name Votes')),
        body: StreamBuilder(
            stream: Firestore.instance.collection("user").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot record = snapshot.data.documents[index];
                  return Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                      child: Text(record['name'])
                  );
                },
              );
            }
        )
    );
  }
}

*/