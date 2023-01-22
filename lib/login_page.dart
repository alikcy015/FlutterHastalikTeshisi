import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_project/firebase/kullan%C4%B1c%C4%B1_ekleme.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'English';
  var items = [
    'English',
    'Deutsch',
    'Türkçe',
    'Zazaki',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //backgroundColor: Color.fromARGB(249, 18, 77, 189),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 15,
            right: 15,
            child: DropdownButton(
              dropdownColor: Colors.blue,
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map(
                (String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                },
              ).toList(),
              onChanged: (String? newValue) {
                dropdownvalue = newValue!;
                print(dropdownvalue);
                var locale = Locale(
                    dropdownvalue.toLowerCase(), dropdownvalue.toUpperCase());
                print(locale.languageCode);
                print(locale.countryCode);
                Get.updateLocale(locale);
                setState(() {});
              },
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 45.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // sayfada ortalamak için
                children: <Widget>[
                  Text(
                      style: TextStyle(height: 1, fontSize: 58),
                      "welcome".tr.toUpperCase()),
                  Image.asset("assets/icons8-disease-85.png"),
                  TextFormField(
                    controller: t1,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: "email".tr,
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your email".tr;
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      username = newValue!;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: t2,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelText: "password".tr,
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password".tr;
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        color: Colors.blue,
                        child: Text("info".tr),
                        onPressed: () {
                          showDialog(
                              context: context,
                              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                              builder: (BuildContext) {
                                return AlertDialog(
                                  backgroundColor: Colors.blue,
                                  title: Text("İnfo".tr),
                                  content: Text(
                                      "Email = ...@gmail.com \nPassword = En 6 haneli olmalıdır"
                                          .tr),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: Text("Geri Dön".tr),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                );
                              });
                        },
                      ),
                      MaterialButton(
                        color: Colors.blueGrey,
                        child: Text("Register".tr),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                      )
                    ],
                  ),
                  _loginButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

  Widget _loginButton() => ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            //validate işlemi sorun çıkmadan işlemi tamamladıysa yani return işlemine takılmadıysa onsaved işlemini çalıştıracak
            _formKey.currentState!.save();
            // ignore: unrelated_type_equality_checks
            if (t1.text.isEmail && t2.text.characters.length >= 6) {
              girisYap();
              debugPrint("Giriş Başarılı");
            } else {
              showDialog(
                barrierDismissible: false,
                context: context,
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                builder: (BuildContext) {
                  return AlertDialog(
                    backgroundColor: Colors.red,
                    title: const Text("Hata"),
                    content: const Text(
                        "Email ve şifreniz hatalı ya da eksik olabilir \nkontrol edip tekrar giriniz!"),
                    actions: <Widget>[
                      MaterialButton(
                        child: Text("Geri Dön".tr),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            }
          } else {
            showDialog(
              barrierDismissible: false,
              context: context,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              builder: (BuildContext) {
                return AlertDialog(
                  backgroundColor: Colors.red,
                  title: const Text("Hata"),
                  content: const Text("Giriş Bilgileriniz Hatalı"),
                  actions: <Widget>[
                    MaterialButton(
                      child: Text("Geri Dön".tr),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          }
        },
        label: Text("Login".tr),
        icon: Icon(Icons.login),
      );
}
