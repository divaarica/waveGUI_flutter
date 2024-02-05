import 'package:wave_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
//! On retrouve les packages de flutter au niveau de pub.dev

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//verifiaction si tout les widget sont bien initialiser

  cameras = await availableCameras();//fonction qui va aller chercher au niveau du peripheriquequel sont les camera disponible et la litse des camera disponibe
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


