# okra-ios-sdk

This is an ios library for implementing okra widget
### Get Started
This library would help you add Okra widget to you native ios app in no time. All you need to do is ...
### Install

### Usage
``` swift
//Okra.create() static method takes in a UIViewController parameter and also and OkraOption parameter
let okraOptions = OkraOptions(isWebview: true, key: "c81f3e05-7a5c-5727-8d33-1113a3c7a5e4", token: "5d8a35224d8113507c7521ac", products: ["auth","transactions"], env: Environment.sandbox, clientName: "Basey")
Okra.create(baseController: self, okraOptions : okraOptions)
```

## OkraOptions

|Name                   | Type           | Required            | Default Value       | Description         |
|-----------------------|----------------|---------------------|---------------------|---------------------|
|  `isWebview `         | `boolean`      | true                |  true               | 
|  `key `               | `String`       | true                |  undefined          | Your public key from Okra.
|  `token`              | `String`       | true                |  undefined          | Your pubic Key from Paystack. Use test key for test mode and live key for live mode
|  `products`           | `ArrayList<Enums.Product>`| true     |  undefined          | The Okra products you want to use with the widget.
|  `env`                | `Enums.Environment`| true            |  undefined          | 
|  `clientName`         | `String`       | true                |  undefined          | Name of the customer using the widget on the application
|  `webhook`            | `String`       | true                |  undefined          | The Url that Okra send the client's data to.
