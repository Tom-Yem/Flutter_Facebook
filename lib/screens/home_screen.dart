import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Responsive(
        mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
        desktop:
            _HomeScreenDesktop(scrollController: _trackingScrollController),
      )),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Text(
            "facebook",
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              onPressed: () => print("search"),
              iconSize: 30.0,
            ),
            CircleButton(
              onPressed: () => print("messenger"),
              iconSize: 30.0,
              icon: MdiIcons.facebookMessenger,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        Container(
            width: 600.0,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  sliver: SliverToBoxAdapter(
                    child: Stories(currentUser: currentUser, stories: stories),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(onlineUsers: onlineUsers),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Post post = posts[index];
                      return PostContainer(post: post);
                    },
                    childCount: posts.length,
                  ),
                )
              ],
            )),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
