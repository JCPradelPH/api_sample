import 'package:api_sample/models/user_model.dart';
import 'package:api_sample/utils/dio_instance.dart';
import 'package:api_sample/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'user_services.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class UserServices {
  factory UserServices({String? baseUrl}) {
    return _UserServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.userList)
  Future<HttpResponse<List<UserModel>>> getProperties();
}
