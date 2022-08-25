
import 'package:flutter/material.dart';
import 'package:lavie/styles/styles.dart';

import '../models/notification_model.dart';

class NotificationScreen extends  StatelessWidget {

  List<NotificationModel> notifications=[
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'Dennis Nedry commented on Isla Nublar SOC2 compliance report', date: 'Yesterday at 5:42 PM', image: 'assets/images/profile1.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'Dennis Nedry commented on Isla Nublar SOC2 compliance report', date: 'Yesterday at 5:42 PM', image: 'assets/images/profile1.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'Dennis Nedry commented on Isla Nublar SOC2 compliance report', date: 'Yesterday at 5:42 PM', image: 'assets/images/profile1.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'Dennis Nedry commented on Isla Nublar SOC2 compliance report', date: 'Yesterday at 5:42 PM', image: 'assets/images/profile1.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
    NotificationModel(title: 'Joy Arnold left 6 comments on Your Post', date: 'Yesterday at 11:42 PM', image: 'assets/images/profile.png'),
    NotificationModel(title: 'John Hammond created Isla Nublar SOC2 compliance report', date: 'Wednesday at 11:15 AM', image: 'assets/images/profile2.png'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Notification',
            style: AppStyles.appBarTittleStyle,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context,index)=>notificationItemBuilder(notifications[index]),
          separatorBuilder:(context,index)=> Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(height: 1,color:const Color(0xffE8EBF0),),
          ),
          itemCount:15,
      ),
    );
  }

  Widget notificationItemBuilder(NotificationModel notification)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Image.asset(notification.image,width: 32.0,height: 32.0,),
          const SizedBox(width: 16.0,),
          Expanded(
            child: Text(
              notification.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.notificationTittleStyle,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 48.0),
        child: Text(
          notification.date,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.notificationDateStyle,
        ),
      )
    ],
  );

}
