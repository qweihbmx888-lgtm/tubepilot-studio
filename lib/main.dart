import 'package:flutter/material.dart';

void main() => runApp(const TubePilotApp());

const bg = Color(0xFF090A10);
const panel = Color(0xFF151824);
const red = Color(0xFFFF365D);
const purple = Color(0xFF8B5CF6);
const blue = Color(0xFF3987FF);

class TubePilotApp extends StatelessWidget {
  const TubePilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TubePilot Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: red,
          brightness: Brightness.dark,
          surface: panel,
        ),
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
  int selected = 0;

  final sections = const [
    ('Dashboard', Icons.dashboard_rounded),
    ('Analytics', Icons.insights_rounded),
    ('Video Studio', Icons.video_library_rounded),
    ('AI Assistant', Icons.auto_awesome_rounded),
    ('Competitors', Icons.travel_explore_rounded),
    ('Settings', Icons.settings_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [red, purple]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text('TubePilot', style: TextStyle(fontWeight: FontWeight.w800)),
            const Text(' Studio', style: TextStyle(color: red, fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => _showNotice(context, 'Notifications will be added in a later build.'),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: selected == 0 ? _dashboard() : _section(sections[selected].$1, sections[selected].$2),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panel,
        selectedIndex: selected < 4 ? selected : 0,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.insights_rounded), label: 'Analytics'),
          NavigationDestination(icon: Icon(Icons.video_library_rounded), label: 'Studio'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_rounded), label: 'AI Tools'),
        ],
      ),
      drawer: NavigationDrawer(
        backgroundColor: panel,
        selectedIndex: selected,
        onDestinationSelected: (i) {
          Navigator.pop(context);
          setState(() => selected = i);
        },
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 28, 16, 18),
            child: Text('WORKSPACE', style: TextStyle(color: purple, letterSpacing: 2, fontWeight: FontWeight.bold)),
          ),
          for (var i = 0; i < sections.length; i++)
            NavigationDrawerDestination(
              icon: Icon(sections[i].$2),
              label: Text(sections[i].$1),
            ),
        ],
      ),
    );
  }

  Widget _dashboard() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('CREATOR WORKSPACE', style: TextStyle(color: purple, letterSpacing: 2, fontSize: 11, fontWeight: FontWeight.bold)),
        const SizedBox(height: 9),
        const Text('Your channel,\\nyour growth.', style: TextStyle(fontSize: 31, height: 1.15, fontWeight: FontWeight.w800)),
        const SizedBox(height: 9),
        const Text('Create, understand and improve your content from one workspace.', style: TextStyle(color: Colors.white60, height: 1.5)),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF54234D), Color(0xFF25234E)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [Icon(Icons.auto_awesome), SizedBox(width: 8), Text('TUBEPILOT AI', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2))]),
            const SizedBox(height: 14),
            const Text('Make your next video better.', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 7),
            const Text('Explore ideas, titles and content planning tools.', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: red),
              onPressed: () => setState(() => selected = 3),
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('Explore AI tools'),
            ),
          ]),
        ),
        const SizedBox(height: 25),
        const Text('QUICK ACCESS', style: TextStyle(color: Colors.white54, letterSpacing: 1.5, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 13),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.28,
          children: [
            _quick('Analytics', 'Channel performance', Icons.insights_rounded, blue, 1),
            _quick('Video Studio', 'Edit and prepare videos', Icons.movie_creation_outlined, red, 2),
            _quick('AI Assistant', 'Ideas, titles and scripts', Icons.auto_awesome, purple, 3),
            _quick('Competitors', 'Explore public channels', Icons.query_stats_rounded, const Color(0xFF20BFA9), 4),
          ],
        ),
        const SizedBox(height: 24),
        const Text('CHANNEL CONNECTION', style: TextStyle(color: Colors.white54, letterSpacing: 1.5, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white10)),
          child: const Column(children: [
            Icon(Icons.link_rounded, size: 32, color: purple),
            SizedBox(height: 10),
            Text('Connect your YouTube channel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 7),
            Text('Secure channel connection and real account statistics will be implemented in a later phase.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, height: 1.5)),
          ]),
        ),
      ],
    );
  }

  Widget _quick(String title, String subtitle, IconData icon, Color color, int page) {
    return InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: () => setState(() => selected = page),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(17), border: Border.all(color: Colors.white10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        ]),
      ),
    );
  }

  Widget _section(String title, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 56, color: purple),
          const SizedBox(height: 18),
          Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('This section is part of the app structure. Its real tools and data connections will be implemented and tested in upcoming development phases.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, height: 1.6)),
          const SizedBox(height: 18),
          OutlinedButton(onPressed: () => setState(() => selected = 0), child: const Text('Back to dashboard')),
        ]),
      ),
    );
  }

  void _showNotice(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
