import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sentezel/settings/business_profile/business_profile_repository.dart';

final businessProfileControllerProvider = StateNotifierProvider<
    BusinessProfileController,
    AsyncValue<BusinessProfile>>((ref) => BusinessProfileController(ref.read));

class BusinessProfileController
    extends StateNotifier<AsyncValue<BusinessProfile>> {
  final Reader _read;

  BusinessProfileController(this._read) : super(const AsyncLoading());

  loadData() async {
    final result = await _read(businessProfileRepository).get();
    state = AsyncData(result);
  }

  set(BusinessProfile payload) async {
    _read(businessProfileRepository).add(payload);
  }
}
