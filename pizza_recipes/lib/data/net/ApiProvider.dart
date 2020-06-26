import 'dart:convert';
import 'package:concept/data/model/Ingredient.dart';
import 'package:concept/data/model/RecipeModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  final String _baseUrl = "http://recipepuppy.com/api/";

  Future<List<RecipeModel>> fetchRecipes(List<Ingredient> ingredients, String query, int page) async {
    final url = prepareUrl(ingredients, query, page);
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<RecipeModel> result = [];
      final List<dynamic> items = json.decode(response.body)['results'];
      
      items.forEach((item) {
        result.add(RecipeModel.fromJson(item));
      });
      return result;
    } else {
      throw Exception('Failed to retrieve recipes');
    }
  }

  String prepareUrl(List<Ingredient> ingredients, String query, int page) {
    if (page < 0) page = 1;
    String params = "?q=" + query + "&p=" + page.toString();

    if (ingredients.length > 0) {
      final String ingredientsParam = parseIngredients(ingredients);
      params = params + ingredientsParam;
    }
    return _baseUrl + params;
  }

  String parseIngredients(List<Ingredient> ingredients) {
    String result = "";
    ingredients.forEach((ingredient ) {
      String parsed = ingredient.toString().split('.').last.toLowerCase();
      result = result + parsed;
      if (ingredient != ingredients.last) result = result + ",";
    });
    return "&i=" + result;
  }
}
