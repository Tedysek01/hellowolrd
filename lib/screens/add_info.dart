import 'package:flutter/material.dart';
import 'package:hellowolrd/post.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  
  final TextEditingController _descriptionController = TextEditingController();
  bool _validateInputs() {
    if (_descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Zadejte popis!'),
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 11, 127, 1),
        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: const Text(
          'Co budeme převážet?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40,),
          SizedBox(
            width: 360,
            height: 230,
            child: TextField(
              controller: _descriptionController,
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        color: Color.fromRGBO(105, 110, 170, 1),
                        width: 2,
                        ),
                        ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        color: Color.fromRGBO(105, 110, 170, 1),
                        width: 2,
                        ),),
                filled: true,
                fillColor: const Color.fromRGBO(71, 78, 156, 1),
                hintText: 'Postel, Skrin, Nocni stolek...',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 249, 249, 249),
                  fontSize: 14,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 360,
            height: 230,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        color: Color.fromRGBO(105, 110, 170, 1),
                        width: 2,
                        ),
                        ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        style: BorderStyle.solid,
                        color: Color.fromRGBO(105, 110, 170, 1),
                        width: 2,
                        ),),
                filled: true,
                fillColor: const Color.fromRGBO(71, 78, 156, 1),
                hintText: 'Tady bude fotka',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 249, 249, 249),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(1000, 100),
              backgroundColor: const Color.fromARGB(255, 238, 0, 255),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: const LinearBorder(),
            ),
            onPressed: () {
              if (_validateInputs()){
              post.description = _descriptionController.text;
              
               // ignore: avoid_print
               print('Current Post: $post');
              Navigator.pushNamed(context,'/order_summary', arguments: post);
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
    );
  }
}
