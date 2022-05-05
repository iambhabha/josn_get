import 'package:api_call/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback ontap;
  PrimaryButton({required this.buttonText, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
          child: Text(
            buttonText,
            style: textButton.copyWith(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
