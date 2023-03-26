import 'package:flutter/material.dart';
import 'package:pokemon_wiki/widgets/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pwidth = MediaQuery.of(context).size.width;
    var pheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/login_pokemon.png'))),
        width: pwidth,
        height: pheight,
        child: Padding(
          padding: EdgeInsets.only(top: (pheight * 0.25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pokemon Wiki',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[800],
                    padding: const EdgeInsets.all(6.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'KHÁM PHÁ THÔI !',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
