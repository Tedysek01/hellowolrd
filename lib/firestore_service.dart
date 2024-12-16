import 'package:cloud_firestore/cloud_firestore.dart';
import 'post.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Uložení postu do Firestore
  Future<void> savePost(Post post) async {
    await _db.collection('posts').add(post.toMap());
  }

  // Načtení všech postů z Firestore
  Stream<List<Post>> getPosts() {
    return _db.collection('posts').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Post.fromFirestore(doc.data())).toList());
  }
}
