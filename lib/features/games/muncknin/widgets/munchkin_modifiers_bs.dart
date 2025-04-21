import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:flutter/material.dart';

/// widget that represents a bottom sheet for Munchkin modifiers.
class MunchkinModifiersBottomSheet extends StatefulWidget {
  final int playerIndex;
  final Player player;
  final Function(int playerIndex, String modifierType, String? value)
      onModifierUpdated;

  const MunchkinModifiersBottomSheet({
    super.key,
    required this.playerIndex,
    required this.player,
    required this.onModifierUpdated,
  });

  @override
  State<MunchkinModifiersBottomSheet> createState() =>
      _MunchkinModifiersBottomSheetState();
}

class _MunchkinModifiersBottomSheetState
    extends State<MunchkinModifiersBottomSheet> {
  late PlayerModifiers _localModifiers;

  @override
  void initState() {
    super.initState();
    _localModifiers = PlayerModifiers(
      race1: widget.player.modifiers.race1,
      race2: widget.player.modifiers.race2,
      class1: widget.player.modifiers.class1,
      class2: widget.player.modifiers.class2,
      leftHand: widget.player.modifiers.leftHand,
      twoHanded: widget.player.modifiers.twoHanded,
      rightHand: widget.player.modifiers.rightHand,
      firstBonus: widget.player.modifiers.firstBonus,
      secondBonus: widget.player.modifiers.secondBonus,
      headGear: widget.player.modifiers.headGear,
      armour: widget.player.modifiers.armour,
      boots: widget.player.modifiers.boots,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final height = MediaQuery.of(context).size.height;
    final categories = getCategories(context);

    return Container(
      height: height * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.bgColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).modifiers,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: theme.secondaryTextColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.bgColor.withValues(alpha: 0.0),
                    theme.bgColor.withValues(alpha: 1.0),
                    theme.bgColor.withValues(alpha: 1.0),
                    theme.bgColor.withValues(alpha: 0.0),
                  ],
                  stops: const [0.0, 0.05, 0.95, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: ListView.builder(
                itemCount: categories.length,
                clipBehavior: Clip.hardEdge,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  String? selectedOption;

                  switch (category.title) {
                    case 'race1':
                      selectedOption = _localModifiers.race1;
                      break;
                    case 'race2':
                      selectedOption = _localModifiers.race2;
                      break;
                    case 'class1':
                      selectedOption = _localModifiers.class1;
                      break;
                    case 'class2':
                      selectedOption = _localModifiers.class2;
                      break;
                    case 'leftHand':
                      selectedOption = _localModifiers.leftHand;
                      break;
                    case 'twoHanded':
                      selectedOption = _localModifiers.twoHanded;
                      break;
                    case 'rightHand':
                      selectedOption = _localModifiers.rightHand;
                      break;
                    case 'firstBonus':
                      selectedOption = _localModifiers.firstBonus;
                      break;
                    case 'secondBonus':
                      selectedOption = _localModifiers.secondBonus;
                      break;
                    case 'headGear':
                      selectedOption = _localModifiers.headGear;
                      break;
                    case 'armour':
                      selectedOption = _localModifiers.armour;
                      break;
                    case 'boots':
                      selectedOption = _localModifiers.boots;
                      break;
                  }

                  return ModifierGroup(
                    title: category.titleText,
                    options: category.options,
                    selectedOption: selectedOption,
                    onOptionSelected: (option) {
                      setState(() {
                        switch (category.title) {
                          case 'race1':
                            _localModifiers =
                                _localModifiers.copyWith(race1: option);
                            break;
                          case 'race2':
                            _localModifiers =
                                _localModifiers.copyWith(race2: option);
                            break;
                          case 'class1':
                            _localModifiers =
                                _localModifiers.copyWith(class1: option);
                            break;
                          case 'class2':
                            _localModifiers =
                                _localModifiers.copyWith(class2: option);
                            break;
                          case 'leftHand':
                            _localModifiers =
                                _localModifiers.copyWith(leftHand: option);
                            break;
                          case 'twoHanded':
                            _localModifiers =
                                _localModifiers.copyWith(twoHanded: option);
                            break;
                          case 'rightHand':
                            _localModifiers =
                                _localModifiers.copyWith(rightHand: option);
                            break;
                          case 'firstBonus':
                            _localModifiers =
                                _localModifiers.copyWith(firstBonus: option);
                            break;
                          case 'secondBonus':
                            _localModifiers =
                                _localModifiers.copyWith(secondBonus: option);
                            break;
                          case 'headGear':
                            _localModifiers =
                                _localModifiers.copyWith(headGear: option);
                            break;
                          case 'armour':
                            _localModifiers =
                                _localModifiers.copyWith(armour: option);
                            break;
                          case 'boots':
                            _localModifiers =
                                _localModifiers.copyWith(boots: option);
                            break;
                        }
                      });

                      widget.onModifierUpdated(
                          widget.playerIndex, category.title, option);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// widget that represents a group of modifiers.
class ModifierGroup extends StatelessWidget {
  /// Title of the modifier group.
  final String title;

  /// List of options for the modifier group.
  final List<String> options;

  /// Currently selected option
  final String? selectedOption;

  /// Callback when an option is selected
  final Function(String?) onOptionSelected;

  const ModifierGroup({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.display2.copyWith(
              color: theme.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: options.map((option) {
              final isSelected = selectedOption == option;
              return RawChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  onOptionSelected(selected ? option : null);
                },
                selectedColor: theme.bgColor,
                visualDensity: VisualDensity.comfortable,
                elevation: 0,
                showCheckmark: false,
                side: BorderSide(
                  color: isSelected ? theme.redColor : theme.textColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelStyle: TextStyle(
                  color: isSelected ? theme.redColor : theme.textColor,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ModifiersCategory {
  final String title;
  final String titleText;
  final List<String> options;

  const ModifiersCategory({
    required this.title,
    required this.titleText,
    required this.options,
  });
}

List<ModifiersCategory> getCategories(BuildContext context) {
  return [
    ModifiersCategory(
      title: 'race1',
      titleText: S.of(context).race1,
      options: [
        S.of(context).dwarf,
        S.of(context).elf,
        S.of(context).halfling,
        S.of(context).halfBreed,
        S.of(context).human,
        S.of(context).secondRace
      ],
    ),
    ModifiersCategory(
      title: 'race2',
      titleText: S.of(context).secondRace,
      options: [
        S.of(context).dwarf,
        S.of(context).elf,
        S.of(context).halfling,
        S.of(context).halfBreed,
        S.of(context).human,
        S.of(context).secondRace
      ],
    ),
    ModifiersCategory(
      title: 'class1',
      titleText: S.of(context).class1,
      options: [
        S.of(context).cleric,
        S.of(context).thief,
        S.of(context).warrior,
        S.of(context).wizard,
        S.of(context).superMunch,
        S.of(context).noClass
      ],
    ),
    ModifiersCategory(
      title: 'class2',
      titleText: S.of(context).class2,
      options: [
        S.of(context).cleric,
        S.of(context).thief,
        S.of(context).warrior,
        S.of(context).wizard,
        S.of(context).superMunch,
        S.of(context).noClass
      ],
    ),
    ModifiersCategory(
      title: 'leftHand',
      titleText: S.of(context).leftHand,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: 'twoHanded',
      titleText: S.of(context).twoHanded,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: 'rightHand',
      titleText: S.of(context).rightHand,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: 'firstBonus',
      titleText: S.of(context).firstBonus,
      options: [
        S.of(context).noItem,
        S.of(context).magic,
        S.of(context).bigMagic
      ],
    ),
    ModifiersCategory(
      title: 'secondBonus',
      titleText: S.of(context).secondBonus,
      options: [
        S.of(context).noItem,
        S.of(context).magic,
        S.of(context).bigMagic
      ],
    ),
    ModifiersCategory(
      title: 'headGear',
      titleText: S.of(context).headGear,
      options: [
        S.of(context).noItem,
        S.of(context).helmet,
        S.of(context).bigHelmet
      ],
    ),
    ModifiersCategory(
      title: 'armour',
      titleText: S.of(context).armour,
      options: [
        S.of(context).noItem,
        S.of(context).armour,
        S.of(context).bigArmour
      ],
    ),
    ModifiersCategory(
      title: 'boots',
      titleText: S.of(context).boots,
      options: [
        S.of(context).noItem,
        S.of(context).boots,
        S.of(context).bigBoots
      ],
    ),
  ];
}
