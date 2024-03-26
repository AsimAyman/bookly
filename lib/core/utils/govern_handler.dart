import 'package:book_extchange/features/auth/data/models/govern_model.dart';

class GovernHandler {
  static const List<GovernModel> allGoverns =[
    GovernModel(name: "القاهرة", id: '1'),
    GovernModel(name: "الجيزة", id: '2'),
    GovernModel(name: "الأسكندرية", id: '3'),
    GovernModel(name: "الدقهلية", id: '4'),
    GovernModel(name: "البحر الأحمر", id: '5'),
    GovernModel(name: "البحيرة", id: '6'),
    GovernModel(name: "الفيوم", id: '7'),
    GovernModel(name: "الغربية", id: '8'),
    GovernModel(name: "الإسماعلية", id: '9'),
    GovernModel(name: "المنوفية", id: '10'),
    GovernModel(name: "المنيا", id: '11'),
    GovernModel(name: "القليوبية", id: '12'),
    GovernModel(name: "الوادي الجديد", id: '13'),
    GovernModel(name: "السويس", id: '14'),
    GovernModel(name: "اسوان", id: '15'),
    GovernModel(name: "اسيوط", id: '16'),
    GovernModel(name: "بني سويف", id: '17'),
    GovernModel(name: "بورسعيد", id: '18'),
    GovernModel(name: "دمياط", id: '19'),
    GovernModel(name: "الشرقية", id: '20'),
    GovernModel(name: "جنوب سيناء", id: '21'),
    GovernModel(name: "كفر الشيخ", id: '22'),
    GovernModel(name: "مطروح", id: '23'),
    GovernModel(name: "الأقصر", id: '24'),
    GovernModel(name: "قنا", id: '25'),
    GovernModel(name: "شمال سيناء", id: '26'),
    GovernModel(name: "سوهاج", id: '27'),
  ];

  static GovernModel? getGoverModelByName(String name){
    GovernModel? governModel;
    for(GovernModel govern in allGoverns){
      if(govern.name == name){
        governModel = govern;
      }
    }

    return governModel;
  }

}