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
	p := func(s *string) *string { return s }
	err := Do(i, o, p)

	if o.String() != want {
		t.Errorf("Do: got (%s), want (%s)", o.String(), want)
	}

	if err != nil {
		t.Errorf("Do returns error: %s", err)
	}

	want = "ABCDEF\n123455"
	p = func(s *string) *string { return &strings.ToUpper(*s) }
	err = Do(i, o, p)

	if o.String() != want {
		t.Errorf("Do: got (%s), want (%s)", o.String(), want)
	}

	if err != nil {
		t.Errorf("Do returns error: %s", err)
	}

}
