import 'package:flutter/material.dart';
import 'package:recepy/global.dart';
import 'package:recepy/ui/screens/screens.dart';

class PageCarousel extends StatefulWidget {
  @override
  _PageCarouselState createState() => _PageCarouselState();
}

class _PageCarouselState extends State<PageCarousel> {
  PageController _controller = PageController();
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: PageView.builder(
            controller: _controller,
            itemCount: recipes.length,
            pageSnapping: false,
            onPageChanged: (i) {
              _active = i;
            },
            itemBuilder: (ctx, id) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => Details(id: id),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 23.0, vertical: 9),
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black26,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${recipes[id]['img']}"),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(.3), BlendMode.srcOver),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${recipes[id]['name']}",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 9.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: List.generate(
                            recipes[id]['ingredients'].length,
                            (i) {
                              return TextSpan(
                                text: i == recipes[id]['ingredients'].length - 1
                                    ? "${recipes[id]['ingredients'][i]}."
                                    : "${recipes[id]['ingredients'][i]}, ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
            // padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              onPressed: () {
                _controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
            // padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () {
                _controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
