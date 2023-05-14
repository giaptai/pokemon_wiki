import 'package:flutter/material.dart';
import 'package:pokemon_wiki/shared/varcolors.dart';
import '../classes/pokemon.dart';
import '../widgets/details_screen.dart';

//tao bien va ham tai su dung
class Constants {
//định dạng text chi tiết
  static Widget textDetails(int a) {
    return Text(
      a == 0 ? 'Type:' : 'Weaknesses',
      style: const TextStyle(
        letterSpacing: 1,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

// the loai nut
  static Color btnTagTypesColor(String colorsName) {
    Color col;
    switch (colorsName) {
      case 'Grass':
      case 'Bug':
        col = grass;
        break;
      case 'Water':
        col = water;
        break;
      case 'Normal':
      case 'Steel':
        col = normal;
        break;
      case 'Electric':
        col = electric;
        break;
      case 'Fire':
        col = fire;
        break;
      case 'Psychic':
        col = psychic;
        break;
      case 'Fighting':
        col = fighting;
        break;
      case 'Rock':
        col = rock;
        break;
      case 'Poison':
        col = poison;
        break;
      case 'Ice':
        col = ice;
        break;
      default:
        col = Colors.red;
    }
    return col;
  }

//nút thể loại
  static Widget btntagType(String name) {
    return Container(
      height: 30,
      width: 74,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: btnTagTypesColor(name),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
        child: Text(name, style: const TextStyle(color: white, fontSize: 11)),
      ),
    );
  }

//hàm hiện chi tiết Pokemon
  static Widget cardPokemon(Pokemon item, BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(poke: item)),
        );
      }),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.white, width: 0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              item.img,
              fit: BoxFit.cover,
              scale: 1.25,
              frameBuilder: (context, image, frame, wasSynchronouslyLoaded) {
                if (frame == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return image;
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Error !')),
            ),
            Text(
              item.name,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            Wrap(
              children: [
                for (var type in item.types) Constants.btntagType(type),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

import '../classes/pokemon.dart';
import '../widgets/details_screen.dart';

class Constants {
  static const Color grass = Color(0xff78c850);
  static const Color water = Color(0xff4592c4);
  static const Color electric = Color(0xffeed535);
  static const Color fire = Color(0xfffd7d24); //0xff
  static const Color spychic = Color(0xfff366b9);
  static const Color posion = Color(0xffb97fc9);
  static const Color ice = Color(0xff51c4e7);
  static const Color white = Colors.white;
  static const Color bgDetails = Color(0xff11c6cd);

  static Widget textDetails(int a) {
    return Text(
      a == 0 ? 'Type:' : 'Weaknesses',
      style: const TextStyle(
        letterSpacing: 1,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Widget btntagType(String name, Color cl) {
    return Container(
      height: 30,
      width: 74,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: cl,
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
            // side: BorderSide(

            // )
          ),
        ),
        child: Text(name, style: const TextStyle(color: white, fontSize: 11)),
      ),
    );
  }

  static Widget cardPokemon(Pokemon item, BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(poke: item)),
        );
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: BorderSide(color: Colors.white, width: 0), //OutlineInputBorder
          side: const BorderSide(
              color: Colors.white, width: 0), //RoundedRectangleBorder
        ),
        // color: grass,
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              item.img,
              fit: BoxFit.cover,
              scale: 1.25,
              // loadingBuilder: (BuildContext context, Widget image,
              //     ImageChunkEvent? loadingProgress) {
              //   if (loadingProgress == null) {
              //     return image;
              //   }
              //   return const Center(child: CircularProgressIndicator());
              // },
              frameBuilder: (context, image, frame, wasSynchronouslyLoaded) {
                if (frame == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return image;
              },
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Error !')),
            ),
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Wrap(
              // children: [
              // ...(item.types)
              //     .map((item) => Constants.btntagType(
              //           item,
              //           Constants.spychic,
              //         ))
              //     .toList(),
              children: [
                for (var s in item.types)
                  Constants.btntagType(s, Constants.spychic),
              ],
              // ],
            ),
          ],
        ),
      ),
    );
  }
}

*/