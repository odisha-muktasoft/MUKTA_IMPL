// import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/error/wager_seeker_attendance_error_model.dart';
import 'package:works_shg_app/utils/common_methods.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

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
                          Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.left,
                ))
          ],
        )));
  }

  static Widget downloadButton(String label, void Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 8.0),
      // child: TextButton.icon(
      //     onPressed: onPressed,
      //     icon: Icon(
      //       Icons.download_sharp,
      //       color: const DigitColors().burningOrange,
      //     ),
      //     label: Text(
      //       label,
      //       style: TextStyle(color: const DigitColors().burningOrange,),
      //     )),

      child: Button(
        prefixIcon: Icons.download_sharp,
        mainAxisSize: MainAxisSize.min,
        type: ButtonType.tertiary,
        size: ButtonSize.large,
        label: label,
        onPressed: onPressed!,
      ),
    );
  }

  static Widget getWageseekerErrorList(
      List<DuplicateWageSeeker> listWageseekers, BuildContext context) {
    final t = AppLocalizations.of(context);
    return Popup(
      type: PopUpType.alert,
      title: t.translate(i18.attendanceMgmt.attendanceAlert),
      description: t.translate(i18.attendanceMgmt.sameDayAttendanceError),
      additionalWidgets: [
        DigitTable(
            columns: [
              DigitTableColumn(
                cellValue: 'first',
                header: t.translate(i18.attendanceMgmt.individualID),
                type: ColumnType.text,
                //columnType: ColumnType.checkbox,
              ),
              DigitTableColumn(
                header: t.translate(i18.attendanceMgmt.name),
                cellValue: 'second',
                // isFrozen: true,
                type: ColumnType.text,
                //columnType: ColumnType.text,
              ),
              DigitTableColumn(
                cellValue: 'third',
                header: t.translate(i18.common.date),
                type: ColumnType.text,
                //columnType: ColumnType.numeric,
              ),
            ],
            rows: List.generate(
                listWageseekers.length,
                (index) => DigitTableRow(
                      tableRow: [
                        DigitTableData(
                            listWageseekers[index].individualId.toString(),
                            cellKey: "first"),
                        DigitTableData(listWageseekers[index].name.toString(),
                            cellKey: "second"),
                        DigitTableData(
                            DateFormat('dd/MM/yyyy')
                                .format(DateTime.parse(
                                    listWageseekers[index].date.toString()))
                                .toString(),
                            cellKey: "third"),
                      ],
                    )).toList()),
      ],
      actions: [
        Button(
            label: AppLocalizations.of(context).translate(i18.common.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
            type: ButtonType.primary,
            size: ButtonSize.large)
      ],
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
