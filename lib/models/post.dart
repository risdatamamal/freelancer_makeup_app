part of 'models.dart';

class Post extends Equatable {
  final int id;
  final User user;
  final List<Category> category;
  final String name;
  final String thumbnail;
  final double rate;
  final int price;
  final String desc;

  Post(
      {this.id,
      this.user,
      this.category,
      this.name,
      this.thumbnail,
      this.rate,
      this.price,
      this.desc});

  @override
  List<Object> get props => [
        id,
        user,
        category,
        name,
        thumbnail,
        rate,
        price,
        desc,
      ];
}

List<Post> mockPosts = [
  Post(
    id: 1,
    user: mockUser,
    name: "Sarah Farasya",
    category: [mockCategory[0], mockCategory[1]],
    thumbnail:
        "https://img-z.okeinfo.net/library/images/2018/10/16/2dd5m2shk3mu7cwjb23w_18722.jpg",
    rate: 4.2,
    price: 18000,
    desc:
        "Kopi Tubruk adalah minuman kopi khas Indonesia yang dibuat dengan menuangkan air panas ke dalam gelas atau teko yang sudah diisi bubuk kopi. Bisa dengan ditambahkan gula, bisa juga tanpa gula. Di Bali, Kopi Tubruk dikenal dengan nama “Kopi Selem” yang artinya kopi hitam.",
  ),
  Post(
    id: 2,
    user: mockUser,
    name: "Sarah Farasya 2",
    category: [mockCategory[0]],
    thumbnail:
        "https://img-z.okeinfo.net/library/images/2018/10/16/2dd5m2shk3mu7cwjb23w_18722.jpg",
    rate: 4.2,
    price: 18000,
    desc:
        "Kopi Tubruk adalah minuman kopi khas Indonesia yang dibuat dengan menuangkan air panas ke dalam gelas atau teko yang sudah diisi bubuk kopi. Bisa dengan ditambahkan gula, bisa juga tanpa gula. Di Bali, Kopi Tubruk dikenal dengan nama “Kopi Selem” yang artinya kopi hitam.",
  ),
];
