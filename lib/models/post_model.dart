import 'package:E_Soor/services/api.dart';

class Post {
  final OldUser author;
  final String time;
  final String text;
  final bool isLiked;
  final int totalReacts;
  final int shares;
  final bool isShared;
  final int likeReacts;
  final int wowReacts;
  final int angryReacts;
  final int loveReacts;
  final int hahaReacts;
  final int sadReacts;
  final List comments;

  Post(this.author, this.time, this.text,
      {this.isLiked,
      this.totalReacts,
      this.shares,
      this.isShared,
      this.likeReacts,
      this.wowReacts,
      this.angryReacts,
      this.loveReacts,
      this.hahaReacts,
      this.sadReacts,
      this.comments});
}
