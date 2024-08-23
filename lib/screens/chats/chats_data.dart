import 'package:demo/exports.dart';

class ChatsData extends ChangeNotifier{
  late ValueNotifier<XFile> selected;
  late ValueNotifier<List<Messages>> send;
  late ValueNotifier<bool> isChanged;
  String? textFieldVal;

  ChatsData(){
    selected= ValueNotifier(XFile(''));
    send= ValueNotifier(Constants.messages);
    isChanged= ValueNotifier(false);
    debugPrint("Created Values");
  }

  notifyList(){
    send.notifyListeners();
  }

  changeTextField(){
    
  }

  @override
  dispose(){
    super.dispose();
    selected.dispose();
    send.dispose();
    textFieldVal=null;
    debugPrint("disposed values");
  }
}