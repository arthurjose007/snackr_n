import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:snackr/core/helper/cashe_helper/shared_pref.dart';
import 'package:snackr/core/utils/config/style/textstyle.dart';
import '../../core/helper/cashe_helper/app_cashe_helper.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletState();
}

class _WalletState extends State<WalletScreen> {
  String?
      wallet,
      id;
  // int wallet = 0;
  int? add;
  TextEditingController amountcontroller = new TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelpers().getUserWallet();
    id = await SharedPreferenceHelpers().getUserId();
    print("this is the wallet $wallet");
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }


   @override
   void initState() {
     ontheload();
     super.initState();
   }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    if(wallet==null){
      wallet='0';
    }
    return Scaffold(
      body:
          // wallet == null
          //     ? CircularProgressIndicator()
          //     :
          Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: AppTextStyle.headTextStyle,
                    )))),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppTextStyle.LightTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      wallet == null
                          ? Text(
                              "\$ 0",
                              style: AppTextStyle.boldTextStyle,
                            )
                          : Text(
                              "\$" + wallet.toString(),
                              style: AppTextStyle.boldTextStyle,
                            )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: AppTextStyle.semiTextStyle,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // makePayment('100');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "100",
                      style: AppTextStyle.semiTextStyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // makePayment('500');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "500",
                      style: AppTextStyle.semiTextStyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //makePayment('1000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "1000",
                      style: AppTextStyle.semiTextStyle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //makePayment('2000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "2000",
                      style: AppTextStyle.semiTextStyle,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                openEdit();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, 'INR');
  //     //Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntent!['client_secret'],
  //             // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
  //             // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
  //             style: ThemeMode.dark,
  //             merchantDisplayName: 'Adnan'))
  //         .then((value) {});
  //
  //     ///now finally display payment sheeet
  //     displayPaymentSheet(amount);
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }
  //
  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) async {
  //       add = int.parse(wallet!) + int.parse(amount);
  //       ///await SharedPreferenceHelper().saveUserWallet(add.toString());
  //       ///await DatabaseMethods().UpdateUserwallet(id!, add.toString());
  //       // ignore: use_build_context_synchronously
  //       showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   children: const [
  //                     Icon(
  //                       Icons.check_circle,
  //                       color: Colors.green,
  //                     ),
  //                     Text("Payment Successfull"),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ));
  //       ///  await getthesharedpref();
  //       // ignore: use_build_context_synchronously
  //
  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       print('Error is:--->$error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //           content: Text("Cancelled "),
  //         ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  //  Future<Map<String, dynamic>>
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     // ignore: avoid_print
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print('err charging user: ${err.toString()}');
  //   }
  // }

  // calculateAmount(String amount) {
  //   final calculatedAmout = (int.parse(amount)) * 100;
  //
  //   return calculatedAmout.toString();
  // }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.cancel)),
                        SizedBox(
                          width: 60.0,
                        ),
                        Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                              color: Color(0xFF008080),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Amount"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: amountcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Enter Amount'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: ()async {
                          int walletadd=int.parse(wallet!);
                          int amount=int.parse(amountcontroller.text.trim());
                          int value=walletadd+amount;
                          wallet=value.toString();
                         // wallet = (walletadd! + amountcontroller.text) as String?;
                         // print(wallet.toString());
                        await SharedPreferenceHelpers().saveUserWallet(value.toString());

                          amountcontroller.clear();
                          Navigator.pop(context);
                          setState(() {});
                          // makePayment(amountcontroller.text);
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
