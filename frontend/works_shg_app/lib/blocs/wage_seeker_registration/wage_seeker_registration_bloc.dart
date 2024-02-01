import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/models/wage_seeker/financial_details_model.dart';
import 'package:works_shg_app/models/wage_seeker/individual_details_model.dart';
import 'package:works_shg_app/models/wage_seeker/location_details_model.dart';
import 'package:works_shg_app/models/wage_seeker/skill_details_model.dart';

part 'wage_seeker_registration_bloc.freezed.dart';

typedef WageSeekerBlocEmitter = Emitter<WageSeekerBlocState>;

class WageSeekerBloc extends Bloc<WageSeekerBlocEvent, WageSeekerBlocState> {
  WageSeekerBloc() : super(const WageSeekerBlocState.create()) {
    on<WageSeekerCreateEvent>(_onCreate);
    on<WageSeekerClearEvent>(_onClear);

    on<WageSeekerIdentificationCreateEvent>(_onIdentificationCreate);

    on<WageSeekerDetailsCreateEvent>(_onDetailsCreate);

    on<WageSeekerSkillCreateEvent>(_onSkillCreate);

    on<WageSeekerPhotoCreateEvent>(_onPhotoCreate);
  }

  FutureOr<void> _onPhotoCreate(
      WageSeekerPhotoCreateEvent event, WageSeekerBlocEmitter emit) async {
    state.maybeMap(
      orElse: () => {},
      create: (value) {
        emit(
          value.copyWith(
            individualDetails: value.individualDetails!.copyWith(
              photo: event.photo,
              imageFile: event.imageFile,
              bytes: event.bytes,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _onSkillCreate(
      WageSeekerSkillCreateEvent event, WageSeekerBlocEmitter emit) async {
    state.maybeMap(
      orElse: () => {},
      create: (value) {
        emit(value.copyWith(
          skillDetails: event.skillDetails,
        ));
      },
    );
  }

  FutureOr<void> _onIdentificationCreate(
      WageSeekerIdentificationCreateEvent event,
      WageSeekerBlocEmitter emit) async {
    emit(WageSeekerBlocState.create(
      individualDetails: IndividualDetails(
        aadhaarNo: event.number,
        name: event.name,
        documentType: event.documentType,
        adharVerified: event.adharVerified,
      ),
    ));
  }

  FutureOr<void> _onDetailsCreate(
      WageSeekerDetailsCreateEvent event, WageSeekerBlocEmitter emit) async {
    state.maybeMap(
      orElse: () => {},
      create: (value) {
        emit(value.copyWith(
            individualDetails: value.individualDetails!.copyWith(
          dateOfBirth: event.dob,
          gender: event.gender,
          fatherName: event.fatherName,
          relationship: event.relationShip,
          socialCategory: event.socialCategory,
          mobileNumber: event.mobileNumber,
        )));
      },
    );
  }

  FutureOr<void> _onCreate(
      WageSeekerCreateEvent event, WageSeekerBlocEmitter emit) async {
    emit(WageSeekerBlocState.create(
        individualDetails: event.individualDetails,
        locationDetails: event.locationDetails,
        skillDetails: event.skillDetails,
        financialDetails: event.financialDetails));
  }

  FutureOr<void> _onClear(
      WageSeekerClearEvent event, WageSeekerBlocEmitter emit) async {
    emit(WageSeekerBlocState.clear(
        individualDetails: IndividualDetails(),
        locationDetails: LocationDetails(),
        skillDetails: SkillDetails(),
        financialDetails: FinancialDetails()));
  }
}

@freezed
class WageSeekerBlocEvent with _$WageSeekerBlocEvent {
  const factory WageSeekerBlocEvent.create(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails}) = WageSeekerCreateEvent;

  const factory WageSeekerBlocEvent.identificationCreate({
    required String documentType,
    required String number,
    required String name,
    required bool adharVerified,
    required int timeStamp,
  }) = WageSeekerIdentificationCreateEvent;

  const factory WageSeekerBlocEvent.detailsCreate(
      {required String fatherName,
      required DateTime dob,
      required String relationShip,
      required String gender,
      required String socialCategory,
      required String mobileNumber}) = WageSeekerDetailsCreateEvent;

  const factory WageSeekerBlocEvent.skillCreate({
    required SkillDetails skillDetails,
  }) = WageSeekerSkillCreateEvent;

  const factory WageSeekerBlocEvent.photoCreate({
    File? imageFile,
    Uint8List? bytes,
    String? photo,
  }) = WageSeekerPhotoCreateEvent;

  const factory WageSeekerBlocEvent.clear() = WageSeekerClearEvent;
}

@freezed
class WageSeekerBlocState with _$WageSeekerBlocState {
  const WageSeekerBlocState._();

  const factory WageSeekerBlocState.create(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails}) = _CreateWageSeeker;
  const factory WageSeekerBlocState.clear(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails}) = _EditWageSeeker;
}
