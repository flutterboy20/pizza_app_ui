import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app_ui/ui/common/order_confirmation_screen.dart';

class BuyNowSliderButton extends StatelessWidget {
  const BuyNowSliderButton({
    super.key,
    required this.actionSliderController, required this.buttonColor, required this.iconColor,
  });
  final Color buttonColor;
  final Color iconColor;

  final ActionSliderController actionSliderController;

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      actionThresholdType: ThresholdType.release,
      height: 55,
      controller: actionSliderController,
      backgroundColor: buttonColor,
      icon:  Icon(
        Icons.local_pizza,
        color: iconColor,
      ),
      toggleColor: Colors.white,
      action: (controller) async {
        controller.loading(); //starts loading animation
        await Future.delayed(const Duration(seconds: 1));
        controller.success(); //starts success animation
        await Future.delayed(const Duration(seconds: 1));
        actionSliderController.reset();
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderConfirmationScreen(),
            ),
          );
        }
      },
      child: const Text(
        'Buy NOW!',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
