import 'package:hudle_quotes/models/quote/src/quote_exception.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/models/webservice/webservice_exception.dart';
import 'package:hudle_quotes/utils/webservice/endpoints.dart';
import 'package:hudle_quotes/utils/webservice/webservice.dart';

class QuoteRepository{

  Future<List<QuoteModel>> getquotes(int page)async{
    try {
      final response=await WebService().requestGet(url: "$getauthorquotes?page=$page");
      List data=response["results"];
       return data.map((e) => QuoteModel.fromJson(e)).toList();
    } on WebserviceException catch (e) {
      print("error:$e");
      throw QuoteException(e.message);
    }
    catch(e){
      print("error:$e");
      throw QuoteException("Some internal error occured");
    }
  
  }

  Future<QuoteModel> getquotebyid(String quoteid)async{
    try {
      final response=await WebService().requestGet(url: "$getauthorquotebyid/$quoteid");

      return QuoteModel.fromJson(response);
    } on WebserviceException catch (e) {
      throw QuoteException(e.message);
    }
    catch(_){
      throw QuoteException("Some unexpected error occured");
    }
 
  }

  Future<QuoteModel> getrandomquote()async{
    try {
      final response=await WebService().requestGet(url: getrandomauthorquote);
    
      return QuoteModel.fromJson(response);
    } on WebserviceException catch (e) {
      throw QuoteException(e.message);
    }
    catch(_){
      throw QuoteException("Some unexpected error occured");
    }
  
  }
}