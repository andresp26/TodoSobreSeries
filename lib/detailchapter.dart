import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';
import 'dart:ui';

class DetailChapter extends StatelessWidget {
  var data;

  DetailChapter({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
        centerTitle: true,
      ),
      body: _layoudDetails(context),
    );
  }

  Widget detailSeason(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 500,
            width: 400  ,
            child: new Column(
              children: <Widget>[
                Icon(
                  Icons.timer,
                ),
                Text(
                  'Duracion Capitulo: ' + data['duracion'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.live_tv),
                Text('Capitulo: ' + data['capitulo1'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.details),
                Expanded(
                  child: Text(
                    data['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  Widget detailSeasonLand(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Row(children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 500,
                width: MediaQuery.of(context).size.width / 2,
                child: new Column(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                    ),
                    Text(
                      'Duracion Capitulo: ' + data['duracion'],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Icon(Icons.live_tv),
                    Text('Capitulo: ' + data['capitulo1'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 8,
                    ),
                    Icon(Icons.details),
                    Expanded(
                      child: Text(
                        data['description'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _layoudDetails(context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          FadeAnimation(1, _picture(context)),
          detailSeason(context),
        ],
      ));
    } else {
      return Row(
        children: <Widget>[
          FadeAnimation(1, _pictureLandScape(context)),
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: MediaQuery.of(context).size.height,
            child: detailSeasonLand(context),
          )
        ],
      );
    }
  }

  Widget _picture(context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.cover, image: AssetImage(data['thumbnail'])),
        ),
        child: Center(
          child:
              Icon(Icons.play_circle_outline, size: 150, color: Colors.white),
        ),
      );

  Widget _pictureLandScape(context) => Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.cover, image: AssetImage(data['thumbnail'])),
        ),
      );
}
