import 'package:flutter/material.dart';
import 'package:works_shg_app/widgets/mb/radio_button_sheet.dart';

enum SortType{mbSort,woSort}
class Conversion {
  static final sortMB = [
    SortObject("SlaDaysRemaining", 0),
    SortObject("WorkFlowState", 1),
    SortObject("Amount - - LowToHigh", 2),
    SortObject("Amount - - HighToLow", 3),
  ];
  static final sortWorkOrder = [
    SortObject("End Date", 0),
    SortObject("Start Date", 1),
    SortObject("Issued Date", 2),
    SortObject("Work Value", 3),
    SortObject("CBO Name", 4),
  ];

  static String convertToTenant(String input) {
    List<String> parts = input.split('.');
    String result =
        "TENANT_TENANTS_${parts.map((part) => part.toUpperCase()).join('_')}";
    return result;
  }

  static String splitTenant(String input) {
    List<String> parts = input.split('.');
    String result = parts.map((part) => part.toUpperCase()).join('_');
    return result;
  }

  static void openSortingModal(BuildContext context, {required List<SortObject>listData, required SortType sortType}) {
    showModalBottomSheet(
      builder: (BuildContext context) {
        return SizedBox(
          height: (listData.length*80),
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: MyBottomSheet(
            dataList: listData, sortType: sortType,
          )),
        );
      },
      context: context,
    );
  }
}
