import 'package:board_buddy/utils/library.dart';

class PlayerIndicator extends StatelessWidget {
  final String letter;
  final bool isActive;

  const PlayerIndicator({
    required this.letter,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Center(
      child: Text(
        letter.toLowerCase(),
        style: theme.display6.copyWith(
          color: isActive ? theme.textColor : theme.secondaryTextColor,
          letterSpacing: 5.0,
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: players.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final player = entry.value;
//                   final firstLetter =
//                       player['name'].toString().characters.first;

//                   return PlayerIndicator(
//                     letter: firstLetter,
//                     isActive: index == 0,
//                   );
//                 }).toList(),
//               ),
//             ),
