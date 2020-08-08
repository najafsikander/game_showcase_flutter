import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameshowcase/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double _width;
  final double _height;
  final bool _showTitle;
  final List<Game> _gameData;

  ScrollableGamesWidget(
      this._width, this._height, this._showTitle, this._gameData);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: _gameData.map((_game) {
          return Container(
            width: _width * 0.31,
            height: _height,
            padding: EdgeInsets.only(right: _width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: _height * 0.8,
                  width: _width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url),
                    ),
                  ),
                ),
                _showTitle?Text(
                  _game.title,
                  style: TextStyle(color: Colors.white,
                      fontSize: _height * 0.08),
                  maxLines: 2,
                ):Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
