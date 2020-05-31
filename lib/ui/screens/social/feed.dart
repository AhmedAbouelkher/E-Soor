import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

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

final defaultInitialReaction = Reaction(
  previewIcon: _buildPreviewIconFacebook('assets/images/like.gif'),
  icon: _buildIconFacebook(
    'assets/images/like.png',
    Text(
      'Like',
      style: TextStyle(
        color: Colors.grey[600],
      ),
    ),
  ),
);

final facebookReactions = [
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/like.gif'),
    icon: _buildIconFacebook(
      'assets/images/like.png',
      Text(
        'Like',
        style: TextStyle(
          color: Color(0XFF3b5998),
        ),
      ),
    ),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/love.gif'),
    icon: _buildIconFacebook(
      'assets/images/love.png',
      Text(
        'Love',
        style: TextStyle(
          color: Color(0XFFed5168),
        ),
      ),
    ),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/wow.gif'),
    icon: _buildIconFacebook(
      'assets/images/wow.png',
      Text(
        'Wow',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/haha.gif'),
    icon: _buildIconFacebook(
      'assets/images/haha.png',
      Text(
        'Haha',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/sad.gif'),
    icon: _buildIconFacebook(
      'assets/images/sad.png',
      Text(
        'Sad',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    previewIcon: _buildPreviewIconFacebook('assets/images/angry.gif'),
    icon: _buildIconFacebook(
      'assets/images/angry.png',
      Text(
        'Angry',
        style: TextStyle(
          color: Color(0XFFf05766),
        ),
      ),
    ),
  ),
];

Widget _buildPreviewIconFacebook(String path) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
    child: Image.asset(path, height: 40),
  );
}

Widget _buildIconFacebook(String path, Text text) {
  return Container(
    color: Colors.transparent,
    child: Row(
      children: <Widget>[
        Image.asset(path, height: 20),
        SizedBox(
          width: 5,
        ),
        text,
      ],
    ),
  );
}

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
                      // TODO: FB Reactions
                      // FlutterReactionButtonCheck(
                      //   onReactionChanged:
                      //       (reaction, selectedIndex, isChecked) {
                      //     audioPlayer.play(sounds[1]);
                      //     print('reaction changed at $selectedIndex');
                      //   },
                      //   reactions: facebookReactions,
                      //   initialReaction: defaultInitialReaction,
                      // ),
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
