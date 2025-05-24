import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';

class TicketToRideStartScreen extends StatelessWidget {
  const TicketToRideStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S.of(context).ticketToRide),
    );
  }
}