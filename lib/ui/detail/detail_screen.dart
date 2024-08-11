import 'dart:ui';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_ui/data/pizza_data.dart';
import 'package:pizza_app_ui/ui/home/widgets/buy_now_slider_button.dart';
import 'package:traversal_slider/traversal_slider.dart';

class DetailScreen extends StatefulWidget {
  final int currentIndex;
  const DetailScreen({super.key, required this.currentIndex});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late int currentIndex;
  ActionSliderController actionSliderController = ActionSliderController();
  @override
  void initState() {
    currentIndex = widget.currentIndex;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    actionSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/detail_screen_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            // make sure we apply clip it properly
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            PizzaData.pizzas.elementAt(currentIndex).name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "\$ ${PizzaData.pizzas.elementAt(currentIndex).price.toString()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Text(
                            PizzaData.pizzas
                                .elementAt(currentIndex)
                                .description,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Spacer(),
                        TraversalSlider(
                          widgets: List.generate(
                            PizzaData.pizzas.length,
                            (index) => Image.asset(
                              PizzaData.pizzas[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          sliderType: SliderType.multipleViewSlider,
                          onIndexChanged: (value) {
                            currentIndex = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      height: 60,
                      width: size.width * 0.95,
                      child: Center(
                        child: BuyNowSliderButton(
                          actionSliderController: actionSliderController,
                          buttonColor: Colors.redAccent,
                          iconColor: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
