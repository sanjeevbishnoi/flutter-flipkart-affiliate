# fk_affiliate

Flutter library to fetch Deals of the day and Offers from Flipkart Affiliate API

## Getting Started
```
dependencies:
    fk_affiliate:
    git:
      url: https://github.com/sanjeevbishnoi/flutter-flipkart-affiliate
      ref: main
```
## Other Instructions
     just visit https://affiliate.flipkart.com/ and create account and in dashboard under API section just click on generate token, copy and paste your affiliate id and token into this /example/lib/fk/fk.dart file
     ```
     import 'package:fk_affiliate/fk_affiliate.dart';

fkAffiliate(Function(FKAffiliate) api) {
  FKAffiliate fkAffiliate = FKAffiliate.getInstance(config: {
    // change this with your affliate ID and Token
    fkAffiliateId: "YOUR AFFILIATE ID",
    fkAffiliateToken: "YOUR AFFILIATE TOKEN"
  });
  return api(fkAffiliate);
}

     ```




## Screenshot

![screenshot](https://github.com/sanjeevbishnoi/flutter-flipkart-affiliate/blob/main/screenshots/screen.png)
