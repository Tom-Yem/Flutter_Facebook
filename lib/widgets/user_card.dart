import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(
            width: 6.0,
          ),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
