import 'package:bloc/bloc.dart';
import 'package:book_extchange/features/home/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BookModel> allBooks = [
    BookModel(
      id: "id",
      sellerId: "sellerId",
      sellerPhone: "sellerPhone",
      title: "title",
      description: "description",
      govern: "govern",
      price: 12,
      isNegotiable: true,
      isExchangeable: true,
      addedDateTime: "addedDateTime",
      imgsPath: ["imgsPath","imgsPath"],
    ),
    BookModel(
      id: "id",
      sellerId: "sellerId",
      sellerPhone: "sellerPhone",
      title: "title",
      description: "description",
      govern: "govern",
      price: 12,
      isNegotiable: true,
      isExchangeable: true,
      addedDateTime: "addedDateTime",
      imgsPath: ["imgsPath","imgsPath"],
    ),
  ];
}
