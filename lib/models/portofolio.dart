part of 'models.dart';

class Portofolio extends Equatable {
  final int id;
  final User user;
  final String desc;
  final String image;

  Portofolio({this.id, this.user, this.desc, this.image});

  @override
  List<Object> get props => [
        id,
        user,
        desc,
        image,
      ];
}

List<Portofolio> mockPortofolios = [
  Portofolio(
      id: 1,
      user: mockUser,
      desc: "Test 1 ini adalah deskripsi",
      image:
          "https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg"),
  Portofolio(
      id: 2,
      user: mockUser,
      desc: "Test 2 ini adalah deskripsi",
      image:
          "https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg"),
];
