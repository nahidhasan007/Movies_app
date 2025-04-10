class Picsum {
  String? id;
  String? author;
  String? downloadUrl;

  Picsum({this.id, this.author, this.downloadUrl});

  Picsum.fromJson(Map<String, dynamic> json){
    id = json['id'];
    author = json['author'];
    downloadUrl = json['download_url'];
  }

  Picsum.toJson(Map<String, dynamic> data){
    data['id'] = id ?? "";
    data['author'] = author ?? "";
    data['download_url'] = downloadUrl ?? "";

  }
}
