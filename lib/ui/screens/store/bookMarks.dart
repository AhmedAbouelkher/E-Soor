import 'package:flutter/material.dart';
import 'package:E_Soor/ui/widgets/bookItem.dart';

class BookMarks extends StatefulWidget {
  @override
  _BookMarksState createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  /// the List tht hols the Saved Book Items
  /*List <Widget> items = [
    BookItem((){}),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Book Marks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: () {
              dismissAlert(context);
            },
            child: BookItem(
              () {},
            ),
          );
        },
      ),
    );
  }
}

void dismissAlert(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Delete Book Item"),
    content: Text("Are you sure you want to delete book item?"),
    actions: <Widget>[
      FlatButton(
        child: Text("Yes"),
        onPressed: () {},
      ),
      FlatButton(
        child: Text("No"),
        onPressed: () {
          /*Navigator.pop(context);*/
        },
      )
    ],
  );
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
