# From A Bottle / Drinksterr

- [Login page design](https://www.nintyzeros.com/2021/01/flutter-login-signup.html)
- [Register page design](https://www.nintyzeros.com/2021/01/flutter-login-signup.html)
- [Forgot password page design](https://www.nintyzeros.com/2021/01/flutter-login-signup.html)

Used [this](https://github.com/danvick/flutter_boilerplate) boilerplate.  

## Generate freezed files  
```
flutter pub run build_runner build
```  

## iOS 16 (public beta) release on iPhone
```
pod cache clean --all
pod deintegrate
pod setup
pod install
pod repo update
sudo gem install cocoapods
```

## Docs:
You actually either:

Don't want to display that ugly back button ( :] ), and thus go for : `AppBar(...,automaticallyImplyLeading: false,...); `  

Don't want the user to go back - replacing current view - and thus go for: `Navigator.pushReplacementNamed(## your routename here ##);`

Don't want the user to go back - replacing a certain view back in the stack - and thus use: `Navigator.pushNamedAndRemoveUntil(## your routename here ##, f(Route<dynamic>)→bool);` where f is a function returning truewhen meeting the last view you want to keep in the stack (right before the new one);  

Don't want the user to go back - EVER - emptying completely the navigator stack with: `Navigator.pushNamedAndRemoveUntil(context, ## your routename here ##, (_) => false);`