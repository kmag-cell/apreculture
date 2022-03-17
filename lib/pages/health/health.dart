// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:apreculture/api/health_state.dart';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/health/health1.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);
  static const routeName = '/health';

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final _FormKey = GlobalKey<FormState>();
  File? image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Erreur lors du telechargement: $e');
    }
  }

  void _predictimage() async {
    dynamic isimage = await Provider.of<HealthState>(
      context,
      listen: false,
    ).health(image);
    if (isimage != null) {
      print(isimage);
      Navigator.of(context)
          .pushNamed(HealthPage1.routeName, arguments: isimage);
    } else if (isimage["error"]) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Quelque chose ne va pas.Réessayer"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Bilan de Santé"),
      drawer: const MenuWidget(),
      body: SingleChildScrollView(
        child: Stack(children: [
          const SizedBox(
            height: 100,
            child: HeaderWidget(100, false, Icons.house_rounded),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.health_and_safety_outlined,
                    size: 80,
                    color: Color.fromARGB(255, 145, 132, 132),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Santé de la Plante',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Veillez fournir une photo de la palnte malade:",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 30,
                ),
                image != null
                    ? InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.file(
                              image!,
                              width: 320,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildButton(
                              title: 'Diagnostic',
                              onPressed: () {
                                _predictimage();
                              },
                            )
                          ],
                        ),
                      )
                    : const Card()
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: kDefaultPadding * 2,
          right: kDefaultPadding * 2,
          bottom: kDefaultPadding,
        ),
        height: 80,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactPage()));
              }),
              icon: const Icon(Icons.message_outlined),
              color: Colors.green,
            ),
            IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
                icon: const Icon(Icons.home_outlined),
                color: Colors.green),
            IconButton(
                onPressed: (() {}),
                icon: const Icon(Icons.search_outlined),
                color: Colors.green),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          highlightElevation: 20,
          child: const Icon(
            Icons.camera_alt_outlined,
          ),
          onPressed: () => getImage(ImageSource.camera)),
    );
  }

  Widget buildButton({
    required String title,
    required VoidCallback onPressed,
  }) =>
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              minimumSize: const Size.fromHeight(56),
              primary: Colors.green,
              onPrimary: Colors.black,
              textStyle: const TextStyle(fontSize: 20)),
          child: Row(
            children: [
              Text(title, textAlign: TextAlign.center),
            ],
          ),
          onPressed: onPressed);
}
