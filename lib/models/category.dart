part of 'models.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String slug;

  Category({this.id, this.name, this.slug});

  @override
  List<Object> get props => [
        id,
        name,
        slug,
      ];
}

List<Category> mockCategory = [
  Category(id: 1, name: "Makeup Photoshoot", slug: "makeup_photoshoot"),
  Category(id: 2, name: "Makeup Pernikahan", slug: "makeup_pernikahan"),
];
