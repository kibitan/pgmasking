package main

import (
	"os"

	"github.com/kibitan/pgmasking/inout"
)

func main() {
	inout.Do(os.Stdin, os.Stdout)
}
