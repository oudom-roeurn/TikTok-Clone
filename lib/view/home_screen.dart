import 'package:flutter/material.dart';
import 'package:tiktok_clone/widget/widget.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // late VideoPlayerController _controller;
  List<VideoPlayerController> listVideoController = [];
  List<String> videoList = [
    'assets/video/s2.mp4',
    'assets/video/s3.mp4',
    'assets/video/s4.mp4',
    'assets/video/s5.mp4',
    'assets/video/s1.mp4',
    'assets/video/s6.mp4',
    'assets/video/s7.mp4',
    'assets/video/s8.mp4',
    'assets/video/s9.mp4',
    'assets/video/s10.mp4',
  ];
  PageController controller = PageController();
  AnimationController? _animationController;
  List<String> imageUrlList = [
    'https://p16-sign-useast2a.tiktokcdn.com/tos-useast2a-avt-0068-giso/926ae542e1e4af0d95094c1581095f6d~c5_100x100.jpeg?lk3s=a5d48078&x-expires=1705402800&x-signature=mru2jzM2jY0F51HISdUI9U6Jx%2FE%3D',
    'https://p16-sign-useast2a.tiktokcdn.com/tos-useast2a-avt-0068-giso/44f81fefea42311a4ef8dee455c6066b~c5_100x100.jpeg?lk3s=a5d48078&x-expires=1705402800&x-signature=lgpFdKC2zVB1Lz7sO639RYZ6Qqc%3D',
    'https://p16-sign-sg.tiktokcdn.com/aweme/100x100/tos-alisg-avt-0068/c40123160f2b38fb32e708bf75d0d85e.jpeg?lk3s=a5d48078&x-expires=1705402800&x-signature=nZOGDef0%2FgmzsjD427OpxVHRD3c%3D',
    'https://p16-sign-sg.tiktokcdn.com/aweme/100x100/tos-alisg-avt-0068/6cf9a4a8086f9bd925ad596f5dd755f6.jpeg?lk3s=a5d48078&x-expires=1705402800&x-signature=I3mDqajWDKbb7DMuEm4P5cuGntA%3D',
    'https://p16-sign-sg.tiktokcdn.com/aweme/100x100/tos-alisg-avt-0068/17b676e578724fc353eafe3e7904e699.jpeg?lk3s=a5d48078&x-expires=1705402800&x-signature=lpqFx4kFgKCuTeQQaQsHFXPmoD4%3D',
    'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
    'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
    'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
    'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
    'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationController!.repeat();
    for (var vdo in videoList) {
      VideoPlayerController? controller = VideoPlayerController.asset(vdo)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      //  controller.play();
      listVideoController.add(controller);
      //_controller.setLooping(true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var dp in listVideoController) {
      dp.dispose();
    }
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              var controlerData = listVideoController[index];
              controlerData
                ..play()
                ..videoPlayerOptions
                ..setLooping(true);

              return TiktokWidget().pageviewWidget(
                context,
                imageUrl: imageUrlList[index],
                animationController: _animationController,
                controller: controlerData,
              );
            },
            controller: controller,
            scrollDirection: Axis.vertical,
          ),
          Positioned(
              width: 400,
              top: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.live_tv_outlined,
                          color: Colors.white,
                        )),
                    const Text(
                      'Following | For you',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(iconSize: 26, currentIndex: 2, items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.group),
          label: 'Friend',
        ),
        BottomNavigationBarItem(
            backgroundColor: Colors.black, icon: Icon(Icons.add), label: 'Add'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.chat),
            label: 'Inbox'),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Me'),
      ]),
    );
  }
}
