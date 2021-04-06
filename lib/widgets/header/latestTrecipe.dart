import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Latestrecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Latest Recipes",
            style: GoogleFonts.josefinSans(
                fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: width < 1200 ? gridView(width) : Text("lawdya fatla"),
        )

//2 pieces grid
        // width > 600
        //     ? AspectRatio(
        //         aspectRatio: 3.9,
        //         child: gridView(width, width > 600 ? 2 : 1,
        //             [for (int i = 0; i < 2; i++) popularCard(width, i)]),
        //       )
        //     : listTiles([
        //         for (int i = 0; i < 2; i++)
        //           Padding(
        //             padding: const EdgeInsets.only(bottom: 5.0),
        //             child: popularCard(width, i),
        //           )
        //       ]),
        // SizedBox(
        //   height: width > 600 ? 5.0 : 0.0,
        // ),

//3 pieces gridview
        // width > 600
        //     ? AspectRatio(
        //         aspectRatio: 4.9,
        //         child: gridView(width, width > 600 ? 3 : 1, [
        //           for (int i = 2; i < topPopularCuisines.length; i++)
        //             popularCard(width, i),
        //         ]),
        //       )
        //     : listTiles([
        //         for (int i = 2; i < topPopularCuisines.length; i++)
        //           Padding(
        //             padding: const EdgeInsets.only(bottom: 5.0),
        //             child: popularCard(width, i),
        //           )
        //       ]),
      ],
    );
  }

  Widget gridView(
    double width,
  ) {
    return GridView.count(
      childAspectRatio: 9 / 15,
      // padding: EdgeInsets.symmetric(horizontal: width > 600 ? 50.0 : 20.0),
      // crossAxisSpacing: 2,
      crossAxisCount: 1,
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1603803721487-97009eb7f8db?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fGZydWl0JTIwanVpY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      "Brain Power Blueberry Smoothie",
                      style: GoogleFonts.josefinSans(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
      ],
    );
  }

  Widget listTiles(List<Widget> children) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(children: children),
    );
  }

  // Widget popularCard(double width, int i) {
  //   return AspectRatio(
  //     aspectRatio: 1.9,
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Colors.red,
  //           image: DecorationImage(
  //               image: NetworkImage(topPopularCuisines[i]["image"]),
  //               fit: BoxFit.cover,
  //               colorFilter:
  //                   ColorFilter.mode(Colors.black26, BlendMode.darken))),
  //       padding: EdgeInsets.all(15.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Text(
  //             topPopularCuisines[i]["name"],
  //             style: GoogleFonts.josefinSans(
  //                 fontSize: width < 1000 ? 20.0 : 30.0,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(
  //             height: 5.0,
  //           ),
  //           width < 600.0
  //               ? Row(
  //                   children: [
  //                     Text(
  //                       topPopularCuisines[i]["cuisine"],
  //                       style: GoogleFonts.montserrat(
  //                           color: Colors.white, fontSize: 13.0),
  //                     ),
  //                     SizedBox(
  //                       width: 5.0,
  //                     ),
  //                     iconContent(FontAwesome.comments,
  //                         headerCuisine[i]["comments"], 15.0, 13.0)
  //                   ],
  //                 )
  //               : Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       topPopularCuisines[i]["cuisine"],
  //                       style: GoogleFonts.montserrat(
  //                           color: Colors.white, fontSize: 13.0),
  //                     ),
  //                     iconContent(FontAwesome.comments,
  //                         headerCuisine[i]["comments"], 15.0, 13.0)
  //                   ],
  //                 )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
