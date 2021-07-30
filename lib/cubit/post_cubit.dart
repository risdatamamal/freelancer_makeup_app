import 'package:bloc/bloc.dart';
import 'package:freelancer_makup_app/models/models.dart';
import 'package:freelancer_makup_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPosts() async {
    ApiReturnValue<List<Post>> result = await PostServices.getPosts();

    if (result.value != null) {
      emit(PostLoaded(result.value));
    } else {
      emit(PostLoadingFailed(result.message));
    }
  }
}
