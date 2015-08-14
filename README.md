Example [Mustache](https://mustache.github.io) to [Common Form](https://commonform.github.io) to Microsoft Word build chain

# Use

Create a `.mustache` template in this directory, writing Common Form markup and Mustache template tags. Then write a `.json` file  with the same name containing template variables and a `.title.txt` file with a title for the document. An example is included.

Run `make` to generate Microsoft Word and plain-text renderings of each template.

Run `make check` to check the project for drafting errors.

# Prerequisites

1. [Make](https://en.wikipedia.org/wiki/Make_(software))

2. [Node.js](https://nodejs.org), which comes with [npm](https://npmjs.com)

3. [BASH](https://www.gnu.org/software/bash/bash.html)
