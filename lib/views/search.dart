import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topLeft, children: [
        Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(999.0)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: const Image(
                              image: AssetImage('assets/album1.jpg'),
                              width: 50,
                              height: 50),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Text("Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            )),
                      ],
                    ),
                    const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    )
                  ]),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Search for songs, artists, or podcasts',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 89, 89, 89),
                      fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 16))
          ],
        ),
      ]),
    );
  }
}