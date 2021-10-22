import 'package:flutter/material.dart';
import 'package:hello_flutter/API/fooder_api.dart';
import 'package:hello_flutter/models/simple_recipe.dart';
import 'package:hello_flutter/widgets/simple_recipe_gridview.dart';


class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final fooderApi = FooderApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SimpleRecipe>>(
      future: fooderApi.getSimpleRecipes(),
      builder: (context, snap){
        if(snap.connectionState == ConnectionState.done){
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemCount: snap.data?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
             itemBuilder: (context , index){
               return SimpleRecipeGrid(gridSimpleRecipe: snap.data![index],);

             });
        } else {
            return const Center(child: CircularProgressIndicator());
          }
      }
    );
    
      
      
    
  }
}
