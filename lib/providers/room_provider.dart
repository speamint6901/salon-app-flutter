import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_salon/models/rooms/room_model.dart';

final StreamProvider streamProvider = StreamProvider((ref) {
  final RoomModel roomModel = ref.watch(roomProvider);
  return roomModel.getRoomsQueryShot();
});
