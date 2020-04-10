package inout

import (
	"bytes"
	"strings"
	"testing"
)

func TestInout(t *testing.T) {
	want := "abcdef\n123455"

	i := strings.NewReader("abcdef\n123455")
	o := new(bytes.Buffer)
	Do(i, o)

	if o.String() != want {
		t.Errorf("Do: got (%s), want (%s)", o.String(), want)
	}

	// TODO: write error scenario
}
