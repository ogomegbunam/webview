import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview/utils/AdmobHelper.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'url.dart';

class Terms extends StatelessWidget {
  static const routeName = '/terms';
  @override
  Widget build(BuildContext context) {
    URL l =new  URL();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: WebView(
        initialUrl: l.termsConditionsUrl,
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
