// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

// import '../data/schema/localization.dart';

// class ISARConfig {
//   late Future<Isar> _isar;
  
//   static final ISARConfig _instance = ISARConfig._();
//   ISARConfig._() {
//     _isar = openIsar();
//   }
//   factory ISARConfig() {
//     return _instance;
//   }
  
//   Future<Isar> get isar {
//     return _isar;
//   }

//   Future<Isar> openIsar() async {
//     if (Isar.instanceNames.isEmpty) {
//       final directory = await getApplicationDocumentsDirectory();

//       return await Isar.open(
//         [
//           LocalizationWrapperSchema,
//         ],
//         inspector: true,
//         directory: directory.path,
//       );
//     } else {
//       return await Future.value(Isar.getInstance());
//     }

//   }

//   }