import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

class TiktokWidget {
  bool isFav = false;
  Widget pageviewWidget(
    BuildContext context, {
    String? imageUrl,
    AnimationController? animationController,
    VideoPlayerController? controller,
  }) {
    return SizedBox(
      child: Stack(
        children: [
          controller!.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                  child: VideoPlayer(controller))
              : const Center(
                  child: CircularProgressIndicator(),
                ),

          // Image(
          //   height: double.infinity,
          //   fit: BoxFit.fitHeight,
          //   image: NetworkImage(
          //     imageUrl!,
          //   ),
          // ),

          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.white)),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 22,
                              minRadius: 22,
                              backgroundImage: NetworkImage(imageUrl!),
                            ),
                          ),
                        ),
                        const Positioned(
                            bottom: -2,
                            right: 12,
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.red,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            //isFav = !isFav;
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFav ? Colors.red : Colors.white70,
                            size: 35,
                          ),
                        ),
                        const Text(
                          '51.2M',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white70,
                          size: 35,
                        ),
                        Text(
                          '3908',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Icon(
                          Icons.bookmark_border_sharp,
                          color: Colors.white70,
                          size: 35,
                        ),
                        Text(
                          '120',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white70,
                          size: 35,
                        ),
                        Text(
                          '2345',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('@oudom',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(
                                      '⏩ A Flutter widget that scrolls text infinitely.',
                                      style: TextStyle(
                                        color: Colors.white70,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.music_note_2,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                height: 20,
                                width: MediaQuery.of(context).size.width - 70,
                                child: Center(
                                  child: Marquee(
                                    text:
                                        'Some sample text that takes some space.',
                                    style:
                                        const TextStyle(color: Colors.white70),
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    blankSpace: 30.0,
                                    velocity: 100.0,
                                    pauseAfterRound: const Duration(seconds: 1),
                                    startPadding: 10.0,
                                    accelerationDuration:
                                        const Duration(seconds: 1),
                                    accelerationCurve: Curves.linear,
                                    decelerationDuration:
                                        const Duration(milliseconds: 200),
                                    decelerationCurve: Curves.easeOut,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: AnimatedBuilder(
                            animation: animationController!,
                            builder: (context, child) => Transform.rotate(
                              angle: 2 * pi * animationController.value,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3, color: Colors.black)),
                                child: CircleAvatar(
                                  maxRadius: 18,
                                  backgroundImage: NetworkImage(imageUrl),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
