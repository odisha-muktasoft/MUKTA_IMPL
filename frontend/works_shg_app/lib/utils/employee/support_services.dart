import 'package:flutter/material.dart';
import 'package:works_shg_app/widgets/mb/radio_button_sheet.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

enum SortType { mbSort, woSort }

class Conversion {
  static final sortMB = [
    SortObject(i18.common.slaDaysRemaining, 0),
    SortObject(i18.measurementBook.workFlowState, 1),
    SortObject(i18.measurementBook.amountLowToHigh, 2),
    SortObject(i18.measurementBook.amountHighToLow, 3),
  ];
  static final sortWorkOrder = [
    SortObject(i18.common.endDate, 0),
    SortObject(i18.common.startDate, 1),
    SortObject(i18.common.issuedDate, 2),
    SortObject(i18.measurementBook.amountLowToHigh, 5),
    SortObject(i18.measurementBook.amountHighToLow, 3),
    SortObject(i18.measurementBook.cboName, 4),
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

  static void openSortingModal(BuildContext context,
      {required List<SortObject> listData, required SortType sortType}) {
    showModalBottomSheet(
      builder: (BuildContext context) {
        return SizedBox(
          height: (listData.length * 80),
          width: MediaQuery.of(context).size.width,
          child: MyBottomSheet(
                      dataList: listData,
                      sortType: sortType,
                    ),
        );
      },
      context: context,
    );
  }
}
