#!/bin/sh

# Bundle JS libs
node_modules/.bin/browserify \
	--require classnames \
	--require react > libs.js

node_modules/.bin/watchify src/index.jsx \
  --extension=.jsx \
  --external classnames \
  --external react \
  --outfile 'derequire > index.js' \
  --standalone HireFormsExamples \
  --transform [ babelify --presets [ es2015 react stage-0 ] ] \
  --transform brfs \
  --verbose