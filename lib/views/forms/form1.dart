

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qureos/config/constants.dart';
import 'package:flutter_qureos/paint/CurveClipper.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:line_icons/line_icons.dart';

class FormOne extends StatefulWidget {
  const FormOne({Key? key}) : super(key: key);

  @override
  State<FormOne> createState() => _FormOneState();
}

enum SingingCharacter { xyz, abc}

enum SingingCharacterTwo { abcd, efgh}

class _FormOneState extends State<FormOne> {

  SingingCharacter? _character_selected = null;
  SingingCharacterTwo? _character_selected_two = null;

  TextEditingController gelaranController = TextEditingController();

  void onChangedCallBack(value){
    setState(() {

    });
  }

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
          title: Text("E-BIN",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36, color: Colors.white)),
          backgroundColor: kUniversalColor,
          elevation: 0.0,
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
                    child: Text("Maklumat\nPelanggan",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white)),
                  ),
                ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Jenis Pemilikan *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Gelaran *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                child: Text('Nama Perima *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                child: Text('Warganegara *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                padding: const EdgeInsets.all(8.0),
                child: Text('Jenis Pengenaian Diri *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                child: Text('No Kad Pengenalan\n(Baru/Lama/Polis/Passport) *',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
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
                child: Text('Jenis Telefon *',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                child: Text('No Telefon *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
                child: Text('Email *', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: kUniversalColor,
                    onPressed: (){
                      Navigator.pushNamed(context, form2);
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
