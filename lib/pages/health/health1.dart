import 'dart:io';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HealthPage1 extends StatefulWidget {
  const HealthPage1({Key? key}) : super(key: key);
  static const routeName = '/health1';

  @override
  State<HealthPage1> createState() => _HealthPage1State();
}

class _HealthPage1State extends State<HealthPage1> {
  @override
  Widget build(BuildContext context) {
    var imgpredict = ModalRoute.of(context)!.settings.arguments;
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
                  "Résultats:",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  imgpredict.toString(),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                )
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
   
    );
  }
}
