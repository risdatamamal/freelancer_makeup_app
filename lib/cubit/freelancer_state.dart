part of 'freelancer_cubit.dart';

abstract class FreelancerState extends Equatable {
  const FreelancerState();

  @override
  List<Object> get props => [];
}

class FreelancerInitial extends FreelancerState {}

class FreelancerLoaded extends FreelancerState {
  final List<Freelancer> freelancers;

  FreelancerLoaded(this.freelancers);

  @override
  List<Object> get props => [freelancers];
}

class FreelancerLoadingFailed extends FreelancerState {
  final String message;

  FreelancerLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
