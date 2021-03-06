import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirebaseFirestore firestore;
  CollectionReference bukuTamu;
  Stream bukuTamuStream;

  TextEditingController namaController;
  TextEditingController pesanController;

  init() {
    FirebaseAuth.instance
        .signInAnonymously()
        .then((UserCredential userCredential) {
      firestore = FirebaseFirestore.instance;
      bukuTamu = FirebaseFirestore.instance.collection('buku_tamu');
      bukuTamuStream =
          bukuTamu.orderBy('createdAt', descending: true).snapshots();
    });

    namaController = TextEditingController();
    pesanController = TextEditingController();
  }

  Future<bool> tambahPesan(String nama, String pesan) async {
    var result = bukuTamu
        .add({
          'nama': nama,
          'pesan': pesan,
          'createdAt': Timestamp.now(),
          'visibility': true
        })
        .then((value) => true)
        .catchError((e) => false);

    if (await result == true) {
      namaController.clear();
      pesanController.clear();
    }

    return result;
  }
}
