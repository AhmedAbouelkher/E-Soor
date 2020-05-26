import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';
import 'package:audioplayers/audio_cache.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

AudioCache audioPlayer = AudioCache(prefix: 'sounds/');
const sounds = [
  'short_press_like.mp3',
  'icon_choose.mp3',
  'box_up.mp3',
];
bool isChecked = false;
String reaction;
List<ReactiveIconDefinition> _reactions = <ReactiveIconDefinition>[
  ReactiveIconDefinition(
    assetIcon: 'assets/images/like.gif',
    code: 'like',
  ),
  ReactiveIconDefinition(
    assetIcon: 'assets/images/haha.gif',
    code: 'haha',
  ),
  ReactiveIconDefinition(
    assetIcon: 'assets/images/love.gif',
    code: 'love',
  ),
  ReactiveIconDefinition(
    assetIcon: 'assets/images/sad.gif',
    code: 'sad',
  ),
  ReactiveIconDefinition(
    assetIcon: 'assets/images/wow.gif',
    code: 'wow',
  ),
  ReactiveIconDefinition(
    assetIcon: 'assets/images/angry.gif',
    code: 'angry',
  ),
];
int reacts = 0;

class _FeedState extends State<Feed> {
  @override
  void initState() {
    audioPlayer.loadAll(
      sounds,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 5.0,
            ),
            child: Card(
              elevation: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://placekitten.com/400/400"),
                    ),
                    title: Text("Acc Name"),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Acc Type"),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text("Date & Time"),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton<int>(
                      icon: Icon(Icons.more_horiz),
                      onSelected: (value) {
                        // TODO: Switch case for the more button
                        print("value:$value");
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          height: 10,
                          value: 1,
                          child: Chip(
                            avatar: Icon(Icons.report),
                            label: Text("Report"),
                          ),
                        ),
                        PopupMenuItem(
                          height: 10,
                          value: 4,
                          child: Chip(
                            avatar: Icon(Icons.notifications_off),
                            label: Text("Mute"),
                          ),
                        ),
                        PopupMenuItem(
                          child: Chip(
                            avatar: Icon(Icons.bookmark_border),
                            label: Text("Save post"),
                          ),
                        ),
                        PopupMenuItem(
                          child: Chip(
                            avatar: Icon(Icons.link),
                            label: Text("Copy link"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                      "Lorem Hello World",
                      maxLines: 10,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ReactiveButton(
                        padding: EdgeInsets.all(0),
                        containerPadding: 0,
                        iconPadding: 2,
                        iconWidth: 32,
                        child: Container(
                          child: reaction != null
                              ? Image.asset(
                                  'assets/images/$reaction.png',
                                  width: 32.0,
                                  height: 32.0,
                                )
                              : FlatButton(
                                  onPressed: () {},
                                  color: Colors.green,
                                  child: Text("React"),
                                ),
                        ),
                        icons: _reactions,
                        onTap: () {
                          setState(
                            () {
                              audioPlayer.play('short_press_like.mp3');
                              if (reaction == null) {
                                reaction = 'like';
                              } else {
                                reaction = null;
                              }
                            },
                          );
                        },
                        onSelected: (ReactiveIconDefinition button) {
                          setState(
                            () {
                              audioPlayer.play('box_up.mp3');
                              reacts++;
                              audioPlayer.play('icon_choose.mp3');
                              reaction = button.code;
                            },
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Comment"),
                        color: Colors.green,
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("Share"),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Divider(
            indent: 80,
            endIndent: 80,
            thickness: 5,
            color: Colors.red,
          );
        },
        itemCount: 20,
      ),
    );
  }
}
