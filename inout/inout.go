// TODO: should consider naming of package
package inout

import (
	"io"
	"io/ioutil"
)

func Do(i io.Reader, o io.Writer) {
	b, _ := ioutil.ReadAll(i) // should refactoring with efficient buffer
	o.Write(b)
}
