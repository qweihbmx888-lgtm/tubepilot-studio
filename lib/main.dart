
import 'package:flutter/material.dart';

void main() {
  runApp(const TubePilotApp());
}

const Color backgroundColor = Color(0xFF090A10);
const Color panelColor = Color(0xFF141621);
const Color accentRed = Color(0xFFFF365D);
const Color accentPurple = Color(0xFF8B5CF6);
const Color accentBlue = Color(0xFF3987FF);

class TubePilotApp extends StatelessWidget {
  const TubePilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TubePilot Studio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.dark(
          primary: accentRed,
          surface: panelColor,
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const StudioHome(),
    );
  }
}

class StudioHome extends StatefulWidget {
  const StudioHome({super.key});

  @override
  State<StudioHome> createState() => _StudioHomeState();
}

class _StudioHomeState extends State<StudioHome> {
  int selectedIndex = 0;

  final List<String> titles = [
    'Dashboard',
    'Analytics',
    'Video Studio',
    'AI Assistant',
    'Competitors',
    'Settings',
  ];

  final List<IconData> icons = [
    Icons.dashboard_rounded,
    Icons.insights_rounded,
    Icons.video_library_rounded,
    Icons.auto_awesome_rounded,
    Icons.travel_explore_rounded,
    Icons.settings_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [accentRed, accentPurple],
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'TubePilot',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const Text(
              ' Studio',
              style: TextStyle(
                color: accentRed,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: selectedIndex == 0
            ? dashboard()
            : sectionPage(titles[selectedIndex], icons[selectedIndex]),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panelColor,
        indicatorColor: accentRed.withValues(alpha: 0.18),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_rounded),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_library_rounded),
            label: 'Studio',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'AI Tools',
          ),
        ],
      ),
    );
  }

  Widget dashboard() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
      children: [
        const Text(
          'CREATOR WORKSPACE',
          style: TextStyle(
            color: accentPurple,
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your channel,\\nyour growth.',
          style: TextStyle(
            fontSize: 30,
            height: 1.15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Everything you need to create, understand and improve your content.',
          style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF54234D), Color(0xFF25234E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'TUBEPILOT AI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Make your next video better.',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              const Text(
                'Get ideas, improve titles and plan your next upload.',
                style: TextStyle(color: Colors.white70, height: 1.4),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: accentRed,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => setState(() => selectedIndex = 3),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Explore AI tools'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'QUICK ACCESS',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white54,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 13),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.35,
          children: [
            quickCard(
              'Analytics',
              'Understand your channel',
              Icons.insights_rounded,
              accentBlue,
              1,
            ),
            quickCard(
              'Video Studio',
              'Create and edit videos',
              Icons.movie_creation_outlined,
              accentRed,
              2,
            ),
            quickCard(
              'AI Assistant',
              'Ideas, titles and scripts',
              Icons.auto_awesome,
              accentPurple,
              3,
            ),
            quickCard(
              'Competitors',
              'Explore public channels',
              Icons.query_stats_rounded,
              const Color(0xFF20BFA9),
              4,
            ),
          ],
        ),
        const SizedBox(height: 25),
        const Text(
          'CHANNEL OVERVIEW',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white54,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: panelColor,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.white10),
          ),
          child: const Column(
            children: [
              Icon(Icons.link_rounded, size: 30, color: accentPurple),
              SizedBox(height: 10),
              Text(
                'Connect your YouTube channel',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                'Channel statistics will appear here after a secure connection is implemented.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget quickCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    int page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: () => setState(() => selectedIndex = page),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 25),
            const SizedBox(height: 11),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionPage(String title, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 54, color: accentPurple),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This workspace is being built. Real features and data connections will be added in the next development steps.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, height: 1.6),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => setState(() => selectedIndex = 0),
              child: const Text('Back to dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
