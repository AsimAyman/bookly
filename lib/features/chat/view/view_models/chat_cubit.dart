import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_details_model.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_model.dart';
import 'package:book_extchange/features/chat/data/repos/chat_repo.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepo) : super(ChatInitial());

  final ChatRepo _chatRepo;

  ChatRoomDetailsModel? chatRoomDetailsModel;
  List<ChatRoomModel> chatRoomModels = [];

  void createChatRoom(String userToken , String bookId)async{
    emit(CreateChatLoading());
    print(userToken);
    var results = await _chatRepo.createChatRoom(userToken, bookId);
    results.fold((l) {
      emit(CreateChatFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(CreateChatSuccess(roomId: r.roomId));
    });
  }

  void fetchAllChatRooms(String userToken)async{
    emit(FetchChatRoomsLoading());
    print(userToken);
    var results = await _chatRepo.fetchAllChatRooms(userToken);
    results.fold((l) {
      emit(FetchChatRoomsFailure(errorMessage: l.errorMessage));
    }, (r) {
      chatRoomModels = r;
      emit(FetchChatRoomsSuccess());
    });
  }

  void fetchChatRoomDetails(String userToken , String roomId)async{
    emit(FetchChatRoomDetailsLoading());
    var results = await _chatRepo.fetchChatRoomDetails(userToken, roomId);
    results.fold((l) {
      emit(FetchChatRoomDetailsFailure(errorMessage: l.errorMessage));
    }, (r) {
      chatRoomDetailsModel = r;
      emit(FetchChatRoomDetailsSuccess());
    });
  }



  void sendMessage(String userToken , String roomId , String content)async{
    var results = await _chatRepo.sendMessage(userToken, roomId , content);

  }


}
