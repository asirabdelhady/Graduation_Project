import 'package:flutter/material.dart';
import 'package:tour_guide_app/search/search_bar.dart';
import 'package:tour_guide_app/search/search_results.dart';

import 'data_model.dart';
import 'firestore_search.dart';

class SearchFeed extends StatefulWidget {
  const SearchFeed({Key? key}) : super(key: key);

  @override
  _SearchFeedState createState() => _SearchFeedState();
}

class _SearchFeedState extends State<SearchFeed> {
  @override
  Widget build(BuildContext context) {
    return FirestoreSearchScaffold(
      firestoreCollectionName: 'entertainment',
      searchBy: 'document',
      scaffoldBody: Column(
        children: [
          Row(
            children: [
               SizedBox(
                width: 40.0,
              ),
              Expanded(
                  child: FirestoreSearchBar(
                    tag: 'test',
                  )),
              const SizedBox(
                width: 40.0,
              ),
            ],
          ),
          Expanded(
            child: FirestoreSearchResults.builder(
              tag: 'test',
              firestoreCollectionName: 'entertainment',
              searchBy: 'document',
              initialBody: const Center(child: Text('result'),),
              dataListFromSnapshot: DataModel().dataListFromSnapshot,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DataModel>? dataList = snapshot.data;
                  if (dataList!.isEmpty) {
                    return const Center(
                      child: Text('No Results Returned'),
                    );
                  }
                  return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final DataModel data = dataList[index];

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${data.name}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),

                          ],
                        );
                      });
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No Results Returned'),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
      dataListFromSnapshot: DataModel().dataListFromSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DataModel>? dataList = snapshot.data;
          if (dataList!.isEmpty) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
          return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final DataModel data = dataList[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${data.name}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),

                  ],
                );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
