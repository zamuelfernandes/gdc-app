// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Curiosidade {
  String title;
  String resume;
  List<dynamic> content;
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
    this.content = const [
      'As nuvens geralmente são brancas por causa da grande concentração de micro gotículas de água e pequenos cristais de gelo. Eles agem como peque- nos prismas, decompondo a luz solar nas cores do arco-íris (vermelho, laranja, amarelo, verde, azul, anil e violeta). Para quem olha a nuvem, o resultado é a soma de todas essas cores, que dá o branco. \n\nAs micro gotículas de água surgem com a condensação (passagem do estado gasoso para o líquido) do vapor na atmosfera. Essas gotículas, cujo diâmetro é de milésimos de centímetro, são muito leves e ficam flutuando. Somente quando se juntam devido a choques e formam gotas maiores é que elas ganham peso suficiente para cair.\n\nA meteorologista, jornalista e apresentadora Laura Ferreira falou sobre o tema no programa “Olá, Curiosos!”:',
      'https://www.youtube.com/watch?v=cHDZCtPYbh4&ab',
      'As nuvens de chuva ficam mais escuras porque não permitem que a luz solar as atravesse. A parte maior da luz solar é refletida e volta para o céu; outra consegue atravessar as nuvens e uma parte menor é absorvida por elas (de 5% a 10%). Como as nuvens de chuva, chamadas cúmulos-nimbos e estratos-nimbos são bastante densas e têm grande profundidade, a quantidade de luz que passa por elas é muito pequena. Se um avião sobrevoar essas nuvens, elas parecerão bastante claras, pois irão refletir quase toda a luz que recebem.\n\nAs nuvens ficam suspensas no ar pela constante evaporação e condensação do vapor de água que as forma. A grandes altitudes, o ar frio provoca a queda das gotas de água. Ao alcançar as camadas inferiores de ar mais quente, elas evaporam e sobem para se condensar outra vez, repetindo o ciclo.\n\nA cada segundo caem sobre a Terra, em forma de chuva, 16 bilhões de litros de água.',
    ],
    this.date = '15 de abril de 2021',
    this.type = 'Tipo',
    this.autor = 'Marcelo Duarte',
    this.image = const AssetImage('assets/images/image_background_nuvens.png'),
    this.autorPicture = const AssetImage('assets/images/marcelo_duarte.png'),
    this.bookmark = false,
  });
}
