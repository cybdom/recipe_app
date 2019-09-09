import 'package:flutter/material.dart';
import 'package:recepy/global.dart';
import 'package:recepy/ui/widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black45)],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(15.0),
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 25.0,
                  child: CategoryMenu(
                    list: categories,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  child: PageCarousel(),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.display1.apply(
                            fontWeightDelta: 2,
                          ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                ...List.generate(dish_cat.length, (id) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 5.0)
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(.3), BlendMode.srcOver),
                        image: NetworkImage(
                          dish_cat[id]['img'],
                        ),
                      ),
                    ),
                    height: 150,
                    child: Text(
                      "${dish_cat[id]['name']}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                    alignment: Alignment.center,
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
