import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackr/core/utils/config/style/textstyle.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({super.key});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/salad2.png",
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height/2.6,
              // color: Colors.grey,
              padding: EdgeInsets.all(10),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mediterranean",
                        style: AppTextStyle.semiTextStyle,
                      ),
                      Text(
                        "Chickpea Saland",
                        style: AppTextStyle.headTextStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (value > 1) {
                            setState(() {
                              value--;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        value.toString(),
                        style: AppTextStyle.semiTextStyle,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Larem Ipsm is simply dummy text of the printing and typesetting industry lorem ipsum has been the industry standard dummy text ever sine the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.  ",
                    style: AppTextStyle.LightTextStyle,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Delivery Time",
                        style: AppTextStyle.semiTextStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.alarm,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "30 min",
                        style: AppTextStyle.semiTextStyle,
                      )
                    ],
                  ),
                ),
              // Flexible(child: SizedBox(height: 10,)),
               // Expanded(child: ),
               // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: AppTextStyle.semiTextStyle,
                            ),
                            Text(
                              "\$28",
                              style: AppTextStyle.headTextStyle,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),                  color: Colors.black,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),SizedBox(width: 20,),
                            Container(color: Colors.grey,child: Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 29,),)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            
            
              ],) ,),
          ),





        ],
      ),
    );
  }
}
