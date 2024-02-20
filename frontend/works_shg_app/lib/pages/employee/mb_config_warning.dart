import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/router/app_router.dart';

import '../../utils/common_methods.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class MBTypeConfirmationPage extends StatefulWidget {
  const MBTypeConfirmationPage({super.key});

  @override
  State<MBTypeConfirmationPage> createState() => _MBTypeConfirmationPageState();
}

class _MBTypeConfirmationPageState extends State<MBTypeConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const DigitColors().white,
      appBar: AppBar(
        titleSpacing: 0,
        title: const AppBarLogo(),
      ),
      drawer: DrawerWrapper(
        Drawer(
          child: SideBar(
            module: CommonMethods.getLocaleModules(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScrollableContent(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          footer: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: DigitOutLineButton(
                    label: "Cancel",
                    onPressed: () {
                      context.router.pop();
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DigitElevatedButton(
                    child: const Text("Forward"),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route is HomeRoute);
                      context.router.push(const HomeRoute());
                    },
                  ),
                )
              ],
            ),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Submit & Forward",
                    style:
                        DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            DigitDropdown(
              onChanged: (value) {},
              value: null,
              label: "Assignee name",
              menuItems: const ["MUKTAUAT", "AE-Engineer", "Executive-engineer"],
              valueMapper: (value) {
                return value.toString();
              },
            ),
            const DigitTextField(label: "Comments",
            maxLines: 6,
            ),
            
          ],
        ),
      ),
    );
  }
}
