
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_bag/features/homePage/ui/productPage.dart';

import '../../../model/model.dart';


class CategoryTile extends StatelessWidget {
  final BagModel bagModel;
  const CategoryTile({super.key, required this.bagModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ProductTile(bagModel: bagModel,)));
      },
      child: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75,
          crossAxisCount: 3,
          children: List.generate(
            bag.length,
                (index) => Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(bag[index].categoryImg!))),
                  ),
                  Center(child: Text(bag[index].categoryName!)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}