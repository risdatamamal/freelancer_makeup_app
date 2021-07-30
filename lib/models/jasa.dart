part of 'models.dart';

class Jasa extends Equatable {
  final int id;
  final User user;
  final Category category;
  final Portofolio portofolio;
  final String name;
  final int price;
  final double rate;

  Jasa({
    this.id,
    this.user,
    this.category,
    this.portofolio,
    this.name,
    this.price,
    this.rate,
  });

  @override
  List<Object> get props => [
        id,
        user,
        category,
        portofolio,
        name,
        price,
        rate,
      ];
}

List<Jasa> mockJasas = [
  Jasa(
      id: 1,
      user: mockUser,
      name: "Makeup Pernikahan",
      portofolio: mockPortofolios[1],
      category: mockCategory[1],
      price: 18000,
      rate: 4.2),
  Jasa(
      id: 2,
      user: mockUser,
      name: "Makeup Pesta",
      portofolio: mockPortofolios[2],
      category: mockCategory[1],
      price: 20000,
      rate: 4.0),
  Jasa(
      id: 3,
      user: mockUser,
      name: "Makeup Photoshoot",
      portofolio: mockPortofolios[2],
      category: mockCategory[1],
      price: 20000,
      rate: 4.0),
];
