import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_handler.dart';
import 'package:bookly/features/chat/data/models/chat_room_details_model.dart';
import 'package:bookly/features/chat/data/models/chat_room_model.dart';
import 'package:bookly/features/chat/data/repos/chat_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChatRepoImp extends ChatRepo {
  final Dio _dio;

  ChatRepoImp(this._dio);

  @override
  Future<Either<Failures, ChatRoomModel>> createChatRoom(
      String userToken, String bookId) async {
    try {
      var jsonData = await _dio.post(
        "${ApiHandler.baseUrl}chat/create-chat-room/$bookId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      ChatRoomModel chatRoomModel = ChatRoomModel.fromJson(jsonData.data['data']);
      return right(chatRoomModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<ChatRoomModel>>> fetchAllChatRooms(
      String userToken) async {
    try {
      List<ChatRoomModel> chatRoomModels = [];
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}chat/rooms",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      for(var chatRoom in jsonData.data['data']){
        chatRoomModels.add(ChatRoomModel.fromJson(chatRoom));
      }
      return right(chatRoomModels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, ChatRoomDetailsModel>> fetchChatRoomDetails(String userToken , String roomId)async {
    try {
      var jsonData = await _dio.get(
        "${ApiHandler.baseUrl}chat/rooms/$roomId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
      );
      ChatRoomDetailsModel chatRoomModel = ChatRoomDetailsModel.fromJson(jsonData.data['data']);
      return right(chatRoomModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerSideError.fromDioException(e));
      } else {
        return left(ServerSideError(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> sendMessage(String userToken, String roomId, String content)async {
    try {
      var jsonData = await _dio.post(
        "${ApiHandler.baseUrl}chat/send-message/$roomId",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $userToken"
          },
        ),
        data: {
          'content': content
        }
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
         
        return left(ServerSideError.fromDioException(e));
      } else {
         

        return left(ServerSideError(e.toString()));

      }
    }
  }
}
