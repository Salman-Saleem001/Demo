
import '../exports.dart';

class PermissionsHandler{
  static Future<bool> _requestPermission({required Permission permission,required Function onPermissionDenied,required Function onPermissionPermanentlyDenied}) async{
    if(await permission.isGranted){
      return true;
    }
    else{
      PermissionStatus result=await permission.request();
      if(result==PermissionStatus.granted){
        return true;
      }
      else if(result == PermissionStatus.denied){
        onPermissionDenied();
        return false;
      }
      else if(result == PermissionStatus.permanentlyDenied){
        onPermissionPermanentlyDenied();
        return false;
      }
      else{
        return false;
      }
    }
  }

  Future cameraPermission(
      { required BuildContext context}) async {
     final val = await _requestPermission(permission: Permission.camera, onPermissionDenied: (){
       CustomDialogs().showDialogs("Permission Denied", " ", context: context,
           onPressed: () {
             Navigator.pop(context);
           });
     }, onPermissionPermanentlyDenied: (){
       CustomDialogs().showDialogs("Permission Denied",
           "Camera Permission is Permanently Denied\nPlease allow permission from settings and try again.",
           buttonLabel: 'Settings',
           context: context, onPressed: ()async {
             await openAppSettings().then((val){
               if(val){
                 Navigator.pop(context);
               }
             });

           });
     });

    return val;
  }
}

