import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  MoreOptionsList({Key? key, required this.currentUser}) : super(key: key);

  final List<List> _moreOptions = [
    [MdiIcons.shieldAccount, Colors.deepPurple, "Cvid-19 Info Center"],
    [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
    [MdiIcons.flag, Colors.orange, "Pages"],
    [MdiIcons.storefront, Palette.facebookBlue, "Market Place"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [MdiIcons.calendarStar, Colors.red, "Events"],
  ];

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
          itemCount: 1 + _moreOptions.length,
          itemBuilder: (context, index) {
            if (index == 0)
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(
                  user: currentUser,
                ),
              );

            final List option = _moreOptions[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child:
                  _Option(icon: option[0], color: option[1], label: option[2]),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option(
      {Key? key, required this.color, required this.icon, required this.label})
      : super(key: key);

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: color,
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
