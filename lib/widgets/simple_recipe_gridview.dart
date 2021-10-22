import 'package:flutter/material.dart';
import 'package:hello_flutter/models/simple_recipe.dart';


class SimpleRecipeGrid extends StatelessWidget {
  const SimpleRecipeGrid({
    Key? key,
    required this.gridSimpleRecipe,
  }) : super(key: key);

  final SimpleRecipe gridSimpleRecipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: 
              Image(image: AssetImage(gridSimpleRecipe.dishImage),
              height: 140,
              fit: BoxFit.cover,),
          ),
            Text(gridSimpleRecipe.title),
            Text(gridSimpleRecipe.duration),
          ],
        ),
    );
  }
}
