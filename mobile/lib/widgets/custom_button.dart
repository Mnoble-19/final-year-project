import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';

class CustomButton extends StatelessWidget {

  String label;

  CustomButton({
    super.key,
    required this.label,
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          CustomColors.appDarkGreenColor,
        ),
      ),
      onPressed: () {
        // TODO: Implement Payment logic
      },
      child: Container(
        width: double.infinity,
        height: 65,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
