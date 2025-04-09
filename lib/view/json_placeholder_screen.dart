import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view_model/json_placeholder_viewmodel.dart';
import 'package:provider/provider.dart';

class JsonPlaceholderScreen extends StatefulWidget {
  const JsonPlaceholderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JsonPlaceHolderScreenState();
}

class _JsonPlaceHolderScreenState extends State<JsonPlaceholderScreen> {

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
        body: Consumer<JsonPlaceholderViewModel>(
          builder: (BuildContext context, viewModel,_) {
            if(viewModel.posts.isEmpty){
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(viewModel.posts[index].title.toString()),
                      subtitle: Text(viewModel.posts[index].body.toString()),
                    ),
                  );
                });
          },
        ));
  }
}
