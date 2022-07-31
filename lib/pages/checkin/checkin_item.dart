import 'package:flutter/material.dart';
import 'package:project_fab/components/avatar.dart';
import 'package:project_fab/models/checkin.dart';
import 'package:project_fab/pages/checkin/checkin_detail.dart';
import 'package:project_fab/pages/profile/profile_page.dart';
import 'package:project_fab/components/time_ago.dart';

class CheckinItem extends StatelessWidget {
  final Checkin checkin;
  final int index;
  final BuildContext context;

  const CheckinItem(this.checkin, this.index, this.context);

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
              child: UserAvatar(
                radius: UserAvatar.s,
                user: checkin.user,
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
                    '${checkin.user.firstName} ${checkin.user.lastName}',
                  ),
                ),
                TimeAgo(
                  date: checkin.postedAt,
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
        Row(
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
      ],
    );
  }
}
