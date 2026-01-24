import 'package:board_buddy/features/games/catan/models/catan_resource.dart';

class CatanTile {
  final CatanResource resource;
  final int? number;

  CatanTile({
    required this.resource,
    this.number,
  });
}
