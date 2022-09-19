// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MusicScreen extends StatefulWidget {
  List<String> recentlyPlayed;
  List<String> recentsongName;
  List<String> recentsingerName;
  int i;

  MusicScreen(
      {super.key,
      required this.recentlyPlayed,
      required this.i,
      required this.recentsongName,
      required this.recentsingerName});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var formatTime = 'mm:ss';
  // List<String> flexData = [
  //   'Assets/image/moment.png',
  //   'Assets/image/shortwave.png',
  //   'Assets/image/believer.png',
  // ];
  List<String> recentsongName = [
    'Moment Apart',
    'Shortwave',
    'Believer',
    'Dream On',
    'Origins',
    'Tie Me Down',
    'Chaff & Dust'
  ];
  List<String> recentsingerName = [
    'Odeza',
    'Ryan Grigdry',
    'Imagine dragons',
    'Roder Terry',
    'Imagine dragons',
    'Gryffyn',
    'Hyonna'
  ];
  // late final PageManager _pageManager;
  bool select = true;
  bool selectheart = true;
  // late AudioPlayer player = AudioPlayer();
  // late AudioCache cache;

  // Duration position = new Duration();
  // Duration musicLength = new Duration();

  // Widget slider() {
  //   return Slider.adaptive(
  //       value: position.inSeconds.toDouble(),
  //       onChanged: (value) {
  //         seekToSec(value.toInt());
  //       });
  // }

  // void seekToSec(int sec) {
  //   Duration newPos = Duration(seconds: sec);
  //   // _player.seek(newPos);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAudio();
    // _pageManager = PageManager();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // _pageManager = PageManager();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(prefix: 'Assets/image');
    final url = await player.load('sound.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    // _pageManager.dispose();
    audioPlayer.dispose();
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    // AudioPlayer audioPlayer = AudioPlayer();
    // Song song = Song.songs[0];
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          fixedColor: Color(0xffffffff),
          unselectedItemColor: Color(0xffffffff),
          backgroundColor: Color(0xff091228),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('Assets/image/shuffle.png')),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/image/repeat.png'),
                ),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/image/playlist.png'),
                  color: Color(0xff091228),
                ),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/image/playlist.png'),
                  color: Color(0xff091228),
                ),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/image/playlist.png'),
                  color: Color(0xff091228),
                ),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('Assets/image/playlist.png'),
                  color: Color(0xff091228),
                ),
                label: "hi"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('Assets/image/playlist.png')),
                label: "hi")
          ],
        ),
      ),
      backgroundColor: Color(0xff091228),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'Assets/image/downarrow.png',
                      height: 15,
                      width: 16,
                    ),
                  ),
                  Text(
                    'Top picks',
                    style: GoogleFonts.roboto(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff)),
                  ),
                  Container()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: List.generate(
                          widget.recentlyPlayed.length,
                          (index) => Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 50, 55, 73),
                                        blurRadius: 10.0,
                                      )
                                    ]),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          widget.recentlyPlayed[widget.i],
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(),
                                        Column(
                                          children: [
                                            Text(
                                              widget.recentsongName[widget.i],
                                              style: GoogleFonts.roboto(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffffffff)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                  widget.recentsingerName[
                                                      widget.i],
                                                  style: GoogleFonts.roboto(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color.fromARGB(
                                                          255, 131, 145, 162))),
                                            ),
                                          ],
                                        ),
                                        // Image.asset(
                                        //   'Assets/image/blankheart.png',
                                        //   height: 17.36,
                                        //   width: 20,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                      // carouselController: _controller,
                      options: CarouselOptions(
                          //scrollPhysics: NeverScrollableScrollPhysics(),
                          // enableInfiniteScroll: false,
                          height: 400,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          //aspectRatio: 1 / 2,
                          viewportFraction: 0.7,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 280, right: 10),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: selectheart
                                ? Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                            onPressed: () {
                              setState(() {
                                selectheart = !selectheart;
                              });
                            },
                          )

                          // child: Image.asset(
                          //   'Assets/image/blankheart.png',
                          //   height: 17.36,
                          //   width: 20,
                          // ),
                          ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text((position.inSeconds.toDouble()).toString(),
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 131, 145, 162))),
                      Text(
                          (duration.inSeconds - position.inSeconds)
                              .toDouble()
                              .toString(),
                          style: GoogleFonts.roboto(
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 131, 145, 162))),
                    ]),
              ),
              Slider(
                activeColor: Colors.white,
                thumbColor: Colors.white,
                inactiveColor: Colors.white,
                min: 0,
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(),
                  Icon(
                    Icons.skip_previous_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 50,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await setAudio();
                          // String url =
                          //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
                          // await audioPlayer.play(url);
                        }
                      },
                    ),
                  ),
                  Icon(
                    Icons.skip_next_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  Container()
                ],
              )
              // const ProgressBar(
              //   timeLabelLocation: TimeLabelLocation.above,
              //   progressBarColor: Colors.white,
              //   baseBarColor: Colors.white,
              //   thumbColor: Colors.white,
              //   bufferedBarColor: Colors.white,
              //   progress: Duration.zero,
              //   total: Duration.zero,
              // ),

              // ValueListenableBuilder<ProgressBarState>(
              //   valueListenable: _pageManager.progressNotifier,
              //   builder: (_, value, __) {
              //     return ProgressBar(
              //       onSeek: _pageManager.seek,
              //       timeLabelLocation: TimeLabelLocation.above,
              //       timeLabelTextStyle:
              //           TextStyle(color: Color.fromARGB(255, 131, 145, 162)),
              //       baseBarColor: Color(0xffffffff),
              //       thumbColor: Color(0xffffffff),
              //       progressBarColor: Color(0xffffffff),
              //       progress: value.current,
              //       buffered: value.buffered,
              //       total: value.total,
              //     );
              //   },
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('02:50',
              //           style: GoogleFonts.roboto(
              //               fontStyle: FontStyle.normal,
              //               fontSize: 12,
              //               fontWeight: FontWeight.w400,
              //               color: Color.fromARGB(255, 131, 145, 162))),
              //       Text('04:00',
              //           style: GoogleFonts.roboto(
              //               fontStyle: FontStyle.normal,
              //               fontSize: 12,
              //               fontWeight: FontWeight.w400,
              //               color: Color.fromARGB(255, 131, 145, 162)))
              //     ],
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Image.asset(
              //     'Assets/image/progressbar.png',
              //     width: 343,
              //     height: 16,
              //     color: Colors.white,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       IconButton(
              //         color: Colors.white,
              //         icon: ImageIcon(
              //           AssetImage('Assets/image/previous.png'),
              //         ),
              //         iconSize: 28.0,
              //         onPressed: () {},
              //       ),
              //       CircleAvatar(
              //         backgroundColor: Colors.white,
              //         radius: 30,
              //         child: IconButton(
              //           color: Color(0xff091228),
              //           icon: select
              //               ? Icon(Icons.play_arrow)
              //               : ImageIcon(
              //                   AssetImage('Assets/image/pause.png'),
              //                 ),
              //           iconSize: 28.0,
              //           onPressed: () {
              //             setState(() {
              //               select = !select;
              //             });
              //           },
              //         ),
              //       ),
              //       IconButton(
              //         color: Colors.white,
              //         icon: ImageIcon(
              //           AssetImage('Assets/image/next.png'),
              //         ),
              //         iconSize: 28.0,
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // ),
              // ValueListenableBuilder<ButtonState>(
              //   valueListenable: _pageManager.buttonNotifier,
              //   builder: (_, value, __) {
              //     switch (value) {
              //       case ButtonState.loading:
              //         return Container(
              //           margin: const EdgeInsets.all(8.0),
              //           width: 32.0,
              //           height: 32.0,
              //           child: const CircularProgressIndicator(),
              //           color: Color(0xffffffff),
              //         );
              //       case ButtonState.paused:
              //         return IconButton(
              //           icon: const Icon(Icons.play_arrow),
              //           iconSize: 32.0,
              //           onPressed: _pageManager.play,
              //           color: Color(0xffffffff),
              //         );
              //       case ButtonState.playing:
              //         return IconButton(
              //           icon: const Icon(Icons.pause),
              //           iconSize: 32.0,
              //           onPressed: _pageManager.pause,
              //           color: Color(0xffffffff),
              //         );
              //     }
              //   },
              // ),
              // Padding(
              //     padding: const EdgeInsets.only(top: 200),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Image.asset(
              //           'Assets/image/shuffle.png',
              //           height: 25,
              //         ),
              //         Image.asset(
              //           'Assets/image/repeat.png',
              //           height: 25,
              //         ),
              //         SizedBox(
              //           width: 180,
              //         ),
              //         Image.asset(
              //           'Assets/image/playlist.png',
              //           height: 25,
              //         ),
              //       ],
              //     ))
            ],
          ),
        ),
      )),
    );
  }
}
