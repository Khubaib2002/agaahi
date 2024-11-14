// // import 'package:flutter/material.dart';
// // import 'package:agaahi/services/auth.dart';

// // class HomePage extends StatelessWidget {
// //   HomePage({super.key});

// //   final AuthService _auth = AuthService();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //           title: const Text(
// //             'AGAAHI',
// //             style: TextStyle(
// //                 fontSize: 25,
// //                 fontWeight: FontWeight.w500,
// //                 color: Color.fromARGB(255, 255, 255, 255),
// //                 fontStyle: FontStyle.italic,
// //                 fontFamily: 'Raleway'),
// //           ),
// //           backgroundColor: Colors.grey[850],
// //           actions: <Widget>[
// //             TextButton.icon(
// //               label: const Text(
// //                 "Log Out",
// //                 style: TextStyle(color: Color.fromARGB(255, 241, 235, 183)),
// //               ),
// //               onPressed: () async {
// //                 await _auth.SignOut();
// //               },
// //               icon: const Icon(Icons.person,
// //                   color: Color.fromARGB(255, 241, 235, 183)),
// //             )
// //           ]),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               _buildStylizedButton(
// //                 context: context,
// //                 label: 'DATA',
// //                 onPressed: () {}
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildStylizedButton({
// //     required BuildContext context,
// //     required String label,
// //     required VoidCallback onPressed,
// //   }) {
// //     return InkWell(
// //       onTap: onPressed,
// //       child: Container(
// //         width: 500,
// //         padding: const EdgeInsets.symmetric(vertical: 36.0),
// //         decoration: BoxDecoration(
// //           gradient: const LinearGradient(
// //             colors: [Colors.blueGrey, Colors.grey],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //           borderRadius: BorderRadius.circular(40),
// //           boxShadow: const [
// //             BoxShadow(
// //               color: Colors.black26,
// //               offset: Offset(0, 4),
// //               blurRadius: 8.0,
// //             ),
// //           ],
// //         ),
// //         child: Center(
// //           child: Text(
// //             label,
// //             style: const TextStyle(
// //                 fontSize: 35,
// //                 fontWeight: FontWeight.w500,
// //                 color: Color.fromARGB(255, 0, 0, 0),
// //                 fontStyle: FontStyle.italic,
// //                 fontFamily: 'Raleway'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:agaahi/services/auth.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'AGAAHI',
//           style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.w500,
//               color: Colors.white,
//               fontStyle: FontStyle.italic,
//               fontFamily: 'Raleway'),
//         ),
//         backgroundColor: Colors.grey[850],
//         actions: <Widget>[
//           TextButton.icon(
//             label: const Text(
//               "Log Out",
//               style: TextStyle(color: Color.fromARGB(255, 241, 235, 183)),
//             ),
//             onPressed: () async {
//               await _auth.SignOut();
//             },
//             icon: const Icon(Icons.person,
//                 color: Color.fromARGB(255, 241, 235, 183)),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Optional: Add a banner or header similar to Bykea's banner
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 color: Colors.green[400],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Welcome to AGAAHI!',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Grid layout for buttons
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2, // Two items per row
//                 mainAxisSpacing: 20,
//                 crossAxisSpacing: 20,
//                 children: [
//                   _buildGridButton(
//                     icon: Icons.event,
//                     label: 'EVENTS',
//                     color: Colors.teal,
//                     onPressed: () {},
//                   ),
//                   _buildGridButton(
//                     icon: Icons.travel_explore,
//                     label: 'TRAVEL',
//                     color: Colors.orange,
//                     onPressed: () {},
//                   ),
//                   _buildGridButton(
//                     icon: Icons.local_shipping,
//                     label: 'FREIGHT',
//                     color: Colors.purple,
//                     onPressed: () {},
//                   ),
//                   _buildGridButton(
//                     icon: Icons.admin_panel_settings,
//                     label: 'ADMIN',
//                     color: Colors.blue,
//                     onPressed: () {},
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGridButton({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onPressed,
//   }) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: Offset(0, 4),
//               blurRadius: 8.0,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 50, color: Colors.white),
//             const SizedBox(height: 10),
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:agaahi/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AGAAHI',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.grey[850],
        actions: <Widget>[
          TextButton.icon(
            label: const Text(
              "Log Out",
              style: TextStyle(color: Color.fromARGB(255, 241, 235, 183)),
            ),
            onPressed: () async {
              await _auth.SignOut();
            },
            icon: const Icon(Icons.person,
                color: Color.fromARGB(255, 241, 235, 183)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile block with user image and name
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  // User profile picture
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/tt.png'), // Replace with user image asset path
                  ),
                  SizedBox(width: 15),
                  // User name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Muhammad \n Khubaib', // Replace with actual user name if available
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Grid layout for buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two items per row
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildGridButton(
                    icon: Icons.event,
                    label: 'EVENTS',
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                  _buildGridButton(
                    icon: Icons.travel_explore,
                    label: 'TRAVEL',
                    color: Colors.orange,
                    onPressed: () {},
                  ),
                  _buildGridButton(
                    icon: Icons.local_shipping,
                    label: 'FREIGHT',
                    color: Colors.purple,
                    onPressed: () {},
                  ),
                  _buildGridButton(
                    icon: Icons.admin_panel_settings,
                    label: 'SETTINGS',
                    color: Colors.blue,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
