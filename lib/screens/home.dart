// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:hellowolrd/post.dart'; // Přidáš cestu k souboru s třídou

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(50.073658, 14.418540),
  zoom: 14.4746,
);
final TextEditingController _pickupController = TextEditingController();
final TextEditingController _dropoffController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  // TextEditingControllers pro uložení zadaných hodnot
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();

  // Metoda pro validaci
  bool _validateInputs() {
    if (_pickupController.text.isEmpty || _dropoffController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vyplňte obě místa!'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Global key to control the drawer
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey, // Assign the key to Scaffold
      body: Stack(
        children: [
          // Background layer (can be a placeholder or a map)
          Container(
            color: Colors.blue[50], // Placeholder for map
            child: const Center(
              child: GoogleMap(initialCameraPosition: _kGooglePlex),
            ),
          ),
          // Header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(113, 255, 255, 255),
                    Color.fromARGB(100, 255, 255, 255),
                    Color.fromARGB(88, 255, 255, 255),
                    Color.fromARGB(57, 255, 255, 255),
                    Color.fromARGB(20, 255, 255, 255),
                    Color.fromARGB(0, 255, 255, 255)
                  ])),
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
              ),
              height: 100,
              // Transparent background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Icon with Pink Dot
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(71, 78, 156, 1)),
                        child: IconButton(
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                          iconSize: 24,
                          onPressed: () {
                            scaffoldKey.currentState
                                ?.openDrawer(); // Open the drawer
                          },
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Color.fromRGBO(230, 42, 255, 1),
                        ),
                      ),
                    ],
                  ),
                  // Center Logo
                  Row(
                    children: [
                      Image.network(
                        'https://cdn.prod.website-files.com/66c76774441d215d277f7d3b/66c768fc3bb556f81833db18_HaulGO%20WIde-p-500.webp',
                        width: 100,
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  // Right Icon with Pink Dot
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(71, 78, 156, 1)),
                        child: IconButton(
                          icon: const Icon(Icons.chat_bubble_outline_sharp),
                          color: Colors.white,
                          iconSize: 24,
                          onPressed: () {
                            Navigator.pushNamed(context, '/chatrooms');
                          },
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Color.fromRGBO(230, 42, 255, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Main Content (Bottom part with inputs and button)
          Positioned.fill(
            top: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  GooglePlacesAutoCompleteTextFormField(
                    googleAPIKey: 'AIzaSyDUk2YTkFMXA2wJUZ3bTKKbi5uoalSdoww',
                    textEditingController: _pickupController,
                    countries: const ['cz'],
                    onSuggestionClicked: (Prediction prediction) =>
                    _pickupController.text = prediction.description!,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(71, 78, 156, 1),
                        hintText: 'Zadejte misto vykladky',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(159, 255, 255, 255),
                            fontSize: 16)),
                  
                  ),
                  
                  GooglePlacesAutoCompleteTextFormField(
                    googleAPIKey: 'AIzaSyDUk2YTkFMXA2wJUZ3bTKKbi5uoalSdoww',
                    textEditingController: _dropoffController,
                    countries: const ['cz'],
                    onSuggestionClicked: (Prediction prediction) =>
                    _dropoffController.text = prediction.description!,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(71, 78, 156, 1),
                        hintText: 'Zadejte misto vykladky',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(159, 255, 255, 255),
                            fontSize: 16)),
                  
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 100),
                      backgroundColor: const Color.fromARGB(255, 238, 0, 255),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: const LinearBorder(),
                    ),
                    onPressed: () {
                      // Validace vstupů
                      if (_validateInputs()) {
                        Post post = Post(
                          pickupLocation: _pickupController.text,
                          dropoffLocation: _dropoffController.text,
                        );
                        // Navigace na další obrazovku s předáním post
                        print('Current Post: $post');

                        Navigator.pushNamed(
                          context,
                          '/pick_car',
                          arguments: post,
                        );
                      }
                    },
                    child: const Text(
                      'Pokračovat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 325,
        backgroundColor: const Color.fromRGBO(37, 46, 142, 1),
        child: Column(
          children: [
            // Drawer Header
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(71, 78, 156, 1),
              ),
              child: const SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 27,
                        foregroundImage:
                            AssetImage('assets/images/Artboard 4.png'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tadeáš Raška',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Můj účet',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 223, 30, 233),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // First Section (Menu Items)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(71, 78, 156, 1),
              ),
              child: SizedBox(
                height: 165,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/Nabidky.png', height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Nabídky',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/moje_prispevky.png',
                              height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Moje Příspěvky',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/hotove_prevozy.png',
                              height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Hotové převozy',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Second Section (More Menu Items)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(71, 78, 156, 1),
              ),
              child: SizedBox(
                height: 165,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/Podminky.png', height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Podmínky Služby',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/Ochrana.png', height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Ochrana údajů',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/Podpora.png', height: 30),
                          const SizedBox(width: 12),
                          const Text(
                            'Podpora',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Spacer to push the next section to the bottom
            const Spacer(),

            // Bottom Section
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0, left: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Odhlásit se',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Smazat účet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
