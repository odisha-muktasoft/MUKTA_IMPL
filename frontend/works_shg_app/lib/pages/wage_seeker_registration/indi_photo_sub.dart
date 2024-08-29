import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_card;
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
          ui_card.DigitCard(
            cardType: CardType.primary,
            margin: const EdgeInsets.all(8),
            children: [
              TextChunk(
                heading: t.translate(i18.wageSeeker.individualPhotoHeader),
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
                child: Button(
                    type: ButtonType.primary,
                    size: ButtonSize.large,
                    mainAxisSize: MainAxisSize.max,
                    onPressed: () {
                      context.read<WageSeekerBloc>().add(
                            WageSeekerPhotoCreateEvent(
                              imageFile: FilePickerData.imageFile,
                              bytes: FilePickerData.bytes,
                              photo: photo,
                            ),
                          );

                      widget.onPageChanged(4);
                    },
                    label: t.translate(i18.common.next)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
