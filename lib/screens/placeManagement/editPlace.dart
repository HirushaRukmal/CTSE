///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:kind_heart/screens/placeManagement/addplace.dart';
import 'package:kind_heart/widgets/FlutterVizBottomNavigationBarModel.dart';
import 'package:kind_heart/screens/placeManagement/listplace.dart';
import 'package:kind_heart/models/placeManagement/place.dart';
import 'package:kind_heart/services/placeManagement/placeService.dart';

class EditPlace extends StatefulWidget {
  final Place? place;
  EditPlace({this.place});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPlace();
  }
}

class _EditPlace extends State<EditPlace> {
  final _docid = TextEditingController();
  final _name = TextEditingController();
  final _contactno = TextEditingController();
  final _date = TextEditingController();
  final _location = TextEditingController();
  final _description = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState

    _docid.value = TextEditingValue(text: widget.place!.uid.toString());
    _name.value = TextEditingValue(text: widget.place!.name.toString());
    _contactno.value =
        TextEditingValue(text: widget.place!.contactno.toString());
    _date.value = TextEditingValue(text: widget.place!.date.toString());
    _location.value = TextEditingValue(text: widget.place!.location.toString());
    _description.value =
        TextEditingValue(text: widget.place!.description.toString());
  }

  @override
  Widget build(BuildContext context) {
    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

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
    final dateField = TextFormField(
        controller: _date,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Date",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

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
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Place'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await PlaceService.updatePlace(
                docId: _docid.text,
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
          "Update",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
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
        title: const Text('Edit Place'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Edit Place',
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
                  // DocIDField,
                  // const SizedBox(height: 25.0),

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
                  const SizedBox(height: 45.0),
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
