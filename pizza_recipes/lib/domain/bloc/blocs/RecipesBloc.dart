import 'package:concept/data/model/Ingredient.dart';
import 'package:concept/data/model/RecipeModel.dart';
import 'package:concept/data/net/Repository.dart';
import 'package:concept/domain/bloc/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

class RecipesBloc implements BaseBloc {
  Repository _repository = Repository();

  final _recipesFetcher = PublishSubject<List<RecipeModel>>();
  Stream<List<RecipeModel>> get recipes => _recipesFetcher.stream;

  void fetchRecipes(
      List<Ingredient> ingredients, String query, int page) async {
    List<RecipeModel> response =
        await _repository.fetchRecipes(ingredients, query, page);
    _recipesFetcher.sink.add(response);
  }

  List<String> parseIngredients(String ingredients) {
    return ["adasd", "asdad"];
  }

  @override
  void dispose() {
    _recipesFetcher.close();
  }
}

final recipesBloc = RecipesBloc();
