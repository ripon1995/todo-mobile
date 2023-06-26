import 'package:flutter_basic/app/environments/dev_env.dart';
import 'package:flutter_basic/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.DEV;
  await dotenv.load(fileName: "assets/.env", mergeWith: devEnv);
  main_app();
}
