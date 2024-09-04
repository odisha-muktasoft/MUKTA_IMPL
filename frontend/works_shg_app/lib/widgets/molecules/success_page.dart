import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/digit_components.dart' as ui_component;
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_card;
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/constants.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/widgets/mb/custom_side_bar.dart';
import 'package:works_shg_app/widgets/new_custom_app_bar.dart';

import '../../utils/common_methods.dart';
import '../atoms/app_bar_logo.dart';
import '../atoms/success_message.dart';
import '../drawer_wrapper.dart';
import '../side_bar.dart';

@RoutePage()
class SuccessResponsePage extends StatelessWidget {
  final String header;
  final String? subHeader;
  final String? subText;
  final String? subTitle;
  final VoidCallback? callBack;
  final VoidCallback? callBackWhatsapp;
  final String? downloadLabel;
  final String? whatsAppLabel;
  final String? printLabel;
  final VoidCallback? callBackDownload;
  final VoidCallback? callBackPrint;
  final bool? backButton;
  final String? buttonLabel;
  final bool isWithoutLogin;
  final String? backButtonLabel;

  const SuccessResponsePage(
      {super.key,
      required this.header,
      this.subHeader,
      this.subText,
      this.subTitle,
      this.callBack,
      this.callBackWhatsapp,
      this.callBackDownload,
      this.callBackPrint,
      this.backButton,
      this.buttonLabel,
      this.isWithoutLogin = false,
      this.downloadLabel,
      this.printLabel,
      this.whatsAppLabel,
      this.backButtonLabel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
        context.router.push(const HomeRoute());
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.all(8.0),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: PoweredByDigit(
              version: Constants.appVersion,
            ),
          ),
        ),
        appBar: isWithoutLogin
            ? AppBar(
                backgroundColor: const Color(0xff0B4B66),
                title: const Text('MuktaSoft'),
                automaticallyImplyLeading: false,
              )
            : customAppBar(),
        drawer: isWithoutLogin
            ? null
            : const MySideBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton == true
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 16, bottom: 16, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackNavigationButton(
                              backButtonText: AppLocalizations.of(context)
                                      .translate(i18.common.back) ??
                                  'Back',
                              handleBack: () =>
                                  context.router.push(const HomeRoute())),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PanelCard(
                  title: header,
                  type: PanelType.success,
                  description: subTitle,
                  actions: [
                    ui_component.Button(
                      type: ButtonType.primary,
                      size: ButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                      onPressed: () {
                        context.router.push(const HomeRoute());
                      },
                      label: buttonLabel ?? '',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
