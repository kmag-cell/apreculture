import 'dart:convert';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/utils/theme_helper.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:apreculture/pages/help/culture1.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CulturePage extends StatefulWidget {
  const CulturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CulturePageState();
  }
}

class _CulturePageState extends State<CulturePage> {
  String _locality = '';
  String _weather = '';

  Future<Position> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<Placemark> getPlacemark(double latitude, double longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    return placemark[0];
  }

  Future<String> getData(double latitude, double longitude) async {
    String api = "http://api.openweathermap.org/data/2.5/weather?";
    String appId = '95770fe0b60e9e3cbaf4202a4b132a4e';
    String url = '$api?lat=$latitude&lon=$longitude&APPID=$appId';

    http.Response response = await http.get(Uri.parse(url));

    Map parsed = json.decode(response.body);

    return parsed['list'][0]['weather'][0]['description'];
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      getPlacemark(position.latitude, position.longitude).then((data) {
        getData(position.latitude, position.longitude).then((weather) {
          setState(() {
            _locality = data.locality!;
            _weather = weather;
          });
        });
      });
    });
  }

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
                          subtitle: Text('temperature°'),
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
                          subtitle: Text('temperature°'),
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
                        child: const Text(
                          "La tomate est une plante annuelle qui craint le froid et nécessite une bonne fertilisation. Cette culture est exigeante en main d’œuvre. La croissance de la plante sera optimale avec des températures nocturnes de 15 à 17°C et des températures diurnes de 18 à 24°C. La période optimale pour cultiver la tomate est Juillet-Aout. Les differentes variétés de la tomate sont : le CLN2418A, CLN1466EA, CLN1460A, CLN2413L, CLN1464A, Caraïbo, LignonC8-6M2-71, F1 Mongal, TMA97, Petomech et bien d'autres.",
                          style: TextStyle(
                            wordSpacing: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              "Suivant",
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
                                        const Culture1Page()));
                          },
                        ),
                      ),
                    ],
                  )),
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
