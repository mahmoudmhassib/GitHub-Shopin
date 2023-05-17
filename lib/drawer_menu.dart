import 'package:flutter/material.dart';
import 'package:shop_in/screens/featured_screen.dart';
import 'package:shop_in/screens/home_version.dart';
import 'package:shop_in/screens/language_screen.dart';
import 'package:shop_in/screens/my_cart_screen.dart';
import 'package:shop_in/screens/my_orders_screen.dart';
import 'package:shop_in/screens/profile_screen.dart';
import 'package:shop_in/screens/setting.dart';
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> drawer=[
      'Home',
      'Profile',
      'My Cart',
      'Favorite',
      'My Order',
      'Language',
      'Settings',
    ];
    final List<IconData> icons=[
      (Icons.home),
      (Icons.person),
      (Icons.shopping_cart),
      (Icons.favorite),
      (Icons.delivery_dining),
      (Icons.language),
      (Icons.settings),
    ];
    List pages=[
      HomeVersion(),
      ProfileScreen(),
      MyCart(),
      FeaturedScreenAndFavorite(pageTitle: 'Favorite',),
      OrdersScreen(),
      LanguageScreen(),
      SettingsScreen(),
    ];
    return Drawer(
      backgroundColor: Colors.black87,
      elevation: 15,
      width: MediaQuery.of(context).size.width * .8,
      child: Center(
        child: ListView.builder(
            itemCount: drawer.length,
            itemBuilder: (ctx,index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>pages[index]));
                      },
                      child: ListTile(
                        title: Text(
                          drawer[index],
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        leading: Icon(icons[index],size: 30,color: Colors.white,),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    indent: 65,
                    color: Colors.grey,
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
