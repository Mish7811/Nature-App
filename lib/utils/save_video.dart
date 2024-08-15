import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> saveVideo(String url) async {
  var status = await Permission.storage.request();
  if (status.isGranted) {
    var appDir = await getExternalStorageDirectory();
    var filePath = '${appDir?.path}/nature_video.mp4';
    var response = await http.get(Uri.parse(url));
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
  } else {
    print("Storage permission denied");
  }
}
