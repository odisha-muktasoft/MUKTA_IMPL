import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/utils/common_methods.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../data/repositories/core_repo/core_repository.dart';
import '../../models/file_store/file_store_model.dart';
import '../../utils/notifiers.dart';

class FilePickerDemo extends StatefulWidget {
  final Function(List<FileStoreModel>?, List<WorkflowDocument>?) callBack;
  final String? moduleName;
  final List<String>? extensions;
  final GlobalKey? contextKey;

  const FilePickerDemo({Key? key, required this.callBack, this.moduleName, this.extensions, this.contextKey}) : super(key: key);
  @override
  FilePickerDemoState createState() => FilePickerDemoState();
}

class FilePickerDemoState extends State<FilePickerDemo> {
  List<dynamic> _selectedFiles = <dynamic>[];
  final List<FileStoreModel> _fileStoreList = <FileStoreModel>[];
  String? _extension;
  final bool _multiPick = true;
  final FileType _pickingType = FileType.custom;
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  FileUploadStatus fileUploading = FileUploadStatus.NOT_ACTIVE;
  List<WorkflowDocument>ss=[];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    try {
      var paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: widget.extensions ?? ((_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null),
      ))
          ?.files;

      if(paths != null){
        var isNotValidSize = false;
        for(var path in paths){
          if (!(await CommonMethods.isValidFileSize(path.size))) isNotValidSize = true;
        }

        if(isNotValidSize){
          Notifiers.getToastMessage(context, i18.common.accountType, 'ERROR');
          return;
        }
        if(_multiPick){
          _selectedFiles.addAll(paths);
        }else{
          _selectedFiles = paths;
        }

        List<File> files = [];
        if(!kIsWeb){
          files = paths.map((e) => File(e.path ?? '')).toList();
        }

        uploadFiles(files);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
    });
  }

  uploadFiles(List<File> files) async {
    try{
      setState(() {
        fileUploading = FileUploadStatus.STARTED;
      });
      var response = await CoreRepository().uploadFiles(files, widget.moduleName !);
      setState(() {
        fileUploading = FileUploadStatus.COMPLETED;
      });
      _fileStoreList.addAll(response);
      if(_selectedFiles.isNotEmpty) {
//List<WorkflowDocument>ss=[];
ss.clear();
      for(int i=0;i<files.length;i++){

    ss.add(WorkflowDocument(
      
      tenantId: _fileStoreList[i].tenantId,
      fileStore: _fileStoreList[i].fileStoreId,
      documentType: path.extension(files[i].path),
      documentUid: path.basename(files[i].path),
      documentAdditionalDetails: DocumentAdditionalDetails(
        fileName: path.basename(files[i].path),
        
        fileType: "img_measurement_book",
        tenantId: _fileStoreList[i].tenantId,
        
      )
    ));

      }

        widget.callBack(_fileStoreList,ss);
      }
    }catch(e){
      setState(() {
        fileUploading = FileUploadStatus.NOT_ACTIVE;
      });
      Notifiers.getToastMessage(context, e.toString(), 'ERROR');
    }
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? '${AppLocalizations.of(context).translate(i18.common.reEnterAccountNo)}'
              : '${AppLocalizations.of(context).translate(i18.common.attachments)}')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
    });
  }

  _getConatiner(constraints, context) {
    return [
      Container(
          width: constraints.maxWidth > 760
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 18, bottom: 3),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("${AppLocalizations.of(context).translate(i18.common.aadhaarNumber)}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                  color: Theme.of(context).primaryColorDark)))),
      Container(
          width: constraints.maxWidth > 760
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width,
          // height: 50,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 4.0, right: 16.0, top: 4.0 , bottom: 4.0),
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0XFFD6D5D4)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        )
                        ),
                    onPressed: () => selectDocumentOrImage(),
                    child: Text(
                      "${AppLocalizations.of(context).translate(i18.common.accountNo)}",
                      style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16),
                    ),
                  )),
            _selectedFiles.isNotEmpty ?
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 3,
                    children : List.generate(_selectedFiles.length, (index) => Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 2,
                      children: [
                        Text(_selectedFiles[index] is File ? (path.basename(_selectedFiles[index].path)) : _selectedFiles[index].name,
                        maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(5),
                            onPressed: ()=> onClickOfClear(index), icon: const Icon(Icons.cancel))
                      ],
                    )).toList()),
              ),
            )
            : Text(
                "${AppLocalizations.of(context).translate(i18.common.backToHome)}",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              Row(
                children: [
                  // Text("${AppLocalizations.of(context).translate(i18.common.backToHome)}",style: const TextStyle(
                  //     color: Colors.black
                  // ),),
                  fileUploading==FileUploadStatus.STARTED?
                  Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(),
                  )
                       :fileUploading==FileUploadStatus.COMPLETED?Icon(Icons.check_circle,color: Theme.of(context).primaryColor,)
                       :const SizedBox(),
                ],
              )
            ],
          ))
    ];
  }

  void onClickOfClear(int index){
    setState(() {
      _selectedFiles.removeAt(index);
      fileUploading = FileUploadStatus.NOT_ACTIVE;
    if(index < _fileStoreList.length)  _fileStoreList.removeAt(index);
    });
    widget.callBack(_fileStoreList,ss);
  }

  void reset(){
    setState(() {
      fileUploading = FileUploadStatus.NOT_ACTIVE;
    });
    _selectedFiles.clear();
    _fileStoreList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SingleChildScrollView(
                child: Container(
                  key: widget.contextKey,
                  margin: constraints.maxWidth > 760 ? const EdgeInsets.only(
                      top: 5.0, bottom: 5, right: 10, left: 10) : const EdgeInsets.only(
                      top: 5.0, bottom: 5, right: 0, left: 0),
                  child: constraints.maxWidth > 760
                      ? Row(children: _getConatiner(constraints, context))
                      : Column(children: _getConatiner(constraints, context))
                  ,
                ),
              )));
    });
  }


  Future<void> selectDocumentOrImage() async {
    FocusScope.of(context).unfocus();
    var list = [
      {
        "label" :  i18.common.camera,
        'icon' : Icons.camera_alt
      },
      {
        "label" :  i18.common.fileManager,
        'icon' : Icons.drive_folder_upload
      },
    ];

    if(kIsWeb){
      _openFileExplorer();
      return ;
    }

    callBack(String value){
      Navigator.pop(context);
      if(list.first['label'] == value){
        imagePath(context, selectionMode: 'camera');
      }else{
        imagePath(context, selectionMode: 'filePicker');
      }
    }

    await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
         return Padding(
           padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children : [
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 8),
                 alignment: Alignment.center,
                 child: Container(
                   height: 2,
                   width: 30,
                   color: Colors.grey,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 16, top: 5),
                 child: Text(AppLocalizations.of(context).translate(i18.common.chooseAnAction), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: list.map((e) => _buildIcon(e['label'] as String,e['icon'] as IconData, callBack)).toList()
             ),
           ]
           ),
         );
        });
  }


  Future<void> imagePath(BuildContext context, { required String selectionMode}) async {
    FocusScope.of(context).unfocus();
    try {
      if (selectionMode == 'camera') {
        final pickedFile = await _picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          String newPath = path.join(path.dirname(pickedFile.path), '${CommonMethods.getRandomName()}${path.extension(pickedFile.path)}');
          final File file = await File(pickedFile.path).copy(newPath);
          if (file != null) {
            if (!(await CommonMethods.isValidFileSize(await file.length()))){
              Notifiers.getToastMessage(context, i18.common.fileSize, 'ERROR');
              return;
            }
            if(_multiPick){
              _selectedFiles.addAll([file]);
            }else{
              _selectedFiles = [file];
            }
            uploadFiles(<File>[file]);
            return;
          } else {
            return;
          }
        } else {
          _openFileExplorer();
        }
      } else {
        _openFileExplorer();
      }
    } on Exception catch (e) {
      Notifiers.getToastMessage(context, e.toString(), 'ERROR');
    }
  }


  Widget _buildIcon(String label, IconData icon, Function(String) callBack){
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 8,
      children: [
       IconButton(onPressed: ()=> callBack(label), iconSize: 45, icon: Icon(icon)),
        Text( AppLocalizations.of(
            context)
            .translate(label),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15
        ),
        )
      ],
    );
  }
}