// package声明必须是代码的第一句
// 目录名：GoMod
// 包名：GoMod
package GoMod

import (
	"fmt"

	"github.com/GZhonghui/GoMod/v2/version"
)

func PrintAboutMessage() {
	fmt.Println("Hi from GoMod", version.GetVersion())
}
