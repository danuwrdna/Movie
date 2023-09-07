import 'package:flutter/material.dart';
import 'package:belajar/view/home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController pengguna = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<List<String>> fetchImages() async {
    List<String> imageUrls = [
      'https://images.thedirect.com/media/article_full/extraction-2-cast-netflix-chris-hemsworth-idris-elba.jpg',
      'https://occ-0-32-41.1.nflxso.net/dnm/api/v6/6gmvu2hxdfnQ55LZZjyzYR4kzGk/AAAABcAa1TsU7AW9NMNRyR9w6v0Fyr_eYpFpvwkB7QxiYQq-klHhMc8WY8gM7R15uQUgDkPW0fQET8EvoDngJ0lWyxzzFvroJ3pdBigb.jpg?r=a0c',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_2hwXGWbFf8YTbWoJdcsEDwskvnlPSRY9fSzUvVQcH1BSntlZxYrxzH0mBPZTTBx2-CU&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPDXBTJtYwmubG3hljhS8ncWma_rz9ZKf9Y3Tqh4e3yo5t7rgyglUMPDS7WulMgkI7Gag&usqp=CAU'
    ];

    List<Future<String>> futureImages = imageUrls.map((url) async {
      await Future.delayed(Duration(seconds: 2)); // Simulasi jeda
      return url;
    }).toList();

    return Future.wait(futureImages);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Nobar Bro',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 10),
                height: 100,
                child: Row(
                  children: [
                    //gambar ke satu
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 100,
                      width: 400,
                      child: FutureBuilder(
                        future: fetchImages(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child:
                                    Text('Error loading images / No internet'));
                          } else {
                            if (snapshot.data != null) {
                              List<String> imageUrls =
                                  (snapshot.data as List).cast<String>();
                              return CarouselSlider.builder(
                                itemCount: imageUrls.length * 2,
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval:
                                      Duration(milliseconds: 1500),
                                  aspectRatio: 21 / 9,
                                  enlargeCenterPage: true,
                                ),
                                itemBuilder: (context, index, realIndex) {
                                  final imageUrlIndex =
                                      index % imageUrls.length;
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        imageUrls[imageUrlIndex],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(child: Text('No images available'));
                            }
                          }
                        },
                      ),
                    ),
                    //end gambar
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.grey],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text(
                            "Silahkan Login",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        //USERNAME

                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          width: 350,
                          child: TextField(
                            controller: pengguna,
                            decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              prefixIcon: Icon(Icons.ac_unit_outlined),
                              hintText: "username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),

                        //endusernamecode
                        //PASSWORD
                        Center(
                          child: Container(
                            width: 350,
                            child: TextField(
                              controller: pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.black12,
                                filled: true,
                                prefixIcon: Icon(Icons.ac_unit_outlined),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              maxLength: 5,
                            ),
                          ),
                        ),
                        //endpaswordcode
                        //button login
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 5,
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    colors: [Colors.green, Colors.black],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Material(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Awal(),
                                    ),
                                  );
                                },
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                            ),
                          ),
                        ),
                        //end button login
                        //Button daftar
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Material(
                            borderRadius: BorderRadius.circular(15),
                            elevation: 5,
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.black],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                              child: Material(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.amber,
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {},
                                  child: Center(
                                      child: Text(
                                    "Daftar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //end button daftar
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
