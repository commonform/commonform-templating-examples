Use templating to write [Common Forms](https://commonform.github.io)

# Templating Engines

- [Mustache](https://mustache.github.io)

- [Embedded JavaScript](http://www.embeddedjs.com/)

# Use

Create a template file with a `.mustache` or `.ejs` extension in this directory, writing Common Form markup and template tags. Then write a `.json` file  of the same name containing template variables and a `.title.txt` file with a title for the document. Examples are included for each supported templating engine.

Run `make` to generate Microsoft Word (`.docx`)and plain-text (`.txt`) renderings of each template.

Run `make check` to check the project for drafting errors, like broken cross-references.

# Prerequisites

1. [Make](https://en.wikipedia.org/wiki/Make_(software))

2. [Node.js](https://nodejs.org), which comes with [npm](https://npmjs.com)

3. [BASH](https://www.gnu.org/software/bash/bash.html)
