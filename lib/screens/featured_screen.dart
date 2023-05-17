import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_in/api_actions/provider_models.dart';
import '../app_bar.dart';
import 'item_details.dart';
class FeaturedScreenAndFavorite extends StatefulWidget {
  final String pageTitle;
  //final int id;
  const FeaturedScreenAndFavorite({Key? key, required this.pageTitle,}) : super(key: key);

  @override
  State<FeaturedScreenAndFavorite> createState() => _FeaturedScreenAndFavoriteState();
}

class _FeaturedScreenAndFavoriteState extends State<FeaturedScreenAndFavorite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context,listen: false).fetchAllProduct();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            margin: EdgeInsets.only(left: 20, bottom: 15),
            child: Text(
              widget.pageTitle,
              style: TextStyle(color: Color(0xFF434343), fontSize: 30),
            ),
          ),
          Expanded(
            child: Consumer<ProviderProduct>(
              builder: (ctx,value,child){
                final prov=value.Products;
                return   GridView.count(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  childAspectRatio: .69,
                  //shrinkWrap: true,
                  children: List.generate(prov.length, (index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(id: prov[index].id,)));
                      },
                      child: Card(
                        elevation: 10,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image:NetworkImage(prov[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('\$${prov[index].price}'),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(prov[index].title),
                              ),
                            ]),
                      ),
                    );
                  }),
                ) ;
              },
            ),
          ),
        ]),
      ),
    );
  }
}
