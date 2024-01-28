class CategoryModel {
  final String value;
  final String name;

  CategoryModel({
    required this.name,
    required this.value,
  });

  @override
  String toString() => name;
}
