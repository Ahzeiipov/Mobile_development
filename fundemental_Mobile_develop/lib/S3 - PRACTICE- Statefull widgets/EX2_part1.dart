import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:const Text('Favorite cards'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey),
              )),
              padding:const  EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                children: [
                  const Expanded(
                    // flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'description',
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
