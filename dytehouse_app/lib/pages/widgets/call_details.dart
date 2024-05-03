import 'package:dytehouse/pages/widgets/size/size_util.dart';
import 'package:flutter/material.dart';

class CallDetailsWidget extends StatelessWidget {
  const CallDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.adjust(356),
          height: context.adjust(262),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CallHeader(),
              UserInfo(),
            ],
          ),
        ),
      ],
    );
  }
}

class CallHeader extends StatelessWidget {
  const CallHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.adjust(156),
      padding: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        color: Color(0xFFE1A500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderDateRow(),
          SizedBox(height: 16),
          TitleAndTags(
              title: 'Binance NFT Chat: Supercharge your spaces',
              tags: ['Small business', 'Cryptocurrency']),
        ],
      ),
    );
  }
}

class HeaderDateRow extends StatelessWidget {
  const HeaderDateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today at 11:00 PM',
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '•••',
            style: TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAndTags extends StatelessWidget {
  final String title;
  final List<String> tags;

  const TitleAndTags({
    super.key,
    required this.title,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 20,
            fontFamily: 'Fira Sans Condensed',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: tags
              .map((tag) => Text(
                    tag,
                    style: const TextStyle(
                      color: Color(0xFFF5F5F5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.adjust(106),
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
      decoration: const ShapeDecoration(
        color: Color(0xFFD19601),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserHeader(),
          SizedBox(height: 8),
          UserDetails(),
        ],
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserProfile(),
        HostBadge(),
      ],
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage("https://via.placeholder.com/32x32"),
        ),
        SizedBox(width: 16),
        Text(
          'Binance NFT',
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class HostBadge extends StatelessWidget {
  const HostBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0xFFE1A500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: const Text(
        'Host',
        style: TextStyle(
          color: Color(0xFFF5F5F5),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '@Binance • #NFT Market place',
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'The one stop for NFT',
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
