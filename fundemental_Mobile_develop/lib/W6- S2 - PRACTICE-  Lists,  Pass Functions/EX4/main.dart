import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(const MaterialApp(
      home: JokeList(),
    ));

class JokeList extends StatelessWidget {
  const JokeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: const FavoriteCard(),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  int? favoriteIdex;

  void onFavoriteClick(int index) {
    setState(() {
      favoriteIdex = favoriteIdex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: .5, color: Colors.grey),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jokes[index].title,
                      style: TextStyle(
                          color: appColor, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10.0),
                    Text(jokes[index].description),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () => onFavoriteClick(index),
                  icon: Icon(
                    favoriteIdex == index
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteIdex == index ? Colors.red : Colors.grey,
                  ))
            ],
          ),
        );
      },
    );
  }
}
