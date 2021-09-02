import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0)
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(isAddStory: true, currentUser: currentUser),
              );

            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: _StoryCard(story: story),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        isAddStory ? currentUser!.imageUrl : story!.imageUrl;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: 110,
            height: double.infinity,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isDesktop(context)
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            height: 40,
            width: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: isAddStory
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print("add story"),
                    icon: Icon(
                      Icons.add,
                    ),
                    iconSize: 30,
                    color: Palette.facebookBlue)
                : ProfileAvatar(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: !story!.isViewed,
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? "Add to story" : story!.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
