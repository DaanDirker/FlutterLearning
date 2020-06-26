import 'package:concept/data/model/Ingredient.dart';
import 'package:concept/data/model/RecipeModel.dart';
import 'package:concept/data/net/ApiProvider.dart';

class Repository {
  ApiProvider api = ApiProvider();

  Future<List<RecipeModel>> fetchRecipes(List<Ingredient> ingredients, String query, int page) 
    => api.fetchRecipes(ingredients, query, page);
}
