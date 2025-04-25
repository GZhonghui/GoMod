// Go在1.11之前没有包管理器，在1.16之后Module成为官方默认的包管理方式
// GOPATH、GO111MODULE等都是历史遗留内容，没有必要了解了

// 现在的Go是基于Module的，一个第三方库是Module，一个工程也是Module
// 一个包含 go.mod 文件的目录就是一个 Module
// go.mod 维护 Module 的信息
// 注意 Module 和 Package 是两个不同的概念
// Module 更大 包括 Package
// Package 是 import 的单位
// 一个 Module 目录也可以 import 但是其是作为 Package 被导入的

// 创建一个 Module
// go mod init <module-path>（在当前目录生成 go.mod）

// Go Module Path
// 如是代码作为一个 Lib 需要复用 这里就写此 Module 存储的真实 url（后面可能需要加上/vN）
// 最常见的情况是代码存储在 Github 那么这里就写 Github 的地址
// 如果不对的话 Go 会报错（或者拉取不到）
// 「Go Modules 要求：你 require 的模块路径（import path）必须与被依赖模块的 go.mod 中声明的 module 名完全一致」
// 「Go 确实不像 Python 有 PyPI 那样的官方中央仓库」

// 需要注意的是 如果版本>=2.0 那么在 url 后面需要跟上「v<主版本号>」
// 这种写法容易和路径搞混 但是「v<主版本号>」并不是路径的一部分
// 注意 大版本升级后
// 所有引用此 Module 的地方（包括go.mod） 就都需要在 import 的地方加上/修改「v<主版本号>」
// v0/v1：模块路径保持不变
// v2+：路径需在末尾加 /vN
// go.mod、go get、import等 各种需要用到module_path的地方 都需要注意末尾的/vN
// 为什么要显式在 module_path 中指明大版本号
// 据说：「因为在代码中显式指定大版本 可以防止包被自动更新带来的混乱」

// 所以 可以思考一下 如果在 module 的根目录下 有 v2、v3 这种文件夹的话
// 一定会很混乱的...

// 版本（在使用 Github 托管代码的情况下）就是 Git 的 Tag
// 格式需要是"v<x>.<y>.<z>"（vMAJOR.MINOR.PATCH）
// 如果不打 Tag 也是可以被拉取的 但是会非常混乱
// Go 会自动生成这种tag：v0.0.0-20250424-<commit_hash>

// 如果项目不是 Lib（没有复用代码的需求）Module Path可以随便写

module github.com/GZhonghui/GoMod/v2

// 记录 Go 的版本

go 1.24.2

// 导入第三方Module使用go get，导入的Module信息会被记录在go.mod中
// 导入的Module会分为direct和indirect两种，区别如名字所示，是否被直接引用了
// 和apt类似，也是为了实现类似autoclean的功能（go mod tidy）