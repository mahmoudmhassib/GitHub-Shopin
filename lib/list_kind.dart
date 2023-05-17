import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_in/screens/item_details.dart';

import 'api_actions/provider_models.dart';

class ListOfType extends StatefulWidget {
  const ListOfType({Key? key}) : super(key: key);

  @override
  State<ListOfType> createState() => _ListOfTypeState();
}

class _ListOfTypeState extends State<ListOfType> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context, listen: false).fetchAllProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 235,
      child: Consumer<ProviderProduct>(
        builder: (ctx, value, child) {
          //TODO:have to getter

          final prov = value.Products;
          if (prov.isNotEmpty) {
            return ListView.builder(
                padding: EdgeInsets.only(left: 27),
                scrollDirection: Axis.horizontal,
                itemCount: prov.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ItemDetails(id: prov[index].id,)));
                    },
                    child: Container(
                      width: 150,
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 13),
                            width: 150,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(prov[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('\$${prov[index].price}'),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(prov[index].title),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: 5,
              ),
            );
          }
        },
      ),
    );
  }
}
