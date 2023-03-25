import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:kind_heart/screens/postManagement/editPost.dart';
import 'package:kind_heart/screens/postManagement/postList.dart';
import 'package:kind_heart/screens/postManagement/reviewPost.dart';
import '../../widgets/FlutterVizBottomNavigationBarModel.dart';
import 'package:kind_heart/models/postManagement/post.dart';
import 'package:kind_heart/services/postManagement/postService.dart';
import 'postListNew.dart';

//post management screen for post management function
class ViewPostScreen extends StatefulWidget {
  final String post_id;
  final String post_title;
  final String post_date;
  final String post_description;

  const ViewPostScreen({
    Key? key,
    required this.post_id,
    required this.post_title,
    required this.post_description,
    required this.post_date,
  }) : super(key: key);

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "View Post",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xffffffff),
          iconSize: 24,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostList(),
                ));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.post_title,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 21,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.post_date,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                            image: NetworkImage(
                                "https://googleflutter.com/sample_image.jpg"),
                            // height: 200,
                            // width: 250,
                            // fit: BoxFit.cover,

                            height: MediaQuery.of(context).size.height *
                                0.35000000000000003,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Text(widget.post_title),
              // Text(widget.post_description),
              // Text(widget.post_date),
              // Text(widget.post_id),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
                child: Text(
                  widget.post_description,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: Color(0xff000000),
                  ),
                ),
              ),

              SizedBox(height: 20),

              RatingBar.builder(
                initialRating: 2.75,
                unratedColor: Color(0xff9e9e9e),
                itemBuilder: (context, index) =>
                    Icon(Icons.star, color: Color(0xffffc107)),
                itemCount: 5,
                itemSize: 35,
                direction: Axis.horizontal,
                allowHalfRating: false,
                onRatingUpdate: (value) {},
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment(1.2, 0.0),
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditPost(
                                post_id: widget.post_id,
                                post_title: widget.post_title,
                                post_description: widget.post_description,
                                post_date: widget.post_date,
                              ),
                            ),
                          );
                        },
                        color: Color(0xff475ee4),
                        iconSize: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            var response = await postService.deletePost(
                                docId: widget.post_id);
                            if (response.code != 200) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text(response.message.toString()),
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text(response.message.toString()),
                                    );
                                  });
                            }
                          },
                          color: Color(0xfff23d2d),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
