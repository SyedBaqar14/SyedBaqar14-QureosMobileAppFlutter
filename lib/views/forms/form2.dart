

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/paint/CurveClipper.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:line_icons/line_icons.dart';

class FormTwo extends StatefulWidget {
  const FormTwo({Key? key}) : super(key: key);

  @override
  State<FormTwo> createState() => _FormTwoState();
}

enum SingingCharacter { xyz, abc, i, j}

enum SingingCharacterTwo { abcd, efgh}

class _FormTwoState extends State<FormTwo> {

  SingingCharacter? _character_selected = null;
  SingingCharacterTwo? _character_selected_two = null;

  TextEditingController gelaranController = TextEditingController();

  Future backAlertDialoge(BuildContext context){
    return showDialog(
        context: context,
        builder: (ctx){
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              height: 120,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Text("Attention!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                        Expanded(
                            flex: 6,
                            child: Text("You have unsaved changes that will be lost.\nAre you sure you want to leave?")),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: (){
                          },
                          child: Text("OK",style: TextStyle(color: Colors.red),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kUniversalColor,
          elevation: 0.0,
          title: Text("E-BIN",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36, color: Colors.white)),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                LineIcons.alternateLongArrowLeft,
                color: Colors.white,
                size: 30,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  color: kUniversalColor,
                  width: double.infinity,
                  height: 120,
                  child: Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 10),
                  child: Center(
                    child: Text("Lampiran\nPelanggan",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white)),
                  ),
                ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Jenis Premis *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              ListTile(
                title: const Text('xyz'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.xyz,
                  groupValue: _character_selected,
                  onChanged: (SingingCharacter? newValue) {
                    setState(() {
                      _character_selected = newValue;
                    });
                  },
                )
              ),
              SizedBox(width: 10,),
              ListTile(
                title: const Text('abc'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.abc,
                    groupValue: _character_selected,
                    onChanged: (SingingCharacter? newValue) {
                      setState(() {
                        _character_selected = newValue;
                      });
                    },
                  )
              ),
              SizedBox(width: 10,),
              ListTile(
                  title: const Text('abcd'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.i,
                    groupValue: _character_selected,
                    onChanged: (SingingCharacter? newValue) {
                      setState(() {
                        _character_selected = newValue;
                      });
                    },
                  )
              ),
              SizedBox(width: 10,),
              ListTile(
                  title: const Text('efg'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.j,
                    groupValue: _character_selected,
                    onChanged: (SingingCharacter? newValue) {
                      setState(() {
                        _character_selected = newValue;
                      });
                    },
                  )
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Alamat *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: gelaranController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                    hintText: '',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lokasi Rumah *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: gelaranController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                    hintText: '',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Poskod *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Daerah *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: gelaranController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                    hintText: '',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Negeri *',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              ),
              ListTile(
                  title: const Text('xyz'),
                  leading: Radio<SingingCharacterTwo>(
                    value: SingingCharacterTwo.abcd,
                    groupValue: _character_selected_two,
                    onChanged: (SingingCharacterTwo? newValue) {
                      setState(() {
                        _character_selected_two = newValue;
                      });
                    },
                  )
              ),
              SizedBox(width: 10,),
              ListTile(
                  title: const Text('abc'),
                  leading: Radio<SingingCharacterTwo>(
                    value: SingingCharacterTwo.efgh,
                    groupValue: _character_selected_two,
                    onChanged: (SingingCharacterTwo? newValue) {
                      setState(() {
                        _character_selected_two = newValue;
                      });
                    },
                  )
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: kUniversalColor,
                    onPressed: (){
                      Navigator.pushNamed(context, form3);
                    },
                  child: Text('Next', style: TextStyle(color: Colors.white),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
