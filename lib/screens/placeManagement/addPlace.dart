///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:kind_heart/screens/dashboard/dashboard.dart';
import 'package:kind_heart/screens/main/home.dart';
import 'package:kind_heart/screens/placeManagement/listplace.dart';
import 'package:kind_heart/widgets/FlutterVizBottomNavigationBarModel.dart';
import 'package:kind_heart/services/placeManagement/placeService.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

class AddPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlace();
  }
}

class _AddPlace extends State<AddPlace> {
  final _name = TextEditingController();
  final _contactno = TextEditingController();
  final _date = TextEditingController();
  final _location = TextEditingController();
  final _description = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
        controller: _name,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final contactField = TextFormField(
        controller: _contactno,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contact Number",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final dateField = Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      height: MediaQuery.of(context).size.width / 3,
      child: Center(
          child: TextField(
        controller: _date,
        //editing controller of this TextField
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: BorderSide(color: Color(0xff000000), width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: BorderSide(color: Color(0xff000000), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0),
            borderSide: BorderSide(color: Color(0xff000000), width: 1),
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
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          //icon of text field),
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
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(
                formattedDate); //formatted date output using intl package =>  2021-03-16
            setState(() {
              _date.text = formattedDate; //set output date to TextField value.
            });
          } else {}
        },
      )),
    );
    final locationField = TextFormField(
        controller: _location,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Location",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final descriptionField = TextFormField(
        controller: _description,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Description",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPlace(),
            ),
            (route) => false, //To disable back feature set to false
          );
        },
        child: const Text('View List of Places'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await PlaceService.addPlace(
                name: _name.text,
                contactno: _contactno.text,
                date: _date.text,
                location: _location.text,
                description: _description.text);
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
          }
        },
        child: Text(
          "Save",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPlace(),
            ),
          );
        }),
        title: const Text('Add Place'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Add a Place',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  nameField,
                  const SizedBox(height: 15.0),
                  contactField,
                  const SizedBox(height: 15.0),
                  dateField,
                  const SizedBox(height: 15.0),
                  locationField,
                  const SizedBox(height: 15.0),
                  descriptionField,
                  viewListbutton,
                  const SizedBox(height: 15.0),
                  SaveButon,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
