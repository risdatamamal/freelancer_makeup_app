part of 'services.dart';

class FreelancerServices {
  static Future<ApiReturnValue<List<Freelancer>>> getFreelancers() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFreelancers);
  }
}
