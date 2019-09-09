import 'package:flutter/material.dart';
import 'package:recepy/global.dart';
import 'package:recepy/ui/widgets/widgets.dart';

class Details extends StatelessWidget {
  final int id;

  const Details({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                recipes[id]['img'],
                fit: BoxFit.cover,
                color: Colors.black38,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Container(
                height: MediaQuery.of(context).size.height/1.35,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "${recipes[id]['name']}",
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(color: Colors.white),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          RatingBar(rating: recipes[id]['rating']),
                          SizedBox(width: 9),
                          Text(
                            "${recipes[id]['people_score']} people score",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes[id]['ingredients'].length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              padding: const EdgeInsets.all(9.0),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Text(
                                "${recipes[id]['ingredients'][i]}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Text(
                            "Difficulty:",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          RatingBar(rating: recipes[id]['rating']),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "${recipes[id]['desc']}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(height: 15),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 5,
                        children: List.generate(
                          recipes[id]['ingredients'].length,
                          (f) {
                            return Row(
                              children: <Widget>[
                                Text(
                                  "${recipes[id]['ingredients'][f]}: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "$f kg",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text("${recipes[id]['duration']}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 15.0),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text("${recipes[id]['temp']}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text("${recipes[id]['cooking_type']}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(9.0),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add to favorite",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
