import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/GamePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(children: [
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Container(
            child: Center(
                child: Text(
              'TIC TAC TOE',
              style: GoogleFonts.arbutus(
                  textStyle: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400)),
            )),
          ),
        ),
//         AvatarGlow(
//  endRadius: 60.0,
//  child: Material(     // Replace this child with your own
//    elevation: 8.0,
//    shape: CircleBorder(),
//    child: CircleAvatar(
//      backgroundColor: Colors.grey[100],
//      child: Image.asset(
//        'assets/images/dart.png',
//        height: 50,
//      ),
//      radius: 30.0,
//    ),
//  ),
// ),
        Expanded(
          flex: 2,
          // child: Container(
          //   width: 150,
          //   height: 150,
          child: AvatarGlow(
            child: Container(
                width: 150,
                height: 150,
                child: Image.asset('lib/photos/tictactoe.png')),
            endRadius: 200,
            duration: Duration(milliseconds: 2000),
            repeatPauseDuration: Duration(milliseconds: 200),
            glowColor: Colors.grey,
          ),
        ),
        //  ),
        Expanded(
          flex: 1,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GamePage(),
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 210,
                  height: 75,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    'Play Game',
                    style: GoogleFonts.arbutus(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400)),
                  )),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
//  Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => GamePage(),
//                         ),
//                       );