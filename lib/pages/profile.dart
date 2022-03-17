import 'package:apreculture/api/user_state.dart';
import 'package:apreculture/models/user_model.dart';
import 'package:apreculture/pages/contact.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/widgets/appbar.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:apreculture/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserModel> _userModel;

  @override
  void initState() {
    super.initState();
    _userModel = UserState().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Profil"),
      drawer: const MenuWidget(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            FutureBuilder<UserModel>(
                future: _userModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
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
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data!.userData!.firstName.toString() +
                                " " +
                                snapshot.data!.userData!.lastName.toString(),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Information Utilisateur",
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
                                        Column(
                                          children: <Widget>[
                                            ...ListTile.divideTiles(
                                              color: Colors.grey,
                                              tiles: [
                                                ListTile(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 4),
                                                  leading: const Icon(
                                                      Icons.my_location),
                                                  title: const Text(
                                                      "Localisation"),
                                                  subtitle: Text(snapshot
                                                      .data!.userData!.location
                                                      .toString()),
                                                ),
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.email),
                                                  title: const Text("Email"),
                                                  subtitle: Text(snapshot
                                                      .data!.userData!.email
                                                      .toString()),
                                                ),
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.phone),
                                                  title: const Text("Numéro"),
                                                  subtitle: Text(snapshot
                                                      .data!.userData!.number
                                                      .toString()),
                                                ),
                                                const ListTile(
                                                  leading: Icon(Icons.person),
                                                  title:
                                                      Text("À propos de moi"),
                                                  subtitle:
                                                      Text(" Agriculteur."),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                })
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
