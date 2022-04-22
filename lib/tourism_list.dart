import 'package:flutter/material.dart';
import 'package:flutterlayout/api/api_service.dart';
import 'package:flutterlayout/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';
import 'list_item.dart';
import 'model/tourism_place.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismList createState() => _TourismList();
}

class _TourismList extends State<TourismList> {
  late Future<TourismResult> _tourismResult;

  @override
  void initState(){
    super.initState();
    _tourismResult=ApiService().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tourismResult,
      builder: (context, AsyncSnapshot<TourismResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var place = snapshot.data?.listData[index];

                  final List<ListData> doneTourismPlaceList =
                      Provider.of<DoneTourismProvider>(context, listen: false)
                          .doneTourismPlaceList;

                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              place: place!,
                            );
                          }));
                    },
                    child: Consumer<DoneTourismProvider>(
                      builder: (context, DoneTourismProvider data, widget) {
                        return ListItem(
                          place: place!,
                          isDone: doneTourismPlaceList.contains(place),
                          onCheckBoxClick: (bool? value) {
                            setState(() {
                              if (value != null) {
                                value
                                    ? doneTourismPlaceList.add(place)
                                    : doneTourismPlaceList.remove(place);
                              }
                            });
                          },
                        );
                      },
                    ),
                  );
                },
                itemCount: snapshot.data?.listData.length);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: Text('Data Masih Kosong !'),
            );
          }
        }
      },
    );
  }
}
