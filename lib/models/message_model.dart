class Message {
  final String name, lastMessage, image, time;
  final bool isActive;

  Message({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List messagesData = [
  Message(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/IMG_4831.JPG",
    time: "3m ago",
    isActive: false,
  ),
  Message(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/IMG_4807.JPG",
    time: "8m ago",
    isActive: true,
  ),
  Message(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/IMG_4808.JPG",
    time: "5d ago",
    isActive: false,
  ),
  Message(
    name: "皐月",
    lastMessage: "You’re welcome :)",
    image: "assets/images/IMG_4809.JPG",
    time: "5d ago",
    isActive: true,
  ),
  // Message(
  //   name: "Albert Flores",
  //   lastMessage: "Thanks",
  //   image: "assets/images/user_5.png",
  //   time: "6d ago",
  //   isActive: false,
  // ),
  // Message(
  //   name: "Jenny Wilson",
  //   lastMessage: "Hope you are doing well...",
  //   image: "assets/images/user.png",
  //   time: "3m ago",
  //   isActive: false,
  // ),
  // Message(
  //   name: "Esther Howard",
  //   lastMessage: "Hello Abdullah! I am...",
  //   image: "assets/images/user_2.png",
  //   time: "8m ago",
  //   isActive: true,
  // ),
  // Message(
  //   name: "Ralph Edwards",
  //   lastMessage: "Do you have update...",
  //   image: "assets/images/user_3.png",
  //   time: "5d ago",
  //   isActive: false,
  // ),
];
