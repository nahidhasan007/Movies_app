import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view_model/json_placeholder_viewmodel.dart';
import 'package:provider/provider.dart';

class JsonPlaceholderScreen extends StatefulWidget {
  const JsonPlaceholderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JsonPlaceHolderScreenState();
}

class _JsonPlaceHolderScreenState extends State<JsonPlaceholderScreen> {
  JsonPlaceholderViewModel postsViewModel = JsonPlaceholderViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JsonPlaceholderViewModel>(context, listen: false)
          .fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Posts"), actions: []),
        body: ChangeNotifierProvider<JsonPlaceholderViewModel>(
          create: (BuildContext context) => postsViewModel,
          child:
              Consumer<JsonPlaceholderViewModel>(builder: (context, value, _) {
            return ListView.builder(
                itemCount: value.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(value.posts[index].title.toString()),
                      subtitle: Text(value.posts[index].body.toString()),
                    ),
                  );
                });
            return Container();
          }),
        ));
  }
}
