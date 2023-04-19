// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gdc/components/curious_card.dart';

import 'package:gdc/components/custom_bar.dart';
import 'package:gdc/models/cores.dart';
import 'package:gdc/models/curiosidade.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CuriosidadeScreen extends StatefulWidget {
  Curiosidade curiosidade;
  CuriosidadeScreen({
    Key? key,
    required this.curiosidade,
  }) : super(key: key);

  @override
  State<CuriosidadeScreen> createState() => _CuriosidadeScreenState();
}

class _CuriosidadeScreenState extends State<CuriosidadeScreen> {
  List<CuriousCard> curiosidadesCards = List.generate(
    3,
    (index) => CuriousCard(
      curiosidade: Curiosidade(),
    ),
  );
  int activeIndex = 0;

  late YoutubePlayerController _ytController;
  late String tumbnail = '';

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.curiosidade.content[1]);
    tumbnail = YoutubePlayer.getThumbnail(
      videoId: videoID!,
      quality: ThumbnailQuality.max,
      webp: false,
    );
    // _ytController = YoutubePlayerController(
    //   initialVideoId: videoID,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //APPBAR -----------------------------------------------------------------
      appBar: CustomBar(context, onlyShare: true),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.curiosidade.image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TYPE BAND -----------------------------------------
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 6,
                            color: Cores().amarelo,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 20,
                              child: Center(
                                child: Text(
                                  widget.curiosidade.type,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Cores().azul,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //AUTOR -----------------------------------------
                            Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: Cores().laranja,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  margin: EdgeInsets.zero,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: widget.curiosidade.autorPicture,
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    widget.curiosidade.autor,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //DATA -----------------------------------------
                            Text(
                              widget.curiosidade.date,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Cores().amarelo,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, -5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(children: [
                //TITLE -----------------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: screenWidth * 0.8,
                  child: Text(
                    widget.curiosidade.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Cores().azul,
                    ),
                  ),
                ),
                //CONTENT 1 -----------------------------------------
                Container(
                  width: screenWidth * 0.9,
                  child: Text(
                    widget.curiosidade.content[0],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                //YOUTUBE -----------------------------------------
                Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.symmetric(vertical: 25),
                  // child: YoutubePlayer(
                  //   controller: _ytController,
                  //   showVideoProgressIndicator: true,
                  // ),
                  child: InkWell(
                    onTap: () {
                      print('tap');
                    },
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.network(tumbnail),
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 60,
                            ),
                            Icon(
                              Icons.play_circle_rounded,
                              color: Colors.red,
                              size: 70,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //CONTENT 2 -----------------------------------------
                Container(
                  width: screenWidth * 0.9,
                  child: Text(
                    widget.curiosidade.content[2],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                ),

                //RECOMENDADOS -------------------------------------------------
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recomendações',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Cores().azul,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: CarouselSlider(
                    items: curiosidadesCards,
                    options: CarouselOptions(
                      height: 238,
                      enableInfiniteScroll: false,
                      padEnds: false,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
