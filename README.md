Example [Mustache](https://mustache.github.io) to [Common Form](https://commonform.github.io) to Microsoft Word build chain

# Use

Edit any `.mustache` file in this directory, writing Common Form markup and Mustache template tags. Then write a `.json` file  with the same name containing template variables and a `.title.txt` file with a title for the document.

Run `make` to generate Microsoft Word and plain-text renderings of the template.

Run `make check` to check the project for drafting errors.
