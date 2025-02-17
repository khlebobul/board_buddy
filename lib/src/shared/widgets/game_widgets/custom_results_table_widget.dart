import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// widget that represents a results table for players.
class ResultsTableWidget extends StatelessWidget {
  /// List of player data, including names and scores.
  final List<Map<String, dynamic>> playersData;
  const ResultsTableWidget({
    this.playersData = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.borderColor, width: 1),
              borderRadius: BorderRadius.circular(20),
              color: theme.fgColor,
            ),
            child: DataTable(
              dividerThickness: 0,
              border: TableBorder.symmetric(
                inside: BorderSide(color: theme.borderColor, width: 1),
              ),
              columns: [
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        S.of(context).name,
                        style: theme.display2.copyWith(color: theme.redColor),
                      ),
                    ),
                  ),
                ),
                for (int i = 1; i <= 5; i++)
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          '${S.of(context).round} $i',
                          style: theme.display2.copyWith(color: theme.redColor),
                        ),
                      ),
                    ),
                  ),
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        S.of(context).total,
                        style: theme.display2.copyWith(color: theme.redColor),
                      ),
                    ),
                  ),
                ),
              ],
              rows: playersData.map((player) {
                final scores = player['scores'] as List<int>;
                final totalScore = scores.reduce((a, b) => a + b);
                return DataRow(
                  cells: [
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          player['name'] as String,
                          style: theme.display2,
                        ),
                      ),
                    ),
                    ...scores.map(
                      (score) => DataCell(
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            score.toString(),
                            style: theme.display2,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          totalScore.toString(),
                          style: theme.display2,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
