import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Function onTap;
  BookItem(this.onTap);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// `Book Image`

                  Expanded(
                    child: Image.network(
                      "https://rethinkpress.com/wp-content/uploads/2016/04/9781781331880.jpg",
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// `Book Name`

                      AutoSizeText(
                        "Book Name",
                        softWrap: true,
                        wrapWords: true,
                        maxLines: 2,
                        maxFontSize: 16,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),

                      /// `Author Name`

                      AutoSizeText(
                        "Author Name",
                        maxLines: 2,
                        maxFontSize: 16,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /// `Rating`

                          Row(
                            children: <Widget>[
                              Text("4.6"),
                              Icon(
                                Icons.star,
                                size: 20.0,
                              ),
                            ],
                          ),

                          /// `Price`

                          Text("\$60"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
