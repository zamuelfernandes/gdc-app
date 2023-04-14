// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gdc/models/cores.dart';

import 'package:gdc/models/curiosidade.dart';

class ExpandedCard extends StatefulWidget {
  Widget leading;
  String categoryTitle;
  List<Curiosidade> curiosidades;

  ExpandedCard({
    Key? key,
    required this.leading,
    required this.categoryTitle,
    required this.curiosidades,
  }) : super(key: key);

  @override
  State<ExpandedCard> createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard> {
  bool _customIcon = false;
  late List<Widget> curiosidadesDaCategoria;

  @override
  void initState() {
    curiosidadesDaCategoria =
        List.generate(widget.curiosidades.length, (index) {
      String title = '';
      if (widget.curiosidades[index].title.length > 26) {
        title = '${widget.curiosidades[index].title.substring(0, 26)} ...';
      }
      return Row(
        children: [
          //LEADING ------------------------------------------------------------
          Container(
            width: 50,
            color: Cores().amarelo,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 15,
              ),
              child: Icon(
                Icons.qr_code,
                color: Cores().amarelo,
                size: 35,
              ),
            ),
          ),
          //CURIOUS ------------------------------------------------------------
          Container(
            width: 310,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SEPARATOR ----------------------------------------------------
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Cores().laranjaSec,
                        Cores().azulSec,
                      ],
                    ),
                  ),
                ),
                //CONTEXT ------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.explore,
                        color: Cores().laranjaSec,
                        size: 30,
                      ),
                      SizedBox(
                        height: 42,
                        width: 215,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.curiosidades[index].resume,
                              style: const TextStyle(
                                fontSize: 9,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_outward_sharp,
                        color: Cores().amarelo,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(
        elevation: 8,
        child: ListTileTheme(
          contentPadding: EdgeInsets.zero,
          dense: true,
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            leading: Container(
              width: 50,
              color: Cores().amarelo,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: widget.leading,
              ),
            ),
            title: Text(
              widget.categoryTitle,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Cores().laranja,
              ),
            ),
            trailing: Icon(
              _customIcon
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_rounded,
              size: 50,
              color: Cores().azul,
            ),
            children: curiosidadesDaCategoria,
            onExpansionChanged: (bool expanded) {
              setState(() => _customIcon = expanded);
            },
          ),
        ),
      ),
    );
  }
}
