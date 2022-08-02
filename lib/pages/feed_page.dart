import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_fab/models/checkin.dart';
import 'package:project_fab/pages/checkin/add_checkin.dart';
import 'package:project_fab/pages/checkin/checkin_list_item.dart';
import 'package:project_fab/services/checkin_service.dart';

class CheckinListPage extends StatefulWidget {
  const CheckinListPage({Key? key}) : super(key: key);

  @override
  State<CheckinListPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinListPage> {
  final int _numberOfPostsPerRequest = 10;

  final PagingController<int, Checkin> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Checkin> checkins = await CheckinService.getCheckins(
        pageKey,
        _numberOfPostsPerRequest,
      );

      final isLastPage = checkins.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(checkins);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(checkins, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'From A Bottle',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.pushNamed(context, AddCheckin.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, Checkin>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Checkin>(
            animateTransitions: true, // some flashy stuff
            transitionDuration: const Duration(milliseconds: 200),
            itemBuilder: (context, item, index) => SizedBox(
              child: CheckinListItem(
                item,
                context,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
