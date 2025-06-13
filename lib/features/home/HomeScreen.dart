import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snackr/core/helper/cashe_helper/database.dart';
import 'package:snackr/features/home/detailed/detailedPage.dart';

import '../../core/utils/config/style/textstyle.dart';
import '../../core/utils/shared/component/widgets/headerimage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex; // Tracks the selected item index (null = none selected)

  final List<String> foodImages = [
    "images/items/ice-cream.png",
    "images/items/burger.png",
    "images/items/pizza.png",
    "images/items/salad.png",
  ];

  // Widget shimmerGridView({required int crossAxisCount, required int itemCount}) {
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: crossAxisCount,
  //       crossAxisSpacing: 10,
  //       mainAxisSpacing: 10,
  //       childAspectRatio: 2.2,
  //     ),
  //     itemCount: itemCount,
  //     itemBuilder: (context, index) =>
  //     const ShimmerWidget(height: 100, width: double.infinity),
  //   );
  // }
  // Shimmer Widget Class
  // class ShimmerWidget extends StatelessWidget {
  // final double height;
  // final double width;
  //
  // const ShimmerWidget({
  // Key? key,
  // required this.height,
  // required this.width,
  // }) : super(key: key);
  //
  // @override
  // Widget build(BuildContext context) {
  // return Shimmer.fromColors(
  // baseColor: Colors.grey[300]!,
  // highlightColor: Colors.grey[100]!,
  // child: Container(
  // height: height,
  // width: width,
  // decoration: BoxDecoration(
  // color: Colors.white,
  // borderRadius: BorderRadius.circular(8.0),
  // ),
  // ),
  // );
  // }
  // }
  Stream? fooditemStream;
  onload() async {
    fooditemStream = await DataBaseMethods().getFoodItem('Pizza');
  }

  @override
  void initState() {
    onload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshort) {
          return snapshort.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshort.data.docs.lenget,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshort.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailedScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Image.network(
                                  ds['Image'],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds['Name'],
                                        style: AppTextStyle.semiTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Honey goot cheese",
                                        style: AppTextStyle.LightTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "\$" + ds['Price'],
                                        style: AppTextStyle.semiTextStyle,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshort) {
          return snapshort.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshort.data.docs.lenget,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshort.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => DetailedScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds['image'],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds['Name'],
                                  style: AppTextStyle.semiTextStyle,
                                ),
                                Text(
                                  "Fresh and Healthy",
                                  style: AppTextStyle.LightTextStyle,
                                ),
                                Text(
                                  "\$" + ds['Price'],
                                  style: AppTextStyle.semiTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Arthur,",
                  style: AppTextStyle.boldTextStyle,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Delicious Food",
              style: AppTextStyle.headTextStyle,
            ),
            Text(
              "Discover and Get Great Food",
              style: AppTextStyle.subTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(foodImages.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeaderImage(
                    imageasset: foodImages[index],
                    isSelected: selectedIndex == index, // Pass selection state
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selection
                      });
                    },
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 270,
                    child: allItems(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/salad2.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Veggie Taco Hash",
                              style: AppTextStyle.semiTextStyle,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: AppTextStyle.LightTextStyle,
                            ),
                            Text(
                              "\$25",
                              style: AppTextStyle.semiTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            allItemsVertically(),
          ],
        ),
      ),
    );
  }
}
