import '../utils/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    final menuItems = [
      {'title': S.of(context).games, 'route': '/games'},
      {'title': S.of(context).rules, 'route': '/rules'},
      {'title': S.of(context).about, 'route': '/about'},
      {'title': S.of(context).settings, 'route': '/settings'},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BubbleField(
              backgroundColor: theme.bgColor,
              circleColor: theme.secondaryTextColor.withOpacity(0.3),
              padding: 3,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 12),
                    TextScramble(
                      text: S.of(context).boardBuddy,
                      style: theme.display1.copyWith(color: theme.redColor),
                    ),
                    const Spacer(),
                    ...menuItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: GestureDetector(
                          onTap: () => _navigateTo(context, item['route']!),
                          child: TextScramble(
                            text: item['title']!,
                            style: theme.display1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
