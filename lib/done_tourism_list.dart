import 'package:flutter/material.dart';
import 'package:flutterlayout/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

import 'model/tourism_place.dart';

class DoneTourismList extends StatelessWidget {
  const DoneTourismList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListData> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(context, listen: false)
            .doneTourismPlaceList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final ListData place = doneTourismPlaceList[index];
          return Card(
            color: Colors.white54,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(place.tourismImg),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            place.tourismName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 4),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              place.tourismLocation,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.done_outline)
              ],
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}
