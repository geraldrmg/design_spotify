import 'package:flutter/material.dart';
import '../views/album_view.dart';
import '/widgets/album_card.dart';
import '/widgets/song_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 0, 0),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent",
                            style: Theme.of(context).textTheme.titleLarge,  // Updated style
                          ),
                          Row(
                            children: const [
                              Icon(Icons.history),
                              SizedBox(width: 16),
                              Icon(Icons.settings),
                              SizedBox(width: 16),
                              Icon(Icons.camera_alt),
                            ],
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: const [
                          AlbumCard(
                            label: "Beast Mode",
                            image: AssetImage("assets/album5.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Beast Mode",
                            image: AssetImage("assets/album4.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top 50",
                            image: AssetImage("assets/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Gaming",
                            image: AssetImage("assets/album1.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top songs",
                            image: AssetImage("assets/album9.jpg"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Good Evening, Gerrald",
                            style: Theme.of(context).textTheme.titleMedium,  // Updated style
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              RowAlbumCard(
                                label: "Best Mode",
                                image: AssetImage("assets/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Top 50",
                                image: AssetImage("assets/top50.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              RowAlbumCard(
                                label: "Rap",
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Eminem Musics",
                                image: AssetImage("assets/album5.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              RowAlbumCard(
                                label: "Top 50 - Indonesia",
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Rock Mix",
                                image: AssetImage("assets/album10.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Based on your recent listening",
                            style: Theme.of(context).textTheme.titleLarge,  // Updated style
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: const [
                              SongCard(
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album6.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Recommended",
                            style: Theme.of(context).textTheme.titleLarge,  // Updated style
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: const [
                              SongCard(
                                image: AssetImage("assets/album8.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album6.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album3.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album10.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }
}
