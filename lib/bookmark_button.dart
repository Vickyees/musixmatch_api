import 'package:flutter/material.dart';

import 'database/shared_preferences_data.dart';

class BookmarkButton extends StatefulWidget {
  final bool isBookmarked;
  final String trackId;
  BookmarkButton(this.isBookmarked, this.trackId);
  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool isBookmarked;
  @override
  void initState() {
    isBookmarked = widget.isBookmarked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          isBookmarked
              ? await SharedPreferencesData.unBookmarkTrack(
                  widget.trackId.toString())
              : await SharedPreferencesData.bookmarkTrack(
                  widget.trackId.toString());

          setState(() {
            isBookmarked = !isBookmarked;
          });
        },
        icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border));
  }
}
