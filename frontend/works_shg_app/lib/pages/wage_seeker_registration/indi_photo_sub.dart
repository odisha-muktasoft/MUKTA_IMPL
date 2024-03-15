import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../blocs/localization/app_localization.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/file_store/file_store_model.dart';
import '../../utils/models/file_picker_data.dart';
import '../../widgets/molecules/file_picker.dart';

class IndividualPhotoSubPage extends StatefulWidget {
  final String? photo;
  final Function(int page) onPageChanged;
  const IndividualPhotoSubPage({
    super.key,
    required this.onPageChanged,
    required this.photo,
  });

  @override
  State<IndividualPhotoSubPage> createState() => _IndividualPhotoSubPageState();
}

class _IndividualPhotoSubPageState extends State<IndividualPhotoSubPage> {
  String? photo;

  @override
  void initState() {
    FilePickerData.imageFile = null;
    FilePickerData.bytes = null;
    photo = widget.photo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                 
                  t.translate(i18.wageSeeker.individualPhotoHeader),
                  style: DigitTheme.instance.mobileTheme.textTheme.displayMedium
                      ?.apply(color: const DigitColors().black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(children: [
                  SHGFilePicker(
                    callBack: (List<FileStoreModel>? fileStore) {
                      if (fileStore != null && fileStore.isNotEmpty) {
                        // setState(() {
                        photo = fileStore.first.fileStoreId;
                        // });
                      } else {
                        // setState(() {
                        photo = '';
                        // });
                      }
                    },
                    extensions: const ['jpg', 'png', 'jpeg'],
                    moduleName: 'works',
                    label: t.translate(i18.common.photoGraph),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ]),
                Center(
                  child: DigitElevatedButton(
                      onPressed: () {
                        context.read<WageSeekerBloc>().add(
                              WageSeekerPhotoCreateEvent(
                                imageFile: FilePickerData.imageFile?.first,
                                bytes: FilePickerData.bytes?.first,
                                photo: photo,
                              ),
                            );

                        widget.onPageChanged(4);
                      },
                      child: Center(
                        child: Text(t.translate(i18.common.next)),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
