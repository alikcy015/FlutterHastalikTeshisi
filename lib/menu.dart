import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_project/drawer/settings_page.dart';
import 'package:mobile_project/firebase/hastal%C4%B1k_bilgisi.dart';
import 'package:mobile_project/firebase/hastalik_se%C3%A7me.dart';
import 'package:mobile_project/open_camera.dart';
import 'package:mobile_project/open_gallery.dart';
import 'package:mobile_project/vm/class_vm.dart';
import 'diseasetflite.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ClassVm());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              iconColor: Colors.blueAccent,
              leading: const Icon(Icons.menu),
              title: Text("Menü".tr),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menu(),
                    ));
              },
            ),
            ListTile(
              iconColor: Colors.yellow,
              leading: const Icon(Icons.medical_information),
              title: Text("Bilgi".tr),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.grey,
              leading: const Icon(Icons.settings),
              title: Text("Ayarlar".tr),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
            ),
            ListTile(
              iconColor: Colors.red,
              leading: const Icon(Icons.exit_to_app),
              title: Text("Çıkış".tr),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Menü".tr),
        backgroundColor: const Color.fromARGB(249, 18, 77, 189),
      ),
      backgroundColor: const Color.fromARGB(249, 18, 77, 189),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        margin: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 20,
          children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.animation),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyWidget(),
                    ));
              },
              label: Text("Hastalık Teşhisi"),
              //child: const Text("Hastalık Teşhisi"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.info_outline_rounded),
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWidgetee()),
                );
              },
              label: Text("Hastalık Bilgisi"),
              //child: const Text("Hastalık Bilgisi"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt_outlined),
              style: ElevatedButton.styleFrom(primary: Colors.indigo),
              onPressed: () {
                Get.to(() => openCamera());
              },
              label: Text("Kamera"),
              //child: const Text("Kamera"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library_outlined),
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
              onPressed: () {
                Get.to(() => openGallery());
              },
              label: Text("Galeri"),
              //child: const Text("Galeri"),
            ),
          ],
        ),
      ),
    );
    // ignore: dead_code
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {},
    );
  }
}
