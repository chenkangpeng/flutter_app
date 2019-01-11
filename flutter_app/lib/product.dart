import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ProductWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProductWidgetState();
  }
}

class ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('产品列表'),
          centerTitle: true,
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}




class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(color:Colors.blue,fontSize: 40.0);
  final _saved = new Set<WordPair>();

  void onPushSave() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asLowerCase,
            style: _biggerFont,
          ),
        );
      });
      final divided =
      ListTile.divideTiles(tiles: tiles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildListView(),
    );
  }

  Widget buildListView() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd)
        return new Divider(
          height: 20,
          color: Colors.blue,
        );
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return buildRowItem(_suggestions[index]);
    });
  }

  Widget buildRowItem(WordPair wordPair) {
    final isSaved = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asLowerCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : Colors.grey,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}