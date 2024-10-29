import 'package:flutter/material.dart';

class CatagoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CatagoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  
  });

static List<CatagoryModel> getCategories() {
  List<CatagoryModel> categories = [];

  categories.add(
    CatagoryModel(name: 'salad',
     iconPath: 'assets/icons/plate.svg',
      boxColor: Color(0xFF92A3FD)
    )
  );

  categories.add(
    CatagoryModel(name: 'salad',
     iconPath: 'assets/icons/pancakes.svg',
      boxColor: Color(0xffc58BF2)
    )
  );

  categories.add(
    CatagoryModel(name: 'Pie',
     iconPath: 'assets/icons/pie.svg',
      boxColor: Color(0xff92A3DF)
    )
  );

  categories.add(
    CatagoryModel(name: 'smoothies',
     iconPath: 'assets/icons/orange-snacks.svg',
      boxColor: Color(0xff92A3FD)
    )
  );

  return categories;
}
}