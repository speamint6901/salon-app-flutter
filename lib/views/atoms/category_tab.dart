import 'package:flutter/material.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/size_config.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.category,
    this.fontSize,
    this.circleSizeMagnification,
  }) : super(key: key);

  final String category;
  final double? fontSize;
  final double? circleSizeMagnification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kRelaxationColor,
        borderRadius:
            BorderRadius.circular(SizeConfig(context).defaultSize * 1.6),
      ),
      margin: EdgeInsets.only(
        right: SizeConfig(context).defaultSize * 0.8,
        bottom: SizeConfig(context).defaultSize * 0.8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig(context).defaultSize,
        vertical: SizeConfig(context).defaultSize * circleSizeMagnification!,
      ),
      child: Text(
        category,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
