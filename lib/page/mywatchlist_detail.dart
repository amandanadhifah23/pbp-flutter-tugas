import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:intl/intl.dart';


class MyWatchListDetail extends StatefulWidget {
  final Mywatchlist watchList;
  const MyWatchListDetail({
    Key? key,
    required this.watchList,
  }) : super(key: key);

  @override
  State<MyWatchListDetail> createState() => _MyWatchListDetailState();
}

class _MyWatchListDetailState extends State<MyWatchListDetail>{
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Wacth Item Detail'),
          elevation: 0,
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.watchList.fields.movieName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                      const Text('Release Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(DateFormat.yMMMMd('en_US')
                      .format(widget.watchList.fields.movieDate)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${widget.watchList.fields.movieRating}/5')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Status: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.watchList.fields.watchedMovie == "Done"
                                  ? 'watched'
                                  : 'not watched',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Review: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      widget.watchList.fields.movieReview,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      );
}