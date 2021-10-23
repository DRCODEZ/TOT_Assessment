import 'package:flutter/cupertino.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/bookmark_recipe.dart';

class BookmarkController with ChangeNotifier {
  String _errorMessage = "";

  get erroMessage => _errorMessage;

  setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  BookmarkService bookMkService = BookmarkService();

  Future<List<RecipeModel>> getBookmarkRecipes() async {
    try {
      await bookMkService.open();
      var bookMarkData = await bookMkService.getAllRecipe();
      if (bookMarkData != null) {
        await bookMkService.close();
        return bookMarkData;
      }
    } catch (error) {
      setErrorMessage("$error");
    }
    await bookMkService.close();
    return [];
  }

  addBookmark(RecipeModel recipeModel) async {
    try {
      await bookMkService.open();
      bookMkService.insert(recipeModel);
      await getBookmarkRecipes();
      await bookMkService.close();
    } catch (error) {
      setErrorMessage("$error");
    }
  }

  void removeBookmark(int id) async {
    try {
      await bookMkService.open();
      bookMkService.delete(id);
      await getBookmarkRecipes();
      await bookMkService.close();
    } catch (error) {
      setErrorMessage("$error");
    }
  }
}
