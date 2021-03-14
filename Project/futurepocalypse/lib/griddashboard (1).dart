import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "News",
      subtitle: "Fire in Plano",
      event: "3 new",
      img: "assets/images/calendar.png");

  Items item2 = new Items(
    title: "Home Grants",
    subtitle: "affordable housing",
    event: "4 Items",
    img: "assets/images/food.png",
  );
  Items item3 = new Items(
    title: "Unemployment Help",
    subtitle: "get employed",
    event: "",
    img: "assets/images/map.png",
  );
  Items item4 = new Items(
    title: "Donate",
    subtitle: "Karma",
    event: "",
    img: "assets/images/festival.png",
  );
  Items item5 = new Items(
    title: "Immediate Needs",
    subtitle: "Food, shelter, clothing",
    event: "4 Items",
    img: "assets/images/todo.png",
  );
  Items item6 = new Items(
    title: "Tax Relief",
    subtitle: "Tax incentives",
    event: "2 Items",
    img: "assets/images/setting.png",
  );
  Items item7 = new Items(
      title: "Hotline",
      subtitle: "emergency numbers",
      event: "1 new",
      img: "assets/images/phone.png");
  Items item8 = new Items(
      title: "Survey",
      subtitle: "Personalize",
      event: "",
      img: "assets/images/survey.png");

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
    List<Items> myList = [
      item5,
      item7,
      item1,
      item6,
      item2,
      item3,
      item4,
      item8
    ];
    var color = Colors.blue[600];
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[700],
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[700],
              Colors.blue[500],
              Colors.blue[400],
            ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        padding: EdgeInsets.only(top: 50),
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return TextButton(
                onPressed: () {
                  // data.title == "News"
                  //     ? Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => NewsView()))
                  //     : data.title == "Home Grants"
                  //         ? Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) => House()))
                  //         : data.title == "Unemployment Help"
                  //             ? Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => Unemployed()))
                  //             : data.title == "Donate"
                  //                 ? Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) => Help()))
                  //                 : data.title == "Immediate Needs"
                  //                     ? Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) =>
                  //                                 ImmediateNeeds()))
                  //                     : data.title == "Tax Relief"
                  //                         ? Navigator.push(
                  //                             context,
                  //                             MaterialPageRoute(
                  //                                 builder: (context) => Tax()))
                  //                         : data.title == "Survey"
                  //                             ? Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         Survey()))
                  //                             : Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         HotlineView()));
                },
                child: Container(
                  width: width / 2,
                  height: width / 2,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 42,
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        data.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.event,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}

class Deadlines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomeGrants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class BusinessGrants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MedicalGrants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class TaxRelief extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
