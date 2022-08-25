

import 'package:lavie/styles/styles.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppChangeBottomNavBarIndexState extends AppStates{}
class AppChangeHeaderWebIndexState extends AppStates{}
class AppChangeTabBarIndexState extends AppStates{}
class AppChangeForumTabBarIndexState extends AppStates{}
class AppSwitchBetweenAllAndMyForumsInWebState extends AppStates{}
class AppChangeWebAppBarIndexState extends AppStates{}
class AppAddProductToCartListState extends AppStates{}
class AppRemoveProductInCartListState extends AppStates{}

class AppGetPlantsLoadingState extends AppStates{}
class AppGetPlantsSuccessState extends AppStates{}
class AppGetPlantsErrorState extends AppStates{
  String error;
  AppGetPlantsErrorState(this.error);
}


class AppGetProductLoadingState extends AppStates{}
class AppGetProductSuccessState extends AppStates{}
class AppGetProductErrorState extends AppStates{
  String error;
  AppGetProductErrorState(this.error);
}




class AppGetBlogsLoadingState extends AppStates{}
class AppGetBlogsSuccessState extends AppStates{}
class AppGetBlogsErrorState extends AppStates{
  String error;
    AppGetBlogsErrorState(this.error);
}



class AppGetProfileDataLoadingState extends AppStates{}
class AppGetProfileDataSuccessState extends AppStates{}
class AppGetProfileDataErrorState extends AppStates{
  String error;
  AppGetProfileDataErrorState(this.error);
}



class AppUpdateProfileDataLoadingState extends AppStates{}
class AppUpdateProfileDataSuccessState extends AppStates{}
class AppUpdateProfileDataErrorState extends AppStates{
  String error;
  AppUpdateProfileDataErrorState(this.error);
}



class AppUpdateEmailDataLoadingState extends AppStates{}
class AppUpdateEmailDataSuccessState extends AppStates{}
class AppUpdateEmailDataErrorState extends AppStates{
  String error;
  AppUpdateEmailDataErrorState(this.error);
}


class AppGetForumsDataLoadingState extends AppStates{}
class AppGetForumsDataSuccessState extends AppStates{}
class AppGetForumsDataErrorState extends AppStates{
  String error;
  AppGetForumsDataErrorState(this.error);
}




class AppGetAllForumsDataLoadingState extends AppStates{}
class AppGetAllForumsDataSuccessState extends AppStates{}
class AppGetAllForumsDataErrorState extends AppStates{
  String error;
  AppGetAllForumsDataErrorState(this.error);
}



class AppPostForumLoadingState extends AppStates{}
class AppPostForumSuccessState extends AppStates{}
class AppPostForumErrorState extends AppStates{
  String error;
  AppPostForumErrorState(this.error);
}

class UploadedImageState extends AppStates{}

