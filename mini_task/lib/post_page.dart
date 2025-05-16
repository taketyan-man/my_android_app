import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  // title を受け取ってるね👀
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // Scaffold は土台みたいな感じ（白紙みたいな）
    return Scaffold(
      // AppBar は上のヘッダー
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              final text = _controller.text.trim();
              Navigator.pop(context, text);
            },)
        ],
      ),
      body: Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        
          
      )
    );
  }
}