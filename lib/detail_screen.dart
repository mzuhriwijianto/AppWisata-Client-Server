import 'package:flutter/material.dart';
import 'package:flutterlayout/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);
  final ListData place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Image.network(place.tourismImg),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.tourismName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35, fontFamily: "Lobster"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(Icons.calendar_today_outlined),
                    Text(
                      place.tourismOpenDays,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.access_time_outlined),
                    Text(
                      place.tourismWorkingHours,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.attach_money),
                    Text(
                      place.tourismTicketPrice.toString(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              place.tourismDescription,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: "Oxygen"),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(place.tourismImgList[index]),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: place.tourismImgList.length,
            ),
          )
        ],
      ),
    );
  }
}
