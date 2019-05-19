
# Example for how to use testrunner-68k

[![Build Status](https://travis-ci.com/Kalmalyzer/testrunner-68k-example.svg?branch=master)](https://travis-ci.com/Kalmalyzer/testrunner-68k-example)

This project contains a routine in assembly, and some test examples.

To build the code and run the tests locally, do `make test`. The makefile only supports Linux so far.

Every time that new changes are pushed to the GitHub repository, Travis CI will also compile the code, run the tests, and update the build passing/failing status. See `.travis.yml` for the automatic build configuration.