import 'package:belajar/view/tnt.dart';
import 'package:flutter/material.dart';

class genreaction extends StatelessWidget {
  final List<String> titles = [
    'Mission Impossible',
    'John Wick 4',
    'Extraction 2',
    'Bad Boys',
    'Tntt',
  ];

  final List<String> imagePaths = [
    'foto/mission-impossible.jpg',
    'foto/john-wick.jpg',
    'foto/extraction.jpg',
    'foto/bad-boys.jpg',
    'foto/TNT.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            String title = titles[index];
            String imagePath = imagePaths[index];

            VoidCallback onPressedAction = () {
              if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tnt(),
                  ),
                );
              } else {
                final snackBar = SnackBar(
                  content: Text('Film $title Tidak Ada'),
                  duration: Duration(seconds: 2),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            };

            return Container(
              margin: EdgeInsets.all(5),
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
                        title,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Image.asset(
                        imagePath,
                        height: 100,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: onPressedAction,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Watch'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
