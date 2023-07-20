class LoginRequest
{
  final String name;
  final String phone;

  LoginRequest({required this.name, required this.phone});

  factory LoginRequest.fromJson(Map<String,dynamic> json)=>LoginRequest(name: json['name'], phone: json['phone']);

  Map<String,dynamic> toJson()
  {
    return {'name':name,'phone':phone};
  }
}