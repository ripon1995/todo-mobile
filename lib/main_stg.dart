import 'package:flutter_basic/app/environments/stg_env.dart';
import 'package:flutter_basic/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.STG;
  await dotenv.load(fileName: "assets/.env", mergeWith: stgEnv);
  main_app();
}
