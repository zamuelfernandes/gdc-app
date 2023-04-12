import 'package:flutter/material.dart';
import 'package:gdc/components/curious_card.dart';
import 'package:gdc/components/custom_bar.dart';
import 'package:gdc/models/cores.dart';
import 'package:gdc/models/curiosidade.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            CuriousCard(
              curiosidade: Curiosidade(),
            ),
          ],
        ),
      ),
    );
  }
}
