import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveCarousel(),
    );
  }
}

class ResponsiveCarousel extends StatefulWidget {
  const ResponsiveCarousel({super.key});

  @override
  _ResponsiveCarouselState createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends State<ResponsiveCarousel> {
  final List<Map<String, String>> carouselItems = [
    {
      'title': 'Friday Night',
      'location': 'THAILAND',
      'imageUrl': 'https://picsum.photos/seed/192/600'
      // 'imageUrl':
      //     'https://firebasestorage.googleapis.com/v0/b/kyozo-prod.appspot.com/o/users%2Fx3cikshkoUb0i8LIfqfKf2n3G272%2Fuploads%2F1712042729180000.png?alt=media&token=3484808f-699b-456d-a77e-3461117f6aa0'
    },
    {
      'title': 'Saturday Morning',
      'location': 'BALI',
      'imageUrl': 'https://picsum.photos/seed/130/600'
      // 'imageUrl':
      //     'https://firebasestorage.googleapis.com/v0/b/kyozo-prod.appspot.com/o/users%2Fx3cikshkoUb0i8LIfqfKf2n3G272%2Fuploads%2F1712034258751000.jpg?alt=media&token=aec797cc-f252-42a7-8ead-4ce7eddec119'
    },
    {
      'title': 'Sunday Afternoon',
      'location': 'VIETNAM',
      'imageUrl': 'https://picsum.photos/seed/497/600'
      // 'imageUrl':
      //     'https://firebasestorage.googleapis.com/v0/b/kyozo-prod.appspot.com/o/users%2FAhQpO1XaGVcVxiPsKbnIdJY8vW63%2Fuploads%2F1712042429772000.png?alt=media&token=ea3d0c6c-eb67-4b54-9f90-95319f7370de'
    },
    {
      'title': 'Saturday Morning2',
      'location': 'BALI',
      'imageUrl':
          'https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MjU0NjUwNzl8MA&ixlib=rb-4.0.3&q=80&w=1080'
      // 'imageUrl':
      //     'https://firebasestorage.googleapis.com/v0/b/kyozo-prod.appspot.com/o/users%2Fx3cikshkoUb0i8LIfqfKf2n3G272%2Fuploads%2F1712034258751000.jpg?alt=media&token=aec797cc-f252-42a7-8ead-4ce7eddec119'
    },
    {
      'title': 'Sunday Afternoon3',
      'location': 'VIETNAM',
      'imageUrl':
          'https://images.unsplash.com/photo-1585366119957-e9730b6d0f60?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxsZWdvfGVufDB8fHx8MTcyNTQzOTA0OXww&ixlib=rb-4.0.3&q=80&w=1080'
      // 'imageUrl':
      //     'https://firebasestorage.googleapis.com/v0/b/kyozo-prod.appspot.com/o/users%2FAhQpO1XaGVcVxiPsKbnIdJY8vW63%2Fuploads%2F1712042429772000.png?alt=media&token=ea3d0c6c-eb67-4b54-9f90-95319f7370de'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return CarouselSlider(
      options: CarouselOptions(
        initialPage: 0,
        height: isSmallScreen ? screenSize.height * 0.3 : 200.0,
        enlargeCenterPage: true,
        autoPlay: false,
        aspectRatio: isSmallScreen ? 16 / 9 : 21 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  EdgeInsets.symmetric(horizontal: isSmallScreen ? 3.0 : 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item['imageUrl']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallScreen ? 8.0 : 10.0,
                        horizontal: isSmallScreen ? 15.0 : 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 18.0 : 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 3 : 5),
                          Text(
                            item['location']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 14.0 : 16.0,
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 8 : 10),
                          ElevatedButton(
                            onPressed: () {
                              // Add your action here
                            },
                            child: Text('View Community'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 10 : 15,
                                vertical: isSmallScreen ? 5 : 8,
                              ),
                              textStyle: TextStyle(
                                fontSize: isSmallScreen ? 12 : 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
