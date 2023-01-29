import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/domain/salons/salon.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/rooms/create_room_model.dart';
import 'package:udemy_salon/views/atoms/category_tab.dart';
import 'package:udemy_salon/views/atoms/circle_image.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';

class SalonDetailCard extends ConsumerWidget {
  const SalonDetailCard({
    Key? key,
    required this.size,
    required this.mainModel,
    required this.salon,
  }) : super(key: key);

  final Size size;
  final MainModel mainModel;
  final Salon salon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreateRoomModel createRoomModel = ref.watch(createRoomProvider);
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.15),
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: CircleImage(
                  length: 70,
                  height: 70,
                  image: NetworkImage(
                    mainModel.firestoreUser.userImageURL,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 190,
                    child: Text(
                      salon.salonName,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Wrap(
                    children: [
                      for (final category in salon.categories)
                        CategoryTab(
                          category: category,
                          fontSize: 12,
                          circleSizeMagnification: 0.2,
                        ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14, left: 14),
            child: Row(
              children: [
                Icon(
                  Icons.place,
                  color: Colors.grey,
                  size: 16,
                ),
                Text(
                  salon.prefName + salon.address,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14, left: 14),
            child: Row(
              children: [
                Icon(
                  Icons.train,
                  color: Colors.grey,
                  size: 16,
                ),
                Text(
                  '土呂駅5分 / 大宮駅30分',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: mainModel.currentUserDoc.id != salon.uid
                ? RoundedButton(
                    onPressed: () async => {
                      await createRoomModel.createRoom(
                        context: context,
                        attendUid: salon.uid,
                        mainModel: mainModel,
                      )
                    },
                    widthRate: 0.5,
                    color: kSecondaryColor,
                    labelText: "メッセージを送る",
                    textSize: 14,
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
