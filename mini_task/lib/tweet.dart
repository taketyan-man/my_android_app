import 'package:flutter/material.dart';
import 'post_page.dart';

class Tweet extends StatefulWidget {
  // title を受け取ってるね👀
  const Tweet({super.key, required this.title});

  final String title;

  

  @override
  State<Tweet> createState() => _TweetState();
}

class _TweetState extends State<Tweet> {
  String _text = "あ";

  @override
  Widget build(BuildContext context) {
    // Scaffold は土台みたいな感じ（白紙みたいな）
    return Scaffold(
      // AppBar は上のヘッダー
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _text,
          style: TextStyle(fontSize:24),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const PostPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(position: animation.drive(tween), child: child);
              },
            ),
          );

          if (result != null && result is String) {
            setState(() {
              _text = result;
            });
          }
        },
        tooltip: '新規ツイート',
        child: const Icon(Icons.edit),
      ),
    );
  }
}