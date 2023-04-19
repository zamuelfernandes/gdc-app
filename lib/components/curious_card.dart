// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gdc/models/cores.dart';
import 'package:gdc/models/curiosidade.dart';
import 'package:gdc/screens/cusiosidade_screen.dart';

class CuriousCard extends StatefulWidget {
  Curiosidade curiosidade;
  CuriousCard({
    Key? key,
    required this.curiosidade,
  }) : super(key: key);

  @override
  State<CuriousCard> createState() => _CuriousCardState();
}

class _CuriousCardState extends State<CuriousCard> {
  @override
  Widget build(BuildContext context) {
    Icon bookmark;
    String title = 'Sem título';

    if (widget.curiosidade.bookmark) {
      bookmark = Icon(
        Icons.bookmark,
        size: 25,
        color: Cores().azul,
      );
    } else {
      bookmark = Icon(
        Icons.bookmark_border,
        size: 25,
        color: Cores().azul,
      );
    }
    if (widget.curiosidade.title.length > 55) {
      title = '${widget.curiosidade.title.substring(0, 55)} ...';
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => CuriosidadeScreen(
                  curiosidade: widget.curiosidade,
                )),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 340,
        child: Card(
          shape: const RoundedRectangleBorder(),
          elevation: 20,
          child: Column(
            children: [
              //TOP CONTEXT -------------------------------------------------------
              Container(
                width: 340,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.curiosidade.image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
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
                        IconButton(
                          icon: Card(
                            elevation: 6,
                            margin: EdgeInsets.zero,
                            color: Cores().amarelo,
                            shape: const CircleBorder(),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: bookmark,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.curiosidade.bookmark =
                                  !widget.curiosidade.bookmark;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //BOT CONTEXT ------------------------------------------------------
              Container(
                width: 340,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TITLE -----------------------------------------
                          SizedBox(
                            width: 180,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Cores().azul,
                              ),
                            ),
                          ),
                          //SHARE -----------------------------------------
                          Row(
                            children: [
                              Text(
                                'Compartilhar',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Cores().amarelo,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.share,
                                  size: 15,
                                  color: Cores().amarelo,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //AUTOR -----------------------------------------
                          Row(
                            children: [
                              Card(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    width: 1.5,
                                    color: Cores().laranja,
                                  ),
                                ),
                                margin: EdgeInsets.zero,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    image: widget.curiosidade.autorPicture,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  widget.curiosidade.autor,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
                              color: Cores().laranja,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
