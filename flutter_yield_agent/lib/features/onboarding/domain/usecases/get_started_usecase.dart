import 'package:yield_agent/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetStartedUsecase {
  final OnboardingRepository repository;

  GetStartedUsecase({required this.repository});

  Future<bool> call() async {
    return repository.getStarted();
  }
}
