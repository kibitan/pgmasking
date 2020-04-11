package main

import (
	"io/ioutil"
	"os"
	"testing"
)

var (
	r *os.File
	w *os.File
)

func TestMain(m *testing.M) {
	// faking Stdin/stdout
	s := os.Stdout
	r, w, _ = os.Pipe()
	os.Stdout = w

	code := m.Run()

	os.Stdout = s
	os.Exit(code)
}

func TestCallMain(t *testing.T) {
	want := "pgmasking test sql\ntest test"
	w.Write([]byte(want))

	main()

	w.Close()
	got, _ := ioutil.ReadAll(r)

	if string(got) != want {
		t.Errorf("Do: got (%s), want (%s)", string(got), want)
	}
}
