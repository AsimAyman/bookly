import 'package:book_extchange/core/utils/measures.dart';
import 'package:book_extchange/core/widgets/custom_error_dialog.dart';
import 'package:book_extchange/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:book_extchange/features/chat/data/models/chat_room_model.dart';
import 'package:book_extchange/features/chat/view/view_models/chat_cubit.dart';
import 'package:book_extchange/features/chat/view/views/widgets/custom_chat_card.dart';
import 'package:book_extchange/features/chat/view/views/widgets/custom_chat_rooms_list_view.dart';
import 'package:book_extchange/features/home/view/view_models/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:book_extchange/features/home/view/views/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatRoomsBody extends StatefulWidget {
  const ChatRoomsBody({super.key});

  @override
  State<ChatRoomsBody> createState() => _ChatRoomsBodyState();
}

class _ChatRoomsBodyState extends State<ChatRoomsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ChatCubit>(context)
        .fetchAllChatRooms(BlocProvider.of<LoginCubit>(context).userModel.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is FetchChatRoomsFailure) {
          customErrorDialog(context,
              title: "Error", content: state.errorMessage);
        }

      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is FetchChatRoomsLoading,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    HomeAppBar(
                      onTap: () {
                        BlocProvider.of<BottomNavCubit>(context)
                            .scaffoldKey
                            .currentState!
                            .openDrawer();
                      },
                    ),
                    CustomChatRoomsListView(chatRoomModels: BlocProvider.of<ChatCubit>(context).chatRoomModels,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



