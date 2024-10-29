class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;


  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });


  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(name: 'Honey Pancake',
       iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Ease',
         duration: '30mins',
         calorie: '188kCal',
          viewIsSelected: true)
    );


    diets.add(
      DietModel(name: 'Canai bread',
       iconPath: 'assets/icons/canai-bread.svg',
        level: 'Ease',
         duration: '20mins',
         calorie: '230kCal',
          viewIsSelected: false)
    );


    return diets;

  }

}