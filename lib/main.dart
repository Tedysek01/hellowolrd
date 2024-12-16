import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellowolrd/screens/add_info.dart';
import 'package:hellowolrd/screens/chat_rooms.dart';
import 'package:hellowolrd/screens/chat_screen.dart';
import 'package:hellowolrd/screens/home.dart';
import 'package:hellowolrd/screens/order_summary.dart';
import 'package:hellowolrd/screens/pick_car.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializace Firebase
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
      ),
      home:  const MyHomePage(),
      routes: {
        '/homepage':(context) =>  const MyHomePage(),
        '/pick_car':(context) =>  const PickCar(),
        '/add_info':(context) =>  const AddInfo(),
        '/order_summary':(context)=>  const OrderSummary(),
        '/chatrooms':(context) =>  const ChatRooms(),
        '/chatscreen':(context) =>  const ChatScreen(),
      },
    );
  }
}


