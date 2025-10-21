import 'package:yield_agent/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:yield_agent/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:yield_agent/features/onboarding/domain/usecases/get_started_usecase.dart';
import 'package:yield_agent/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:yield_agent/main_injection_container.dart';

Future<void> onboardingInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getStartedUsecase: sl.call()),
  );

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetStartedUsecase>(
    () => GetStartedUsecase(repository: sl.call()),
  );

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(remoteDataSource: sl.call()),
  );
}
