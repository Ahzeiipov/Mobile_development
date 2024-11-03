import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 156, 179),
        body: Center(
          child: Text("Hi im sreypov",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              )),
        ),
      ),
    ),
  );
}

//   Ex2

// void main() {
//   runApp(MaterialApp(
//     home: Container(
//       padding: EdgeInsets.all(60),
//       margin: EdgeInsets.all(50),
//       color: const Color.fromARGB(255, 78, 158, 224),

//     ),

//   ));
// }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//           padding: EdgeInsets.all(60),
//           margin: EdgeInsets.all(50),
//           color: const Color.fromARGB(255, 78, 158, 224),
//           child: Column(
//             // Use a Column to stack the inner container vertically
//             children: [
//               Text(
//                 "Container 1",
//                 style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white), // Text style for visibility
//               ),
//               SizedBox(
//                   height:
//                       20), // Add some space between the text and the inner container
//               Container(
//                 padding: EdgeInsets.all(30),
//                 color: const Color.fromARGB(
//                     255, 224, 78, 158), // Color for the second container
//                 child: Center(
//                   child: Text(
//                     "Container 2",
//                     style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white), // Text style for visibility
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
