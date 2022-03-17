// ignore_for_file: deprecated_member_use

import 'package:apreculture/api/culture_state.dart';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/utils/theme_helper.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:apreculture/pages/recommandation/recommandation1.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:provider/provider.dart';

class RecommandationPage extends StatefulWidget {
  const RecommandationPage({Key? key}) : super(key: key);
  static const routeName = '/recommandation';

  @override
  _RecommandationPageState createState() => _RecommandationPageState();
}

class _RecommandationPageState extends State<RecommandationPage> {
  final _FormKey = GlobalKey<FormState>();
  late String _nitrogen = '';
  late String _phosphor = '';
  late String _potassium = '';
  late String _temperature = '';
  late String _humidity = '';
  late String _rainfall = '';
  late String _ph = '';

  void _cultureNew() async {
    var isValid = _FormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _FormKey.currentState!.save();
    dynamic isrecommede = await Provider.of<CultureState>(
      context,
      listen: false,
    ).culture(_nitrogen, _phosphor, _potassium, _temperature, _humidity, _ph,
        _rainfall);
    if (isrecommede != null) {
      print(isrecommede["culture"]);
      Navigator.of(context).pushNamed(Recommandation1Page.routeName,
          arguments: isrecommede["culture"]);
    } else if (isrecommede["error"]) {
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
      appBar: AppbarWidget(title: "Cultures"),
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
                      Icons.recommend_outlined,
                      size: 80,
                      color: Color.fromARGB(255, 145, 132, 132),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'caracteristique du sol',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Les caractéristiques de votre parcelle sont:",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Form(
                                  key: _FormKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Taux d'azote",
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
                                          onSaved: (value) {
                                            _nitrogen = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Taux de phosphore",
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
                                          onSaved: (value) {
                                            _phosphor = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Taux de potassium",
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
                                          onSaved: (value) {
                                            _potassium = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Température",
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
                                          onSaved: (value) {
                                            _temperature = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration("Humidité",
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
                                          onSaved: (value) {
                                            _humidity = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Ph", "Entrez une valeur"),
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
                                          onSaved: (value) {
                                            _ph = value!;
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  "Precipitations",
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
                                          onSaved: (value) {
                                            _rainfall = value!;
                                          },
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
                                            padding: EdgeInsets.fromLTRB(
                                                40, 10, 40, 10),
                                            child: Text(
                                              "Cultures recommandées",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () {
                                            _cultureNew();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
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
