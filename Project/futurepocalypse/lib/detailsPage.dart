import 'package:flutter/material.dart';
import 'package:futurepocalypse/apiCaller.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  News info;
  DetailPage(this.info);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        Text(
                          info.title,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 25,
                            color: Color(0xFF414C6B),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          info.description ?? '',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff868686),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'URL',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                      onPressed: () async {
                        if (await canLaunch(info.url) != null) {
                          await launch(info.url);
                        } else {
                          print("launch failes");
                        }
                      },
                      child: Text(
                        info.url,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )
                  // Container(
                  //   height: 250,
                  //   padding: const EdgeInsets.only(left: 32.0),
                  //   child: ListView.builder(
                  //       itemCount: planetInfo.images.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Card(
                  //           clipBehavior: Clip.antiAlias,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(24),
                  //           ),
                  //           child: AspectRatio(
                  //               aspectRatio: 1,
                  //               child: Image.network(
                  //                 planetInfo.images[index],
                  //                 fit: BoxFit.cover,
                  //               )),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
            // Positioned(
            //   right: -64,
            //   child: Hero(
            //       tag: planetInfo.position,
            //       child: Image.asset(planetInfo.iconImage)),
            // ),
            // Positioned(
            //   top: 60,
            //   left: 32,
            //   child: Text(
            //     planetInfo.position.toString(),
            //     style: TextStyle(
            //       fontFamily: 'Avenir',
            //       fontSize: 247,
            //       color: primaryTextColor.withOpacity(0.08),
            //       fontWeight: FontWeight.w900,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
