import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    if (counter == 0) {
      setState(() {
        counter=0;
      });
    } else {
      setState(() {
        counter--;
      });
    }


  }



  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      elevation: 20,
      margin:
      EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 100,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/images/features/Mask Group 4.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Women t-shirt',
                      style: TextStyle(
                          color: Color(0xFF434343),
                          fontSize: 16),
                    ),
                   const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Lotto. LTD',
                      style: TextStyle(
                          color: Color(0xFF919191),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$34.00 ',
                      style: TextStyle(
                          color: Color(0xFF374ABE),
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainerIconButton(
                            decrement, Icons.remove),
                        Container(
                          width: 30,
                          height: 30,
                          color: Color(0xFFF6F6F6),
                          child: Center(
                            child: Text('${counter}'),
                          ),
                        ),
                        buildContainerIconButton(
                            increment, Icons.add),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon:const Icon(Icons.close_sharp)),
        ],
      ),
    );;
  }

  Container buildContainerIconButton(Function() onClick, IconData icon) {
    return Container(
      width: 30,
      height: 30,
      color: Color(0xFFF6F6F6),
      child: Center(
        child: IconButton(
          onPressed: onClick,
          icon: Icon(icon, size: 15,),
        ),
      ),
    );
  }
}
