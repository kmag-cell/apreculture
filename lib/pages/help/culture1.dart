import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/pages/help/etape1.dart';
import 'package:apreculture/utils/theme_helper.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';

import 'package:apreculture/widgets/dropdown.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';

class Culture1Page extends StatefulWidget {
  const Culture1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Culture1PageState();
  }
}

class _Culture1PageState extends State<Culture1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Aides"),
      drawer: const MenuWidget(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
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
                    child: Image.asset(
                      'assets/images/tomate.jpg',
                      height: 100,
                      width: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Tomate',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: const Color.fromARGB(240, 210, 215, 218),
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                              child: Image.asset('assets/icons/02d.png')),
                          title: const Text("Méteo"),
                        ),
                        const Divider(
                          height: 5,
                          thickness: 2,
                          indent: 20,
                          color: Color.fromARGB(244, 246, 248, 247),
                        ),
                        ListTile(
                          leading: SizedBox(
                              child: Image.asset('assets/icons/09d.png')),
                          title: const Text("Température"),
                          subtitle: const Text("Humidité"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  const Text(
                                    "Veillez entrer la superficie de votre parcelle",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      decoration: ThemeHelper()
                                          .textInputDecoration("Superficie",
                                              "Entrez une valeur"),
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        // ignore: prefer_is_not_empty
                                        if (!(val!.isEmpty) &&
                                            !RegExp(r"^(\d+)*$")
                                                .hasMatch(val)) {
                                          return "Entrez une valeur";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                    decoration: ThemeHelper()
                                        .inputBoxDecorationShaddow(),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: ThemeHelper()
                                        .buttonBoxDecoration(context),
                                    child: ElevatedButton(
                                      style: ThemeHelper().buttonStyle(),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(40, 10, 40, 10),
                                        child: Text(
                                          "Demarrez votre culture",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Etape1Page()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
