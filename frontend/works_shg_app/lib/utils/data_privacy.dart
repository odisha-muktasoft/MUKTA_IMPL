import 'package:works_shg_app/models/attendance/individual_list_model.dart';
import 'package:works_shg_app/models/muster_rolls/estimate_muster_roll_model.dart';

class DataPrivacy {
  ///
  ///
  ///  muster-roll/v1/estimate
  static EstimateMusterRollsModel updateIndividualEntriesAdditionalDetails(
    EstimateMusterRollsModel musterRollsModel,
    List<IndividualModel> individualList,
  ) {
    // Create a map for faster lookup by individualId
    var individualMap = {
      for (var individual in individualList) individual.id: individual,
    };

    // Create updated muster rolls
    var updatedMusterRolls = musterRollsModel.musterRoll?.map((musterRoll) {
      // Create updated individual entries for this muster roll
      var updatedEntries = musterRoll.individualEntries?.map((entry) {
        // Find the matching individual
        var matchingIndividual = individualMap[entry.individualId];

        if (matchingIndividual != null) {
          // Update only specific fields in additionalDetails
          return entry.copyWith(
            musterIndividualAdditionalDetails:
                entry.musterIndividualAdditionalDetails?.copyWith(
                      userName: matchingIndividual.name?.givenName,
                      fatherName: matchingIndividual.fatherName,
                      gender: matchingIndividual.gender,
                    ) ??
                    EstimateMusterIndividualAdditionalDetails(
                      userName: matchingIndividual.name?.givenName,
                      fatherName: matchingIndividual.fatherName,
                      gender: matchingIndividual.gender,
                    ),
          );
        }
        return entry; // Return the entry as-is if no match
      }).toList();

      // Return the updated muster roll
      return musterRoll.copyWith(individualEntries: updatedEntries);
    }).toList();

    // Return updated EstimateMusterRollsModel
    return musterRollsModel.copyWith(musterRoll: updatedMusterRolls);
  }

  ///
  ///  service to create list of individual ids from given object
  ///
  static List<String> extractIndividualIds(
      EstimateMusterRollsModel musterRollsModel) {
    return musterRollsModel.musterRoll
            ?.map((musterRoll) => musterRoll.individualEntries)
            .where((entries) =>
                entries != null) // Filter out null individualEntries
            .expand(
                (entries) => entries!) // Flatten the list of individualEntries
            .map((entry) => entry.musterIndividualAdditionalDetails?.userId!)
            .where((id) => id != null) // Filter out null individualIds
            .cast<String>() // Ensure the list contains only non-null Strings
            .toList() ??
        [];
  }
}
