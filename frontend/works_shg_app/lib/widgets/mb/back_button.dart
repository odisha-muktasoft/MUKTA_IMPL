import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class IconBackButton extends StatelessWidget {
  final VoidCallback? action;
  final Color iconTextColor;
  final Color iconColor;
  final IconData icon;
  
  const IconBackButton({super.key, this.action, required this.iconTextColor, required this.iconColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return DigitIconButton(
      iconTextColor: iconTextColor,
      iconColor: iconColor,
      icon: icon,
      iconText:
          AppLocalizations.of(context).translate(i18.common.back) ?? 'Back',
      onPressed: action,
    );
  }
}
