import '../library.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final menuItems = [
      {'title': S.of(context).about, 'route': '/about'},
      {'title': S.of(context).games, 'route': '/games'},
      {'title': S.of(context).rules, 'route': '/rules'},
      {'title': S.of(context).settings, 'route': '/settings'},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BubbleField(
              backgroundColor: AppColors.background,
              circleColor: AppColors.secondaryText.withOpacity(0.3),
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
                      style: textTheme.displayMedium,
                    ),
                    const Spacer(),
                    ...menuItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: GestureDetector(
                          onTap: () => _navigateTo(context, item['route']!),
                          child: TextScramble(
                            text: item['title']!,
                            style: textTheme.displayLarge,
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
