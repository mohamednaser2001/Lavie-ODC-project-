

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../components/components.dart';
import '../../../models/blogs_model.dart';
import '../../../modules/blogs_screen/blog_description.dart';

class WebBlogsDescriptionScreen  extends StatelessWidget {
 // Plants plant;
 // WebBlogsDescriptionScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // header
          Text(
            'Blogs',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40.0,),
         // BlogDescriptionScreen()
          Expanded(child: descriptionBlogPageTest(size),  //BlogDescriptionScreen(plant),
          ),

          contactUs(size),
        ],
      ),
    );
  }

  //just for test web,will be deleted.
  Widget descriptionBlogPageTest(Size size)=>Container(
    width: size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'assets/images/blog_image_test.png',
          fit: BoxFit.cover,
          width: size.width,
          height: size.height*0.31,
        ),
        const SizedBox(height: 37.0,),
        Padding(
          padding: const EdgeInsets.only(left: 24.0,right: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5 Simple Tips treat plant',
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
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy textever since the 1500s, when an unknown priLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy textever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only fivecenturies, but also the leap into electronic typesetting, remaining essentially unchanged. \n It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like AldusPageMaker including versions of Lorem Ipsum.',
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
  );

}
