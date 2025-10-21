part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
}

class Initial extends OnboardingState {
  @override
  List<Object> get props => [];
}

class Loading extends OnboardingState {
  @override
  List<Object?> get props => [];
}

class Successful extends OnboardingState {
  @override
  List<Object?> get props => [];
}

class Failed extends OnboardingState {
  @override
  List<Object?> get props => [];
}
