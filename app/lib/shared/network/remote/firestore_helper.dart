import 'package:cloud_firestore/cloud_firestore.dart';

//ToDo: Class_FirebaseHelper....................................................
class FirestoreHelper {
  FirestoreHelper._();
  static final instance = FirestoreHelper._();
  final _fireStore = FirebaseFirestore.instance;

//!~> setData >================================================================<
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = _fireStore.doc(path);
    // ignore: avoid_print
    print('setData :: Request Data: $data');
    await reference.set(data);
  }

//!~> deleteData >=============================================================<
  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    // ignore: avoid_print
    print(' deleteData :: Path: $path');
    await reference.delete();
  }

//!~> documentsStream >========================================================<
  Stream<T> documentsStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) {
    final reference = _fireStore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

//!~> collectionsStream >======================================================<
  Stream<List<T>> collectionsStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder,
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  //! firestore.collection('posts').where('tags', '!=', null)
  bool isFavoriteArrow({required user}) {
    Query<Map<String, dynamic>> query = _fireStore
        .collection('users/${user?.uid}/followingArrow/')
        .where('isFav', isEqualTo: true);
    //!db.collection.find({ "fieldToCheck" : { $exists : true, $not : null } })
    // _fireStore.collection.
    //! db.getCollection('collectionName').findOne({"fieldName" : {$ne: null}})
    // _fireStore.collection("").where(field)
    // .getCollection('users/${user?.uid}/followingArrow/').findOne({"isFav":{true}});
    // if(query){

    // }
    return true;
  }
}
