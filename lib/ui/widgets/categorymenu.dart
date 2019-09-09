import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  final List<dynamic> list;

  const CategoryMenu({Key key, @required this.list}) : super(key: key);
  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.list.length,
        (id) {
          return GestureDetector(
            onTap: () {
              setState(() {
                active = id;
              });
            },
            child: Container(
              child: Text(
                "${widget.list[id]}",
                style: TextStyle(
                  fontWeight:
                      active == id ? FontWeight.bold : FontWeight.normal,
                  color: active == id ? Colors.black : Colors.grey[500],
                  fontSize: 17,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
