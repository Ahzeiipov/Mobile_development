import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Favorite cards'),
            backgroundColor: Colors.blue,
          ),
          body: const Column(
            children: [
              FavoriteCard(
                title: 'School',
                description: ' Do u like ur university life?',
                isFavorite: true,
              ),
              FavoriteCard(
                title: 'School',
                description: ' Do u like ur university life?',
                isFavorite: false,
              ),
              FavoriteCard(
                title: 'School',
                description: ' Do u like ur university life?',
                isFavorite: true,
              ),
            ],
          )),
    ));

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard(
      {super.key,
      required this.title,
      required this.description,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey),
          )),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
