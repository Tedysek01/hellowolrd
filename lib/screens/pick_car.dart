import 'package:flutter/material.dart';
import 'package:hellowolrd/post.dart';
import 'package:hellowolrd/car_data.dart';

class PickCar extends StatefulWidget {
  const PickCar({super.key});

  @override
  State<PickCar> createState() => _PickCarState();
}

class _PickCarState extends State<PickCar> {
  final TextEditingController _dateController = TextEditingController();

  String _selectedCar = "medium";

  bool _validateInputs() {
    if (_dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Zadejte datum!'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context)!.settings.arguments as Post;
    // ignore: avoid_print
    print('Post received in PickCar: $post');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: const Text('Jak velké auto budeš potřebovat?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                carData[_selectedCar]!["big-image"]!,
                width: 320,
              ),
              Text(
                carData[_selectedCar]!["name"]!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                carData[_selectedCar]!["description"]!,
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: carData.keys.map((key) {
              final isSelected = _selectedCar == key;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCar = key; // Změna výběru
                  });
                  post.vehicleSize = key; // Uložení výběru do objektu Post
                },
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isSelected
                        ? const Color.fromRGBO(76, 83, 163, 1) // Aktivní barva
                        : const Color.fromRGBO(
                            54, 60, 121, 1), // Neaktivní barva
                  ),
                  child: Image.asset(
                    carData[key]!["image"]!,
                    width: 100,
                  ),
                ),
              );
            }).toList(),
          ),
          Column(
            children: [
              const Text(
                '/ODHAD CENY NA ZÁKLADĚ KM X VELIKOST/',
                style: TextStyle(
                    color: Color.fromARGB(255, 219, 219, 219),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _dateController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                    prefixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(71, 78, 156, 1),
                    hintText: 'Vyber datum a čas...',
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
                  if (_validateInputs()) {
                    // ignore: avoid_print
                    post.date =  _dateController.text;
                    post.vehicleSize = _selectedCar;
                    // ignore: avoid_print
                    print('tent post: $post');
                    Navigator.pushNamed(context, '/add_info', arguments: post);
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
        ],
      ),
    );
  }
}
