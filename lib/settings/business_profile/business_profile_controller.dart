import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sentezel/settings/business_profile/business_profile_repository.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

final businessProfileControllerProvider = StateNotifierProvider<
        BusinessProfileController, AsyncValue<BusinessProfile>>(
    (ref) => BusinessProfileController(ref.read)..loadData());

class BusinessProfileController
    extends StateNotifier<AsyncValue<BusinessProfile>> {
  final Reader _read;

  BusinessProfileController(this._read) : super(const AsyncLoading());

  loadData() async {
    final result = await _read(businessProfileRepository).get();
    state = AsyncData(result);
  }

  set name(String value) {
    state = AsyncData(
      state.data!.value.copyWith(name: value),
    );
  }

  set description(String value) {
    state = AsyncData(
      state.data!.value.copyWith(description: value),
    );
  }

  set type(BusinessType value) {
    state = AsyncData(
      state.data!.value.copyWith(type: value),
    );
  }

  set(BusinessProfile payload) async {
    _read(businessProfileRepository).add(payload);
  }
}
