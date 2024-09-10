class ApiResponse {
  final String status;
  final dynamic data;
  final String? message;

  ApiResponse({required this.status, this.data, required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> data) {
    return ApiResponse(
      status: data['status'],
      data: data['data'],
      message: data['message'],
    );
  }
  static ApiResponse success({dynamic data}) {
    return ApiResponse(status: 'OK', data: data, message: '');
  }

  static ApiResponse error({dynamic data, String message = ''}) {
    return ApiResponse(status: 'error', data: data, message: message);
  }
}
