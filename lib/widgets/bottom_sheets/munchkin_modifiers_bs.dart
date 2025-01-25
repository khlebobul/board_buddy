import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

class MunchkinModifiersBottomSheet extends StatelessWidget {
  const MunchkinModifiersBottomSheet({super.key});

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
                child: TextScramble(
                  text: S.of(context).close,
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ModifierGroup(
                  title: categories[index].title,
                  options: categories[index].options,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ModifierGroup extends StatefulWidget {
  final String title;
  final List<String> options;

  const ModifierGroup({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  State<ModifierGroup> createState() => _ModifierGroupState();
}

class _ModifierGroupState extends State<ModifierGroup> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: theme.display2.copyWith(
              color: theme.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: widget.options.map((option) {
              final isSelected = _selectedOption == option;
              return RawChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedOption = selected ? option : null;
                  });
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
  final List<String> options;

  const ModifiersCategory({
    required this.title,
    required this.options,
  });
}

List<ModifiersCategory> getCategories(BuildContext context) {
  return [
    ModifiersCategory(
      title: S.of(context).race1,
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
      title: 'race 2',
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
      title: S.of(context).class1,
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
      title: S.of(context).class2,
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
      title: S.of(context).leftHand,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: S.of(context).twoHanded,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: S.of(context).rightHand,
      options: [
        S.of(context).noItem,
        S.of(context).sword,
        S.of(context).bigSword
      ],
    ),
    ModifiersCategory(
      title: S.of(context).firstBonus,
      options: [
        S.of(context).noItem,
        S.of(context).magic,
        S.of(context).bigMagic
      ],
    ),
    ModifiersCategory(
      title: S.of(context).secondBonus,
      options: [
        S.of(context).noItem,
        S.of(context).magic,
        S.of(context).bigMagic
      ],
    ),
    ModifiersCategory(
      title: S.of(context).headGear,
      options: [
        S.of(context).noItem,
        S.of(context).helmet,
        S.of(context).bigHelmet
      ],
    ),
    ModifiersCategory(
      title: S.of(context).armour,
      options: [
        S.of(context).noItem,
        S.of(context).armour,
        S.of(context).bigArmour
      ],
    ),
    ModifiersCategory(
      title: S.of(context).boots,
      options: [
        S.of(context).noItem,
        S.of(context).boots,
        S.of(context).bigBoots
      ],
    ),
  ];
}
