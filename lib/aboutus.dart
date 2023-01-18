import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview/utils/AdmobHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'url.dart';


class AboutUs extends StatelessWidget {
  final AboutUs1;
  static const routeName = '/aboutus';

  const AboutUs({Key key, this.AboutUs1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    URL l =new  URL();
    Future<bool> showExitPopUp() async {
      return await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
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
    return  OverflowBar(
      children: [ WillPopScope(onWillPop: showExitPopUp,
        child: Scaffold(
                    extendBody: true,
                    // appBar: AppBar(
                    //   title: Text('About Us',
                    //       style: TextStyle(color: Theme.of(context).accentColor)),
                    //   backgroundColor: Theme.of(context).backgroundColor,
                    // ),
                    body: WebView(
                      initialUrl: l.aboutUsUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.width *0.13,
            width: 25,
            child: AdWidget(
              ad:AdmobHelper.getBannerAd()..load(),
            ),
          ),
                  ),
      ),

   ],

    );
  }
}
