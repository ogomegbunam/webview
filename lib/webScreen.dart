import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'url.dart';

class WebScreen extends StatelessWidget {
  URL l = new URL();
  static const routeName = '/web';
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopUp() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Are you sure to exit?"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  // passing false
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  // passing true
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return OverflowBar(
      children: [
        WillPopScope(
          onWillPop: showExitPopUp,
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: WebView(

              initialUrl: l.webViewUrl,
              gestureNavigationEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if(request.url.contains("play.google.com")){
                  launch(request.url);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          ),
        ),
      ],
    );
  }
}
