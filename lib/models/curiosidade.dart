// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Curiosidade {
  String title;
  String resume;
  String date;
  String type;
  String autor;
  ImageProvider autorPicture;
  ImageProvider image;
  bool bookmark;

  Curiosidade({
    this.title =
        'Como as nuvens são formadas, quantos tipos existem e o que significam seus nomes.',
    this.resume =
        'This is accordiom text content. Lorem ipsum dolor sit amet. This is accordiom text content... ',
    this.date = '15 de abril de 2021',
    this.type = 'Tipo',
    this.autor = 'Marcelo Duarte',
    this.image = const AssetImage('assets/images/image_background_nuvens.png'),
    this.autorPicture = const AssetImage('assets/images/marcelo_duarte.png'),
    this.bookmark = false,
  });
}
