import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview/aboutus.dart';
import 'package:webview/url.dart';
import 'package:webview/utils/AdmobHelper.dart';
import 'theme.dart';

import 'webScreen.dart';
import 'main_drawer.dart';
import 'package:provider/provider.dart';
import 'dart:io' as IO;

class Bottom extends StatefulWidget {
  Bottom({
    Key key,
  }) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentIndex = 1;
  List screens = [AboutUs
    (), WebScreen(), MainDrawer()];

  void _onItemTapped1(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.0),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Theme
              .of(context)
              .backgroundColor, spreadRadius: 0.0)
        ]),
        child: BottomNavigationBar(
          onTap: _onItemTapped1,
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          selectedItemColor: Theme
              .of(context)
              .accentColor,
          elevation: 0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
              icon: Image.asset(
                themeProvider.isLightMode == true
                    ? 'assets/images/infob.png'
                    : 'assets/images/infow.png',

                width: 35,
                height: 35,
              ),
              label: 'About Us',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme
                  .of(context)
                  .backgroundColor,
              icon: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orangeAccent,
                child: Image.asset(
                  'assets/images/homew.png',
                  height: 30,
                  width: 30,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
              icon: Image.asset(
                themeProvider.isLightMode == true
                    ? 'assets/images/settingb.png'
                    : 'assets/images/settingw.png',
                width: 35,
                height: 35,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

