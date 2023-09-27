import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:tryapp/category_model.dart';

class Network {
  String endpoint = "https://wasteapi2.soft-acc.com/GetShowCasedProduct";
  Future<List<CategoryModel>> getCategorywithProduct() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['Data'];
      return result.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final provider = Provider<Network>((ref) => Network());
