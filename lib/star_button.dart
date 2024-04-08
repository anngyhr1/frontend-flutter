import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
const double buttonSize = 40.0;
class LikeHeartButton extends StatefulWidget {
  @override
  _LikeHeartButtonState createState() => _LikeHeartButtonState();
}

class _LikeHeartButtonState extends State<LikeHeartButton> {
  final int likeCount = 999;
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  @override
  Widget build(BuildContext context) {
    return LikeButton(
            size: buttonSize,
            likeCount: likeCount,
            key: _globalKey,
            isLiked: true,
            postFrameCallback: (LikeButtonState state) {
              state.controller?.forward();
            },
            countBuilder: (int? count, bool isLiked, String text) {
              final ColorSwatch<int> color =
                  isLiked ? Colors.pinkAccent : Colors.grey;
              Widget result;
              if (count == 0) {
                result = Text(
                  'love',
                  style: TextStyle(color: color),
                );
              } else
                result = Text(
                  count! >= 1000
                      ? (count / 1000.0).toStringAsFixed(1) + 'k'
                      : text,
                  style: TextStyle(color: color),
                );
              return result;
            },
            likeCountAnimationType: likeCount < 1000
                ? LikeCountAnimationType.part
                : LikeCountAnimationType.none,
            likeCountPadding: const EdgeInsets.only(left: 15.0),
            onTap: onLikeButtonTapped,
          );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  }