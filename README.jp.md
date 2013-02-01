iOS NBUCore
===========  
[English](https://github.com/icb-cost-01/iOS-NBUCore/blob/master/README.md)

_最新バージョン 1.5.0b4_

全てのプロジェクトの Core Service  

NBUCoreは **個々に使用の選択が可能** なコンポーネント群で構成されていますので
どのようなプロジェクトにも組み合わせて使う事が出来ます。  
__*[NBUBase](https://github.com/icb-cost-01/iOS-NBUBase)や
[NBUKit](https://github.com/icb-cost-01/iOS-NBUKit)、[NBUGap](https://github.com/icb-cost-01/iOS-NBUGap)をお使いの場合は、
ver1.5.x よりNBUCoreが追加されています。*__

![NBUCore](https://github.com/icb-cost-01/iOS-NBUCore/wiki/images/NBUCore.png)

Components
----------

### NBUCore_<>.xcconfig Files

複数のビルド設定（Debug、Testing、Productionなど）をしたい場合、  
.xcconfigファイルをターゲットの'build settings'に追加します。

### NBUUtil

一般的によく使われるマクロやFunction等です。

### NBULog

パフォーマンスの悪かったNSLogに取って代わるとても便利な後継者です。  
使いやすく拡張も簡単です。 参考：[Cocoa Lumberjack](https://github.com/robbiehanson/CocoaLumberjack).

### NBUAdditions

ここにあるたくさんの便利なUIKitやNSFoundationのカテゴリーは多くのアプリケーション制作に役立ちます。  
必要なものだけをImportして使うこともできます。  
**是非、みなさんがお使いの便利なカテゴリーを 'Pull Request' してNBUAdditionalsにコミットしてみてください！:-)**

Installation
------------

1. NBUCoreをプロジェクト内にチェックアウト`git@github.com:icb-cost-01/iOS-NBUCore.git`するか、もしくは [ダウンロード](https://github.com/icb-cost-01/iOS-NBUCore/tags)してください。  
2. その次に `NBUCore.h` 、もしくは必要なファイルだけをインポートしてください。  
3. 任意でターゲットに設定ファイル [configuration files](#nbucore_xcconfig-files) を追加します。  
 
_Keychain access は`Security.framework`のリンクが必須です。_
 
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
 
* ビルドステップごとのターゲットの'Build settings'で’<code>-w</code>’が追加されたファイルからのビルドwarningを非表示にすることが出来ます。 


