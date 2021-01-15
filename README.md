# okra-ios-sdk

This is an ios library for implementing okra widget
### Get Started
This library would help you add Okra widget to you native ios app in no time.
### Install

1. Clone the repository and save to a location:
```git
$ git clone https://github.com/okraHQ/okra-ios-sdk.git
```
2. Build and run the project via **Xcode** this creates a library build named "OkraWidget.framework" in the Products folder located at the root directory. 

3. Copy the file OkraWidget.framework to the root directory of the project you want to use it in.

4. Go to project > General > Frameworks,Libraries, and Embedded Content and add the "OkraWidget.framework"

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
|  `token`              | `String`       | true                |  undefined          | Your client token key from Okra.
|  `products`           | `ArrayList<Enums.Product>`| true     |  undefined          | The Okra products you want to use with the widget.
|  `env`                | `Enums.Environment`| true            |  undefined          | 
|  `clientName`         | `String`       | true                |  undefined          | Name of the customer using the widget on the application
|  `webhook`            | `String`       | true                |  undefined          | The Url that Okra send the client's data to.

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
