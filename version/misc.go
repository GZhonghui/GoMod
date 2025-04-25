// 一个文件夹就是一个包
// 包内的所有go文件，都必须标记为同一个package（在文件开头），例外是test文件
// 「不允许同一目录下出现多个 package 名」
// 标记的这个package理论上可以和文件夹使用不同的命名
// 「Go 不要求 文件夹名 必须和 package 名一致」
// 但是强烈建议package和文件夹同名（除非是main 非lib的项目根目录的包直接写main比较方便）
// 导入package使用路径，路径从Module开始
// package是「最小的编译单元」

// internal/ 下面的包不能被外部引用
// pkg/ 下面是希望被重用的公共代码
// TODO: 这是推荐的组织方式 还是强制要求？

package version

func GetVersion() string {
	return "v2.1.1"
}
