import 'package:flutter/material.dart';
import 'drug_list.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "카테고리", //카테고리
          style: TextStyle(
            fontWeight: FontWeight.bold, //bold체
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.teal[400],
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {}
            //onPressed: _search //누르면 search page
          ),
          new IconButton(
              icon: Icon(
                Icons.category,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => drugListPage()),
                );
              }
            //onPressed: _search //누르면 search page
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            CategoryList(data[index]),
      ),
    );
  }
}

class Category {
  //--- Name Of Drug
  final String name;
  final List<Category> children;

  Category(this.name, [this.children = const <Category>[]]);
}


final List<Category> data = <Category>[
  Category('감기', <Category>[Category('감기약')]),
  Category('소화기계약', <Category>[
    Category('전체'),
    Category('배탈1'),
    Category('소화2'),
    Category('속쓰림3')
  ]),
  Category('해열 진통 소염', <Category>[
    Category('전체'),
    Category('해열제'),
    Category('두통약'),
    Category('관절염약'),
    Category('근육통약'),
    Category('타박상약'),
  ]),
];

class CategoryList extends StatelessWidget {
  const CategoryList(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTiles(category);
  }

  Widget _buildTiles(Category root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.name),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Category>(root),
      title: Text(root.name),
      //children: root.children.map<Widget>(_buildTiles).toList(),
      children: root.children
          .map<Widget>(
        _buildTiles,
      )
          .toList(),
    );
  }
}