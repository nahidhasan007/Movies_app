import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/view_model/demo_images_view_model.dart';
import 'package:provider/provider.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ImagesScreen();
}

class _ImagesScreen extends State<ImagesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ImagesViewModel>(context, listen: false).getImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Images")),
        body: Consumer<ImagesViewModel>(
            builder: (BuildContext context, viewmodel, _) {
          if (viewmodel.images.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: viewmodel.images.length,
              itemBuilder: (context, index) {
                final imageItem = viewmodel.images[index];
                return ListTile(
                  leading: Image.network(imageItem.downloadUrl!,width: 50, height: 50, fit: BoxFit.cover ),
                  title: Text(imageItem.author!),
                );
              });
        }));
  }
}
