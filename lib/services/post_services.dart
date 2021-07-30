part of 'services.dart';

class PostServices {
  static Future<ApiReturnValue<List<Post>>> getPosts() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockPosts);
  }
}
