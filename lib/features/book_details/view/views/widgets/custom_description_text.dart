import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class CustomDescriptionText extends StatelessWidget {
  const CustomDescriptionText({
    super.key,required this.txt
  });

final String txt;

  @override
  Widget build(BuildContext context) {
    return  ExpandableText(
      txt,
      expandText: 'show more',
      collapseText: 'show less',
      maxLines: 4,
      linkColor: Colors.blue,
      animation: true,
      collapseOnTextTap: true,
      prefixText: "Description",
      // onPrefixTap: () => showProfile(username),
      prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
      // onHashtagTap: (name) => showHashtag(name),
      hashtagStyle: const TextStyle(
        color: Color(0xFF30B6F9),
      ),
      // onMentionTap: (username) => showProfile(username),
      mentionStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      // onUrlTap: (url) => launchUrl(url),
      urlStyle: const TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
