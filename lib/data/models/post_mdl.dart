class PostMdl {
  int? id;
  int? userId;
  String? title;
  String? body;
  PostMdl({this.id, this.userId, this.body, this.title});
  PostMdl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }
}
