// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bookly/features/chat/data/models/chat_room_details_model.dart';
import 'package:bookly/features/chat/data/models/chat_room_model.dart';
import 'package:bookly/features/chat/data/models/message_model.dart';
import 'package:bookly/features/chat/data/repos/chat_repo.dart';
import 'package:meta/meta.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepo) : super(ChatInitial());

  final ChatRepo _chatRepo;

  ChatRoomDetailsModel? chatRoomDetailsModel;
  List<ChatRoomModel> chatRoomModels = [];

  List<MessageModel> newMessages = [];
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  late PusherChannel channel;

  void createChatRoom(String userToken, String bookId) async {
    emit(CreateChatLoading());
     
    var results = await _chatRepo.createChatRoom(userToken, bookId);
    results.fold((l) {
      emit(CreateChatFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(CreateChatSuccess(roomId: r.roomId));
    });
  }

  void fetchAllChatRooms(String userToken) async {
    emit(FetchChatRoomsLoading());
     
    var results = await _chatRepo.fetchAllChatRooms(userToken);
    results.fold((l) {
      emit(FetchChatRoomsFailure(errorMessage: l.errorMessage));
    }, (r) {
      chatRoomModels = r;
      emit(FetchChatRoomsSuccess());
    });
  }

  void fetchChatRoomDetails(String userToken, String roomId) async {
    emit(FetchChatRoomDetailsLoading());
    var results = await _chatRepo.fetchChatRoomDetails(userToken, roomId);
    results.fold((l) {
      emit(FetchChatRoomDetailsFailure(errorMessage: l.errorMessage));
    }, (r) {
      chatRoomDetailsModel = r;
      emit(FetchChatRoomDetailsSuccess());
    });
  }

  Future<void> sendMessage(
      String userToken, String roomId, String content) async {
    var results = await _chatRepo.sendMessage(userToken, roomId, content);
  }

  void listenToMessagesStream(String userAccessToken, String chatRoomId) async {
    newMessages = [];
    void onEvent(event) {
       
      if (event.eventName == "message.sent") {
        try {
          var s = json.decode(event.data);
           
          MessageModel messageModel = MessageModel.fromJson(s);
          newMessages.add(messageModel);
           
          emit(NewMessage());
           
        } catch (e) {
           
        }
      }
    }

    try {
      await pusher.init(
        apiKey: "64fbcb19855c9773256f",
        cluster: "eu",
        authEndpoint: "http://bookly.website/api/broadcasting/auth",
      );
      channel = await pusher.subscribe(channelName: 'chat.$chatRoomId');
      await pusher.connect();
      channel.onEvent = onEvent;
       
    } catch (e) {
       
    }
  }

}
