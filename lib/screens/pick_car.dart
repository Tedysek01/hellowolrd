

import 'package:flutter/material.dart';
import 'package:hellowolrd/post.dart';

class PickCar extends StatefulWidget {
  const PickCar({super.key});

  @override
  State<PickCar> createState() => _PickCarState();
}

class _PickCarState extends State<PickCar> {

  @override
  Widget build(BuildContext context) {
  final Post post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: const Text('Jak velké auto budeš potřebovat?', style: TextStyle(fontSize:16, fontWeight:FontWeight.bold )),
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset('assets/images/Artboard 2.png', width: 320,),
              const Text('HaulGO Dodávka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
              const SizedBox(height: 5,),
              const Text('Ideální na větší nábytek, nebo celý pokoj', style: TextStyle(fontSize: 14, color: Colors.white),)
            ],
          )
          ,
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              
              Container(
                width: 110,
                decoration: 
                        BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromRGBO(54, 60, 121, 1)),
                child: Image.asset('assets/images/Artboard 6.png',width: 110,)
              ),
              Container(
                width: 110,
                decoration: 
                        BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromRGBO(76, 83, 163, 1)),
                child: Image.asset('assets/images/Artboard 5.png',width: 100)
              ),
              Container(
                width: 110,
                decoration: 
                        BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromRGBO(54, 60, 121, 1)),
                child: Image.asset('assets/images/Artboard 4.png',width: 100),
              ),
          ],),
          
          Column(
          
            children: [
              Text('${post.pickupLocation}'),
              Text('${post.dropoffLocation}'),
              const Text('/ODHAD CENY NA ZÁKLADĚ KM X VELIKOST/', style: TextStyle(color: Color.fromARGB(255, 219, 219, 219), fontSize: 16, fontWeight: FontWeight.w600),),
              const SizedBox(height: 15,),
              TextField(
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: 
                        InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          prefixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 20,),
                          filled: true,
                          
                          fillColor: const Color.fromRGBO(71, 78, 156, 1),
                          hintText: 'Vyber datum a čas...',
                          hintStyle: const TextStyle(color: Color.fromARGB(159, 255, 255, 255), fontSize: 16)
                        ),
                      ),
                      
                      ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(1000, 100),
                          backgroundColor: const Color.fromARGB(255, 238, 0, 255),
                          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                          
                          shape: const LinearBorder(),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_info');
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