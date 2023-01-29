import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/constants/routes.dart' as routes;
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/size_config.dart';
import 'package:udemy_salon/views/atoms/category_tab.dart';

class SalonCard extends StatelessWidget {
  const SalonCard({
    Key? key,
    required this.salon,
  }) : super(key: key);

  final Salon salon;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig(context).defaultSize;
    return GestureDetector(
      onTap: () => routes.toSalonDetail(context: context, salon: salon),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultSize * 1.8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              color: Color(0xFFC1C79D),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      salon.salonName,
                      style: TextStyle(
                        fontSize: defaultSize * 2.0,
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultSize * 0.5,
                    ),
                    Text(
                      "${salon.prefName} ${salon.address}駅",
                      style: TextStyle(
                        color: kRubyTextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultSize,
                    ),
                    Wrap(
                      children: [
                        for (final category in salon.categories)
                          CategoryTab(
                            category: category,
                            circleSizeMagnification: 0.8,
                          ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: defaultSize * 0.5,
            ),
            AspectRatio(
              aspectRatio: 0.71,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(salon.mainImageURL),
                  fit: BoxFit.fill,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(double defaultSize, {required String iconSrc, text}) {
    return Row(
      children: [
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize),
        Text(
          text,
          style: const TextStyle(
            color: Color(0x482E2E2F),
          ),
        ),
      ],
    );
  }
}
