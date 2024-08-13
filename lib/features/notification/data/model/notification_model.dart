class NotificationModel {
  final String? title;
  final String? body;
  final Map<String, dynamic>? data;
  final int? hour;
  final String? image;
  NotificationModel({
    this.image,
    required this.title,
    required this.body,
    required this.data,
    required this.hour,
  });
  factory NotificationModel.fromJson(json) {
    return NotificationModel(
      image: json['data']['image'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      hour: json['time'] as int,
    );
  }
}
