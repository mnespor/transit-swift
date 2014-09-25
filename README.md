# transit-swift

Transit is a data format and a set of libraries for conveying values between applications written in different languages. This library provides support for marshalling Transit data to/from Cocoa and Cocoa Touch data types.

* [Rationale](http://blog.cognitect.com/blog/2014/7/22/transit)
* [Specification](http://github.com/cognitect/transit-format)

This implementation's major.minor version number corresponds to the
version of the Transit specification it supports.

_NOTE: Transit is a work in progress and may evolve based on feedback. As a result, while Transit is a great option for transferring data between applications, it should not yet be used for storing data durably over time. This recommendation will change when the specification is complete._

## Releases and Dependency Information

* Latest release: 

## Usage

```Swift
```

```Objective-C
```


## Default Type Mapping

|Transit type|Write accepts|Read returns|
|------------|-------------|------------|
|null|nil|nil|
|string|String|String|
|boolean|Bool|Bool|
|integer|Int|Int|
|decimal|Double|Double|
|keyword|com.mnespor.TransitKit.Keyword|com.mnespor.TransitKit.Keyword|
|symbol|com.mnespor.TransitKit.Symbol|com.mnespor.TransitKit.Symbol|
|big decimal|NSNumber|NSNumber|
|big integer|NSNumber|NSNumber|
|time|NSDate|NSDate|
|uri|NSURL|NSURL|
|uuid|String|String|
|char|Character|Character|
|array|Array|Array|
|list|Array|Array|
|set|com.mnespor.TransitKit.Set|com.mnespor.TransitKit.Set|
|map|Dictionary|Dictionary|
|link|com.mnespor.TransitKit.Link|com.mnespor.TransitKit.Link|

## Copyright and License

Copyright © 2014 Matthew Nespor

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
