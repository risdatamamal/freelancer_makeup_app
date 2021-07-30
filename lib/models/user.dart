part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String level;
  // final Status status;
  final String email;
  final String image;
  final String phone;
  final String gender;
  final String address;
  final String city;

  User(
      {this.id,
      this.name,
      this.level,
      // this.status,
      this.email,
      this.image,
      this.phone,
      this.gender,
      this.address,
      this.city});

  @override
  List<Object> get props => [
        id,
        name,
        level,
        email,
        image,
        gender,
        address,
        phone,
        city,
      ];
}

User mockUser = User(
  id: 1,
  name: "TomTom",
  level: "Bronze",
  email: "tomtom@gmail.com",
  image:
      "https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg",
  gender: "Laki-Laki",
  address: "jalanjalan kita kemedan",
  phone: "087262876762",
  city: "Jakarta",
);
