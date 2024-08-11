import 'package:pizza_app_ui/model/pizza_model.dart';

class PizzaData {
  static List<PizzaModel> pizzas = [
    PizzaModel(
      name: "Mozzarella",
      image: "assets/mozzarella.png",
      price: 24.50,
      description:
          "Classic Mozzarella pizza with rich, creamy cheese and a delicious tomato base.",
    ),
    PizzaModel(
      name: "Salami",
      image: "assets/salami.png",
      price: 18.49,
      description:
          "A spicy Salami pizza topped with generous slices of salami and a tangy tomato sauce.",
    ),
    PizzaModel(
      name: "Prosciutto",
      image: "assets/prosciutto.png",
      price: 29.99,
      description:
          "Prosciutto pizza with thinly sliced prosciutto, fresh arugula, and parmesan cheese.",
    ),
    PizzaModel(
      name: "Margherita",
      image: "assets/mozzarella.png",
      price: 19.99,
      description:
          "A simple yet delicious Margherita pizza with fresh tomatoes, basil, and mozzarella cheese.",
    ),
    PizzaModel(
      name: "Pepperoni",
      image: "assets/salami.png",
      price: 22.99,
      description:
          "Classic Pepperoni pizza loaded with spicy pepperoni slices and melted mozzarella cheese.",
    ),
    PizzaModel(
      name: "Hawaiian",
      image: "assets/prosciutto.png",
      price: 21.50,
      description:
          "A controversial yet tasty Hawaiian pizza with ham, pineapple, and mozzarella cheese.",
    ),
  ];

  static List<PizzaModel> pizzasVarieties = [
    PizzaModel(
      name: "Bagel",
      image: "assets/bagel.png",
      price: 19.50,
      description: "",
    ),
    PizzaModel(
      name: "Cheese",
      image: "assets/cheese.png",
      price: 22.49,
      description: "",
    ),
    PizzaModel(
      name: "Detroit",
      image: "assets/detroit.png",
      price: 26.99,
      description: "",
    ),
    PizzaModel(
      name: "Sicilian",
      image: "assets/sicilian.png",
      price: 28.99,
      description: "",
    ),
  ];
}
