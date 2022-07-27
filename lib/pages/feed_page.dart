import 'package:flutter/material.dart';
import 'package:project_fab/config.dart';
import 'package:project_fab/models/models.dart';
import 'package:project_fab/pages/checkin/add_checkin.dart';
import 'package:project_fab/pages/checkin/checkin_detail.dart';
import 'package:project_fab/pages/onboarding/login_page.dart';
import 'package:project_fab/pages/profile/profile_page.dart';
import 'package:project_fab/services/checkin_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late List<Checkin> _checkinList;
  late Future<void> _initCheckinData;

  @override
  void initState() {
    super.initState();
    _initCheckinData = _initCheckins();
  }

  Future<void> _initCheckins() async {
    final List<Checkin> checkins =
        await CheckinService.getCheckinsWithCaching();

    _checkinList = checkins;
  }

  Future<void> _refreshCheckins() async {
    final checkins = await CheckinService.getCheckinsWithCaching();
    setState(() {
      _checkinList = checkins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
        title: const Text(
          'From A Bottle',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: FutureBuilder(
            future: _initCheckinData,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  return RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _refreshCheckins,
                    child: ListView.builder(
                      itemCount: _checkinList.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          _checkinList[index],
                          index,
                          context,
                        );
                      },
                    ),
                  );
              }

              return const Center(
                child: Text(
                    'First add some friends to see what they\'re drinking.'),
              );
              // if (snapshot.connectionState == ConnectionState.waiting) {
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
              // }
              // if (snapshot.connectionState == ConnectionState.done) {
              //   if (snapshot.hasError) {
              //     WidgetsBinding.instance.addPostFrameCallback((_) {
              //       Navigator.popAndPushNamed(context, LoginPage.routeName);
              //     });

              //     return Center(
              //       child: Text(
              //         snapshot.error.toString(),
              //       ),
              //     );
              //   }
              // }

              // if (snapshot.hasData) {
              //   print('oaiwjef');
              // return RefreshIndicator(
              //   //TODO: check if this works!
              //   key: _refreshIndicatorKey,
              //   onRefresh: _refreshCheckins,
              //   child: ListView.separated(
              //     separatorBuilder: (context, idx) => const Padding(
              //       padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              //     ),
              //     itemCount: _checkinList.length,
              //     itemBuilder: (context, index) {
              //       var item = snapshot.data![index];

              //       return CustomCard(item, index, context);
              //     },
              //   ),
              // );
              // }

              // // Empty container.
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, AddCheckin.routeName);
        },
        tooltip: 'Add Activity',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Checkin checkin;
  final int index;
  final BuildContext context;

  const CustomCard(this.checkin, this.index, this.context);

  void onPressedChat() {
    Navigator.of(context).pushNamed(
      CheckinDetailPage.routeName,
      arguments: checkin,
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrls = [
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
      'https://cdn.webshopapp.com/shops/259604/files/203974904/japanse-whisky-kopen-3-redenen-waarom-je-dit-moet.jpg',
      'https://slijterijbartels.nl/wp-content/uploads/2019/04/Zwolse-Whiskys.jpg',
      'https://www.rtlnieuws.nl/sites/default/files/content/images/2020/02/07/perfcol%202.jpg?itok=te52KopY&width=1024&height=576&impolicy=semi_dynamic',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj13c2XxxvH1jbtLDxw4popmfB4jeoRuWfSBNzM_MWsiiVNBwrobiQMcmRHwV3q5iap_o&usqp=CAU',
    ];

    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ProfilePage.routeName,
                  arguments: checkin.user,
                ),
                child: const CircleAvatar(
                  child: Text('me'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ProfilePage.routeName,
                    arguments: checkin.user,
                  ),
                  child: Text(
                      '${checkin.user.firstName} ${checkin.user.lastName}'),
                ),
                Text(
                  timeago.format(
                    checkin.postedAt,
                    locale: 'en',
                    allowFromNow: true,
                  ),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            CheckinDetailPage.routeName,
            arguments: checkin,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10,
              right: 10,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    width: MediaQuery.of(context).size.width / 3,
                    height: 35,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              '4/5 star rating',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              checkin.whisky.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                            const Text(
                              'Distillery name here',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        //   child: Row(
        //     children: const <Widget>[
        //       Text(
        //         'Rianne Heijnen and 83 others cheered this',
        //         style: TextStyle(
        //           fontSize: 14,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chat_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                      onPressed: onPressedChat,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 18,
                        color: Colors.black,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
