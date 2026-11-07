import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(primary: Color.fromARGB(255, 255, 17, 0)),
      ),
      home: const HomeScreen(),
    );
  }
}

class Movie {
  final String title, genre, img;
  const Movie(this.title, this.genre, this.img);
}

final List<Movie> movies = [
  const Movie(
    'Toy Story 5', 
    'Comedy', 
    'https://lumiere-a.akamaihd.net/v1/images/p_movies_toystory5_nowstreamingdisneyplus_poster_v1_93556266.jpeg'
  ),
  const Movie(
    'Inside Out 2', 
    'Animation', 
    'https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg'
  ),
  const Movie(
    'The Batman', 
    'Crime', 
    'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg'
  ),
  const Movie(
    'Twenty Five Twenty One', 
    'Romance', 
    'https://upload.wikimedia.org/wikipedia/id/1/15/Twenty-Five_Twenty-One.jpg'
  ),
  const Movie(
    'Upin & Ipin', 
    'Animation', 
    'https://m.media-amazon.com/images/M/MV5BNTYyN2E0NjUtZDQ1Mi00YWJhLThhOWEtMTIxZWUwMjFhZTRiXkEyXkFqcGc@._V1_.jpg'
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CINEMAFLIX', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red, letterSpacing: 2)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Now Playing', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 400,
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                final m = movies[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: NetworkImage(m.img), fit: BoxFit.cover),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(12),
                  child: Text(m.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, backgroundColor: Colors.black54)),
                );
              },
            ),
          ),
          const SizedBox(height: 35),
          const Text('Recomended For You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final m = movies[index];
                return Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(m.img, fit: BoxFit.cover, width: double.infinity),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(m.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                      Text(m.genre, style: const TextStyle(color: Color.fromARGB(255, 117, 117, 117), fontSize: 10)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}