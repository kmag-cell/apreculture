import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final dynamic link;
  final Image? image;
  final Text? text;
  // ignore: use_key_in_widget_constructors
  const CardWidget({this.image, this.text, this.link});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder:(context) => link));
          debugPrint;
        },
        child: ListTile(
          leading: SizedBox(
            child: image,
            height: 50,
            width: 100,
          ),
          title: text,
          subtitle: const Text('Aide à la culture'),
        ),
      ),
    ));
  }
}
