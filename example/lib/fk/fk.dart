import 'package:fk_affiliate/fk_affiliate.dart';

fkAffiliate(Function(FKAffiliate) api) {
  FKAffiliate fkAffiliate = FKAffiliate.getInstance(config: {
    // change this with your affliate ID and Token
    fkAffiliateId: "ersanjeev",
    fkAffiliateToken: "18c86d2d9da04aa0ac9a8f38099639e0"
  });
  return api(fkAffiliate);
}
