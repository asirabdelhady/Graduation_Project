import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({required String url}) =>_launcherUrl(url);

  static Future _launcherUrl(String url) async{
    if(await canLaunch(url) ) {
      await launch(url);

    }
  }

}