
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/models/blogs_model.dart';
import 'package:lavie/models/product_model.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/shared/local/cache_helper.dart';
import 'package:lavie/shared/remote/dio_helper.dart';

import '../../../components/constants.dart';
import '../../../models/fourms_model.dart';
import '../../../models/profile_data_model.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=2;
  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarIndexState());
  }


  int tabBarIndex=0;
  void changeTabBarIndex(int index){
    tabBarIndex = index;
    emit(AppChangeTabBarIndexState());
  }




                  // method to get all products from API.
  ProductModel ? productModel;
  void getProductsData(){
    emit(AppGetProductLoadingState());

    DioHelper.getData(
      url: GET_PRODUCTS,
      token:'Bearer $token',
    ).then((value) {

      productModel = ProductModel.fromJson(value.data);
      divideProductsIntoCategories();
      // print(productModel!.data![0].price.toString()+'==============');
      emit(AppGetProductSuccessState());

    }).catchError((error){
      print('this error from AppGetProductErrorState : ${error.toString()}');
      emit(AppGetProductErrorState(error.toString()));
    });

  }

  List<ProductData> seedsList=[];
  List<ProductData> toolsList=[];
  List<ProductData> plantsList=[];

  //method to divide products into categories
  void divideProductsIntoCategories(){
    productModel!.data!.forEach((element) {
      if(element.type=='PLANT') plantsList.add(element);
      else if(element.type=='SEED') seedsList.add(element);
      else if(element.type=='TOOL') toolsList.add(element);
    });
  }




  BlogsModel ? blogsModel;
  void getBlogsData(){
    emit(AppGetBlogsLoadingState());

    DioHelper.getData(
      url: GET_BLOGS,
      token:'Bearer $token',
    ).then((value) {

      blogsModel = BlogsModel.fromJson(value.data);
      print(baseUrl+blogsModel!.data!.plants![1].imageUrl.toString()+'==============');
      emit(AppGetBlogsSuccessState());

    }).catchError((error){
      print('this error from AppGetBlogsErrorState : ${error.toString()}');
      emit(AppGetBlogsErrorState(error.toString()));
    });

  }




  int selectedHeaderIndex=0;
  void changeSelectedHeaderIndex(int index){
    selectedHeaderIndex=index;

    emit(AppChangeHeaderWebIndexState());
  }



  ProfileDataModel ? profileDataModel;
  void getProfileData(){
    emit(AppGetProfileDataLoadingState());

    DioHelper.getData(
      url: GET_PROFILE,
      token:'Bearer $token',
    ).then((value) {

      profileDataModel = ProfileDataModel.fromJson(value.data);
       print(profileDataModel!.data!.userId.toString()+'==============');
      emit(AppGetProfileDataSuccessState());

    }).catchError((error){
      print('this error from AppGetProfileDataErrorState : ${error.toString()}');
      emit(AppGetProfileDataErrorState(error.toString()));
    });

  }



  // method to update user name
  void updateUserName({
    String? firstName,
    String? lastName,
  }) {
    emit(AppUpdateProfileDataLoadingState());

    DioHelper.patchData(
      url: GET_PROFILE,
      token: 'Bearer $token',
      data: {
        'firstName': firstName,
        'lastName': lastName,
      },
    ).then((value) {
      profileDataModel = ProfileDataModel.fromJson(value.data);
      print(profileDataModel!.data!.userId.toString() + '==============');
      getProfileData();
      emit(AppUpdateProfileDataSuccessState());
    }).catchError((error) {
      print('this error from AppUpdateProfileDataErrorState : ${error
          .toString()}');
      emit(AppUpdateProfileDataErrorState(error.toString()));
    });
  }



    // method to update user email

   void updateUserEmail({
      String? email,
    }){
      emit(AppUpdateEmailDataLoadingState());

      DioHelper.patchData(
        url: GET_PROFILE,
        token:'Bearer $token',
        data: {
          'email':email,
        },
      ).then((value) {

        profileDataModel = ProfileDataModel.fromJson(value.data);
        print(profileDataModel!.data!.userId.toString()+'==============');
        getProfileData();
        emit(AppUpdateEmailDataSuccessState());

      }).catchError((error){
        print('this error from AppUpdateProfileDataErrorState : ${error.toString()}');
        emit(AppUpdateEmailDataErrorState(error.toString()));
      });

  }



  //method to get forums data and store it in forum model to use it in discussion forums screen
  MyForumsModel ? forumsModel;
  void getForumsData(){
    emit(AppGetForumsDataLoadingState());

    DioHelper.getData(
      url: GET_FORUMS,
      token:'Bearer $token',
    ).then((value) {

      forumsModel = MyForumsModel.fromJson(value.data);
      myForums = forumsModel;

      // print(productModel!.data![0].price.toString()+'==============');
      emit(AppGetForumsDataSuccessState());

    }).catchError((error){
      print('this error from AppGetForumsErrorState : ${error.toString()}');
      emit(AppGetForumsDataErrorState(error.toString()));
    });

  }




  //method to get all forums data and store it in forum model to use it in discussion forums screen
  MyForumsModel ? allForumsModel;
  void getAllForumsData(){
    emit(AppGetAllForumsDataLoadingState());

    DioHelper.getData(
      url: GET_ALL_FORUMS,
      token:'Bearer $token',
      query: {
        'search':'',
      },

    ).then((value) {

      allForumsModel = MyForumsModel.fromJson(value.data);
      allForums = allForumsModel;
       print(allForumsModel!.data![0].title.toString()+'=======55555=======');
      emit(AppGetAllForumsDataSuccessState());

    }).catchError((error){
      print('this error from AppGetAllForumsErrorState : ${error.toString()}');
      emit(AppGetAllForumsDataErrorState(error.toString()));
    });

  }





  int forumTabBarIndex=0;
  void changeForumTabBarIndex(int index){
    forumTabBarIndex = index;
    emit(AppChangeForumTabBarIndexState());
  }


  int webAppBarIndex=0;
  void changeWebAppBarIndex(int index){
    webAppBarIndex=index;
    emit(AppChangeWebAppBarIndexState());
  }



  // method to create new post

  void createPost({
    String? title,
    String? description,
    String? image,
  }){
    emit(AppPostForumLoadingState());

    DioHelper.patchData(
      url: GET_PROFILE,
      token:'Bearer $token',
      data: {
        'title':title,
        'description':description,
        'imageBase64':image,
      },
    ).then((value) {

      emit(AppPostForumSuccessState());

    }).catchError((error){
      print('this error from AppPostForumErrorState : ${error.toString()}');
      emit(AppPostForumErrorState(error.toString()));
    });

  }



  // switch between all and my forums in web
  int switchIndex=0;
  void switchBetweenAllAndMyForumsInWeb(int index){
    switchIndex = index;
    emit(AppSwitchBetweenAllAndMyForumsInWebState());
  }


  // list to store cart items.
  List<ProductData> productsInCart=[];
  //this method add products to cart list that the user add it to cart.
  void addToCart(ProductData product){
    productsInCart.add(product);
    getId();
    CacheHelper.saveData(key: 'productsInCart',list: listOfIdOfProductsInCart);
    emit(AppAddProductToCartListState());
  }

  //method to get id from productsInCart.
  List<String>listOfIdOfProductsInCart=[];
 void getId(){
    productsInCart.forEach((element) {
      if(!listOfIdOfProductsInCart.contains(element.productId))
      listOfIdOfProductsInCart.add(element.productId!);
    });
 }


 //method to remove item from list of product in cart
 void removeFromCart(ProductData item){
   productsInCart.remove(item);
   getId();
   CacheHelper.saveData(key: 'productsInCart',list: listOfIdOfProductsInCart);
   emit(AppRemoveProductInCartListState());
 }



 String ?base64string;

  Future<void> uploadImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      String imageExtension = imagePath.split('.').last;
      print(imageExtension);
      Uint8List imageBytes = await pickedFile.readAsBytes(); //convert to bytes
      base64string = base64.encode(imageBytes); //convert bytes to base64 string
      base64string = "data:image/$imageExtension;base64,$base64string";
    }
    emit(UploadedImageState());
  }


}