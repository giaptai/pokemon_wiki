import 'package:flutter/material.dart';
import 'package:pokemon_wiki/classes/pokemon.dart';
import '../shared/constants.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.poke}) : super(key: key);
  final Pokemon poke;
  @override
  Widget build(BuildContext context) {
    var pwidth = MediaQuery.of(context).size.width;
    var pheight = MediaQuery.of(context).size.height;
    // print(context.)
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Constants.bgDetails.withOpacity(0),
          elevation: 0,
        ),
        body: Container(
          width: pwidth,
          height: pheight,
          color: Constants.bgDetails,
          // padding: EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: pheight * 0.6,
                width: pwidth * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // border: Border.all(color: grass, width: 4),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Number: ${poke.num}',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Height: ${poke.height}',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Weight: ${poke.weight}',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 25),
                    Column(
                      children: [
                        Constants.textDetails(0),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            for (var type in poke.types)
                              Constants.btntagType(type, Constants.grass),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        Constants.textDetails(1),
                        Wrap(
                          direction: Axis.horizontal,
                          verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: (poke.weaknesses)
                              .map((e) =>
                                  Constants.btntagType(e, Constants.fire))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: pheight * 0.1,
                child: Column(
                  children: [
                    Image.network(
                      poke.img,
                      filterQuality: FilterQuality.low,
                      // height: pheight * 0.25,
                      // width: pheight * 0.25,
                      fit: BoxFit.contain,
                      frameBuilder:
                          (context, image, frame, wasSynchronouslyLoaded) {
                        if (frame == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return image;
                      },
                      errorBuilder: (_, __, ___) => const Center(child: Text('Error !')),
                    ),
                    Text(
                      poke.name,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
