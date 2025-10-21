import 'package:yield_agent/features/onboarding/data/data_sources/remote/onboarding_remote_data_source.dart';
import 'package:yield_agent/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;

  OnboardingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> getStarted() {
    remoteDataSource.getStarted();
    throw UnimplementedError();
  }
}
