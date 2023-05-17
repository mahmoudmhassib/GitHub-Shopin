import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../drawer_menu.dart';
import '../icon_button.dart';
import '../list_kind.dart';
import '../text_title_container.dart';
import 'featured_screen.dart';

class HomeVersion extends StatelessWidget {
  const HomeVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final _controll = TextEditingController();
    final List<String> categoryName = <String>['Women', 'Man', 'Kids'];
    final List<ColorModel> categoryColor = [
      ColorModel(
        c1: Color(0xFF667EEA),
        c2: Color(0xFF667EEA),
      ),
      ColorModel(
        c1: Color(0xFFFF5858),
        c2: Color(0xFF667EEA),
      ),
      ColorModel(
        c1: Color(0xFF43E97B),
        c2: Color(0xFF43E97B),
      ),
    ];
    final List<String> categoryImage = <String>[
      'lib/images/category/Mask Group 1.png',
      'lib/images/category/Mask Group 2.png',
      'lib/images/category/Mask Group 3.png',
    ];


    return Scaffold(
      key: scaffoldKey,
      drawer:DrawerMenu(),
      body: SafeArea(
        child: Column(
          children: [
            AppBarToScreen(
              icon1: Icons.menu,
              onClick1: () {
                print('2222222');
                scaffoldKey.currentState!.openDrawer();
              },
              icon2: Icons.add_alert,
              onClick2: () {},
              icon3: Icons.delete,
              onClick3: () {},
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .87,
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(10),
                  shadowColor: Colors.black38,
                  child: TextField(
                    controller: _controll,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search Your Product',
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  TextTitleContainer(
                    edgeInsets: const EdgeInsets.only(
                        left: 27, right: 23, top: 20, bottom: 10),
                    title: 'Category',
                    onPress: () {},
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        left: 27,
                      ),
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryName.length,
                      itemBuilder: (ctx, index) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 13),
                              width: 115,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(categoryImage[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: .70,
                              child: Container(
                                width: 115,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      categoryColor[index].c1,
                                      categoryColor[index].c2,
                                    ],
                                    stops: const [0, 225],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Text(
                                categoryName[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              top: 25,
                              right: 0,
                              left: 37,
                              bottom: 0,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  TextTitleContainer(
                    edgeInsets: const EdgeInsets.only(
                        left: 27, right: 23, top: 20, bottom: 10),
                    title: 'Featured',
                    onPress: () {
                      print('11111111111111');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => FeaturedScreenAndFavorite(pageTitle: 'Featured',)));
                    },
                  ),
                  ListOfType(),
                  TextTitleContainer(
                    edgeInsets: const EdgeInsets.only(
                        left: 27, right: 23, top: 20, bottom: 10),
                    title: 'BestSell',
                    onPress: () {},
                  ),
                  ListOfType(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorModel {
  final Color c1;
  final Color c2;

  ColorModel({
    required this.c1,
    required this.c2,
  });
}
