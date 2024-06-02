class DataModel {
  DataModel({
    required this.id,
    required this.name,
  }) : fav = false;
  final int id;
  final String name;
  bool fav;
}
