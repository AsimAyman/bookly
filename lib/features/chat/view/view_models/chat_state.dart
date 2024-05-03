part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class CreateChatLoading extends ChatState {}
class CreateChatSuccess extends ChatState {
  final int roomId;

  CreateChatSuccess({required this.roomId});

}
class CreateChatFailure extends ChatState {
  final String errorMessage;

  CreateChatFailure({required this.errorMessage});

}

class FetchChatRoomsLoading extends ChatState {}
class FetchChatRoomsSuccess extends ChatState {


}
class FetchChatRoomsFailure extends ChatState {
  final String errorMessage;

  FetchChatRoomsFailure({required this.errorMessage});

}

class FetchChatRoomDetailsLoading extends ChatState {}
class FetchChatRoomDetailsSuccess extends ChatState {


}
class FetchChatRoomDetailsFailure extends ChatState {
  final String errorMessage;

  FetchChatRoomDetailsFailure({required this.errorMessage});

}

class NewMessage extends ChatState {}
