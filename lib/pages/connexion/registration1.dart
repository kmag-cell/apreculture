import 'package:apreculture/utils/theme_helper.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:apreculture/widgets/header.dart';
import 'package:apreculture/pages/connexion/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Registration1Page extends StatefulWidget {
  const Registration1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Registration1PageState();
  }
}

class _Registration1PageState extends State<Registration1Page> {
  final _formKey = GlobalKey<FormState>();
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Veuillez choisir votre lieu :',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CSCPicker(
                            /// Activer la liste déroulante d'état de désactivation [PARAMÈTRE OPTIONNEL]
                            showStates: true,

                            /// Enable disable city drop down [OPTIONAL PARAMETER]
                            showCities: true,

                            ///Enable (obtenir le drapeau avec le nom
                            flagState: CountryFlag.DISABLE,

                            dropdownDecoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),

                            disabledDropdownDecoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade300,
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),

                            /// espaces réservés pour le champ de recherche déroulant
                            countrySearchPlaceholder: "Country",
                            stateSearchPlaceholder: "State",
                            citySearchPlaceholder: "City",

                            ///étiquettes pour la liste déroulante
                            countryDropdownLabel: "*Country",
                            stateDropdownLabel: "*State",
                            cityDropdownLabel: "*City",

                            selectedItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                            dropdownHeadingStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),

                            ///DropdownDialog Item style [OPTIONAL PARAMETER]
                            dropdownItemStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            ///Dialog box radius [OPTIONAL PARAMETER]
                            dropdownDialogRadius: 10.0,

                            ///Search bar radius [OPTIONAL PARAMETER]
                            searchBarRadius: 10.0,

                            ///triggers once country selected in dropdown
                            onCountryChanged: (value) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setString('countryValue', value);
                              setState(() {
                                ///store value in country variable
                                countryValue = value;
                              });
                            },

                            // /triggers once state selected in dropdown
                            onStateChanged: (value) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              // ignore: unrelated_type_equality_checks
                              if (value != null) {
                                await prefs.setString('stateValue', value);
                              }
                              setState(() {
                                ///store value in state variable
                                stateValue = value;
                              });
                            },

                            onCityChanged: (value) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              if (value != null) {
                                await prefs.setString('cityValue', value);
                              }
                              setState(() {
                                ///store value in city variable
                                cityValue = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Continuer",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) ;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationPage()));
                              },
                            ),
                          ),

                          // ///print newly selected country state and city in Text Widget
                          // TextButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         address =
                          //             "$cityValue, $stateValue, $countryValue";
                          //       });
                          //     },
                          //     child: const Text("Print Data")),
                          // Text(address)
                        ],
                      )),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
