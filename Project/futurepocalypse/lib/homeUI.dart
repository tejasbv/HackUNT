import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:futurepocalypse/Survey/quiz.dart';
import 'package:futurepocalypse/apiCaller.dart';
import 'package:futurepocalypse/detailsPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Survey/survey.dart';
import 'griddashboard (1).dart';

class HomeState extends StatefulWidget {
  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  int _radioValue1 = -1;
  String dropdownValue = 'Select';
  NewsAPI api;
  List<News> _newsinfo;
  @override
  void initState() {
    // TODO: implement initState
    api = new NewsAPI();
    super.initState();
    api.fetchnews().then((value) {
      _newsinfo = value;
      setState(() {});
    });
  }

  var item_tapped = 0;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    /**********************************************************/
    // full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    // height without status and toolbar
    double height3 = (height - kToolbarHeight) / 2;
    double boxw = height > width ? width : height - 50;
    /**********************************************************/
    return Scaffold(
      body: item_tapped == 0
          ? _newsinfo == null
              ? Text("loading")
              : Stack(
                  children: [
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/back4.jpg"),
                        fit: BoxFit.cover,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(60),
                      //     topRight: Radius.circular(60))),
                      //height: ,
                      width: width,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Swiper(
                        itemCount:
                            _newsinfo.length > 10 ? 10 : _newsinfo.length,
                        itemWidth: MediaQuery.of(context).size.width,
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeSize: 20, space: 8),
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 50,
                                          ),
                                          Divider(
                                            color: Colors.black,
                                            thickness: 5,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            _newsinfo[index].title,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 44,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.left,
                                            maxLines: 4,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            _newsinfo[index].description,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 23,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                            maxLines: 3,
                                          ),
                                          SizedBox(height: 32),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                      pageBuilder: (context, a,
                                                              b) =>
                                                          DetailPage(
                                                            _newsinfo[index],
                                                          )));
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  'Read more',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 18,
                                                    color: Color(0xFFE4979E),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Color(0xFFE4979E),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Hero(
                              //   //tag: planets[index].position,
                              //   child: Image.network(_newsinfo[index].imageURL),
                              // ),
                              // Positioned(
                              //   right: 24,
                              //   bottom: 60,
                              //   child: Text(
                              //     _newsinfo[index].position.toString(),
                              //     style: TextStyle(
                              //       fontFamily: 'Avenir',
                              //       fontSize: 200,
                              //       color: primaryTextColor.withOpacity(0.08),
                              //       fontWeight: FontWeight.w900,
                              //     ),
                              //     textAlign: TextAlign.left,
                              //   ),
                              // ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
          : item_tapped == 1
              ? Center(
                  child: Container(
                    //decoration: BoxDecoration(border: BoxBorder),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Image(
                          image: AssetImage("assets/images/map.jpg"),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                )
              : item_tapped == 2
                  ? Stack(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/images/back3.jpg"),
                            fit: BoxFit.cover,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        ListView(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                                child: ListTile(
                                  title: Text(
                                      "Disaster Distress Hotline: 1-800-985-5990"),
                                ),
                                color: Colors.yellow[500]),
                            Card(
                                child: ListTile(
                                  title: Text(
                                      "Inclement Weather Hotline: 1-512-463-5751"),
                                ),
                                color: Colors.yellow[200]),
                            Card(
                                child: ListTile(
                                  title:
                                      Text("National Emergency Hotline: 911"),
                                ),
                                color: Colors.yellow[500]),
                            Card(
                              child: ListTile(
                                title: Text(
                                    "State Bar of Texas Disaster Hotline: 1-800-985-5990"),
                              ),
                              color: Colors.yellow[200],
                            ),
                            Divider(
                              thickness: 5,
                              color: Colors.grey,
                            ),
                            Card(
                                child: ListTile(
                                  title: Text("Redcross Hotline: 143"),
                                ),
                                color: Colors.red[500]),
                            Card(
                              child: ListTile(
                                title:
                                    Text("Elder Care Locator: 1-800-677-1116"),
                              ),
                              color: Colors.red[200],
                            ),
                            Divider(
                              thickness: 5,
                              color: Colors.grey,
                            ),
                            Card(
                                child: ListTile(
                                  title: Text("Suicide Hotline: 1-800-SUICIDE"),
                                ),
                                color: Colors.blue[500]),
                            Card(
                              child: ListTile(
                                title: Text(
                                    "United Way Crisis Helpline: 1-800-233-HELP"),
                              ),
                              color: Colors.blue[200],
                            ),
                            Card(
                                child: ListTile(
                                  title: Text(
                                      "National Domestic Violence Hotline: 1-800-799-SAFE"),
                                ),
                                color: Colors.blue[500]),
                            Card(
                              child: ListTile(
                                title: Text(
                                    "National Domestic Violence Hotline Spanish: 1-800-942-6908"),
                              ),
                              color: Colors.blue[200],
                            ),
                          ],
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                      ],
                    )
                  : item_tapped == 3
                      ? Survey()
                      : Stack(
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage("assets/images/back1.jpg"),
                                fit: BoxFit.cover,
                              ),
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                width: width - 100,
                                height: height - 400,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Amount:",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Radio(
                                          value: 0,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        new Text(
                                          '\$100',
                                          style: new TextStyle(fontSize: 16.0),
                                        ),
                                        new Radio(
                                          value: 1,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        new Text(
                                          '\$200',
                                          style: new TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        new Radio(
                                          value: 2,
                                          groupValue: _radioValue1,
                                          onChanged: _handleRadioValueChange1,
                                        ),
                                        new Text(
                                          '\$500',
                                          style: new TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 200,
                                      child: TextField(
                                        onTap: () {
                                          setState(() {
                                            _radioValue1 = -1;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter \$ value",
                                          border: InputBorder.none,
                                        ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Divider(
                                        thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Donate to:",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      child: Center(
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          iconSize: 20,
                                          elevation: 36,
                                          underline: Container(
                                            height: 2,
                                            color: Colors.black,
                                          ),
                                          onChanged: (newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Select',
                                            'Research',
                                            'American Red Cross',
                                            'Poject HOPE',
                                            'Doctors Without Borders'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "donate!",
                                          style: TextStyle(fontSize: 20),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: item_tapped,
        onTap: (index) {
          item_tapped = index;
          setState(() {});
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              label: "News",
              icon: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/images/calendar.png"))),
          BottomNavigationBarItem(
            label: "essentials",
            icon: Container(
                height: 35,
                width: 35,
                child: Image.asset("assets/images/food.png")),
          ),
          BottomNavigationBarItem(
              label: "Hotline",
              icon: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/images/phone.png"))),
          BottomNavigationBarItem(
              label: "Survey",
              icon: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/images/survey.png"))),
          BottomNavigationBarItem(
              label: "Donate",
              icon: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/images/Donate.png"))),
        ],
      ),
    );
  }
}
