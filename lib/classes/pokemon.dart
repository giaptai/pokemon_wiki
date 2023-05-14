import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//lay API
Future<List<Pokemon>> fetchPokemon() async {
  List<Pokemon> listPokemon = [];
  var res = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
  // If the server did return a 200 OK response,
  if (res.statusCode == 200) {
    List jsonObj = jsonDecode(res.body)['pokemon'];
    // listPokemon = jsonObj.map((poke) => Pokemon.fromJson(poke)).toList();
    for (var item in jsonObj) {
      listPokemon.add(Pokemon.fromJson(item));
    }
    return listPokemon; // tra ve danh sach dang List<Pokemon>
  } else {
    throw Exception('Failed to load json');
  }
}

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<dynamic> types;
  final String height;
  final String weight;
  final List<dynamic> weaknesses;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.types,
    required this.height,
    required this.weight,
    required this.weaknesses,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      types: json['type'],
      height: json['height'],
      weight: json['weight'],
      weaknesses: json['weaknesses'],
    );
  }
}
