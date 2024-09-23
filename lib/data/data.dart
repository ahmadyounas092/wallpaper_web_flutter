import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = 'xm4AaeXsZmCR9Ngm1KVW4W69x9eBSoaW7y2h6Kbrj3sjeF7pnx9sziy7';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];

  CategoriesModel cm1 = CategoriesModel(categoriesName: "Nature", imgUrl: "https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm1);
  CategoriesModel cm2 = CategoriesModel(categoriesName: "Street Art", imgUrl: "https://images.pexels.com/photos/1045534/pexels-photo-1045534.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm2);
  CategoriesModel cm3 = CategoriesModel(categoriesName: "Wild Life", imgUrl: "https://images.pexels.com/photos/46519/leopard-cat-big-cat-wildcat-46519.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm3);
  CategoriesModel cm4 = CategoriesModel(categoriesName: "City", imgUrl: "https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm4);
  CategoriesModel cm5 = CategoriesModel(categoriesName: "Cars", imgUrl: "https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm5);
  CategoriesModel cm6 = CategoriesModel(categoriesName: "Bikes", imgUrl: "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm6);
  CategoriesModel cm7 = CategoriesModel(categoriesName: "Houses", imgUrl: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm7);
  CategoriesModel cm8 = CategoriesModel(categoriesName: "Mountains", imgUrl: "https://images.pexels.com/photos/210243/pexels-photo-210243.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm8);
  CategoriesModel cm9 = CategoriesModel(categoriesName: "Art", imgUrl: "https://images.pexels.com/photos/102127/pexels-photo-102127.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm9);
  CategoriesModel cm10 = CategoriesModel(categoriesName: "Beaches", imgUrl: "https://images.pexels.com/photos/50594/sea-bay-waterfront-beach-50594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm10);
  CategoriesModel cm11 = CategoriesModel(categoriesName: "Planes", imgUrl: "https://images.pexels.com/photos/46148/aircraft-jet-landing-cloud-46148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm11);
  CategoriesModel cm12 = CategoriesModel(categoriesName: "Motivational", imgUrl: "https://images.pexels.com/photos/21696/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  categories.add(cm12);


  return categories;
}
