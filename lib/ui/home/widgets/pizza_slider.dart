import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pizza_app_ui/data/pizza_data.dart';
import 'package:pizza_app_ui/model/pizza_model.dart';
import 'package:pizza_app_ui/ui/detail/detail_screen.dart';

class PizzaSlider extends StatefulWidget {
  const PizzaSlider({super.key});

  @override
  State<PizzaSlider> createState() => _PizzaSliderState();
}

class _PizzaSliderState extends State<PizzaSlider> {
  double pageValue = 0.0;
  late PageController pageController;

  double scaleFactor = 1;
  // selectedSize of the pizza
  String _selectedSize = 'S';

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 1.3)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: PizzaData.pizzas.length,
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      allowImplicitScrolling: true,
      itemBuilder: (context, index) {
        double angle = (pageValue - index).abs();

        Widget getPlate(Widget child) {
          /// Sliding the movie card in focus a little but up
          if (index == pageValue.floor() + 1 ||
              index == pageValue.floor() + 2) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (index - pageValue)),
              child: child,
            );
          } else if (index == pageValue.floor() ||
              index == pageValue.floor() - 1) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (pageValue - index)),
              child: child,
            );
          } else {
            return child;
          }
        }

        PizzaModel item = PizzaData.pizzas[index];
        return Stack(
          children: [
            // Background filter image
            Positioned(
              top: -180,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: angle < 0.45 ? 1 : 0,
                child: Transform.scale(
                  scale: 1.8,
                  child: Transform.rotate(
                      angle: -angle * 1.5, child: buildFilter(item.image)),
                ),
              ),
            ),
            // Pizza
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.12,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            currentIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: getPlate(
                        Transform.rotate(
                          angle: angle * 2.5,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 1200),
                            scale: scaleFactor,
                            curve: Curves.elasticInOut,
                            child: Image.asset(
                              item.image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Price and Size Customization button
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                  child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: angle < 0.15 ? 1 : 0,
                child: Column(
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 68, right: 68, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${item.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                          // Buttons to change size of pizza
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircleButton(
                                label: 'S',
                                newSize: 200,
                                onTap: () => setState(() {
                                  scaleFactor = 1;
                                  _selectedSize = 'S';
                                }),
                                isSelected: _selectedSize == 'S',
                              ),
                              const SizedBox(width: 10),
                              _buildCircleButton(
                                label: 'M',
                                newSize: 250,
                                onTap: () => setState(() {
                                  scaleFactor = 1.2;
                                  _selectedSize = 'M';
                                }),
                                isSelected: _selectedSize == 'M',
                              ),
                              const SizedBox(width: 10),
                              _buildCircleButton(
                                label: 'L',
                                newSize: 300,
                                onTap: () => setState(() {
                                  scaleFactor = 1.4;
                                  _selectedSize = 'L';
                                }),
                                isSelected: _selectedSize == 'L',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        );
      },
    );
  }
}

Widget buildFilter(String image) {
  return ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    child: Image.asset(
      image,
    ),
  );
}

Widget _buildCircleButton(
    {required String label,
    required double newSize,
    required Function()? onTap,
    required bool isSelected}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color(
                  0xff1C1C25,
                )
              : Colors.white,
          border: Border.all(
            color: Colors.black45,
          )
          // color: _selectedSize == label ? Colors.purple : Colors.white,
          ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            // color: _selectedSize == label ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
