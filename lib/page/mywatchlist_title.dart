import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/fetch/mywatchlist_fetch.dart';
import 'package:counter_7/page/mywatchlist_detail.dart';
import 'package:counter_7/page/watchlist_card.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                  children: const [
                    Text(
                      "Tidak ada watchlist :(",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (_, index)=> GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWatchListDetail(
                                  watchList: snapshot.data![index])
                          )
                      );
                    },
                    // child: WatchListItemCard(
                    //   watchList: snapshot.data[index],
                      child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].fields.movie_name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
              );
            }
          }
        },
      )
    );
  }
}
