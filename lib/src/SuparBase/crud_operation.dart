import 'package:supabase_flutter/supabase_flutter.dart';

class CRUD{
  final supabaseCRUD = Supabase.instance.client;

  //Create a file
  createFile(String docName, String subDoc1, int subDoc2, bool subDoc3) async{
  try{
      await supabaseCRUD.from(docName).insert({
        'name': subDoc1,
        'age': subDoc2,
        'isVerified': subDoc3,
      });
    }catch(e){
    print(e.toString());
  }
  }

  //read a file
  readFile(String docName, String subDoc1, int subDoc2, bool subDoc3) async{
    try{
      await supabaseCRUD.from(docName).select('name');

      await supabaseCRUD.from(docName).insert({
        'name': subDoc1,
        'age': subDoc2,
        'isVerified': subDoc3,
      });
    }catch(e){
      print(e.toString());
    }
  }

  //Update a file
  updateFile(String docName, String subDoc1, String subDoc2) async{
    try{

      await
      supabaseCRUD.from(docName)
          .update({ 'name': subDoc1 })
          .match({ 'name': subDoc2 });


    }catch(e){
      print(e.toString());
    }
  }

  // delete a file
  deleteFile(String docName, bool subDoc3) async{
    try{
      await supabaseCRUD.from(docName).delete().match({'name': subDoc3});

    }catch(e){
      print(e.toString());
    }
  }
}