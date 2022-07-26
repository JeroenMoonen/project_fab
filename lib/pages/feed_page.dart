import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_fab/config.dart';
import 'package:project_fab/models/models.dart';
import 'package:project_fab/pages/checkin/add_checkin.dart';
import 'package:project_fab/pages/checkin/checkin_detail.dart';
import 'package:project_fab/services/checkin_service.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
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
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: Container(
                child: _createBody(context),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddCheckin(),
            ),
          );
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

Widget _createBody(BuildContext context) {
  return FutureBuilder(
    future: CheckinService.getCheckinsWithCaching(),
    builder: (context, AsyncSnapshot<List<Checkin>?> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.popAndPushNamed(context, '/login');
          });

          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
      }

      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        return RefreshIndicator(
          // onRefresh:() async => setState(() {})
          onRefresh: () async => null,
          child: ListView.separated(
            separatorBuilder: (context, idx) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var item = snapshot.data![index];

              return Card(item, index);
            },
          ),
        );
      }

      // Empty container.
      return const Center(
        child: Text('First add some friends to see what they\'re drinking.'),
      );
    },
  );
}

class Card extends StatelessWidget {
  final Checkin item;
  final int index;

  const Card(this.item, this.index);
  // final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  // CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
  //     this.oldPrice, this.newPrice);
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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                child: Text(
                  'me',
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${item.user.firstName} ${item.user.lastName}'),
                Text(
                  'Posted at ${DateFormat('yyyy-MM-dd - kk:mm').format(item.postedAt)}',
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
            arguments: item,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    // child: Text('hello'),
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
                                  fontWeight: FontWeight.normal),
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
                              item.whisky.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1),
                            ),
                            const Text(
                              'Distillery name here',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
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
      ],
    );
  }
}
