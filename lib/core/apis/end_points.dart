class EndPoints {
  static String baseUrl = 'https://student.valuxapps.com/api/';
  static String signup = 'user/signup';
  static String login = 'login';
  static String updateUser = 'user/update';
  static String getUser (id){
    return 'user/get-user/$id';
  }
  static String deleteUser (id){
    return 'user/delete?id=$id';
  }

}

class ApiKey{
  static String status = 'status';
  static String email = 'email';
  static String password = 'password';
  static String acceptLanguage = 'Accept-Language';
  static String errorMessage = 'ErrorMessage';
  static String message = 'message';
  static String token = 'token';
  static String id = 'id';
  static String name = 'name';
  static String phone = 'phone';
  static String confirmPassword = 'confirmPassword';
  static String location = 'location';
  static String profilePic = 'profilePic';
}