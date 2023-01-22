// ignore_for_file: unnecessary_string_escapes, duplicate_ignore, unused_local_variable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "classifier demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  File? _image;
  List? _outputs;
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    _loading = true;
    print("Model yükleniyor");
    loadModel().then((value) {
      setState(() {
        _loading = false;
        print("OK");
      });
    });
    super.initState();
  }

  loadModel() async {
    try {
      await Tflite.loadModel(
        // ignore: duplicate_ignore
        isAsset: true,
        useGpuDelegate: false,
        numThreads: 1,
        model:
            // ignore: unnecessary_string_escapes
            "assets/converted_model.tflite",
        labels: "assets/labels.txt",
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  pickImage() async {
    // ignore: deprecated_member_use
    var image = await _imagePicker.getImage(source: ImageSource.gallery);

    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path, numResults: 2, asynch: true);

    setState(() {
      _loading = false;

      _outputs = output!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diesease classifier"),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: unnecessary_null_comparison
                  _image == null
                      ? Container()
                      : SizedBox(
                          height: 500,
                          width: MediaQuery.of(context).size.width - 200,
                          child: Image.file(_image!),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: unnecessary_null_comparison
                  _outputs != null
                      ? Text(
                          "${_outputs![0]["label"]}"
                              .replaceAll(RegExp(r'[0-9]'), ""),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              background: Paint()..color = Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      : const Text("Clasification Waiting")
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Increment",
        child: const Icon(Icons.photo),
      ),
    );
  }
}
