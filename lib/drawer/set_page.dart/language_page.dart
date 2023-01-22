import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Select_Language extends StatelessWidget {
  const Select_Language({super.key});

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
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Diller",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.bookmark,
                    title: "English",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.bookmark,
                    title: "Türkçe",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.bookmark,
                    title: "Zazaki",
                    titleStyle: const TextStyle(
                      //color: Colors.red,
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
}
