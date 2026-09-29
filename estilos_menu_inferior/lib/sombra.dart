import 'package:flutter/material.dart';

void main() {
  runApp(     
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(color: Colors.orange, width: 3),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Card com borda',
            style: TextStyle(
              fontSize: 22
              )
            ),
          ),
        ),
      ),
    ),
  );  
} 
