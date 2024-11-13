import 'package:api_call_without_model/services.dart';
import 'package:flutter/material.dart';

class GetMethodWithoutModel extends StatefulWidget {
  const GetMethodWithoutModel({super.key});

  @override
  State<GetMethodWithoutModel> createState() => _GetMethodWithoutModelState();
}

class _GetMethodWithoutModelState extends State<GetMethodWithoutModel> {
  dynamic postModelData = [];
  bool isLoading = false;

  getPost() {
    isLoading = true;
    ApiService().getRequestWithoutModel().then((value) {
      setState(() {
        postModelData = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      // ignore: avoid_print
      print(error);
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Method Without Model"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postModelData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                          userInfo(index, "Name : ",
                          postModelData[index]['name'].toString()),
                          userInfo(index, "Email : ",
                          postModelData[index]['email'].toString()),
                          userInfo(index, "Street : ",
                          postModelData[index]['street'].toString()),
                          userInfo(index, "City : ",
                          postModelData[index]['city'].toString()),
                          userInfo(index, "Zipcode : ",
                          postModelData[index]['zipcode'].toString()),
                          userInfo(index, "Phone : ",
                          postModelData[index]['phone'].toString()),
                          userInfo(index, "Website : ",
                          postModelData[index]['website'].toString()),
                    ],
                  ),
                );
              }),
    );
  }

  Row userInfo(int index, name, value) {
    return Row(children: [
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    ]);
  }
}
