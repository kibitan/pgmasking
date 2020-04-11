package main

import (
	"io/ioutil"
	"os"
	"testing"
)

func TestCallMain(t *testing.T) {
	r, w, _ := os.Pipe() // I don't know why it works...

	want := "pgmasking test sql\ntest test"
	w.Write([]byte(want))

	main()

	w.Close()
	got, _ := ioutil.ReadAll(r)

	if string(got) != want {
		t.Errorf("Do: got (%s), want (%s)", string(got), want)
	}
}
