import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview/utils/AdmobHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'url.dart';

class Privacy extends StatelessWidget {
  URL l =new  URL();
  static const routeName = '/privacy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',
            style: TextStyle(color: Theme.of(context).accentColor)),
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: WebView(
        initialUrl:l.privacyPolicyUrl ,
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width *0.13,
        width: 25,
        child: AdWidget(
          ad:AdmobHelper.getBannerAd()..load(),
        ),
      ),
    );
  }
}
