class OtpRequest
{
  final String code;
  final String phone;

  OtpRequest({required this.code, required this.phone});

  factory OtpRequest.fromJson(Map<String,dynamic> json)=>OtpRequest(code: json['code'], phone: json['phone']);

  Map<String,dynamic> toJson()
  {
    return {'code':code,'phone':phone};
  }
}