package GoMod

import (
	"fmt"

	"github.com/GZhonghui/GoMod/v2/version"
)

func PrintAboutMessage() {
	fmt.Println("Hi from GoMod", version.GetVersion())
}
