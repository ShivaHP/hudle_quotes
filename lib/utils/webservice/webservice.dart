import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:hudle_quotes/models/webservice/webservice_exception.dart';

class WebService{


  requestGet({String url=""})async{
    try {
    final Response _response=await get(Uri.parse(url));
      Map body=jsonDecode(_response.body);
      switch(_response.statusCode){
        case 200:
        return body;
        case 404:
        throw WebserviceException(body["statusMessage"]);
        default:
        throw WebserviceException("Some error occured");
      }
    }
    on WebserviceException catch(e){
      throw WebserviceException(e.message);
    }
     on SocketException catch (e) {
      print("socketexception:${e.message}");
      throw WebserviceException("Some network error occured");
    }
    on FormatException catch(e){
      print("FormatException:${e.message}");
      throw WebserviceException("Request is badly formatted");
    }
    on HttpException catch(e){
     print("HttpException:${e.message}");
      throw WebserviceException(e.message);
    }
    catch(_){
      throw WebserviceException("Some internal error occured");
    }
  }


}