# CocoapodsBinary
以预构建框架的形式加快编译速度的Cocoapods插件使用

[Cocoapods-binary](https://github.com/leavez/cocoapods-binary)是`Cocoapods`推荐的非官方的一个插件。

通过修改`podfile`文件将依赖的组件选择性打包成二进制文件，以预构建框架的形式加快编译。

其实现原理是在`pre install`的`hook`中，独立执行另外一个`pod install`。这个独立的`install`根据`podfile` 中的配置过滤出要二进制化的`pod`，生成`pod project`，再使用 `xcodebuild`编译出`framework`。接着在正常的`install` 过程中，通过运行时更改`CocoaPod` 的代码，使得在集成的时候，对于指定的库使用的刚才编译好的 `framework`，而非源代码。这些`framework`作为该`pod`库的 `vendored_framework`来实现引用。

生成的`framework`文件保存在`Pod/_Prebuild/`目录中，并符号链接到 `Pod`目录下，以便`CocoaPods`使用。

这里是[Demo]()，实测项目编译速度提升了90%，但由于是以二进制的形式存在，所以在Debug时看不到源代码，增加调试难度。

**注意:** 当从二进制切换回源码时，需要手动到项目根目录下删除`_pre_build`文件再`pod install`否则可能会报错`No such module 'XXXX'`。
