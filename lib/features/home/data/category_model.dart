class CategoryModel {
  final String id;
  final String name;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

const List<CategoryModel> categories = [
  CategoryModel(
    id: 'cleansers',
    name: 'Cleansers',
    image: 'assets/images/cleanser.png',
  ),
  CategoryModel(
    id: 'moisturizers',
    name: 'Moisturizers',
    image: 'assets/images/moisturizer.png',
  ),
  CategoryModel(
    id: 'serums',
    name: 'Serums',
    image: 'assets/images/serum.png',
  ),
  CategoryModel(
    id: 'sunscreen',
    name: 'Sunscreen',
    image: 'assets/images/sunscreen.png',
  ),
  CategoryModel(
    id: 'hair_care',
    name: 'Hair Care',
    image: 'assets/images/hair_care.png',
  ),
];