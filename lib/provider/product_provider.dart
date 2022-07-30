import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/modal/product_item.dart';
import 'package:shopping_app/services/getapidata.dart';

// final List<Product> initialData = List.generate(
//   10,
//   (index) => Product(id: 1, title: 'title', price: 21, description: 'description', image: 'image', rating: Rating(rate: 12, count: 12)),
// );
// final List<Product> initialData = () async => await RemoteServices().getProductData() as List<Product>;

class ProductProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  List<Product> _product = [];
  double _totalprice = 0;
  double get totalprice => _totalprice;

  List<Product> get product => _product;

  final List<Product> _mylist = [];

  List<Product> get mylist => _mylist;

  void addToList(Product product) {
    _mylist.add(product);
    countPrice();
    notifyListeners();
  }

  void removeFromList(Product product) {
    _mylist.remove(product);
    countPrice();
    notifyListeners();
  }

  setProductList(List<Product> list) {
    _product = list;
    notifyListeners();
  }

  countPrice() {
    _totalprice = 0;
    _mylist.forEach((element) {
      _totalprice += element.price;
    });
  }

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future Logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
