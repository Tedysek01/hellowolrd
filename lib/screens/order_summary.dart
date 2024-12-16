import 'package:flutter/material.dart';
import 'package:hellowolrd/post.dart';
import 'package:hellowolrd/car_data.dart';


class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: const Text('Shrnuti', style: TextStyle(fontSize:16, fontWeight:FontWeight.bold )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40,),
          Center(
            child: Container(
              child: Image.asset(
                carData[post.vehicleSize]!["big-image"]!, width: 320,),
            ),
          ),
          
          
           Padding(
            padding: EdgeInsets.only(left: 30),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Text(carData[post.vehicleSize]?["name"] ?? "Neznámé vozidlo", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 5,),
                  Text('${post.pickupLocation}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 5,),
                  Text('${post.dropoffLocation}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 5,),
                  Text('${post.date}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 5,),
                  Text('ODHAD CENY NA ZAKLADE KM X VELIKOST', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 5,),
                  Text('Spravni poplatek Kc', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500 )),
                  SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        Column(
          children: [
            TextField(
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: 
                        InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          prefixIcon: const Icon(Icons.discount_outlined
                          , color: Colors.white, size: 20,),
                          filled: true,
                          
                          fillColor: const Color.fromRGBO(71, 78, 156, 1),
                          hintText: 'Sem můžete vložit promo kód...',
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
                          Navigator.pushNamed(context, '');
                        },
                        child: const Text(
                          'Objednat',
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