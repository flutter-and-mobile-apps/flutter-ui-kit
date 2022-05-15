import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kNavColor = Color(0xFF3F5A9E);
const kPrimaryColor = Color.fromARGB(255, 83, 117, 202);
const kDullWhite = Color.fromARGB(255, 221, 221, 221);



// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var WIDTH = MediaQuery.of(context).size.width;
//     return BottomAppBar(
//       color: kNavColor,
//       shape: const CircularNotchedRectangle(),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () => {},
//             icon: const Icon(
//               Icons.menu,
//               size: 50,
//               color: Colors.white,
//             ),
//           ),
//           spaceBetweenItems(WIDTH),
//           IconButton(
//             onPressed: () => {},
//             icon: const Icon(Icons.videogame_asset,
//                 size: 50, color: Colors.white),
//           ),
//           spaceBetweenItems(WIDTH),
//           IconButton(
//             onPressed: () => {},
//             icon: const Icon(Icons.supervised_user_circle,
//                 size: 50, color: Colors.white),
//           ),
//           spaceBetweenItems(WIDTH),
//           IconButton(
//             onPressed: () => {},
//             icon: const Icon(Icons.supervised_user_circle,
//                 size: 50, color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// Widget spaceBetweenItems(double WIDTH) => SizedBox(
//   width: WIDTH * 0.09,
// );
//
