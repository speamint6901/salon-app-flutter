import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/views/main/homes/salon_detail/components/salon_detail_card.dart';

class Body extends ConsumerWidget {
  const Body({
    Key? key,
    required this.salon,
  }) : super(key: key);
  final Salon salon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/totoro_img.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SalonDetailCard(
                      size: size,
                      mainModel: mainModel,
                      salon: salon,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Column(
                children: [
                  Text('メニュー'),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Text("マッサージ"),
                      Text("ネイル"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
