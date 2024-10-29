import 'package:fitness_project/Pages/models/catagory_model.dart';
import 'package:fitness_project/Pages/models/diet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatagoryModel> categories = [];
  List<DietModel> diets = [];

  void getInitialInfo(){
    categories = CatagoryModel.getCategories();
    diets = DietModel.getDiets();

  }


  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(),
          SizedBox(height: 40,),
          categoriesSection(),
          SizedBox(height: 40,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recomandation\nfor Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 200,
                child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        // color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diets[index].iconPath),
                          Column(
                            children: [
                              Text(
                                diets[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff9DCEFF),
                                  Color(0xff92A3Fd)
                                ]
                                )
                            ),
                          )
                        ],
                      ),
                    );
                  },
                   separatorBuilder: (context, index) => SizedBox(width: 25,),
                    itemCount: diets.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    ),
              )
            ],
          )
        ],
      ),
    );
  }

  Column categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        );
  }

  Container searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff101617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: "Search Pancake",
              hintStyle: TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Color(0xffDDDAD),
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
          color: Colors.black,
          fontSize: 18,
            fontWeight: FontWeight.bold,
      ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){

        },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset("assets/icons/Arrow - Left 2.svg",
        height: 20,
        width: 20,
        ),
      ),
      ),
      actions: [
        GestureDetector(
          onTap: (){

          },
        child: Container(
          alignment: Alignment.center,
          width: 37,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset("assets/icons/dots.svg",
            height: 10,
            width: 10,
          ),
        ),
        ),
      ],
    );
  }
}
