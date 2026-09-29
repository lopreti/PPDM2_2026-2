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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(2.5, 10)
                )              
              ]
            ),
            child: Text(
              'Card com sombra', 
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
    ),
  );  
}
