import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final List<String> imgList = [
    'assets/images/key1.jpg',
    'assets/images/key2.jpg',
    'assets/images/key3.jpg',
    'assets/images/key4.jpg',
     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 8),
              children: List.generate(4, (index) {
                return Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(imgList[index], fit: BoxFit.cover)
                          ),
                          ListTile(
                              title: Text(
                                'Two Gold Rings',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
