class Token {
  final String _token;

  const Token({required String token}) : _token = token;

  String get token => _token;

  factory Token.fromJson(Map<String, dynamic> data){

    final token = data['token'];
    
    if(token is! String){
      throw FormatException('Invalid JSON: required "token" field of type String in $data');
    }
    return Token(token: data['token']);
  }

  Map<String, dynamic> toJson(){
    return{
      'token' : token,
    };
  }
}