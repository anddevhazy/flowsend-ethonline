import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yield_agent/features/onboarding/domain/usecases/get_started_usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetStartedUsecase getStartedUsecase;

  OnboardingCubit({required this.getStartedUsecase}) : super(Initial());

  Future<void> getStarted() async {
    emit(Loading());

    try {
      final result = await getStartedUsecase();
      if (result) {
        emit(Successful());
      } else {
        emit(Failed());
      }
    } catch (e) {
      emit(Failed());
    }
  }
}
