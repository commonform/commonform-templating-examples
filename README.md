Example [Mustache](https://mustache.github.io) to [Common Form](https://commonform.github.io) to Microsoft Word build chain

# Use

Create a `.mustache` template in this directory, writing Common Form markup and Mustache template tags. Then write a `.json` file  with the same name containing template variables and a `.title.txt` file with a title for the document. An example is included.

Run `make` to generate Microsoft Word and plain-text renderings of each template.

```shellsession
$ make
npm install mustache
mustache@2.1.3 node_modules/mustache
./node_modules/.bin/mustache agreement.json agreement.mustache > agreement.commonform
npm install commonform-cli
commonform-cli@0.5.0 node_modules/commonform-cli
├── english-list@1.0.0-prerelease-1
├── commonform-markup@0.4.0 (last-index-matching@1.0.1, keyarray-get@0.1.0)
├── commonform-serialize@0.4.0 (is-array@1.0.1, is-object@1.0.1)
├── docopt@0.6.2
├── commonform-normalize@0.4.0 (clone@1.0.2, commonform-predicate@0.4.0, commonform-hash@0.4.0)
├── commonform@1.0.1
├── commonform-critique@0.5.1 (commonform-predicate@0.4.0)
├── concat-stream@1.5.0 (inherits@2.0.1, typedarray@0.0.6, readable-stream@2.0.2)
├── commonform-annotations@1.0.0
├── commonform-lint@0.5.1 (commonform-analyze@0.4.1)
├── commonform-tex@0.2.1 (escape-latex@0.1.2, decimal-numbering@1.0.0, commonform@1.0.1, commonform-flatten@0.5.0)
├── commonform-terminal@0.5.2 (decimal-numbering@1.0.0, chalk@1.1.0, commonform@1.0.1, commonform-flatten@0.5.0)
└── commonform-docx@0.5.1 (smart-quotes@0.0.2, merge@1.2.0, decimal-numbering@1.0.0, commonform@1.0.1, commonform-flatten@0.5.0, jszip@2.5.0)
./node_modules/.bin/commonform render --format docx --title "Agreement" < agreement.commonform > agreement.docx
./node_modules/.bin/commonform render --format terminal < agreement.commonform > agreement.txt
```

Run `make check` to check the project for drafting errors.

```shellsession
$ make check
bash -c "for file in agreement.commonform; do commonform lint < \$file ; done"
The term "Beatles" is used, but not defined.
Makefile:27: recipe for target 'check' failed
make: *** [check] Error 1
```
