# BFLogger

This library is for developer who need to collect the log from their apps in a web server. You can easily start a server that receive log from your app with this library.

## Requirements

You need a backend server ready to receive the log and collect them.

## Installation

BFLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BFLogger'
```

Add your url to post log online using this keyword on the info.plist

```
BFLogger_base_url
```

# How to use

First you need to declare the endpoint you are using for collecting remote logs.

You can do it by adding the url in your app-info.plist with this key:

```
BFLogger_base_url
```

You can also use this macro (just put in the prefix file) to send online every NSLog you have added to your server.


```C
#define NSLog(...) [[LogManager sharedManager] postLog:[NSString stringWithFormat:__VA_ARGS__]]
```


## Author

Francesco Novelli [@iF9](https://twitter.com/if9)

## License

BFLogger is available under the MIT license. See the LICENSE file for more info.
