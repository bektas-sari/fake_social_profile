import 'package:flutter/material.dart';

void main() {
  runApp(const SocialProfileApp());
}

class SocialProfileApp extends StatelessWidget {
  const SocialProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Social Profile',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String profileImage = 'https://i.pravatar.cc/150?img=5';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile'), centerTitle: true),
        body: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(profileImage),
            ),
            const SizedBox(height: 12),
            const Text(
              'Jane Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('@janedoe', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Flutter Developer | Coffee Lover ☕ | Cat Person 🐱',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatBox(label: 'Posts', value: '120'),
                _StatBox(label: 'Followers', value: '3.5K'),
                _StatBox(label: 'Following', value: '180'),
              ],
            ),
            const SizedBox(height: 16),
            const TabBar(
              indicatorColor: Colors.purple,
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.bookmark_border)),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  _PostGrid(),
                  Center(child: Text('No saved posts yet.')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _PostGrid extends StatelessWidget {
  const _PostGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/200?random=$index'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
