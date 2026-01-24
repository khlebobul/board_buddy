import 'dart:ui';
import 'package:board_buddy/config/theme/app_colors.dart';

enum CatanResource {
  wood,
  brick,
  wheat,
  sheep,
  ore,
  desert,
}

extension CatanResourceColor on CatanResource {
  Color get color {
    switch (this) {
      case CatanResource.wood:
        return CatanResourceColors.wood;
      case CatanResource.brick:
        return CatanResourceColors.brick;
      case CatanResource.wheat:
        return CatanResourceColors.wheat;
      case CatanResource.sheep:
        return CatanResourceColors.sheep;
      case CatanResource.ore:
        return CatanResourceColors.ore;
      case CatanResource.desert:
        return CatanResourceColors.desert;
    }
  }
}
