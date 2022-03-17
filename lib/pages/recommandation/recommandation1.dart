import 'dart:convert';
import 'package:apreculture/api/culture_state.dart';
import 'package:apreculture/models/culturepred_model.dart';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/help/help.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/pages/help/culture.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/card.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:provider/provider.dart';

class Recommandation1Page extends StatefulWidget {
  const Recommandation1Page({Key? key}) : super(key: key);
  static const routeName = '/recommandation1';

  @override
  State<StatefulWidget> createState() {
    return _Recommandation1PageState();
  }
}

class _Recommandation1PageState extends State<Recommandation1Page> {
  @override
  Widget build(BuildContext context) {
    final imgpred = Provider.of<CultureState>(context).getImgPred();

    var predict = ModalRoute.of(context)!.settings.arguments;

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
                    'Cultures recommandées',
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
                            "Les cultures adaptées à votre sol sont:",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 10),

                        CardWidget(
                          // image: image ,
                          // image: Image.network(
                          //     "http://192.168.8.100:8000$imgpred",
                          //     height: 100),
                          text: Text(predict.toString()),
                          link: const CulturePage(),
                        ),
                        // const SizedBox(height: 10),
                        // CardWidget(

                        //   image: Image.asset('assets/images/piment.jpg'),
                        //   text: const Text('Piment'),
                        //   link: const CulturePage(),
                        // ),
                        // const SizedBox(height: 10),
                        // CardWidget(
                        //   image: Image.asset(
                        //     'assets/images/oignon.jpg',
                        //   ),
                        //   text: const Text('Oignon'),
                        //   link: const CulturePage(),
                        // ),
                        // const SizedBox(height: 10),
                        // CardWidget(
                        //   image: Image.asset(
                        //     'assets/images/aubergine.jpg',
                        //   ),
                        //   text: const Text('Aubergine'),
                        //   link: const CulturePage(),
                        // ),
                      ],
                    ),
                  )
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
