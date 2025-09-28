import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final db = FirebaseFirestore.instance;

  var user1 = {
    "email": "example@gmail.com",
    "password": "11111111",
    "isMale": "true",
  };
  var user2 = {"email": "wwwww@gmail.com", "password": "33333333"};
  var x = {"camNumber": 4, "price": 98000};

  createCollection() {
    db.collection("users").add(user1);
    db.collection("products").add(x);
  }

  setDocument() {
    db.collection("users").doc("user1").set(user2);
  }

  updateDocument() {
    db.collection("users").doc("user1").update(user2);
  }

  getCollection() {
    db.collection("users").get().then((docData) {
      for (var doc in docData.docs) {
        log(doc.id, name: "ID is :");
      }
    });
  }
}
