import 'package:image_picker_service/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class GetPermissions {
  ///
  ///
  /// Checking Location Permission
  static Future<bool> getCameraPermission() async {
    PermissionStatus permissionStatus = await Permission.camera.status;

    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isDenied) {
      PermissionStatus status = await Permission.camera.request();
      if (status.isGranted) {
        return true;
      } else {
        Utils.flutterToast('Camera permission is required');
        return false;
      }
    }
    return false;
  }

  ///
  ///
  /// Checking External Storage Permission
  static Future<bool> getStoragePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;
    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isDenied) {
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      } else {
        Utils.flutterToast('Storage permission is required');
        return false;
      }
    }
    return false;
  }
}
