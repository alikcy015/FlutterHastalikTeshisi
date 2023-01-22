import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/firebase_options.dart';
import 'package:mobile_project/login_page.dart';
import 'package:mobile_project/menu.dart';
import 'package:mobile_project/language.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({super.key});

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  var getEmail = "";
  var getPassword = "";

  // ignore: non_constant_identifier_names
  Future<void> Kayitol() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
        .whenComplete(() => print("auth başarılı"))
        .then(
      (Kullanici) {
        FirebaseFirestore.instance
            .collection("Kullanicilar")
            .doc(t1.text)
            .set({"useremail": t1.text, "userpassword": t2.text});
      },
    );
  }

  // ignore: non_constant_identifier_names
  KullaniciCagir() {
    FirebaseFirestore.instance
        .collection("Kullanıcı")
        .doc(t1.text)
        .get()
        .then((values) {
      setState(() {
        getEmail = values.data()!['email'.tr];
        getPassword = values.data()!['password'.tr];
      });
    });
  }

  kullaniciEkle() async {
    await FirebaseFirestore.instance
        .collection("Kullanıcı".tr)
        .doc(t1.text)
        .set({'email'.tr: t1.text, 'password'.tr: t2.text}).whenComplete(
            () => print("Kullanıcı eklendi"));
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t1.text, password: t2.text);
  }

  // ignore: non_constant_identifier_names
  KullaniciGuncelle() {
    FirebaseFirestore.instance
        .collection("Kullanıcı".tr)
        .doc(t1.text)
        .set({'email'.tr: t1.text, 'password'.tr: t2.text}).whenComplete(
            () => print("Kullanıcı Güncellendi"));
  }

  // ignore: non_constant_identifier_names
  KullaniciSil() {
    FirebaseFirestore.instance.collection("Kullanıcı".tr).doc(t1.text).delete();
  }

  girisYap() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then(
      (Kullanici) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const menu(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: t1,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "Email".tr,
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email Giriniz".tr;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: "Şifre".tr,
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(),
                ),
                controller: t2,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifrenizi Giriniz".tr;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15, width: 15),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        child: ElevatedButton(
                          onPressed: girisYap,
                          child: Text("Giriş".tr),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 3,
                        child: ElevatedButton(
                          onPressed: kullaniciEkle,
                          child: Text("Kayıt Ol".tr),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.orange)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        child: ElevatedButton(
                          onPressed: KullaniciGuncelle,
                          child: Text("Güncelle".tr),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.greenAccent)),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 3,
                        child: ElevatedButton(
                          onPressed: KullaniciSil,
                          child: Text("Kullanıcıyı Sil".tr),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Text("Back".tr),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
