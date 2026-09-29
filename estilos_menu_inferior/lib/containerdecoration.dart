
import 'package:flutter/material.dart';

void main() {
  runApp(     
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(20),
            color: Colors.blue,
            child: Text(
              'Container estilizado',      
              textAlign: TextAlign.center,  
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22
              ),   
            ),
          ),
        ),
      ),
    ),
  );  
} 
