# Dubas Custom Formulas
This extension will add new formulas to your EspoCRM. Thanks to that you'll be able to modify dates and strings without coding skills.

!!! note
    You can download extension from [official website](https://devcrm.it/custom-formulas).

!!! info
    If you want to find out how to use Formulas in EspoCRM, check [official documentation](https://docs.espocrm.com/administration/formula/).

## :material-video-box: Video Presentation
<div class="video-wrapper">
  <iframe width="1280" height="400" src="https://www.youtube.com/embed/9PMxd2A5DO4" frameborder="0" allowfullscreen></iframe>
</div>

## :material-playlist-check:  Requirements
EspoCRM in version higher than 6.1.0.

## :material-book-plus-multiple: Getting started
1. Install Dubas Custom Formulas extension
2. Open formula editor 
3. Use one of formulas listed below.

## Available formulas
### dubasDate
dubasDate formula let you modify date as you want. With this formula you can add and substract days, weeks, months and years.
!!! warning ""
    `DubasDate` formula require 2 params. 
#### How to use it
Enter in formula field: `datetime\dubasDate(date, value)`.  
#### Example of usage
`datetime\dubasDate('2021-01-01', '-1 day')`  
#### Explanation of params
1. **Date** - Enter based date. It could be field, variable or static date in format YYYY-MM-DD.
2. **Value** - Enter what you want to do, if you want to add one day, enter +1 day.

### dubasMd5
dubasMd5 formula let you to create md5 hash based on string which you provide.
!!! warning ""
    `DubasMd5` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasMd5(value)`.

#### Example of usage
`string\dubasMd5('abc')`  

#### Explanation of params
1. **Value** - Enter what you want to do, if you want to add one day, enter +1 day.


### dubasSha1
dubasSha1 formula let you to create SHA1 hash from provided string.
!!! warning ""
    `dubasSha1` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasSha1(value)`.

#### Example of usage
`string\dubasSha1('abcdef')`  

#### Explanation of params
1. **Value** - Enter the string from which you want to create the hash


### dubasUniqueId
dubasUniqueId formula let you to generate unique id based on params which you provide. This formula will let you also to define prefix of id.
!!! warning ""
    `dubasUniqueId` formula require 2 params. 

#### How to use it
Enter in formula field: `string\dubasUniqueId('length', 'prefix')`.

#### Example of usage
`string\dubasUniqueId('15', 'devcrm-')`  

#### Explanation of params
1. **Length** - Enter number of characters which unique id should have. We recommend minimum 15 characters.
2. **Prefix** - Enter prefix of unique id.


### dubasStrlen
dubasStrlen formula let you to check length of provided string.
!!! warning ""
    `dubasStrlen` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasStrlen(value)`.

#### Example of usage
`string\dubasStrlen('abcdef')`  

#### Explanation of params
1. **Value** - Enter the string whose length you want to count


### dubasUrlEncode
dubasUrlEncode formula let you to encode provided value before you use it in url.
!!! warning ""
    `dubasUrlEncode` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasUrlEncode(value)`.

#### Example of usage
`string\dubasUrlEncode('abcdef')`  

#### Explanation of params
1. **Value** - Enter the string which you want to encode


### dubasUrlDecode
dubasUrlDecode formula let you to decode characters from url provided in value.
!!! warning ""
    `dubasUrlDecode` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasUrlDecode(value)`.

#### Example of usage
`string\dubasUrlDecode('abcdef')`  

#### Explanation of params
1. **Value** - Enter the string which you want to decode


### dubasBase64Encode
dubasBase64Encode let you to encode in base64 provided value.
!!! warning ""
    `dubasBase64Encode` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasBase64Encode(value)`.

#### Example of usage
`string\dubasBase64Encode('abcdef')`  

#### Explanation of params
1. **Value** - Enter the string which you want to encode in base64


### dubasBase64Decode
dubasBase64Decode let you to decode encoded base64 string which you provide in value.
!!! warning ""
    `dubasBase64Decode` formula require 1 param. 

#### How to use it
Enter in formula field: `string\dubasBase64Decode(value)`.

#### Example of usage
`string\dubasBase64Decode('VGhpcyBpcyBhbiBlbmNvZGVkIHN0cmluZw==')`  

#### Explanation of params
1. **Value** - Enter base64 string which you want to decode

## :material-lifebuoy: Support
This extension is shared without any support. Extension is available as it is. If you want to order some service, all information about us you can find on our website [https://devcrm.it/](https://devcrm.it/).