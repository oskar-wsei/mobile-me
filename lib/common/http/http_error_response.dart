import 'dart:convert';

class HttpErrorResponse {
  final String message;

  HttpErrorResponse({required this.message});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'message': message};
  }

  factory HttpErrorResponse.fromMap(Map<String, dynamic> map) {
    return HttpErrorResponse(message: map['message']);
  }

  String toJson() => json.encode(toMap());

  factory HttpErrorResponse.fromJson(String source) =>
      HttpErrorResponse.fromMap(json.decode(source));

  @override
  String toString() => 'HttpErrorResponse(message: $message)';

  @override
  bool operator ==(covariant HttpErrorResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
