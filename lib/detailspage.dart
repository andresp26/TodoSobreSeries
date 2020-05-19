import 'package:flutter/material.dart';
import 'package:flutterapp/detailchapter.dart';
import 'Animation/FadeAnimation.dart';
import 'data.dart';
import 'dart:ui';

class DetailsPage extends StatelessWidget {
  final String data;

  DetailsPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle ' + SeriesData().series[data]['title'].toString()),
        centerTitle: true,
      ),
      body: _layoudDetails(context),
    );
  }

  Widget _picture(context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(SeriesData().series[data]['thumbnail'])),
        ),
      );

  Widget _pictureLandScape(context) => Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(SeriesData().series[data]['thumbnail'])),
        ),
      );

  Widget detailSeason(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              SeriesData().series[data]['title'],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 15,
          width: double.infinity,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            Text(
              SeriesData().series[data]['match'],
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.green.withGreen(200),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 20),
            Text(
              SeriesData().series[data]['year'] +
                  '  16+' +
                  (SeriesData().series[data]['movie'] == 'true'
                      ? '  1h 52min'
                      : ''),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Flexible(
                child: new Text(
                  SeriesData().series[data]['description'],
                  style: new TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Flexible(
                child: new Text(
                  'Starring : ' + SeriesData().series[data]['starring'],
                  style: new TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 80,
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              SizedBox(width: 80),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                  Text(
                    'Me gusta',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                  Text(
                    'Compartir',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          height: 1,
        ),
        Divider(
          color: Colors.black,
          height: 1,
        ),
        SizedBox(
          height: 2,
          width: double.infinity,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  child: Container(
                    color: Colors.red,
                    height: 2,
                    width: 80,
                  ),
                  height: 2.0,
                ),
                Text(
                  'Episodios',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 10,
        ),
        SeriesData().series[data]['movie'] == 'false'
            ? FlatButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(100),
                      borderRadius: BorderRadius.circular(5)),
                  width: 120,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Temporada 1',
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: 10,
              ),
        SizedBox(
          height: 10,
        ),
        episodeBlock('1.' + SeriesData().series[data]['capitulo1'], context),
        episodeBlock('2.' + SeriesData().series[data]['capitulo2'], context),
        episodeBlock('3.' + SeriesData().series[data]['capitulo3'], context)
      ],
    );
  }

  Widget _layoudDetails(context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          FadeAnimation(1.5, _picture(context)),
          detailSeason(context),
        ],
      ));
    } else {
      return Row(
        children: <Widget>[
          FadeAnimation(1.5, _pictureLandScape(context)),
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: MediaQuery.of(context).size.height,
            child: detailSeasonLandScape(context),
          )
        ],
      );
    }
  }

  Widget detailSeasonLandScape(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text(
                SeriesData().series[data]['title'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text(
                SeriesData().series[data]['match'],
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.green.withGreen(200),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 50),
              Text(
                SeriesData().series[data]['year'] +
                    '  16+' +
                    (SeriesData().series[data]['movie'] == 'true'
                        ? '  1h 52min'
                        : ''),
                style: TextStyle(
                    fontSize: 15,
                    
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
            width: 50,
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                Flexible(
                  child: new Text(
                    SeriesData().series[data]['description'],
                    style: new TextStyle(
                      fontSize: 12,                      
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                Flexible(
                  child: new Text(
                    'Starring : ' + SeriesData().series[data]['starring'],
                    style: new TextStyle(
                      fontSize: 13,                      
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 80,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                SizedBox(width: 80),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    Text(
                      'Me gusta',
                      style: TextStyle( fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                    Text(
                      'Compartir',
                      style: TextStyle( fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            height: 1,
          ),
          Divider(
            color: Colors.black,
            height: 1,
          ),
          SizedBox(
            height: 2,
            width: 5,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    child: Container(
                      color: Colors.red,
                      height: 20,
                      width: 80,
                    ),
                    height: 2,
                  ),
                  Text(
                    'Episodios',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 10,
          ),
            FlatButton(
                  onPressed: () {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: BorderRadius.circular(5)),
                    width: 150,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Temporada 1',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        )
                      ],
                    ),
                  ),
                )
              ,
          SizedBox(
            height: 20,
          ),
          episodeBlockLandscape(
              '1.' + SeriesData().series[data]['capitulo1'], context),
          episodeBlockLandscape(
              '2.' + SeriesData().series[data]['capitulo2'], context),
          episodeBlockLandscape(
              '3.' + SeriesData().series[data]['capitulo3'], context)
        ],
      ),
    );
  }

  Container episodeBlock(epTitle, context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              SeriesData().series[data]['thumbnail'],
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black, BlendMode.softLight))),
                    width: 100,
                    height: 60,
                    child: GestureDetector(
                      child: Center(
                        child: Icon(Icons.play_circle_outline,
                            size: 35, color: Colors.white),
                      ),
                      onTap: () {
                        print(data);
                        print(SeriesData().detalleseries[data]);
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastLinearToSlowEaseIn);
                                return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                    alignment: Alignment.center);
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return DetailChapter(
                                    data: SeriesData().detalleseries[data]);
                              },
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2,
                    child: Container(width: 60, color: Colors.red),
                  )
                ],
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    epTitle,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.timer),
                  Text(
                    '54 min',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Flexible(
            child: Text(
              SeriesData().series[data]['description'],
              style: TextStyle(fontSize: 11),
            ),
          ),
          Divider(
            height: 40,
            thickness: 4,
          )
        ],
      ),
    );
  }

  Container episodeBlockLandscape(epTitle, context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: ListView(children: <Widget>[
                      GestureDetector(                        
                        onTap: () {
                          Navigator.push(
                            context,
                           PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastLinearToSlowEaseIn);
                                return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                    alignment: Alignment.center);
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return DetailChapter(
                                    data: SeriesData().detalleseries[data]);
                              },
                            )
                          );
                        },
                        child: Container(
                          child: Image.asset(
                              SeriesData().series[data]['thumbnail']),
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          width: 100.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    SeriesData().series[data]['thumbnail'],
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black, BlendMode.softLight))),
                        ),
                      ),
                    ]),
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    epTitle,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.timer),
                  Text(
                    '54 min',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Flexible(
            child: Text(
              SeriesData().series[data]['description'],
              style: TextStyle( fontSize: 11),
            ),
          ),
          Divider(color: Colors.black, height: 40)
        ],
      ),
    );
  }
}
