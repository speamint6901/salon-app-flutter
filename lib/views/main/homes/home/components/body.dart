import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/models/homes/search_model.dart';
import 'package:udemy_salon/size_config.dart';
import 'package:udemy_salon/views/main/homes/home/components/categories.dart';
import 'package:udemy_salon/views/organisms/salon_card.dart';

class Body extends ConsumerWidget {
  Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    return SafeArea(
      child: Column(
        children: [
          Categories(),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig(context).defaultSize * 2,
              ),
              child: GridView.builder(
                itemCount: searchModel.salons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => SalonCard(
                  salon: searchModel.salons[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
