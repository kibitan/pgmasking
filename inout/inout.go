package inout

// TODO: should refactor naming of package

import (
	"io"
	"io/ioutil"
)

// Do will read lines from input and process it and write it to output
func Do(in io.Reader, out io.Writer, processor func(*[]byte) *[]byte) error {
	b, _ := ioutil.ReadAll(in)
	out.Write(*processor(&b))
	return nil
}
