import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview/utils/AdmobHelper.dart';
import 'privacypolicy.dart';
import 'terms_conditions.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'dart:io' as IO;
import 'url.dart';

class MainDrawer extends StatefulWidget {
  static const routeName = '/settings';

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
    URL l =new  URL();
    AdmobHelper admobHelper = AdmobHelper();
  _openMap() async {
    if (await canLaunch(l.playStoreUrl)) {
      if (IO.Platform.isAndroid) {
        await launch(l.playStoreUrl);
      } else if (IO.Platform.isIOS) {
        await launch(l.appStoreUrl);
      }
    } else {
      throw 'Could not launch $l.url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
    return OverflowBar(children: [
        WillPopScope(
          onWillPop: showExitPopUp,
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
                title: Text('Settings',
                    style: TextStyle(color: Theme.of(context).accentColor)),
                backgroundColor: Theme.of(context).backgroundColor),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SwitchListTile(
                    secondary: IconButton(
                        icon: Image.asset('assets/images/dark-mode.png',
                            color: Theme.of(context).accentColor)),
                    title: Text('Dark Mode'),
                    activeColor: Colors.white,
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                        icon: Image.asset(
                      'assets/images/Privacy-policy.png',
                      color: Theme.of(context).accentColor,
                    )),
                    title: Text('Privacy Policy'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      admobHelper.showInterad();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Privacy()));
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                        icon: Image.asset(
                            'assets/images/terms-and-conditions.png',
                            color: Theme.of(context).accentColor)),
                    title: Text('Terms & Conditions'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      admobHelper.showInterad();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Terms()));
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: Image.asset('assets/images/share.png',
                          color: Theme.of(context).accentColor),
                    ),
                    title: Text('Share'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      FlutterShare.share(
                        title: 'Share',
                        linkUrl:  l.playStoreUrl,
                      );
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: Image.asset('assets/images/rate-us.png',
                          color: Theme.of(context).accentColor),
                    ),
                    title: Text('Rate Us'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      return _openMap();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ]);
    }
  }

