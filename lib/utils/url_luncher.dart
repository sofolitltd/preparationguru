import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  //
  static void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  } // Convenience methods for specific platforms

  static void launchFacebookPage(String pageId) {
    launchURL('https://www.facebook.com/$pageId');
  }

  static void launchFacebookGroup(String groupId) {
    launchURL('https://www.facebook.com/groups/$groupId');
  }

  static void launchMessenger(String userId) {
    launchURL('https://m.me/$userId');
  }

  static void launchWhatsApp(String phoneNumber) {
    launchURL('https://wa.me/$phoneNumber');
  }

  static void launchGmail(String email) {
    launchURL('mailto:$email');
  }

  static void launchPhone(String phoneNumber) {
    launchURL('tel:$phoneNumber');
  }
}
