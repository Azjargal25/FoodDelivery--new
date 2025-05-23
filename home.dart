import 'package:flutter/material.dart';
import 'package:fooddelivery/Widget/widget_support.dart';
import 'package:fooddelivery/pages/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = "all";

  // Хоолнуудын жагсаалт
  final List<Map<String, dynamic>> allItems = [
    {
      "category": "salad",
      "image": "images/salad2.png",
      "title": "Veggie Taco Hash",
      "subtitle": "Fresh and Healthy",
      "price": "\$25",
    },
    {
      "category": "salad",
      "image": "images/salad3.png",
      "title": "Mix Veg Salad",
      "subtitle": "Spicy with Onion",
      "price": "\$28",
    },
    {
      "category": "salad",
      "image": "images/salad4.png",
      "title": "Mediterranean Chicken",
      "subtitle": "Honey goat cheese",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad4.png",
      "title": "Mediterranean Chicken",
      "subtitle": "Honey goat cheese",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad5.png",
      "title": "Asian Coleslaw with Ginger Dressing",
      "subtitle": "Ginger and Mushroom",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad6.png",
      "title": "Marinated Vegetable Salad",
      "subtitle": "Filled with crunchy, healthy veggies",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad7.png",
      "title": "Carrot Ribbon Salad with Arugula",
      "subtitle": "arugula, sweet carrots, goat cheese ",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad8.png",
      "title": "Carrot Ribbon Salad with Arugula",
      "subtitle": "arugula, sweet carrots, goat cheese ",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad9.png",
      "title": "Chopped Broccoli Crunch Salad",
      "subtitle": "All Natural Vegan ",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad10.png",
      "title": "Crisp and Cool Asian Cucumber Salad",
      "subtitle": "arugula, sweet carrots, goat cheese",
      "price": "\$30",
    },
    {
      "category": "salad",
      "image": "images/salad11.png",
      "title": "Sweet Pepper Cucumber Crunch Salad",
      "subtitle": "viral cucumber salad",
      "price": "\$30",
    },

    {
      "category": "pizza",
      "image": "images/pizza 1.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$32",
    },
    {
      "category": "pizza",
      "image": "images/pizza2.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$62",
    },
    {
      "category": "pizza",
      "image": "images/pizza3.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$50",
    },
    {
      "category": "pizza",
      "image": "images/pizza4.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$42",
    },
    {
      "category": "pizza",
      "image": "images/pizza5.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$22",
    },
    {
      "category": "pizza",
      "image": "images/pizza6.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$62",
    },
    {
      "category": "pizza",
      "image": "images/pizza7.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$22",
    },
    {
      "category": "pizza",
      "image": "images/pizza8.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$40",
    },
    {
      "category": "pizza",
      "image": "images/pizza9.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$30",
    },
    {
      "category": "pizza",
      "image": "images/pizza10.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$33",
    },
    {
      "category": "pizza",
      "image": "images/pizza11.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$42",
    },
    {
      "category": "pizza",
      "image": "images/pizza12.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$32",
    },
    {
      "category": "pizza",
      "image": "images/pizza13.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$30",
    },
    {
      "category": "pizza",
      "image": "images/pizza14.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$30",
    },
    {
      "category": "pizza",
      "image": "images/pizza15.png",
      "title": "МАХАНД ДУРЛАГСАД & ПЕППЕРОНИ",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$32",
    },

    {
      "category": "burger",
      "image": "images/burger1.png",
      "title": "Beef Burger",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$18",
    },
    {
      "category": "burger",
      "image": "images/burger2.png",
      "title": "Чикен Воппер",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$38",
    },
    {
      "category": "burger",
      "image": "images/burger3.png",
      "title": "Криспи Чикен",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$40",
    },
    {
      "category": "burger",
      "image": "images/burger4.png",
      "title": "Бекон Криспи Чикен",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$28",
    },
    {
      "category": "burger",
      "image": "images/burger5.png",
      "title": "Лонг Чизбургер",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$40",
    },
    {
      "category": "burger",
      "image": "images/burger6.png",
      "title": "Дабл Чизбургер",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$32",
    },
    {
      "category": "burger",
      "image": "images/burger7.png",
      "title": "Воппер",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$28",
    },
    {
      "category": "burger",
      "image": "images/burger8.png",
      "title": "Воппе",
      "subtitle": "With cheese and fries",
      "price": "\$30",
    },
    {
      "category": "burger",
      "image": "images/burger9.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$30",
    },
    {
      "category": "burger",
      "image": "images/burger10.png",
      "title": "Beef Burger",
      "subtitle": "Нэг пиццанаас хоёр өөр амтыг мэдрээрэй",
      "price": "\$48",
    },
    {
      "category": "burger",
      "image": "images/burger11.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$28",
    },

    {
      "category": "burger",
      "image": "images/burger11.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$18",
    },
    {
      "category": "burger",
      "image": "images/burger11.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$18",
    },
    {
      "category": "burger",
      "image": "images/burger11.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$18",
    },
    {
      "category": "burger",
      "image": "images/burger11.png",
      "title": "Beef Burger",
      "subtitle": "With cheese and fries",
      "price": "\$18",
    },
    {
      "category": "icecream",
      "image": "images/cream1.png",
      "title": "Gelato",
      "subtitle": "Unlike American ice cream",
      "price": "\$15",
    },
    {
      "category": "icecream",
      "image": "images/cream2.png",
      "title": "Kulfi",
      "subtitle": "slowly heating sweetened milk",
      "price": "\$10",
    },
    {
      "category": "icecream",
      "image": "images/cream3.png",
      "title": "blueberry",
      "subtitle": "slowly heating ",
      "price": "\$10",
    },
    {
      "category": "icecream",
      "image": "images/cream4.png",
      "title": "strawberry",
      "subtitle": "fruit and milk",
      "price": "\$12",
    },
    {
      "category": "icecream",
      "image": "images/cream5.png",
      "title": " Sherbet",
      "subtitle": "slowly heating sweetened milk",
      "price": "\$10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems =
        selectedCategory == "all"
            ? allItems
            : allItems
                .where((item) => item['category'] == selectedCategory)
                .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Azjargal,",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text("Delicious Food", style: AppWidget.HeadLineTextFieldStyle()),
              Text(
                "Discover and Get Great Food",
                style: AppWidget.LightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),

              // Хоолны төрөл
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryIcon("images/ice-cream.png", "icecream"),
                  buildCategoryIcon("images/pizza.png", "pizza"),
                  buildCategoryIcon("images/salad.png", "salad"),
                  buildCategoryIcon("images/burger.png", "burger"),
                ],
              ),

              SizedBox(height: 30.0),

              // Хоолны жагсаалт
              Column(
                children:
                    filteredItems.map((item) {
                      return GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Details()),
                            ),
                        child: buildCard(item),
                      );
                    }).toList(),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Хоолны төрлийн icon
  Widget buildCategoryIcon(String imagePath, String categoryName) {
    bool selected = selectedCategory == categoryName;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = selected ? "all" : categoryName;
        });
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Карт бүтээх
  Widget buildCard(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              Image.asset(
                item['image'],
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title'], style: AppWidget.boldTextFieldStyle()),
                    Text(
                      item['subtitle'],
                      style: AppWidget.LightTextFieldStyle(),
                    ),
                    SizedBox(height: 5),
                    Text(item['price'], style: AppWidget.boldTextFieldStyle()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
