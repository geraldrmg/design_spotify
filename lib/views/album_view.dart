import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;

  const AlbumView({Key? key, required this.image}) : super(key: key);
  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    super.initState();
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          imageSize = initialSize - scrollController.offset;
          if (imageSize < 0) {
            imageSize = 0;
          }
          containerHeight = containerinitalHeight - scrollController.offset;
          if (containerHeight < 0) {
            containerHeight = 0;
          }
          imageOpacity = imageSize / initialSize;
          showTopBar = scrollController.offset > 224;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width / 2 - 32;

    return Scaffold(
      body: Stack(
        children: [
          // Header Section (Image)
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 54, 54, 54)
                              .withOpacity(.5),
                          offset: const Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          
          // Content Section (Body)
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed magna bibendum, accumsan nibh non, posuere sapien.",
                                  style: Theme.of(context).textTheme.bodySmall, // Updated style
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Image(
                                      image: AssetImage('assets/album1.jpg'),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Lil Nusnus")
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "69,696 likes  6h 9m",
                                  style: Theme.of(context).textTheme.bodySmall, // Updated style
                                ),
                                const SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite),
                                        SizedBox(width: 16),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // You Might Like Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sed magna bibendum, accumsan nibh non, posuere sapien.",
                        ),
                        const SizedBox(height: 32),
                        Text(
                          "You might also like",
                          style: Theme.of(context).textTheme.titleMedium, // Updated style
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: const AssetImage("assets/album7.jpg"),
                              ),
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: const AssetImage("assets/album5.jpg"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: const AssetImage("assets/album6.jpg"),
                              ),
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: const AssetImage("assets/album9.jpg"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: AssetImage("assets/album10.jpg"),
                              ),
                              AlbumCard(
                                size: cardWidth,
                                label: "Lorem",
                                image: const AssetImage("assets/album4.jpg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // App Bar Section
          Positioned(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              color: showTopBar
                  ? const Color(0xFFC61855).withOpacity(1)
                  : const Color(0xFFC61855).withOpacity(0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SafeArea(
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 38,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        child: Text(
                          "Ophelia",
                          style: Theme.of(context).textTheme.titleMedium, // Updated style
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 80 - containerHeight.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff14D860),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 38,
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.shuffle,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
