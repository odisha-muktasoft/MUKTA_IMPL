import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/localization/app_localization.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/wage_seeker/skill_details_model.dart';
import '../../utils/notifiers.dart';
import '../../widgets/atoms/multiselect_checkbox.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class IndividualSkillSubPage extends StatefulWidget {
  final List<String> relationship;
  final List<String> gender;
  final List<String> socialCategory;
  final List<String> skills;
  final String? photo;
  final Function(int page) onPageChanged;
  final SkillDetails? skillDetails;
  const IndividualSkillSubPage({
    super.key,
    required this.relationship,
    required this.gender,
    required this.photo,
    required this.skills,
    required this.socialCategory,
    required this.onPageChanged,
    required this.skillDetails,
  });

  @override
  State<IndividualSkillSubPage> createState() => _IndividualSkillSubPageState();
}

class _IndividualSkillSubPageState extends State<IndividualSkillSubPage> {
  List<String> selectedOptions = [];

  @override
  void initState() {
    if (widget.skillDetails != null &&
        widget.skillDetails?.individualSkills != null) {
      selectedOptions =
          widget.skillDetails!.individualSkills!.any((a) => a.type == null)
              ? []
              : widget.skillDetails!.individualSkills!
                  .where((e) => e.type != null)
                  .map((e) => '${e.level}.${e.type}')
                  .toList();
    }

    super.initState();
  }

  void _onSelectedOptionsChanged(List<String> options) {
    setState(() {
      selectedOptions = options;
    });
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
                  //  "Individual's Skill Details",
                  t.translate(i18.wageSeeker.individualSkillHeader),
                  style: DigitTheme.instance.mobileTheme.textTheme.displayMedium
                      ?.apply(color: const DigitColors().black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(children: [
                  MultiSelectSearchCheckBox(
                    label: t.translate(i18.attendanceMgmt.skill) + ' *',
                    onChange: _onSelectedOptionsChanged,
                    options: widget.skills,
                    hintText: t.translate(i18.attendanceMgmt.skill),
                    selectedOptions: selectedOptions,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ]),
                Center(
                  child: DigitElevatedButton(
                      onPressed: () {
                        if (!getSkillsValid()) {
                          Notifiers.getToastMessage(context,
                              i18.wageSeeker.selectSkillValidation, 'ERROR');
                        } else if (selectedOptions.isEmpty) {
                          Notifiers.getToastMessage(
                              context, i18.wageSeeker.skillsRequired, 'ERROR');
                        } else {
                          final skillList = SkillDetails(
                              individualSkills: selectedOptions
                                  .map((e) => IndividualSkill(
                                      type: e.toString().split('.').last,
                                      level: e.toString().split('.').first))
                                  .toList());

                          context.read<WageSeekerBloc>().add(
                                WageSeekerSkillCreateEvent(
                                    skillDetails: skillList),
                              );

                          widget.onPageChanged(3);
                        }
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

  bool getSkillsValid() {
    Map<String, int> beforeDotCount = {};
    Map<String, int> afterDotCount = {};

    for (String skill in selectedOptions) {
      List<String> skillParts = skill.split(".");
      String beforeDot = skillParts[0];
      String afterDot = skillParts[1];

      beforeDotCount[beforeDot] = (beforeDotCount[beforeDot] ?? 0) + 1;
      afterDotCount[afterDot] = (afterDotCount[afterDot] ?? 0) + 1;
    }

    // int countBeforeDot =
    //     beforeDotCount.values.where((count) => count > 1).length;
    int countAfterDot = afterDotCount.values.where((count) => count > 1).length;

    if (countAfterDot > 0) {
      return false;
    }
    return true;
  }
}
