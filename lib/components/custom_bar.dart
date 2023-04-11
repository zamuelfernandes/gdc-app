// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:gdc/models/cores.dart';

AppBar CustomBar(
  BuildContext context, {
  bool onlySettings = false,
  bool onlyNotify = false,
  bool search = false,
}) {
  Widget leftIcons = const SizedBox(width: 50);
  Widget rightIcons = const SizedBox(width: 50);

  if (search) {
    leftIcons = IconButton(
      icon: Card(
        color: Cores().amarelo,
        shape: const CircleBorder(),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              Icons.search,
              size: 25,
              color: Cores().azul,
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  } else {
    leftIcons = IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Card(
        color: Cores().amarelo,
        shape: const CircleBorder(),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Cores().azul,
            ),
          ),
        ),
      ),
    );
  }

  if (onlySettings) {
    rightIcons = Builder(
      builder: (context) => IconButton(
        icon: Card(
          color: Cores().amarelo,
          shape: const CircleBorder(),
          margin: EdgeInsets.all(0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(
                Icons.settings,
                size: 25,
                color: Cores().azul,
              ),
            ),
          ),
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  } else if (onlyNotify) {
    rightIcons = IconButton(
      icon: Card(
        color: Cores().amarelo,
        shape: const CircleBorder(),
        margin: EdgeInsets.all(0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              Icons.notifications,
              size: 25,
              color: Cores().azul,
            ),
          ),
        ),
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  } else {
    rightIcons = Row(
      children: [
        IconButton(
          icon: Card(
            color: Cores().amarelo,
            shape: const CircleBorder(),
            margin: EdgeInsets.all(0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Icon(
                  Icons.notifications,
                  size: 25,
                  color: Cores().azul,
                ),
              ),
            ),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        Builder(
          builder: (context) => IconButton(
            icon: Card(
              color: Cores().amarelo,
              shape: const CircleBorder(),
              margin: EdgeInsets.all(0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: Cores().azul,
                  ),
                ),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ],
    );
  }

  return AppBar(
    shadowColor: Colors.transparent,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: leftIcons,
    centerTitle: true,
    title: const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Image(
        image: AssetImage('assets/images/gdc-logo.png'),
        width: 60,
      ),
    ),
    actions: [rightIcons],
  );
}
