import 'package:flutter/material.dart';
import 'package:movie_app/RepeatedFunction/repttext.dart';
import '../DetailScreen/MovieDetails.dart';
import '../DetailScreen/TvSeriesDetail.dart';


Widget sliderlist(List firstlistname, String categorytittle, String type, int length) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
        child: tittletext(categorytittle),
      ),
      SizedBox(
        height: 250,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: firstlistname.length, // Use the actual length of the list
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (type == 'movie') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        id: firstlistname[index]['id'],
                      ),
                    ),
                  );
                } else if (type == 'tv') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TvSeriesDetails(
                        id: firstlistname[index]['id'],
                      ),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path']}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(left: 13),
                width: 170,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 6),
                      child: datetext(firstlistname[index]['Date']),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, right: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            left: 5,
                            right: 5,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 15),
                              const SizedBox(width: 2),
                              ratingtext(firstlistname[index]['vote_average']
                                  .toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}


////////////////////////////////////////////////////////////////////////////
/////////////////////////// Drawer ///////////////////////////
////////////////////////////////////////////////////////////////////////////
