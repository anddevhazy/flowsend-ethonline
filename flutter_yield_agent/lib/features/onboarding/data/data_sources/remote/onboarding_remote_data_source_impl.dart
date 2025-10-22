import 'package:yield_agent/features/onboarding/data/data_sources/remote/onboarding_remote_data_source.dart';

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  OnboardingRemoteDataSourceImpl();

  @override
  Future<bool> getStarted() async {
    await Future.delayed(Duration(seconds: 4));
    return true;
  }
}
