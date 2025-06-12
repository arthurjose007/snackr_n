import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackr/core/utils/config/style/textstyle.dart';
import 'package:snackr/core/utils/shared/component/widgets/onboardmodel.dart';

import '../signup/signupScreen.dart';

class Onboardscreen extends StatefulWidget {
  const Onboardscreen({super.key});

  @override
  State<Onboardscreen> createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: Onboarding.contentsOnboarding.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Onboarding.contentsOnboarding[index].image,
                          height: 450,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Onboarding.contentsOnboarding[index].title,
                          style: AppTextStyle.onboardSemiTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Onboarding.contentsOnboarding[index].description,
                          style: AppTextStyle.onBoardLightTextStyle,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                Onboarding.contentsOnboarding.length,
                                (index) => buildDot(index, context)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex ==
                                Onboarding.contentsOnboarding.length - 1) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => Signupscreen()));
                            }
                            _controller.nextPage(
                                duration: Duration(microseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                            height: 60,
                            width: double.infinity,
                            margin: EdgeInsets.all(40),
                            child: Center(
                                child: Text(
                                  currentIndex ==
                                      Onboarding.contentsOnboarding.length - 1?"Sign UP" :"Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 10,
        width: currentIndex == index ? 18 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.grey,
            borderRadius: BorderRadius.circular(6)));
  }
}
