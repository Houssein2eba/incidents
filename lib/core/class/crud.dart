import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:incidents/core/class/status_request.dart';
import 'package:incidents/core/functions/checkconnection.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
    String url,
    Map data,
    Map<String, String> header,
  ) async {
    try {
      if (await checkConnection()) {
        var response = await http.post(
          Uri.parse(url),
          headers: header,
          body: data,
        );
        debugPrint(
          "Response status:=========//=========== ${response.statusCode}",
        );
        debugPrint("Response body:=========//=========== ${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = json.decode(response.body);
          return Right(reponseBody);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
    String url,
    Map<String, String> header,
  ) async {
    try {
      if (await checkConnection()) {
        var response = await http.get(Uri.parse(url), headers: header);
        debugPrint(
          "Response status:=========//=========== ${response.statusCode}",
        );
        debugPrint("Response body:=========//=========== ${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = json.decode(response.body);
          return Right(reponseBody);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
    String url,
    Map<String, String> header,
  ) async {
    try {
      if (await checkConnection()) {
        var response = await http.delete(Uri.parse(url), headers: header);
        debugPrint(
          "Response status:=========//=========== ${response.statusCode}",
        );
        debugPrint("Response body:=========//=========== ${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map reponseBody = json.decode(response.body);

          return  Right(reponseBody);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return Left(StatusRequest.serverException);
    }
  }
}
