import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/views/video_player_view.dart';

class DetailViewExample extends StatelessWidget {
  DetailViewExample({Key? key, required this.model}) : super(key: key);

  final BookmarkController bookMkController = BookmarkController();

  // RecipeModel recipe;
  final RecipeModel model;
  double? rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(
              model.image,
              // 'https://images.unsplash.com/photo-1504297050568-910d24c426d3?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1287&q=80',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.white12,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            VideoPlayerView(videoUrl: model.video)));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.play_arrow,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 60,
                    ),
                    radius: 40,
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color:
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
                  elevation: 0,
                  margin: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Center(
                          child: Container(
                            width: 60,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                        ),
                        Text(
                          // 'Title here',
                          model.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              'category',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              // '5.0',
                              '$rate',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 0,
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.6),
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 120,
                                child: ListView.builder(
                                    itemCount: model.ingredients.length,
                                    itemBuilder: (context, index) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // "4545",
                                              model.ingredients[index].name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              model.ingredients[index].quantity,
                                            ),
                                          ],
                                        )),
                              )

/*                             child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Wheat',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '270 gr',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Powdered Milk',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '1 sachet',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Powdered Milk',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '1 sachet',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Powdered Milk',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '1 sachet',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Powdered Milk',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '1 sachet',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                )
                              ],
                            ), */
                              ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BackButton(),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                       await bookMkController.addBookmark(model);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Icon(Icons.bookmark_border_outlined),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.grey.shade300))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
