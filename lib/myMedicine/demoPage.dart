import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../review_bottom.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var index = 8;
  int _counter = 0;
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
//      appBar: _appbar(context),
      body: topOfReview(context),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.create),
          backgroundColor: Colors.teal[300],
          elevation: 0.0,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WriteReview()
                ));

          }
        ),

//      body: _buildBody(context),
//        floatingActionButton: FloatingActionButton(
//            child: Icon(Icons.create),
//          backgroundColor: Colors.teal[300],
//          elevation: 0.0,
//          onPressed: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => WriteReview()
//                ));
//
//          }
//        ),
    );
    //body: _buildBody(context));
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
              _starAndId(record, context),
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
//              _dateAndLike(record),
              Row(
                children: <Widget>[
                  //Container(height: size.height * 0.05),
                  Text("2020.08.11",
                      style: TextStyle(color: Colors.grey[500], fontSize: 13)),
//        Container(width: size.width * 0.63),
                  Padding(padding: EdgeInsets.all(18)),
                  Padding(padding: EdgeInsets.only(left: 235)),
                  Container(
                    //width: 500.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new GestureDetector(
                            child: new Icon(
                              Icons.favorite,
                              //color: _rating >= 1 ? Colors.orange : Colors.grey,
                              color: record.favoriteSelected == true
                                  ? Colors.redAccent[200]
                                  : Colors.grey[300],
                              size: 21,
                            ),
                            //when 2 people click this
                            onTap:() => record.reference.updateData({
                              'noFavorite': FieldValue.increment(1),
                              'favoriteSelected': !record.favoriteSelected,

                            })
                          /*//                          onTap: () => Firestore.instance.runTransaction((transaction) async {
//                            final freshSnapshot = await transaction.get(record.reference);
//                            final fresh = Record.fromSnapshot(freshSnapshot);
//                            await transaction.update(record.reference, {'votes': fresh.votes + 1});
//                          }),
*/
                        )
                      ],
                    ),
                  ),
                  Text((record.noFavorite).toString(),
                      style: TextStyle(fontSize: 14, color: Colors.black)),
//            Text("309", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              )




            ]));
  }

  Widget topOfReview(BuildContext context) {
    int _effectColor;
    int _sideEffectColor;

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
              child: Column(
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
                              itemBuilder: (context, _) =>
                                  Icon(
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
                            //_starAndId(size),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //_reviewEffect(size, _effectColor),
                                Padding(padding: EdgeInsets.only(top: 6.0)),
                                //_reviewSideEffect(size, _sideEffectColor),
                                Padding(padding: EdgeInsets.only(top: 6.0)),
                                //_reviewOverall(size),
                                Padding(padding: EdgeInsets.only(top: 6.0)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 7.0)),
                            //_dateAndLike(size),
                          ])),
                  Container(
                    height: 400,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("user").snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text("Error: ${snapshot.error}");
                        if (!snapshot.hasData)
                          return LinearProgressIndicator();
                        return ListView(
//                        scrollDirection: Axis.vertical,
                          children: snapshot.data.documents.map((DocumentSnapshot data) {
                            final record = Record.fromSnapshot(data);
//                        Timestamp tt = document["datetime"];
//                        DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
//                            tt.microsecondsSinceEpoch);

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
                                      _starAndId(record, context),
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
//              _dateAndLike(record),
                                      Row(
                                        children: <Widget>[
                                          //Container(height: size.height * 0.05),
                                          Text("2020.08.11",
                                              style: TextStyle(color: Colors.grey[500], fontSize: 13)),
//        Container(width: size.width * 0.63),
                                          Padding(padding: EdgeInsets.all(18)),
                                          Padding(padding: EdgeInsets.only(left: 235)),
                                          Container(
                                            //width: 500.0,
                                            child: new Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                new GestureDetector(
                                                    child: new Icon(
                                                      Icons.favorite,
                                                      //color: _rating >= 1 ? Colors.orange : Colors.grey,
                                                      color: record.favoriteSelected == true
                                                          ? Colors.redAccent[200]
                                                          : Colors.grey[300],
                                                      size: 21,
                                                    ),
                                                    //when 2 people click this
                                                    onTap:() => record.reference.updateData({
                                                      'noFavorite': FieldValue.increment(1),
                                                      'favoriteSelected': !record.favoriteSelected,

                                                    })
                                                  /*//                          onTap: () => Firestore.instance.runTransaction((transaction) async {
//                            final freshSnapshot = await transaction.get(record.reference);
//                            final fresh = Record.fromSnapshot(freshSnapshot);
//                            await transaction.update(record.reference, {'votes': fresh.votes + 1});
//                          }),
*/
                                                )
                                              ],
                                            ),
                                          ),
                                          Text((record.noFavorite).toString(),
                                              style: TextStyle(fontSize: 14, color: Colors.black)),
//            Text("309", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                                        ],
                                      )




                                    ]));
                          }).toList(),
                        );
                      },
                    ),
                  )
                ],
              )


          ),
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
  }

  Widget _starAndId(record, context) {
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
            Text(record.id, style: TextStyle(color: Colors.grey[500], fontSize: 13)),

//          IconButton(
//            icon: Icon(Icons.create, color: Colors.grey[700], size: 19
//            ),
//            onPressed: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => WriteReview()
//                  ));
//            },
//          )
          ],

        ),

        MySnackBar(),

//      Stack(
//        children: <Widget>[
//          Expanded(
//            child: Container(
//            width: 100,
//            color: Colors.black.withOpacity(0.25), //transparent
//            )
//          )
//        ],
//      )


      ],
    );
  }
}


Widget _reviewEffect(Size size, EffectColor) {
}
Widget _reviewSideEffect(Size size, sideEffectColor) {
}
Widget _reviewOverall(size) {
}
Widget _dateAndLike(record) {
  return Row(
    children: <Widget>[
      //Container(height: size.height * 0.05),

      Text("2020.08.11",
          style: TextStyle(color: Colors.grey[500], fontSize: 13)),
//        Container(width: size.width * 0.63),
      Padding(padding: EdgeInsets.all(18)),
      Padding(padding: EdgeInsets.only(left: 235)),
      Container(
        //width: 500.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new GestureDetector(
              child: new Icon(
                Icons.favorite,
                //color: _rating >= 1 ? Colors.orange : Colors.grey,
                color: record.favoriteSelected == true
                    ? Colors.redAccent[200]
                    : Colors.grey[300],
                size: 21,
              ),
              onTap: () {
                //favorite(record.favoriteSelected, record.noFavorite);
              },
            )
          ],
        ),
      ),

      Text((record.noFavorite).toString(),
          style: TextStyle(fontSize: 14, color: Colors.black)),
//            Text("309", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
    ],
  );
}




