import 'package:flutter/material.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/size_config.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
  }) : super(key: key);
  final List<String> categories = ["リラク", "エステ", "ネイル", "まつげ", "ジム"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig(context).defaultSize),
      child: SizedBox(
        height: SizeConfig(context).defaultSize * 6,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                buildCategoriesItem(context, index)),
      ),
    );
  }

  Widget buildCategoriesItem(context, int index) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: SizeConfig(context).defaultSize * 2,
          left: SizeConfig(context).defaultSize * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig(context).defaultSize * 2,
          vertical: SizeConfig(context).defaultSize,
        ),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(
            SizeConfig(context).defaultSize * 1.6,
          ),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}
