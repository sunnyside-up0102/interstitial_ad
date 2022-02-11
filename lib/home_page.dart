import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyHomePage extends StatefulWidget{
  const HomePage({key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;


  @override
  void didChangeDependencies() {
    //TODO implement didChangeDependencies
    super.didChangeDependencies();
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            this.interstitialAd = ad;
          });
          print("Ad Loaded");
        },
        onAdFailedToLoad: (error) {

          print("Interstitial Failed to load");
        },
      ),
    );

  }


  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
    title: Text("Google Ads"),
    ),
    body: Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {

            if (isLoaded) {
              interstitialAd!.show();
            }
          },
          child: Text("Show"),
        ),
      ),

      ),
    );
  }
}
