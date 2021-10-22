import 'package:hello_flutter/models/explore_data.dart';
import 'package:hello_flutter/models/post.dart';
import 'package:hello_flutter/models/recipe.dart';
import 'package:hello_flutter/models/simple_recipe.dart';

import 'fake_data.dart';

class FooderApi {
  Future<ExploreData> getExploreData() async {
    final recipes = await _getRecipies();
    final feed = await _getFreindsFeed();

    return ExploreData(recipesData: recipes, friendsFeed: feed);
  }

  Future<List<Recipe>> _getRecipies() async {
    await Future.delayed(Duration(seconds: 1));
    var rawRecipies = exploreRecipies;

    List<Recipe> recipes = [];

    for (var rawRecipe in rawRecipies["recipes"]!) {
      Recipe recipe = Recipe.fromMap(rawRecipe);
      recipes.add(recipe);
    }

    return recipes;
  }

  Future<List<Post>> _getFreindsFeed() async {
    //Creates a future that runs its computation after a delay.
    // The computation will be executed after the given duration has passed
    //(here dart will continue after one second)
    await Future.delayed(Duration(seconds: 1));

    var rawPostsData = freindsFeed;

    List<Post> friendsPosts = [];

    for (var post in rawPostsData["feed"]!) {
      Post friendPost = Post.fromMap(post);
      friendsPosts.add(friendPost);
    }

    return friendsPosts;
  }

  Future<ExploreData> getSampleData() async {
    final recipes = await _getRecipies();
    final feed = await _getFreindsFeed();

    return ExploreData(recipesData: recipes, friendsFeed: feed);
  }

  Future<List<SimpleRecipe>>getSimpleRecipes() async{
    Future.delayed(Duration(seconds: 1));

    var rawSimpleRecipes = sampleRecipes;

    List<SimpleRecipe> simpleRecipes =[];

    for (var sRecipe in rawSimpleRecipes["recipes"]!) {
      SimpleRecipe sRecipes = SimpleRecipe.fromMap(sRecipe);
      simpleRecipes.add(sRecipes);
    }

    return simpleRecipes;
  }
}
