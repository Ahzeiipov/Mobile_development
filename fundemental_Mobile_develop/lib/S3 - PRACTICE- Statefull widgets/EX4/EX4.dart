// import 'package:flutter/material.dart';

// class ScoreWidget extends StatefulWidget {
//   @override
//   _ScoreWidgetState createState() => _ScoreWidgetState();
// }

// class _ScoreWidgetState extends State<ScoreWidget> {
//   double _score = 0.0;

//   void _incrementScore() {
//     setState(() {
//       _score = (_score + 10) % 101;
//     });
//   }

//   void _decrementScore() {
//     setState(() {
//       _score = (_score - 10) < 0 ? 0 : _score - 10;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'My score in Flutter',
//           style: TextStyle(
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 16.0),
//         Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             Container(
//               width: 300,
//               height: 30,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 height: 30,
//                 width: _score / 100 * 300,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: _decrementScore,
//               icon: Icon(Icons.remove),
//             ),
//             SizedBox(width: 16.0),
//             Text(
//               _score.toStringAsFixed(0),
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(width: 16.0),
//             IconButton(
//               onPressed: _incrementScore,
//               icon: Icon(Icons.add),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('My Flutter Score'),
//       ),
//       body: Center(
//         child: ScoreWidget(),
//       ),
//     ),
//   ));
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        child: Scorebar(),
      ),
    ),
  ));
}

class Scorebar extends StatefulWidget {
  const Scorebar({
    super.key,
  });

  @override
  State<Scorebar> createState() => _ScorebarState();
}

class _ScorebarState extends State<Scorebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'My score Dart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(onPressed: (){},
            icon: Icons.)
          ],
        ),
        Stack(
          children: [
            Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Expanded(
              child: Container(
                height: 30,
                // width: Function!!,
              )
             
            )

          ],
        )
      ],
    );
  }
}
