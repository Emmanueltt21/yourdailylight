import 'dart:convert';

import 'package:yourdailylight/utils/StringsUtils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class SubscriptionModel with ChangeNotifier {
  /*final InAppPurchase connection = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> subscription;
  List<String> notFoundIds = [];
  List<ProductDetails> products = [];
  List<ProductDetails> albumproducts = [];
  List<PurchaseDetails> userPurchases = [];
  bool isAvailable = false;
  bool purchasePending = false;
  bool loading = true;
  String? queryProductError;
  bool isSubscribed = false;
  int albumid = 0;

  SubscriptionModel() {
    initInAppPurchases();
  }

  setAlbumid(int albumid) {
    this.albumid = albumid;
    notifyListeners();
  }

  //inapp purchases
  initInAppPurchases() {
    Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      subscription.cancel();
    }, onError: (error) {
      // handle error here.
    }) as StreamSubscription<List<PurchaseDetails>>;
    initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await connection.isAvailable();
    if (!isAvailable) {
      this.isAvailable = isAvailable;
      products = [];
      userPurchases = [];
      notFoundIds = [];
      purchasePending = false;
      loading = false;
      notifyListeners();
      return;
    }

    ProductDetailsResponse productDetailResponse =
        await connection.queryProductDetails(StringsUtils.productIds.toSet());
    if (productDetailResponse.error != null) {
      queryProductError = productDetailResponse.error!.message;
      this.isAvailable = isAvailable;
      products = productDetailResponse.productDetails;
      userPurchases = [];
      notFoundIds = productDetailResponse.notFoundIDs;
      purchasePending = false;
      loading = false;
      notifyListeners();
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      queryProductError = null;
      this.isAvailable = isAvailable;
      products = productDetailResponse.productDetails;
      userPurchases = [];
      notFoundIds = productDetailResponse.notFoundIDs;
      purchasePending = false;
      loading = false;
      notifyListeners();
      return;
    }

    connection.restorePurchases();

    *//*final QueryPurchaseDetailsResponse purchaseResponse =
        await connection.queryPastPurchases();
    if (purchaseResponse.error != null) {
      // handle query past purchase error..
    }
    final List<PurchaseDetails> verifiedPurchases = [];
    for (PurchaseDetails purchase in purchaseResponse.pastPurchases) {
      if (await _verifyPurchase(purchase)) {
        verifiedPurchases.add(purchase);
      }
    }*//*
    this.isAvailable = isAvailable;
    products = productDetailResponse.productDetails;
    // userPurchases = verifiedPurchases;
    notFoundIds = productDetailResponse.notFoundIDs;
    purchasePending = false;
    loading = false;
    if (userPurchases.length > 0) {
      isSubscribed = true;
    }
    notifyListeners();
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    print("subscriptions arrived here" + purchaseDetailsList.toString());
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        print("subscriptions arrived here pending" +
            purchaseDetails.status.toString());
      } else {
        print("subscriptions arrived here status is " +
            purchaseDetails.status.toString());
        if (purchaseDetails.status == PurchaseStatus.error) {
          print("subscriptions arrived here error" +
              purchaseDetails.status.toString());
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          print("subscriptions arrived here valid" +
              purchaseDetailsList.toString());
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }

        final InAppPurchaseAndroidPlatformAddition androidAddition = connection
            .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
        await androidAddition.consumePurchase(purchaseDetails);
        if (purchaseDetails.pendingCompletePurchase) {
          await connection.completePurchase(purchaseDetails);
        }
      }
    });
  }

  void deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify a purchase purchase details before delivering the product.
    userPurchases.add(purchaseDetails);
    print("userPurchases item = " + userPurchases[0].productID);
    purchasePending = false;
    isSubscribed = true;

    notifyListeners();
  }

  void handleError(IAPError error) {
    purchasePending = false;
    notifyListeners();
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }*/
}
