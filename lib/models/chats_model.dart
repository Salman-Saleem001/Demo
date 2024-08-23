class ChatsModel{
  String? name;
  String? avatar;
  int? unreadMessages;
  List<Messages>? messages;

  ChatsModel({this.name, this.avatar,this.unreadMessages, this.messages});

}


class Messages{
  int? id;
  String? messageType;
  String? time;
  dynamic message;
  Messages({this.id,this.time,this.messageType, this.message});
}