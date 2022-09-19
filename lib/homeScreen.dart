import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'musicScreen.dart';
import 'newMusicScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> mixes = [
    'Warming Indie Noir',
    'Ólafur Arnalds',
    'Soundscapes',
    'New Acoustic',
    'Focus',
    'North Ambient'
  ];
  List<String> image = [
    'Assets/image/warming.png',
    'Assets/image/olafur.png',
    'Assets/image/soundscape.png',
    'Assets/image/acoustic.png',
    'Assets/image/focus.png',
    'Assets/image/north.png'
  ];
  List<String> recentsongName = [
    'Moment Apart',
    'Believer',
    'Shortwave',
    'Dream On',
    'Origins',
    'Tie Me Down',
    'Chaff & Dust'
  ];
  List<String> newsongName = [
    'Dream On',
    'Origins',
    'Tie Me Down',
    'Chaff & Dust'
  ];
  List<String> recentsingerName = [
    'Odeza',
    'Imagine dragons',
    'Ryan Grigdry',
    'Roder Terry',
    'Imagine dragons',
    'Gryffyn',
    'Hyonna'
  ];
  List<String> newsingerName = [
    'Roder Terry',
    'Imagine dragons',
    'Gryffyn',
    'Hyonna'
  ];
  List<String> recentlyPlayed = [
    'Assets/image/moment.png',
    'Assets/image/believer.png',
    'Assets/image/shortwave.png'
  ];
  List<String> newRelease = [
    'Assets/image/dream.png',
    'Assets/image/origin.png',
    'Assets/image/tie.png',
    'Assets/image/chaf.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff091228),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top picks',
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: image.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (8 / 3),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemBuilder: ((context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromARGB(255, 131, 145, 162),
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: 6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Image.asset(image[index])),
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        mixes[index],
                                        style: GoogleFonts.roboto(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container()
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Recently played',
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recentlyPlayed.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        //return Container();
                        return Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => MusicScreen(
                                                i: index,
                                                recentlyPlayed: recentlyPlayed,
                                                recentsongName: recentsongName,
                                                recentsingerName:
                                                    recentsingerName))));
                                  },
                                  child: Container(
                                      height: 144,
                                      child:
                                          Image.asset(recentlyPlayed[index])),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  recentsongName[index],
                                  style: GoogleFonts.roboto(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  recentsingerName[index],
                                  style: GoogleFonts.roboto(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 131, 145, 162)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text(
                      'New releses for you',
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: newRelease.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        //return Container();
                        return Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                newMusicScreen(
                                                    i: index,
                                                    newRelease: newRelease,
                                                    newsongName: newsongName,
                                                    newsingerName:
                                                        newsingerName))));
                                  },
                                  child: Container(
                                    height: 144,
                                    child: Image.asset(newRelease[index]),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  newsongName[index],
                                  style: GoogleFonts.roboto(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  newsingerName[index],
                                  style: GoogleFonts.roboto(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 131, 145, 162)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
