import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdc/components/curious_card.dart';
import 'package:gdc/components/custom_bar.dart';
import 'package:gdc/components/expanded_card.dart';
import 'package:gdc/models/cores.dart';
import 'package:gdc/models/curiosidade.dart';
import 'package:gdc/models/webstorie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CuriousCard> curiosidadesCards = List.generate(
    5,
    (index) => CuriousCard(
      curiosidade: Curiosidade(),
    ),
  );

  List<Curiosidade> curiosidadesDia = List.generate(
    3,
    (index) => Curiosidade(),
  );

  List<WebStorie> webStoriesDia = List.generate(
    5,
    (index) => WebStorie(),
  );

  int activeIndex = 0;
  late List<Widget> websoriesDoDia;

  @override
  void initState() {
    activeIndex = curiosidadesCards.length ~/ 2;
    websoriesDoDia = List.generate(webStoriesDia.length, (index) {
      return Card(
        elevation: 8,
        color: Cores().amarelo,
        shape: CircleBorder(),
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            border: Border.all(color: Cores().amarelo, width: 2),
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: webStoriesDia[index].image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
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
                children: websoriesDoDia,
              ),
            ),
            //TITLE 1 ----------------------------------------------------------
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
                    items: curiosidadesCards,
                    options: CarouselOptions(
                      height: 238,
                      initialPage: curiosidadesCards.length ~/ 2,
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
                      count: curiosidadesCards.length,
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
            //TITLE 2 ----------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hoje é dia ${DateTime.now().day}/${DateTime.now().month}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //SANFONADO --------------------------------------------------------
            Column(
              children: [
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/calendar_check.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Curiosidade do Dia',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/lamp.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Fatos do Dia',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/baloon.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Perguntas Curiosas',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/happy.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Abobrinhas do Dia',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/efem.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Efemérides',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/angels.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Santo do Dia',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/cake.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Aniverssários',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/death.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Falecidos',
                  curiosidades: curiosidadesDia,
                ),
                ExpandedCard(
                  leading: SvgPicture.asset(
                    'assets/icons/etc.svg',
                    height: 35,
                    width: 35,
                  ),
                  categoryTitle: 'Frases do Dia',
                  curiosidades: curiosidadesDia,
                ),
                //ENDING POINTS ------------------------------------------------
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        width: 10,
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          width: 10,
                          height: 10,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        width: 10,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
