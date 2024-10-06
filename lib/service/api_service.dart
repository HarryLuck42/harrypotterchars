
import 'package:dio/dio.dart';
import 'package:my_products/model/response/character_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("characters")
  Future<List<Character>> getListCharacters();

  @GET("character/{id}")
  Future<Character> getCharacterDetail(
  @Path("id") String id);

  @GET("characters/house/{house}")
  Future<List<Character>> getCharactersByHouse(
  @Path("house") String house);

  @GET("characters/staff")
  Future<List<Character>> getStaff();

  @GET("characters/students")
  Future<List<Character>> getStudents();

}