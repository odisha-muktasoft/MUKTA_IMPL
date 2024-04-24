import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/employee/mb/measurement_book.dart';
import 'package:works_shg_app/blocs/employee/work_order/workorder_book.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/utils/employee/support_services.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MyBottomSheet extends StatefulWidget {
  final List<SortObject> dataList;
  final SortType sortType;
  const MyBottomSheet(
      {super.key, required this.dataList, required this.sortType});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              t.translate(i18.measurementBook.sortBy),
              style: DigitTheme.instance.mobileTheme.textTheme.headlineMedium!
                  .copyWith(
                      fontWeight: FontWeight.w100,
                      color: const DigitColors().cloudGray),
            ),
          ),
          const Divider(),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.dataList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    contentPadding: const EdgeInsets.only(left: 16, right: 16),
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      t.translate(widget.dataList[index].name),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineSmall,
                    ),
                    value: widget.dataList[index].number,
                    groupValue: _selectedValue,
                    onChanged: (value) async {
                      setState(() {
                        _selectedValue = value!;
                      });
                      if (widget.sortType == SortType.mbSort) {
                        context.read<MeasurementInboxBloc>().add(
                            MeasurementBookInboxSortBlocEvent(
                                sortCode: value!));
                      } else {
                        context
                            .read<WorkOrderInboxBloc>()
                            .add(WorkOrderInboxSortBlocEvent(sortCode: value!));
                      }

                      await Future.delayed(const Duration(milliseconds: 500),
                          () {
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SortObject {
  final String name;
  final int number;

  SortObject(this.name, this.number);
}
