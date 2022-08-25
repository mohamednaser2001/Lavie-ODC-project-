

import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../models/blogs_model.dart';

class BlogDescriptionScreen  extends  StatelessWidget {
  Plants plant;
  BlogDescriptionScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '$baseUrl${plant.imageUrl!}',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height*0.31,
            ),
            const SizedBox(height: 37.0,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 40.0),
              child: Column(
                children: [
                  Text(
                    plant.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                  Text(
                    plant.description!,
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color:const Color(0xff7D7B7B).withOpacity(0.79),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
