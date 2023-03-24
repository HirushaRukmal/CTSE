// import 'package:flutter/material.dart';
// import 'package:kind_heart/screens/dashboard/dashboard.dart';
// import 'package:kind_heart/screens/postManagement/addPost.dart';
// import 'package:kind_heart/screens/postManagement/viewPost.dart';
// import '../../widgets/FlutterVizBottomNavigationBarModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../models/postManagement/post.dart';
// import '../../services/postManagement/postService.dart';
//
// class PostListScreen extends StatelessWidget {
//
//   final Stream<QuerySnapshot> collectionReference = postService.readPosts();
//
//   List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems =
//       [
//     FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Home"),
//     FlutterVizBottomNavigationBarModel(icon: Icons.article, label: "Donation"),
//     FlutterVizBottomNavigationBarModel(icon: Icons.location_on, label: "Place"),
//     FlutterVizBottomNavigationBarModel(icon: Icons.credit_card, label: "Post"),
//     FlutterVizBottomNavigationBarModel(
//         icon: Icons.account_circle, label: "Account")
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffff),
//       appBar: AppBar(
//         elevation: 4,
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xff3a57e8),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//         ),
//         title: Text(
//           "Posts",
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontStyle: FontStyle.normal,
//             fontSize: 20,
//             color: Color(0xffffffff),
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Color(0xffffffff),
//           iconSize: 24,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DashboardScreen(),
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: flutterVizBottomNavigationBarItems
//             .map((FlutterVizBottomNavigationBarModel item) {
//           return BottomNavigationBarItem(
//             icon: Icon(item.icon),
//             label: item.label,
//           );
//         }).toList(),
//         backgroundColor: Color(0xffffffff),
//         currentIndex: 3,
//         elevation: 8,
//         iconSize: 24,
//         selectedItemColor: Color(0xff3a57e8),
//         unselectedItemColor: Color(0xff9e9e9e),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         onTap: (value) {},
//       ),
//       body: Padding(
//
//
//
//         padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
//                 child: Text(
//                   "Post List",
//                   textAlign: TextAlign.start,
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.normal,
//                     fontSize: 24,
//                     color: Color(0xff272727),
//                   ),
//                 ),
//               ),
//               ListView(
//                 scrollDirection: Axis.vertical,
//                 padding: EdgeInsets.all(0),
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 children: [
//                   Card(
//                     margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
//                     color: Color(0xffffffff),
//                     shadowColor: Color(0x4d939393),
//                     elevation: 1,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                       side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 0, horizontal: 16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Text(
//                                     "Manusath Derana",
//                                     textAlign: TextAlign.start,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.clip,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 16,
//                                       color: Color(0xff000000),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.all(0),
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Color(0xff3a57e8),
//                               shape: BoxShape.circle,
//                             ),
//                             child: IconButton(
//                               icon: Icon(Icons.visibility),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ViewPostScreen(),
//                                     ),
//                                 );
//                               },
//                               color: Color(0xffffffff),
//                               iconSize: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
//                     color: Color(0xffffffff),
//                     shadowColor: Color(0x4d939393),
//                     elevation: 1,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                       side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 0, horizontal: 16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Text(
//                                     "Food donation campaign",
//                                     textAlign: TextAlign.start,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.clip,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 16,
//                                       color: Color(0xff000000),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.all(0),
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Color(0xff3a57e8),
//                               shape: BoxShape.circle,
//                             ),
//                             child: IconButton(
//                               icon: Icon(Icons.visibility),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ViewPostScreen(),
//                                     ),
//                                 );
//                               },
//                               color: Color(0xffffffff),
//                               iconSize: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Card(
//                     margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
//                     color: Color(0xffffffff),
//                     shadowColor: Color(0x4d939393),
//                     elevation: 1,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                       side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 0, horizontal: 16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Text(
//                                     "Share food with others!",
//                                     textAlign: TextAlign.start,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.clip,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontStyle: FontStyle.normal,
//                                       fontSize: 16,
//                                       color: Color(0xff000000),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.all(0),
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Color(0xff3a57e8),
//                               shape: BoxShape.circle,
//                             ),
//                             child: IconButton(
//                               icon: Icon(Icons.visibility),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ViewPostScreen(),
//                                     ),
//                                 );
//                               },
//                               color: Color(0xffffffff),
//                               iconSize: 24,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   margin: EdgeInsets.all(0),
//                   padding: EdgeInsets.all(0),
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Color(0x1f27a5d6),
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Color(0x4d9e9e9e), width: 1),
//                   ),
//                   child: IconButton(
//                     icon: Icon(Icons.add),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddPostScreen(),
//                         ),
//                       );
//                     },
//                     color: Color(0xff212435),
//                     iconSize: 24,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
