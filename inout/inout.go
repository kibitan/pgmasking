package inout

// TODO: should refactor naming of package

import (
	"bufio"
	"io"
)

// Do will read lines from input and process it and write it to output
func Do(i io.Reader, o io.Writer, p func(*string) *string) error {
	r := bufio.NewReader(i)
	r.WriteTo(o)
	return nil
}
