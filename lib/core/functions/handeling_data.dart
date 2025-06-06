import 'package:incidents/core/class/status_request.dart';
import 'package:flutter/material.dart';

handlingData(response) {
  if (response is StatusRequest) {
    debugPrint("Response StatusReq status:==handelingData======= ${response.toString()}");
    return response;
  } else {
    return StatusRequest.success;
  }
}
