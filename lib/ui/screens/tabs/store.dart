import 'package:E_Soor/models/category_model.dart';
import 'package:E_Soor/ui/screens/store/book_page.dart';
import 'package:E_Soor/ui/screens/store/categoryScreen.dart';
import 'package:E_Soor/ui/widgets/SlidingPanel.dart';
import 'package:E_Soor/ui/widgets/storeContent.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories = List<Category>.generate(
      5,
      (i) {
        return Category(name: "Category $i");
      },
    );

    return RefreshIndicator(
      displacement: 10,
      onRefresh: () {
        return;
      },
      child: Scaffold(
        // floatingActionButton: ActionsFAB(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            storeContent(
              context,
              openBookPage,
              openCategoryPage,
              categories,
            ),
            Positioned(
              child: SlidingPanel(),
            ),
          ],
        ),
      ),
    );
  }

  void openBookPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BookPage()));
  }

  void openCategoryPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CategoryScreen()));
  }
}
