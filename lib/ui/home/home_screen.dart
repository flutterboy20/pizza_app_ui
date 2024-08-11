import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_ui/data/pizza_data.dart';
import 'package:pizza_app_ui/ui/home/widgets/buy_now_slider_button.dart';
import 'package:pizza_app_ui/ui/home/widgets/pizza_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActionSliderController actionSliderController = ActionSliderController();
  @override
  void dispose() {
    super.dispose();
    actionSliderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppAppBar(appBar: AppBar()),
      body: Column(
        children: [
          // Pizza horizontal carousel
          const Expanded(flex: 6, child: PizzaSlider()),
          // List of varieties of pizza
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
              ),
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Color(
                  0xff1C1C25,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    16,
                  ),
                  topRight: Radius.circular(
                    16,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 18,
                      ),
                      child: Text(
                        "Pizza Varieties",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: PizzaData.pizzasVarieties.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xffFFF5F2,
                                ),
                                borderRadius: BorderRadius.circular(
                                  18,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 14,
                                    ),
                                    child: Image.asset(
                                      PizzaData.pizzasVarieties[index].image,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    PizzaData.pizzasVarieties[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 42,
                        bottom: 4,
                      ),
                      child: Center(
                        child: BuyNowSliderButton(
                          actionSliderController: actionSliderController,
                          buttonColor: const Color(
                            0xff707FCD,
                          ),
                          iconColor: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
