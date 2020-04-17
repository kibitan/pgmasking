package main

import (
	"os"

	"github.com/kibitan/pgmasking/inout"
)

func main() {
	p := func(s *[]byte) *[]byte { return s } // dummy
	inout.Do(os.Stdin, os.Stdout, p)
}
