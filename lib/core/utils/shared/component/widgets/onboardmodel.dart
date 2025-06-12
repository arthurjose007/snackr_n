class Onboarding {
  Onboarding(
      {required this.image, required this.title, required this.description});
  String image;
  String title;
  String description;
  static List<Onboarding> contentsOnboarding = [
    Onboarding(
        image: "images/screen1.png",
        title: "Select from Our\n     Best Menu ",
        description: "Pick your food from our menu\n            More than 35 times"),
    Onboarding(
        image: "images/screen2.png",
        title: "Easy and Online Payment",
        description:
            "You can pay cash on delivery and\n       Card payment is available"),
    Onboarding(
        image: "images/screen3.png",
        title: "Quick Delivery at your Door\n                        Step",
        description: "Deliver your food at your Doorstep "),
  ];
}
