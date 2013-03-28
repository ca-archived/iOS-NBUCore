iOS NBUCore
===========  
[日本語](https://github.com/icb-cost-01/iOS-NBUCore/blob/master/README.jp.md)

_Latest version 1.7.0_

Core services for ANY iOS project

NBUCore consists of **completely optional** separate components.

![NBUCore](https://github.com/icb-cost-01/iOS-NBUCore/wiki/images/NBUCore.png)

You can use any combination of these components in your projects.  
__*If you are using [NBUBase](https://github.com/icb-cost-01/iOS-NBUBase),
[NBUKit](https://github.com/icb-cost-01/iOS-NBUKit) or [NBUGap](https://github.com/icb-cost-01/iOS-NBUGap),
then NBUCore will be already included starting with 1.5.x.*__

Components
----------

### NBUCore_<>.xcconfig Files

Add these files to your target's build settings if you want to have some default settings
to configure your Debug, Testing and Production configurations.

### NBUUtil

Commonly needed macros, functions, etc.

### NBULog

A very useful replacement for NSLog wich is also bad for performance.  
Easy to use and easy to extend. Based on [Cocoa Lumberjack](https://github.com/robbiehanson/CocoaLumberjack).

NBUDashboardLogger for an on-device log console.

### NBUAdditions

Many useful UIKit and NSFoundation categories that could be useful for many applications.
Import them all or just the ones you need. **Also do a pull request to add your own NBUAdditions!**

Installation
------------

1. Checkout `git@github.com:icb-cost-01/iOS-NBUCore.git` or [download](https://github.com/icb-cost-01/iOS-NBUCore/tags)
the NBUCore sources to your project directory.
2. Import `NBUCore.h` or only the files that you need.
3. Optionally add the [configuration files](#nbucore_xcconfig-files) to your target.

_Keychain access requires to link `Security.framework`._

Documentation
-------------

* HTML: http://172.17.127.199/doc/NBUCore/html
* Xcode DocSet: http://172.17.127.199/doc/NBUCore/publish/NBUCore.atom

Screenshots
-----------
 
![Dashboard](https://github.com/icb-cost-01/iOS-NBUCore/wiki/images/Dashboard.png "On-device log console")
![Dashboard minimized](https://github.com/icb-cost-01/iOS-NBUCore/wiki/images/Dashboard_minimized.png "Minimized log console")
 
Notes
-----

* You can hide build warnings from specific files by adding the <code>-w</code> in the Build Step of your target's Build settings.



