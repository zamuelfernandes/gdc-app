import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdc/components/custom_bar.dart';
import 'package:gdc/models/cores.dart';

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
                    fontSize: 12,
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
            )
          ],
        ),
      ),
    );
  }
}
