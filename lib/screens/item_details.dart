import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_in/api_actions/api_models.dart';

import '../api_actions/provider_models.dart';
import '../app_bar.dart';
import 'my_cart_screen.dart';

class ItemDetails extends StatefulWidget {
  final int id;
  const ItemDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Color grey = Color(0xFFE1E1E1);
  Color mov = Color(0xFF667EEA);
  int selectSize = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context,listen: false).fetchProductById(widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buildExpandedButton(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MyCart()));
          }, 'ADD TO CART', Colors.black, grey),
          buildExpandedButton(() {}, 'BUY NOW', Colors.white, mov),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProviderProduct>(
            builder: (ctx,value,child){
              final prov=value.fetchProductById(widget.id);
              return   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarToScreen(
                    icon1: Icons.arrow_back,
                    onClick1: () {
                      Navigator.of(context).pop();
                    },
                    icon2: Icons.search,
                    onClick2: () {},
                    icon3: Icons.delete,
                    onClick3: () {},
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 23),
                    width: MediaQuery.of(context).size.width * .88,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(prov.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 23, bottom: 8),
                    child: Text(
                      prov.title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Color(0xFF2A2A2A),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 23, bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          '\$${prov.price}',
                          style: const TextStyle(
                            color: Color(0xFF667EEA),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '\$${prov.oldPrice}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xFF2A2A2A),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 20,
                    // color: ,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 23, right: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 65,
                              height: 35,
                              child: Center(
                                child: Text(
                                  '${prov.rating}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFF667EEA),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              prov.ratingTitle,
                              style: const TextStyle(
                                  color: Color(0xFF2A2A2A), fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          '${prov.ratingNum} Reviews',
                          style: const TextStyle(
                              color: Color(0xFF667EEA), fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                    height: 20,
                    // color: ,
                  ),
                  ListTile(
                    title: const Text('Describtion\n'),
                    subtitle: Text(
                        prov.details),
                  ),
                  const Divider(
                    thickness: 1.5,
                    height: 20,
                    // color: ,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Select Size',
                        style: TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Select Color',
                        style: TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 18,
                          //fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1.5,
                    height: 20,
                    // color: ,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: prov.sizes.map((e) =>  buildContainerSelectSize(e)).toList()

                    ),
                  ),
                ],
              ) ;
            },
          ),
        ),
      ),
    );
  }

  Consumer buildContainerSelectSize(
    String text,
  ) {
    return Consumer<ProviderProduct>(
      builder: (ctx,value,child){
        final prov=value.fetchProductById(widget.id);
        return  GestureDetector(
          onTap: () {
            setState(() {
              selectSize = prov.sizes.indexOf(text);
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            color: selectSize == prov.sizes.indexOf(text)? Color(0xFF667EEA): Colors.grey,
            child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: selectSize == prov.sizes.indexOf(text)? Colors.white: Colors.black),
                )),
          ),
        );
      },
    );
  }

  Expanded buildExpandedButton(
      Function() onPress, String text, Color col1, Color col2) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 53,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: col1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: col2,
          ),
        ),
      ),
    );
  }
}
