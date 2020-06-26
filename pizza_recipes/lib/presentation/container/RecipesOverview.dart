import 'package:concept/data/model/WebviewArgs.dart';
import 'package:concept/presentation/widget/RecipeDetail.dart';
import 'package:flutter/rendering.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:concept/data/model/RecipeModel.dart';
import 'package:concept/domain/bloc/blocs/RecipesBloc.dart';
import 'package:concept/presentation/widget/Recipe.dart';
import 'package:concept/util/Navigation.dart' as Route;
import 'package:flutter/material.dart';

class _RecipesOverviewContainer extends State<RecipesOverviewContainer> {
  ScrollController scrollController;

  List<RecipeModel> _recipes = [];
  int _recipePage = 4;

  final int _pixelsBeforeNext = 600;
  final int _maxPage = 8;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        scrollListener();
      });
    _fetchPage();
  }

  void _fetchPage() {
    recipesBloc.fetchRecipes([], "Pizza", this._recipePage);
    _recipePage++;
  }

  Widget _buildRow(RecipeModel recipe) {
    return GestureDetector(
      onTap: () => _showDialog(recipe),
      child: Recipe(recipe: recipe),
    );
  }

  void _showDialog(RecipeModel recipe) {
    slideDialog.showSlideDialog(
      context: context,
      pillColor: Colors.red,
      backgroundColor: Colors.white.withOpacity(0.9),
      child: RecipeDetail(recipe, _navigateToDetail),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: recipesBloc.recipes,
        builder: (context, AsyncSnapshot<List<RecipeModel>> recipes) {
          if (recipes.hasData) {
            _recipes.addAll(recipes.data);
            return Container(
              margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: _recipes.length * 2,
                  itemBuilder: (context, index) {
                    if (index.isOdd) return Divider();

                    index = index ~/ 2;
                    return _buildRow(_recipes[index]);
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _navigateToDetail(String title, String url) {
    if (url != "") {
      Navigator.pushNamed(context, Route.DETAIL_ROUTE,
          arguments: WebviewArgs(title, url));
    }
  }

  void scrollListener() {
    if (scrollController.position.extentBefore < _pixelsBeforeNext) {
      if (_recipePage <= _maxPage) {
        _fetchPage();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    recipesBloc.dispose();
  }
}

class RecipesOverviewContainer extends StatefulWidget {
  @override
  _RecipesOverviewContainer createState() => _RecipesOverviewContainer();
}
