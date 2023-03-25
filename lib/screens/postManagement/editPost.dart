import 'package:flutter/material.dart';

import '../../widgets/FlutterVizBottomNavigationBarModel.dart';
import 'package:kind_heart/services/postManagement/postService.dart';
import 'package:intl/intl.dart';

//edit post screen of post management
class EditPost extends StatefulWidget {
  final String post_id, post_title, post_date, post_description;

  const EditPost({
    Key? key,
    required this.post_id,
    required this.post_title,
    required this.post_date,
    required this.post_description,
  }) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.value =
        TextEditingValue(text: widget.post_title.toString());
    _dateController.value = TextEditingValue(text: widget.post_date.toString());
    _descriptionController.value =
        TextEditingValue(text: widget.post_description.toString());
  }

  List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems =
      [
    FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Home"),
    FlutterVizBottomNavigationBarModel(icon: Icons.article, label: "Donation"),
    FlutterVizBottomNavigationBarModel(icon: Icons.location_on, label: "Place"),
    FlutterVizBottomNavigationBarModel(icon: Icons.credit_card, label: "Post"),
    FlutterVizBottomNavigationBarModel(
        icon: Icons.account_circle, label: "Account")
  ];

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
          "Post",
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PostListScreen(),
            //   ),
            // );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: flutterVizBottomNavigationBarItems
            .map((FlutterVizBottomNavigationBarModel item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
        backgroundColor: Color(0xffffffff),
        currentIndex: 0,
        elevation: 8,
        iconSize: 24,
        selectedItemColor: Color(0xff3a57e8),
        unselectedItemColor: Color(0xff9e9e9e),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {},
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Edit Post",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: _titleController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),

                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty){
                  //     return 'This field is required';
                  //   }
                  // },

                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              //   child: Text(
              //     "Upload a Photo",
              //     textAlign: TextAlign.start,
              //     overflow: TextOverflow.clip,
              //     style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 14,
              //       color: Color(0xff000000),
              //     ),
              //   ),
              // ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Align(
              //       alignment: Alignment.center,
              //       child: Padding(
              //         padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              //         child: Stack(
              //           alignment: Alignment.bottomRight,
              //           children: [
              //             ///***If you have exported images you must have to copy those images in assets/images directory.
              //             Image(
              //               image: NetworkImage(
              //                   "https://picsum.photos/250?image=9"),
              //               height: 100,
              //               width: 130,
              //               fit: BoxFit.cover,
              //             ),
              //             Container(
              //               margin: EdgeInsets.all(0),
              //               padding: EdgeInsets.all(0),
              //               width: 40,
              //               height: 40,
              //               decoration: BoxDecoration(
              //                 color: Color(0xff3a57e8),
              //                 shape: BoxShape.rectangle,
              //                 borderRadius: BorderRadius.zero,
              //                 border: Border.all(
              //                     color: Color(0x4d9e9e9e), width: 1),
              //               ),
              //               child: Icon(
              //                 Icons.add,
              //                 color: Color(0xffffffff),
              //                 size: 24,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Text(
              //       "Date",
              //       textAlign: TextAlign.start,
              //       overflow: TextOverflow.clip,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         fontStyle: FontStyle.normal,
              //         fontSize: 14,
              //         color: Color(0xff000000),
              //       ),
              //     ),
              //
              //
              //     Expanded(
              //       flex: 1,
              //       child: CalendarDatePicker(
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(DateTime
              //             .now()
              //             .year),
              //         lastDate: DateTime(2050),
              //         onDateChanged: (date) {},
              //       ),
              //     ),
              //   ],
              // ),

              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                    child: TextField(
                  controller: _dateController,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    hintText: "Select Date",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),

                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        _dateController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                )),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: _descriptionController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    hintText: "Description",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () async {
                      var response = await postService.updatePost(
                        docId: widget.post_id,
                        title: _titleController.text,
                        date: _dateController.text,
                        description: _descriptionController.text,
                      );
                      if (response.code != 200) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(response.message.toString()),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(response.message.toString()),
                              );
                            });
                      }
                      // };
                    },
                    color: Color(0xff3a57e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Color(0xff3a57e8), width: 1),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                    minWidth: 140,
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
