import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gdc/components/curious_card.dart';
import 'package:gdc/components/custom_bar.dart';
import 'package:gdc/models/cores.dart';
import 'package:gdc/models/curiosidade.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CuriousCard> curiosidades = List.generate(
    5,
    (index) => CuriousCard(
      curiosidade: Curiosidade(),
    ),
  );

  int activeIndex = 0;
  @override
  void initState() {
    activeIndex = curiosidades.length ~/ 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores().azul,
      //APPBAR -----------------------------------------------------------------
      appBar: CustomBar(context, search: true, onlyNotify: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //WEBSTORIES -------------------------------------------------------
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'WebStories',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 8,
                    color: Cores().laranjaSec,
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 65,
                      height: 65,
                    ),
                  ),
                  Card(
                    elevation: 8,
                    color: Cores().laranjaSec,
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 65,
                      height: 65,
                    ),
                  ),
                  Card(
                    elevation: 8,
                    color: Cores().laranjaSec,
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 65,
                      height: 65,
                    ),
                  ),
                  Card(
                    elevation: 8,
                    color: Cores().laranjaSec,
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 65,
                      height: 65,
                    ),
                  ),
                  Card(
                    elevation: 8,
                    color: Cores().laranjaSec,
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 65,
                      height: 65,
                    ),
                  ),
                ],
              ),
            ),
            //TITLE ------------------------------------------------------------
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sabia que...',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //CARROSSEL --------------------------------------------------------
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  CarouselSlider(
                    items: curiosidades,
                    options: CarouselOptions(
                      height: 238,
                      initialPage: curiosidades.length ~/ 2,
                      enableInfiniteScroll: false,
                      //autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: curiosidades.length,
                      effect: JumpingDotEffect(
                        activeDotColor: Cores().laranja,
                        dotColor: Colors.white,
                        dotWidth: 10,
                        dotHeight: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
