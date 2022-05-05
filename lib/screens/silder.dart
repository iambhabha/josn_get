import 'package:api_call/constant/colors_constant.dart';
import 'package:api_call/models/homepageresponse.dart';
import 'package:api_call/service/homepage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class silder extends StatefulWidget {
  const silder({Key? key}) : super(key: key);

  @override
  State<silder> createState() => _silderState();
}

class _silderState extends State<silder> {
  HomepageService homepageService = HomepageService();

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("silder "),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: homepageService.getHomepage(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              HomeResponse? homeResponse = snapshot.data as HomeResponse?;
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    var ol = homeResponse!.sliders![index];
                    var si = homeResponse.sliders![index].sliderImage;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 190,
                            child: Swiper(
                              onIndexChanged: (index) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              autoplay: true,
                              layout: SwiperLayout.DEFAULT,
                              itemCount: homeResponse.sliders!.length,
                              itemBuilder: (BuildContext conterxt, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          homeResponse
                                              .sliders![index].sliderImage
                                              .toString(),
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
