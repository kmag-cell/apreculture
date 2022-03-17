import 'package:apreculture/api/stock_state.dart';
import 'package:apreculture/models/stock_model.dart';
import 'package:apreculture/models/user_model.dart';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/component/futureplant.dart';
import 'package:apreculture/pages/home/component/plant.dart';
import 'package:apreculture/pages/home/component/title.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:apreculture/pages/home/component/search.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppbarWidget(title: "Acceuil"),
      drawer: const MenuWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              // height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            SearchWidget(
              size: size,
            ),
            TitleWithMoreBtn(title: "Culture de la saison ", press: () {}),
            const RecomendsPlants(),
            TitleWithMoreBtn(title: "En vogue", press: () {}),
            const FeaturedPlants(),
            const SizedBox(height: kDefaultPadding),
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
            offset: const Offset(0, -10),
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
