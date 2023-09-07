import 'package:belajar/view/horor.dart';
import 'package:belajar/view/actionview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:belajar/model/modelimage.dart';

class Awal extends StatefulWidget {
  const Awal({Key? key}) : super(key: key);

  @override
  State<Awal> createState() => _AwalState();
}

class _AwalState extends State<Awal> {
   model_image imageModel = model_image();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 40, left: 10),
                            child: Text(
                              'Selamat Datang, Ka Danu',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              'Silahkan Pilih Genre Film Yang Kamu Minati',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //card HOROR
                Container(
                  margin: EdgeInsets.only(top: 180),
                  child: CarouselSlider(
                    items: imageModel.horor.map ((assetPath) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Horor(),
                              ),
                            );
                          },
                          child: Container(
                            width: 380,
                            height: 280,
                            margin: EdgeInsets.only(top: 0, right: 10),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Horor',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      assetPath,
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),

                //end card Horor
              ],
            ),
            //card Thriller
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: CarouselSlider(
                    items: imageModel.thriller.map((assetPath) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Horor(),
                              ),
                            );
                          },
                          child: Container(
                            width: 380,
                            height: 280,
                            margin: EdgeInsets.only(top: 0, right: 10),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Thriller',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      assetPath,
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            // end card Thriler

            //card Action
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: CarouselSlider(
                    items: imageModel.action.map((assetPath) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => genreaction(),
                              ),
                            );
                          },
                          child: Container(
                            width: 380,
                            height: 280,
                            margin: EdgeInsets.only(top: 0, right: 10),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Action',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      assetPath,
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            //end Card action

            //card comedy
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: CarouselSlider(
                    items: imageModel.comedy.map((assetPath) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Horor(),
                              ),
                            );
                          },
                          child: Container(
                            width: 380,
                            height: 280,
                            margin: EdgeInsets.only(top: 0, right: 10),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Comedy',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      assetPath,
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            //end card comedy
          ],
        ),
      ),
    );
  }
}
