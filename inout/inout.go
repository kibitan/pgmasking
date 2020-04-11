// TODO: should consider naming of package
package inout

import (
	"bufio"
	"io"
)

func Do(i io.Reader, o io.Writer) {
	r := bufio.NewReader(i)
	r.WriteTo(o)
}
