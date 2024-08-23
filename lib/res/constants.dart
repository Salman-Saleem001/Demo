import 'package:demo/exports.dart';

class Constants{
  static const List<String> topics= [
    "Climate change & Sustainability",
    "Conscious Art",
    "Climate change & Sustainability",
    "Conscious Art",
  ];

 static List<Messages> messages = [
    Messages(
      id: 1,
      messageType: 'text',
      time: '6 mins ago',
      message: 'Hello, how are you?',
    ),
    Messages(
      id: 1,
      messageType: 'image',
      time: '6 mins ago',
      message: 'https://tinypng.com/images/social/website.jpg',
    ),
    Messages(
      id: 2,
      time: '6 mins ago',
      messageType: 'text',
      message: 'This is another text message.',
    ),
    Messages(
      id: 2,
      time: '6 mins ago',
      messageType: 'image',
      message: 'https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg',
    ),
    Messages(
      id: 1,
      time: '6 mins ago',
      messageType: 'text',
      message: 'Here is some more text.',
    ),
    Messages(
      id: 2,
      time: '6 mins ago',
      messageType: 'image',
      message: 'https://tinypng.com/images/social/website.jpg',
    ),
    Messages(
      id: 2,
      time: '6 mins ago',
      messageType: 'text',
      message: 'Just checking in!',
    ),
    Messages(
      id: 1,
      time: '6 mins ago',
      messageType: 'image',
      message: 'https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg',
    ),
    Messages(
      id: 2,
      time: '6 mins ago',
      messageType: 'text',
      message: 'Last text message.',
    ),
  ];


  static List<ChatsModel> chatsData=[
    ChatsModel(name: 'Bruno Pham' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Kevin' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Brain' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Kris' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Leonerd' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Sheldon' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Amy' , unreadMessages: 5, messages: messages),
    ChatsModel(name: 'Penny' , unreadMessages: 5, messages: messages),
  ];

}