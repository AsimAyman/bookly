import 'package:Bookly/core/widgets/custom_error_dialog.dart';
import 'package:Bookly/features/auth/view/view_models/login_cubit/login_cubit.dart';
import 'package:Bookly/features/chat/view/view_models/chat_cubit.dart';
import 'package:Bookly/features/chat/view/views/widgets/chat_detials_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatDetailsView extends StatefulWidget {
  const ChatDetailsView({super.key,required this.id});
  final int id;
  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ChatCubit>(context).fetchChatRoomDetails(BlocProvider.of<LoginCubit>(context).userModel.accessToken, widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var chatCubit = BlocProvider.of<ChatCubit>(context);
    return  BlocConsumer<ChatCubit, ChatState>(
  listener: (context, state) {
    if(state is FetchChatRoomDetailsFailure){
      customErrorDialog(context, title: "Error", content: state.errorMessage);
    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state is FetchChatRoomDetailsLoading || chatCubit.chatRoomDetailsModel == null,
      child: Scaffold(

        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          bottomOpacity: 0,

          centerTitle: true,
          title:  Text(
            chatCubit.chatRoomDetailsModel?.sellerName ?? "",
          ),
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                size: 32,
              )),
        ),
        body:  ChatDetailsBody(chatRoomId: widget.id.toString(),),
      ),
    );
  },
);
  }
}
