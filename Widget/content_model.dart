class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent({
    required this.image,
    required this.description,
    required this.title,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    description: 'Pick your food our menu\n    More than 35 times ',
    image: "images/screen1.png",
    title: 'Select from Our Best Menu',
  ),
  UnboardingContent(
    description:
        'You can pay cash on delivery and\n        Card payment is available',
    image: "images/screen2.png",
    title: 'Easy and online payment ',
  ),
  UnboardingContent(
    description: 'Deliver your food at youtr\n                 doorstep',
    image: "images/screen3.png",
    title: 'Quick delivery at your doorstep',
  ),
];
