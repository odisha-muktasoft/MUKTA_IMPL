import 'dart:io';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/utils/validators/file_validator.dart';
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/atoms/upload_image.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_card;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/data/repositories/core_repo/core_repository.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../blocs/localization/app_localization.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/file_store/file_store_model.dart';
import '../../utils/models/file_picker_data.dart';
import '../../widgets/loaders.dart';

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
    // FilePickerData.imageFile = null;
    // FilePickerData.bytes = null;
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
              // const SizedBox(
              //   height: 16,
              // ),
              Column(children: [
                //old
                // SHGFilePicker(
                //   callBack: (List<FileStoreModel>? fileStore) {
                //     if (fileStore != null && fileStore.isNotEmpty) {
                //       // setState(() {
                //       photo = fileStore.first.fileStoreId;
                //       // });
                //     } else {
                //       // setState(() {
                //       photo = '';
                //       // });
                //     }
                //   },
                //   extensions: const ['jpg', 'png', 'jpeg'],
                //   moduleName: 'works',
                //   label: t.translate(i18.common.photoGraph),
                // ),
                // const SizedBox(
                //   height: 12,
                // ),

                ImageUploader(
                  label:t.translate(i18.common.photoGraph) ,
                  validators: [
                    FileValidator(FileValidatorType.maxSize, 5242880,
                        errorMessage: 'max file size exceeded'),
                  ],
                  initialImages:FilePickerData.imageFile!=null ?[FilePickerData.imageFile!] : [] ,
                  onImagesSelected: (List<File> imageFile) async {
                    // Handle the selected image file here
                    print('Image selected: ${imageFile[0].path}');
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).popUntil(
                      (route) => route is! PopupRoute,
                    );
                    Loaders.showLoadingDialog(context,label: "Uploading...");

                    final List<FileStoreModel> ss =
                        await uploadProfile(imageFile, 'works');

                    if (ss.isNotEmpty) {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).popUntil(
                        (route) => route is! PopupRoute,
                      );
                      photo = ss.first.fileStoreId;
                      FilePickerData.imageFile = imageFile.first;
                      //FilePickerData.bytes=
                    } else {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).popUntil(
                        (route) => route is! PopupRoute,
                      );
                       FilePickerData.imageFile = null;
                      photo = '';
                    }
                  },
                )
              ]),
              Button(
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
                  label: t.translate(i18.common.next))
            ],
          ),
        ],
      ),
    );
  }

  Future<List<FileStoreModel>> uploadProfile(
    List<File> files,
    String moduleName,
  ) async {
    try {
      List<FileStoreModel> ss = [];
      var response =
          await CoreRepository().uploadFiles(files, moduleName.toString());
      ss.addAll(response);

      return ss;
    } catch (e) {
      return [];
    }
  }
}
