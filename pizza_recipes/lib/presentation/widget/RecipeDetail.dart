import 'package:concept/data/model/RecipeModel.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  RecipeDetail(this.recipe, this.onClick);

  RecipeModel recipe;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              recipe.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8.0), child: Divider()),
            Text(
              recipe.detail,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8.0), child: Divider()),
            Container(
              child: MaterialButton(
                color: Colors.red,
                onPressed: () => onClick(recipe.title, recipe.href),
                child: Text(
                  "Cook it!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
