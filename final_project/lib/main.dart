import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:midterm/screens/index.dart';
import 'package:midterm/routes.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: const Login(),
    routes: routes,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.red), // Set AppBar background color
      buttonTheme: const ButtonThemeData(buttonColor: Colors.red), // Set button color
    ),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Midterm App"),
//           actions: [
//             IconButton(
//               onPressed: (){}, 
//               icon: const Icon(Icons.search),
//             )
//           ],
//         ),
//         body: const Center(
//           child: Text("This is my mobile application")
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){}, 
//           child: const Icon(Icons.add)
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings), label: "Settings")
//           ],
//         ),
//       ),
//     );
//   }
// }