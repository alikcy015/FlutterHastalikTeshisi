import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_project/drawer/set_page.dart/about.dart';
import 'package:mobile_project/drawer/set_page.dart/language_page.dart';
import 'package:mobile_project/login_page.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Select_Language(),
                          ));
                    },
                    icons: CupertinoIcons.chevron_left_slash_chevron_right,
                    iconStyle: IconStyle(),
                    title: 'Dil',
                    subtitle: "",
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => About_page(),
                          ));
                    },
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'Hakkında',
                    subtitle: "",
                  ),
                ],
              ),

              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Hesap",
                items: [
                  SettingsItem(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    icons: Icons.exit_to_app_rounded,
                    title: "Hesaptan Çık",
                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    icons: CupertinoIcons.repeat,
                    title: "Hesap değiştir",
                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KullaniciSil()(context),
                          ));
                    },
                    icons: CupertinoIcons.delete_solid,
                    title: "Hesap Sil",
                    titleStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  KullaniciSil() {
    FirebaseFirestore.instance.collection("Kullanıcı".tr).doc(t1.text).delete();
  }
}
