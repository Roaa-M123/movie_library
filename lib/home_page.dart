import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListView = true;
  bool isSearchFieldVisible = true;
  String inputSearch = "";
  int varNum=120;

  @override
  Widget build(BuildContext context) {
    onTapFunc(){
      setState(() {
        varNum=varNum-1;
      });

    }

    final newFilteredSearch =
    movieList.where((movie) {
      return movie.title.replaceAll(" ", "").toLowerCase().contains(inputSearch.replaceAll(" ", "").toLowerCase()) ||
          movie.genre.toLowerCase().contains(inputSearch.toLowerCase());
    }).toList();
    //because where return iterable
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text(
          "Movie Library",
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.movie, size: 25, color: Theme.of(context).cardColor, weight: 20),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchFieldVisible = !isSearchFieldVisible;
              });
            },
            icon: Icon(
              isSearchFieldVisible ? Icons.search_outlined : Icons.close,
              color: Theme.of(context).cardColor,
              size: 25,
              weight: 10,
            ),
            style: IconButton.styleFrom(foregroundColor: Colors.transparent),
          ),
          IconButton(
            style: IconButton.styleFrom(foregroundColor: Colors.transparent),
            onPressed: () {
              isListView = !isListView;
              setState(() {});
            },
            icon: isListView
                ? Icon(Icons.list, color: Theme.of(context).cardColor, size: 25, weight: 10)
                : Icon(
                    Icons.grid_view,
                    color: Theme.of(context).cardColor,
                    size: 25,
                    weight: 10,
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (isSearchFieldVisible == false)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    inputSearch = value;
                  });
                },
                decoration: InputDecoration(
                  enabled: true,
                  hintText: 'Search movies...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.pinkAccent[100]!),
                  ),
                ),
              ),
            ),
          Expanded(
            child:newFilteredSearch.isEmpty?Center(child: Lottie.asset("assets/movie_assets/noresult.json",width: 400,height: 400)): isListView
                ? ListView.separated(
                    itemBuilder: (context, index) =>
                        MovieCard(movie: newFilteredSearch[index], varNum: varNum, onTapFunc: onTapFunc,),
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemCount: newFilteredSearch.length,
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      childAspectRatio: 0.4,
                    ),
                    itemBuilder: (context, index) =>
                        MovieCard(movie: newFilteredSearch[index], varNum: varNum, onTapFunc: onTapFunc,),
                    itemCount: newFilteredSearch.length,
                  ),
          ),
        ],
      ),
    );
  }
}
