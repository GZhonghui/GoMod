package GoMod

import (
	"fmt"

	"github.com/GZhonghui/GoMod/version"
)

func PrintAboutMessage() {
	fmt.Println("Hi from GoMod", version.GetVersion())
}
