import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    
    final nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        shadowColor: Colors.transparent,
        
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        
        title: Center(child: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
      ),



      body: Center(
        child:  Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 100, bottom: 100),
          child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 5,
                  offset: const Offset(-2, -2),
                  color:  Colors.black.withOpacity(0.5),
                ),
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                  color:  Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            child:  Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(

                  children: [
                    TextField(
        
        controller: nameController,
        obscureText: false,
        style: TextStyle(color: Colors.grey.shade800),
        decoration: InputDecoration(
        
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color:  Colors.white, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
               borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: "Your name",
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
                    Text("juchuu")
                  ],
                ),
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}
