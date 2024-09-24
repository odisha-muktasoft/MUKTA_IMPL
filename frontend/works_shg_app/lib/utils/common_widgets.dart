import 'package:digit_components/digit_components.dart';
// import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/widgets/atoms/digit_action_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/error/wager_seeker_attendance_error_model.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/utils/models.dart';
import 'package:works_shg_app/widgets/molecules/digit_table.dart'
    as custom_table;
// import 'package:works_shg_app/utils/models.dart';
import 'package:works_shg_app/widgets/molecules/digit_table.dart' as shg_app;

class CommonWidgets {
  static getItemWidget(BuildContext context,
      {String title = '',
      String description = '',
      String subtitle = '',
      Color? descColor}) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: (Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(right: 16),
                width: MediaQuery.of(context).size.width > 720
                    ? MediaQuery.of(context).size.width / 3.5
                    : MediaQuery.of(context).size.width / 3.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      subtitle.trim.toString() != ''
                          ? Text(
                              subtitle,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColorLight),
                            )
                          : const Text('')
                    ])),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: descColor ??
                          DigitTheme.instance.colorScheme.onBackground),
                  textAlign: TextAlign.left,
                ))
          ],
        )));
  }

  static Widget downloadButton(String label, void Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 8.0),
      child: TextButton.icon(
          onPressed: onPressed,
          icon: Icon(
            Icons.download_sharp,
            color: DigitTheme.instance.colorScheme.primary,
          ),
          label: Text(
            label,
            style: TextStyle(color: DigitTheme.instance.colorScheme.primary),
          )),
    );
  }

  static void getWageseekerErrorList(
      List<DuplicateWageSeeker> listWageseekers, BuildContext context) {
    final t = AppLocalizations.of(context);

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text(
    //         t.translate(i18.attendanceMgmt.attendanceAlert),
    //         style: Theme.of(context).textTheme.headlineLarge,
    //       ),
    //       actionsAlignment: MainAxisAlignment.center,
    //       actions: [
    //         DigitElevatedButton(
    //           child: Text(AppLocalizations.of(context).translate(i18.common.close)),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //       content: SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height*0.4,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 8.0),
    //               child: Text(
    //                t.translate(i18.attendanceMgmt.sameDayAttendanceError),
    //                 style: Theme.of(context).textTheme.bodyLarge,
    //                 textAlign: TextAlign.justify,
    //               ),
    //             ),
    //             Expanded(
    //               // Use Expanded to allow dynamic height based on content
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.vertical,
    //                 child: SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: DataTable(

    //                     columns: [
    //                       DataColumn(label: Text(t.translate(i18.attendanceMgmt.individualID),style: Theme.of(context).textTheme.headlineSmall,)),
    //                       DataColumn(label: Text(t.translate(i18.attendanceMgmt.name),style: Theme.of(context).textTheme.headlineSmall,)),
    //                       DataColumn(label: Text(t.translate(i18.common.date),style: Theme.of(context).textTheme.headlineSmall,)),
    //                     ],
    //                     rows: listWageseekers.map((wageSeeker) {
    //                       return DataRow(cells: [
    //                         DataCell(Text(wageSeeker.individualId.toString())),
    //                         DataCell(Text(wageSeeker.name)),
    //                         DataCell(Text(DateFormat('dd/MM/yyyy')
    //                             .format(
    //                                 DateTime.parse(wageSeeker.date.toString()))
    //                             .toString())),
    //                       ]);
    //                     }).toList(),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );

    DigitDialog.show(
      context,
      options: DigitDialogOptions(
        title:  Icon(Icons.warning, size: 40, color: Theme.of(context).colorScheme.error,),
        contentPadding: const EdgeInsets.all(8),
          primaryAction: DigitDialogActions(
            label: AppLocalizations.of(context).translate(i18.common.close),
            action: (context) {
              Navigator.of(context).pop();
            },
          ),
          // title: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     t.translate(i18.attendanceMgmt.attendanceAlert),
          //     style: Theme.of(context).textTheme.headlineLarge,
          //   ),
          // ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0,bottom: 8.0,right: 8.0),
                  child: Text(
                    t.translate(i18.attendanceMgmt.sameDayAttendanceError),
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Expanded(
                  // Use Expanded to allow dynamic height based on content
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                            t.translate(i18.attendanceMgmt.individualID),
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                          DataColumn(
                              label: Text(
                            t.translate(i18.attendanceMgmt.name),
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                          DataColumn(
                              label: Text(
                            t.translate(i18.common.date),
                            style: Theme.of(context).textTheme.headlineSmall,
                          )),
                        ],
                        rows: listWageseekers.map((wageSeeker) {
                          return DataRow(cells: [
                            DataCell(Text(wageSeeker.individualId.toString())),
                            DataCell(Text(wageSeeker.name)),
                            DataCell(Text(DateFormat('dd/MM/yyyy')
                                .format(
                                    DateTime.parse(wageSeeker.date.toString()))
                                .toString())),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                // Expanded(child:   shg_app. DigitTable(headerList: [TableHeader("Individual ID"),TableHeader("Name"),TableHeader("Date")], tableData: [

                // ], leftColumnWidth: 100, rightColumnWidth: 100)),
              ],
            ),
          )),
    );
  }
}
