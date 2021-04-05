# Okra Widget iOS SDK
![alt text](https://files.readme.io/f0c57b5-ios-black.svg)

iOS SDK for implementing the Okra widget - Okra is a safe and secure web drop-in module and this library provides a front-end web (also available in [Android](https://github.com/okraHQ/okra-android-sdk) and [JavaScript](https://github.com/okraHQ/okra-js)) SDK for [account authentication](https://docs.okra.ng/docs/widget-properties) and [payment initiation](https://docs.okra.ng/docs/creating-a-charge) for each bank that Okra [supports](https://docs.okra.ng/docs/bank-coverage). 

## Try the demo
Checkout the [widget flow](https://okra.ng/) to view how the Okra Widget works. *Click "See How it Works"*

## Before getting started
- Checkout our [get started guide](https://docs.okra.ng/docs/get-started-with-okra) to create your developer account and retrieve your Client Token, API Keys, and Private Keys.
- Create a [sandbox customer](https://docs.okra.ng/docs/creating-sandbox-customers), so you can get connecting immediately. 

*Bonus Points*
- Setup [Slack Notifications](https://docs.okra.ng/docs/slack-integration) so you can see your API call statuses and re-run calls in real-time!

## Example
 
 To run the example project, clone the repo, and open `OkraWidget.xcworkspace` in the Example directory with **Xcode**, run and build and you are good to go!
 
- In `Viewcontroller.swift` put the key and token you get from your Okra dashboard

```swift
   let dataDictionary:[String:Any] = ["isWebview":true,
                                           "key":"key",
                                           "token":"token",
                                           "products": ["auth","transactions"],
                                           "env":Environment.production.rawValue,
                                           "clientName":"Basey",
                                           "source":"ios",
                                           "color":"#953ab7",
                                           "limit":"24",
                                           "guarantors":guarantor,
                                           "corporate":false,
                                           "connectMessage":"Which account do you want to connect with?",
                                           "callback_url":"",
                                           "redirect_url":"",
                                           "logo":"https://cdn.okra.ng/images/icon.svg",
                                           "widget_success":"Your account was successfully linked to Okra, Inc",
                                           "widget_failed":"Which account do you want to connect with?",
                                           "currency":"NGN",
                                           "exp":"2021-08-06",
                                           "manual":false,
                                           "success_title":"Successfully connect bank",
                                           "success_message":"You have successfully connected your bank account"
        ]
        
        Okra.create(baseController: self, dataDictionary: dataDictionary, okraHandlerDelegate: self)
```

## Development Requirements
- iOS 10.0+
- Swift: 5.1
- Xcode Version: 10.0+

## Installation
 
OkraWidget is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:
 
 - Simply add the following line to your <code>Podfile</code>
```ruby
  pod 'OkraWidget'
```

- Run command
```
  pod install
```
- Write Import statement on your source file
```swift
  import OkraWidget
```
 
 ### The Basis Of Usage for 4.0.5 and below

```swift

import OkraWidget
class ViewController: UIViewController,OkraHandlerDelegate {
    
    
    
    let launchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
    }
    
    @objc func showExample(){
        
    let okraOptions = OkraOptions(isWebview: true, key: "key", token: "token", products: ["auth","transactions"], env: Environment.production.rawValue, clientName: "Basey")
        Okra.create(baseController: self, okraOptions : okraOptions, okraHandlerDelegate: self)
        
    }
    
    func onSuccess(data: [String : Any]) {
        print("Succesfully connected bank \(data)")
    }
    
    func onError(data: [String : Any]) {
        print("Error Receieved \(data)")
    }
    
    func onClose() {
        print("Closed")
    }
  
}

```
 
 ### The Basis Of Usage for 4.0.6 and above

```swift

import OkraWidget

class ViewController: UIViewController,OkraHandlerDelegate {
    
    
    
    let launchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
    }
    
    @objc func showExample(){

        
        let  guarantor:[String:Any] = ["status":true,"message":"hello nurse","number":1]
        let dataDictionary:[String:Any] = ["isWebview":true,
                                           "key":"key",
                                           "token":"token",
                                           "products": ["auth","transactions"],
                                           "env":Environment.production.rawValue,
                                           "clientName":"Basey",
                                           "source":"ios",
                                           "color":"#953ab7",
                                           "limit":"24",
                                           "guarantors":guarantor,
                                           "corporate":false,
                                           "connectMessage":"Which account do you want to connect with?",
                                           "callback_url":"",
                                           "redirect_url":"",
                                           "logo":"https://cdn.okra.ng/images/icon.svg",
                                           "widget_success":"Your account was successfully linked to Okra, Inc",
                                           "widget_failed":"Which account do you want to connect with?",
                                           "currency":"NGN",
                                           "exp":"2021-08-06",
                                           "manual":false,
                                           "success_title":"Successfully connect bank",
                                           "success_message":"You have successfully connected your bank account"
        ]
        
        Okra.create(baseController: self, dataDictionary: dataDictionary, okraHandlerDelegate: self)
        
    }
    
    func onSuccess(data: [String : Any]) {
        print("Succesfully connected bank \(data)")
    }
    
    func onError(data: [String : Any]) {
        print("Error Receieved \(data)")
    }
    
    func onClose() {
        print("Closed")
    }
  
}


```
  

## OkraOptions

|Name                   | Type           | Required            | Default Value       | Description         |
|-----------------------|----------------|---------------------|---------------------|---------------------|
|  `isWebview `         | `boolean`      | true                |  true               | 
|  `key `               | `String`       | true                |  undefined          | Your public key from Okra.
|  `token`              | `String`       | true                |  undefined          | Your client token key from Okra.
|  `payment`            | `Booelan`      | false               |                     | Whether you want to initiate a payment (https://docs.okra.ng/docs/payments)
|  `charge `            | `Object`       | false               |                     | Payment charge opject (https://docs.okra.ng/docs/creating-a-charge)
|  `products`           | `ArrayList<Enums.Product>`| true     |  undefined          | The Okra products you want to use with the widget.
|  `env`                | `Enums.Environment`| true            |  undefined          | 
|  `clientName`         | `String`       | true                |  undefined          | Name of the customer using the widget on the application
|  `webhook`            | `String`       | true                |  undefined          | The Url that Okra send the client's data to.

View a complete list of customizable options [here](https://docs.okra.ng/docs/widget-properties)

## Data Dictionary

### Auth
Field | Required | Description
---|---|---
**id**<br>`ObjectID` | **Yes** | Unique Auth ID (Unique Okra Identifier)
**validated**<br>`Boolean` | **Yes** | Customer authentication status
**bank**<br>`ObjectID` | **Yes** | Unique Bank ID (Unique Okra Identifier)
**customer**<br>`ObjectID` | **Yes** | Unique Customer ID (Unique Okra Identifier)
**record**<br>`ObjectID` | **Yes** | Unique Record ID (Unique Okra Identifier)
**owner**<br>`ObjectID` | **Yes** | Unique Company ID (Unique Okra Identifier) (Your Client Token)
**created_at**<br>`Object` | **Yes** | Date Auth was fetched
**last_updated**<br>`Object` | **Yes** | Last Date Auth was fetched

### Balance
Field | Required | Description
---|---|---
**id**<br>`ObjectID` | **Yes** | Unique Balance ID (Unique Okra Identifier)
**available_balance**<br>`Integer` | **Yes** | Amount of available funds in account
**ledger_balance**<br>`Integer` | **Yes** | Closing balance of account
**currency**<br>`String` | **Yes** | The currency of the account
**connected**<br>`Boolean` | **Yes** | Customer connection status (Did they choose to connect this account to you)
**env**<br>`String` | **Yes** | Okra API Env the transaction was pulled from **production** or **production-sandbox**
**bank**<br>`ObjectID` | **Yes** | Unique Bank ID (Unique Okra Identifier)
**accounts**<br>`ObjectID` | **Yes** | Unique Account ID (Unique Okra Identifier)
**customer**<br>`ObjectID` | **Yes** | Unique Customer ID (Unique Okra Identifier)
**record**<br>`Array of ObjectID` | **Yes** | Unique Record ID (Unique Okra Identifier)
**created_at**<br>`Object` | **Yes** | Date Balance was fetched
**last_updated**<br>`Object` | **Yes** | Last Date Balance was fetched

### Identity
Field | Required | Description
---|---|---
**id**<br>`ObjectID` | **Yes** | Unique Identifier ID (Unique Okra Identifier)
**firstname**<br>`String` | **Yes** | Customer First Name
**middlename**<br>`String` | **Yes** | Customer Middle Name
**lastname**<br>`String` | **Yes** | Customer Last Name
**next_of_kins**<br>`Identity Object` | **Yes** | Customer Next of Kins
**dob**<br>`Date` | **Yes** | Customer Date of Birth
**verified**<br>`String` | **Yes** | BVN Validation status
**score**<br>`String` | **Yes** | Unique Okra Score
**dti**<br>`String` | **Yes** | Customer Debt to Income Score
**fullname**<br>`String` | **Yes** | Customer Fullname
**company_name**<br>`String` | **Yes | Company Name if Corporate Identity
**nin**<br>`String` | **Yes** | Customer NIN Number
**national_id**<br>`String` | **Yes** | Customer National ID Number
**drivers_lisence**<br>`String` | **Yes** | Customer Driver's License Number
**nimc**<br>`String` | **Yes** | Customer National Identity Management Commission (NIMC) Number
**voters_id**<br>`String` | **Yes** | Customer Voter's ID Number
**rc_number**<br>`String` | **Yes** | Company's Registered Company Number if Corporate Identity
**phone**<br>`Array of String` | **Yes** | Customer Phone Number
**last_login**<br>`String` | **Yes** | Customer Last Login via Okra
**email**<br>`Array of String` | **Yes** | Customer Email address
**address**<br>`Array of String` | **Yes** | Customer
**mothers_maiden**<br>`String` | **Yes** | Customer Mother's Maiden Name
**photo_ids**<br>`Array of Object` | **Yes** | Customer's photo ID
**env**<br>`String` | **Yes** | Okra API Env the transaction was pulled from **production** or **production-sandbox**
**bank**<br>`ObjectID` | **Yes** | Unique Bank ID (Unique Okra Identifier)
**accounts**<br>`ObjectID` | **Yes** | Unique Account ID (Unique Okra Identifier)
**customer**<br>`ObjectID` | **Yes** | Unique Customer ID (Unique Okra Identifier)
**record**<br>`Array of ObjectID` | **Yes** | Unique Record ID (Unique Okra Identifier)
**created_at**<br>`Object` | **Yes** | Date Balance was fetched
**last_updated**<br>`Object` | **Yes** | Last Date Balance was fetched

### Transaction
Field | Required | Description
---|---|---
**id**<br>`ObjectID` | **Yes** | Unique Transaction ID (Unique Okra Identifier)
**debit**<br>`Integer` | **No**| Amount deducted from account 
**credit**<br>`Integer` | **No**| Amount credited to account
**trans_date**<br>`Date` | **Yes** | Date transaction occurred
**cleared_date**<br>`Date` | **Yes** | Date transaction cleared at bank
**unformatted_trans_date**<br>`String` | **Yes** | Date transaction occurred (from bank)
**unformatted_cleared_date**<br>`String` | **Yes** | Date transaction cleared (from bank)
**branch**<br>`String` | **No**| Branch transactions occurred
**ref**<br>`String` | **No**| Bank reference ID (from bank)
**env**<br>`String` | **Yes** | Okra API Env the transaction was pulled from **production** or **production-sandbox**
**code**<br>`String` | **No**| Bank Code (from bank)
**benefactor**<br>`ObjectID` | **No**| Customer ID of sender (within Okra)
**code**<br>`String` | **No**| Bank Code (from bank)
**notes**<br>`Object` | **Yes** | Breakdown of Narrative from bank
**bank**<br>`ObjectID` | **Yes** | Unique Bank ID (Unique Okra Identifier)
**account**<br>`ObjectID` | **Yes** | Unique Account ID (Unique Okra Identifier)
**record**<br>`Array of ObjectID` | **Yes** | Unique Record ID (Unique Okra Identifier)
**created_at**<br>`Object` | **Yes** | Date transactions was fetched
**last_updated**<br>`Object` | **Yes** | Last Date transactions was fetched

### Notes Data Dictionary
Field | Required | Description
---|---|---
**desc**<br>`String` | **Yes** | Narrative / Description of transaction (combination of bank and user entered information)
**topics**<br>`Array of String` | **Yes** | Topics within the desc
**places**<br>`Array of String` | **Yes** | Places mentioned within the desc
**people**<br>`Array of String` | **Yes** | People mentioned within the desc
**actions**<br>`Array of String` | **Yes** | Actions mentioned within the desc
**subject**<br>`Array of String` | **Yes** | Subject of the desc
**preposition**<br>`Array of String` | **Yes** | Prepositions within desc to understand intent

## Done connecting?
Checkout our [API Overiview](https://docs.okra.ng/docs/api-overview) and see how to use the data you've received and [other products](https://docs.okra.ng/docs/selfie-verification) you can use to create more personalized experiences for your customers!

## Not a developer? 
Get started without writing a single line of code, Try our App Builder! [Click here to get started](https://dash.okra.ng/link-builder)
