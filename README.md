# BackgroundDownloadDemo
一个简单的使用NSURLSession的下载Demo，包括后台下载和断点下载.

这个demo是基于**HK_Hank**的github[BackgroundDownloadDemo](https://github.com/HustHank/BackgroundDownloadDemo)来修改的。

* 我在它的基础上加入了保存resumeData到文件，和从文件中恢复。这样就可以当任务被暂停后，即使APP被杀掉，当下次启动后仍然可以继续下载。
* 另外一个改动，当正在下载文件时，APP被杀掉，下载起来时，NSURLSession的delegate会回调，这时把Task保存起来下次使用

当然还有其他的一些修改，例如加入了一些日志打印，计算下载速度等。这个demo很简单，但是却包含后台下载核心内容。我自己根据这个demo在公司的项目中写了一个FileDownloadManager，支持后台下载和断点续传，任务的调度，还结合了数据库来管理下载任务。基本核心跟这个demo一致。不过我们的那个FileDownloadManager还集成了ASIHTTPRequest的下载方式，还有一些公司内部业务逻辑，所以没法开源。但是根据这个demo的思想就可以做一个下载管理器出来。

##运行环境
 * Xcode8.0
 * iOS9.3.5

---------
[iOS后台下载和断点续传](http://szuwest.github.io/ioshou-tai-xia-zai-he-duan-dian-xu-chuan.html)
