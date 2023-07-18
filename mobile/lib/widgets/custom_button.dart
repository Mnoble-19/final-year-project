import 'package:flutter/material.dart';
import 'package:Etolls/constants/constants.dart';

class CustomButton extends StatelessWidget {

  String label;
  Function onTap;

  CustomButton({
    super.key,
    required this.label,
    required this.onTap
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
        onTap();
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
