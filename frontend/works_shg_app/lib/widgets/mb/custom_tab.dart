import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;
  final bool firstTab;
  final bool lastTap;

  const CustomTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap, required this.firstTab, required this.lastTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: isSelected?60:55,
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
             
              width: isSelected ? 1.0 : 1.0,
            ),
            left: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: 1.0,
            ),
            right: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: isSelected ? 3.0 : 1.0,
              
            ),
          ),
          borderRadius: isSelected
          ? const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          :  BorderRadius.only(
              topLeft:  Radius.circular(firstTab?10:0),
              topRight: Radius.circular(lastTap?10:0),
            ),
          color: isSelected
              ? const DigitColors().white
              : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              
              text,
              style: TextStyle(
                color: isSelected
                    ? const DigitColors().black
                    : const DigitColors().cloudGray,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}