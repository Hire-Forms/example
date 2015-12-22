#!/bin/sh

rm -rf examples/build
mkdir examples/build

cp node_modules/hire-forms-example/index.html examples/build
cp node_modules/hire-forms-example/libs.js examples/build

node_modules/.bin/browserify examples/index.jsx \
  --extension=.jsx \
  --external classnames \
  --external react \
  --outfile examples/build/index.js \
  --standalone HireFormsListExamples \
  --transform [ babelify --plugins object-assign ] \
  --transform brfs \
  --verbose

node_modules/.bin/browser-sync start --server examples/build