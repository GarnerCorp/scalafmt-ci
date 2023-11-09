TESTDATA := .github/testdata

.PHONY: test testfail testdata clean

test:
	act -W .github/workflows/test.yml

# expected failure, to see output
testfail: 
	act -W .github/workflows/test-all.yml

# generate the "good" version of the sample file
$(TESTDATA)/Good.scala: $(TESTDATA)/Bad.scala $(TESTDATA)/.scalafmt.conf
	./.github/regenerate-good.sh

testdata: $(TESTDATA)/Good.scala

clean:
	rm -rf $(TESTDATA)/Good.scala
