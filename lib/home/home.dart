import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_key_maker/localizations.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'assets/images/key1.jpg',
    'assets/images/key2.jpg',
    'assets/images/key3.jpg',
    'assets/images/key4.jpg',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            AppLocalizations.of(context)
                                .translate('NEW_ARRIVALS'),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 240.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: imgList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 140.0,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/products',
                                            arguments: i);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 160,
                                            child: Hero(
                                              tag: '$i',
                                              child: Image.asset(i, fit: BoxFit.cover)
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              'Two Gold Rings',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            subtitle: Text('\$200',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/ad.jpg'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('Shop By Category',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                child: Text('View All',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categories');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(4, (index) {
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    print('Card tapped.');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                70,
                                        width: double.infinity,
                                        child: Image.asset(imgList[index], fit: BoxFit.cover)
                                      ),
                                      ListTile(
                                          title: Text(
                                        'Two Gold Rings',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/ad.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
