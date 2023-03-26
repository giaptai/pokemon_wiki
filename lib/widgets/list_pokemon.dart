import 'package:flutter/material.dart';
import '../classes/pokemon.dart';
import '../shared/constants.dart';

class ListPokemon extends StatefulWidget {
  ListPokemon({super.key, required this.searchByName, required this.pheight});
  final String searchByName;
  final double pheight;
  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  late Future<List<Pokemon>> futurePokemon;

  Future<List<Pokemon>> searchPokemon(String name) async {
    //neu xai asyn voi await luc nay no tra ve list<Pokemon> chu khong phai ham Future<List<Pokemon>>
    // List<Pokemon> tempList = (await fetchPokemon()).where((element) => false).toList();
    List<Pokemon> tempList = await fetchPokemon();
    List<Pokemon> filterList;
    if (name.isNotEmpty) {
      filterList = tempList
          .where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    } else {
      filterList = tempList;
    }
    return filterList;
  }

  @override
  void initState() {
    super.initState();
    futurePokemon = searchPokemon(widget.searchByName);
  }

// hàm này đươc gọi khi searchController thay đổi
  @override
  void didUpdateWidget(ListPokemon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchByName != widget.searchByName) {
      futurePokemon = searchPokemon(widget.searchByName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: widget.pheight * 0.4,
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Constants.cardPokemon(snapshot.data![index], context);
                }),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
                // remember write return to show the widget on screen
                  // This function has a nullable return type of 'Widget?', but ends without returning a value.
                  // Try adding a return statement, or if no value is ever returned, try changing the return type to 'void'.