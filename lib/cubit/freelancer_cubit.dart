import 'package:bloc/bloc.dart';
import 'package:freelancer_makup_app/models/models.dart';
import 'package:freelancer_makup_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'freelancer_state.dart';

class FreelancerCubit extends Cubit<FreelancerState> {
  FreelancerCubit() : super(FreelancerInitial());

  Future<void> getFreelancers() async {
    ApiReturnValue<List<Freelancer>> result =
        await FreelancerServices.getFreelancers();

    if (result.value != null) {
      emit(FreelancerLoaded(result.value));
    } else {
      emit(FreelancerLoadingFailed(result.message));
    }
  }
}
