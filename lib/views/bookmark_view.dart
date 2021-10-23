import 'package:flutter/material.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';

//TODO: GET ALL BOOKMARKED RECIPES
//TODO: DELETE RECIPE

class BookmarkView extends StatelessWidget {
   BookmarkView({ Key? key }) : super(key: key);

  final BookmarkController bookMkController = BookmarkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),body: FutureBuilder(
        future: bookMkController.getBookmarkRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          List<RecipeModel> recipeModels = snapshot.data as List<RecipeModel>;
          return ListView.builder(
              itemCount: recipeModels.length,
              itemBuilder: (BuildContext context, int index) {
                RecipeModel recipeModel = recipeModels[index];

                return ListTile(
                  leading: Image.network(
                    recipeModel.image,
                    width: 150,
                    height: 150,
                  ),
                  title: Text(recipeModel.title),
                  subtitle: Text(recipeModel.category),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: const Text(
                                  "Are you sure you want to delete this reciepe?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      bookMkController
                                          .removeBookmark(recipeModel.id!);

                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Reciepe deleted successfully")));
                                    },
                                    child: const Text("Yes"))
                              ],
                            ));
                  },
                );
              });
        },
      ),
    );
  }
}