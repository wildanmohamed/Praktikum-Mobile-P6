import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

final List<Map<String, String>> barang = [
  {
    'nama': 'Laptop',
    'foto':
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500',
  },
  {
    'nama': 'HP',
    'foto':
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
  },
  {
    'nama': 'Tablet',
    'foto': 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500',
  },
  {
    'nama': 'Keyboard',
    'foto':
        'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500',
  },
  {
    'nama': 'Mouse',
    'foto':
        'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500',
  },
  {
    'nama': 'Monitor',
    'foto':
        'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 6'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('ListView'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('GridView'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: barang.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              barang[index]['foto']!,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(barang[index]['nama']!),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    nama: barang[index]['nama']!,
                    foto: barang[index]['foto']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: barang.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      nama: barang[index]['nama']!,
                      foto: barang[index]['foto']!,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      barang[index]['foto']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      barang[index]['nama']!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String nama;
  final String foto;

  const DetailPage({super.key, required this.nama, required this.foto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(foto, width: 250, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              nama,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
