import 'package:flutter/material.dart';
import 'package:lavie/styles/styles.dart';

import '../../components/components.dart';

class SearchScreen extends  StatelessWidget {
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    List<Widget>recents =[
      recentSearches('gardenia plant'),
      recentSearches('snake plant'),
      recentSearches('gardenia plant'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 22,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                                //search bar
            Container(
              height: 55.0,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: defaultTextFormField(
                  icon: Icons.search,
                  text: 'Search',
                  withBorder: false,
                  controller:searchController,
                  validator: (String ?value){
                    if(value!.isEmpty) return 'Enter any word';
                    return null;
                  }

              ),
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent searches',
                    style: AppStyles.searchAndTapBarStyle,
                  ),
                  const SizedBox(height: 20.0,),
                  recents[0],
                  recents[1],
                  recents[2],

                ],
              ),
            ),
          ],
        ),
      ),
      // floating action button that used to create new post.

    );
  }

                                                        //recent item
  Widget recentSearches(String text)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.access_time,size: 20,color: Color(0xff979797),),
        const SizedBox(width: 10.0,),
        Text(
          text,
          style: AppStyles.searchAndTapBarStyle,
        ),
        Spacer(),
        Image.asset(
          'assets/images/x_icon.png',
        ),
      ],
    ),
  );
}
