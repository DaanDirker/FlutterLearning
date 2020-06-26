import 'package:concept/data/model/RecipeModel.dart';
import 'package:flutter/material.dart';

TextStyle headerStyle = TextStyle(
  fontSize: 18,
  color: Colors.black87,
  fontWeight: FontWeight.bold,
);

TextStyle detailStyle = TextStyle(
  fontSize: 14,
  color: Colors.black45,
);

class _RecipeState extends State<Recipe> {
  bool _fav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      height: 74.0,
      child: Row(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(top: 8.0),
            width: 100.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.recipe.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(widget.recipe.title,
                          overflow: TextOverflow.ellipsis, style: headerStyle),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(widget.recipe.detail,
                            overflow: TextOverflow.ellipsis,
                            style: detailStyle),
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(_fav ? Icons.favorite : Icons.favorite_border,
                      color: this._fav ? Colors.redAccent : Colors.red),
                  onPressed: () => {setState(() => _fav = !_fav)},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe extends StatefulWidget {
  final RecipeModel recipe;

  Recipe({Key key, @required this.recipe}) : super(key: key);

  @override
  State<Recipe> createState() => _RecipeState();
}
