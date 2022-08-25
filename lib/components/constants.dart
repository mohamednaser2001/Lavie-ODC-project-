
import 'package:lavie/models/fourms_model.dart';

import '../models/product_model.dart';

String? token;
String SIGNIN = '/api/v1/auth/signin';
String REGISTER = '/api/v1/auth/signup';
String GET_PLANTS = '/api/v1/plants';
String GET_PRODUCTS = '/api/v1/products';
String GET_BLOGS = '/api/v1/products/blogs';
String GET_PROFILE = '/api/v1/user/me';
String GET_FORUMS = '/api/v1/forums/me';
String GET_ALL_FORUMS = '/api/v1/forums';
String baseUrl = 'https://lavie.orangedigitalcenteregypt.com';

//this list contain the list of id of products that the user add it to cart.
//List<ProductData> productsInUserCart=[];

MyForumsModel? allForums;
MyForumsModel? myForums;