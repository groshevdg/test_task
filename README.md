To run this project you need to create config file that's under git ignore.

res/config/development.json

content:

{
"base_url": "https://catfact.ninja/"
}

Then call code gen -> dart run build_runner build -d
Then run or debug app within dev env -> flutter run -t lib/main_dev.dart

It is done to increase security of the project. All sensitive info is hidden. It moves to
github secrets and puts into the config-file while running CI. So there's nothing stores in the code of the project. 