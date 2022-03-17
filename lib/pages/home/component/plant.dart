import 'package:apreculture/api/stock_state.dart';
import 'package:apreculture/models/stock_model.dart';
import 'package:apreculture/pages/help/culture.dart';
import 'package:apreculture/pages/recommandation/recommandation1.dart';
import 'package:apreculture/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecomendsPlants extends StatefulWidget {
  const RecomendsPlants({Key? key}) : super(key: key);

  @override
  State<RecomendsPlants> createState() => _RecomendsPlantsState();
}

class _RecomendsPlantsState extends State<RecomendsPlants> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding = await Provider.of<StockState>(context).getStock();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final stock = Provider.of<StockState>(context).stock;
    if (!_isLoding)
      return Text("erreur");
    else {
      return SizedBox(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stock.length,
            itemBuilder: (ctx, i) => RecomendPlantCard(
                  image: stock[i].imageCulture!,
                  title: stock[i].name!,
                  country: stock[i].origin!,
                  price: stock[i].price!,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CulturePage(),
                      ),
                    );
                  },
                )),
      );
    }
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final String price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 0.15,
      ),
      width: size.width * 0.50,
      child: Column(
        children: <Widget>[
          Image.network("http://192.168.1.131:8000$image", height: 140),
          GestureDetector(
            onTap: (() {}),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  // Text(
                  //   '\€$price',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .button!
                  //       .copyWith(color: kPrimaryColor),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
