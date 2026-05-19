# UniPd thesis modern template

Just a template for thesis at University of Padova.


A full preview is available in the [compiled demo PDF](main.pdf).
For a real-world example, you may also consult [my MSc thesis](https://hdl.handle.net/20.500.12608/65146), which was written using an earlier version of this template.


## Compilation

### Recommended compiler

**LuaLaTeX** (recommended)

This is the suggested compiler for full PDF/A compatibility with the default font configuration.


### Alternative: pdfLaTeX

The template can also be compiled with **pdfLaTeX**, but some PDF/A compatibility issues may arise when using the default `newpxtext` font package.

If pdfLaTeX is required, consider switching to:
```latex
\RequirePackage{mathpazo}
```
inside the class file.

For further details, see the PDF/A compatibility notes in the demo document.


## PDF/A compliance

The University submission system requires thesis manuscripts to be submitted as **PDF/A-compliant documents**.

This template enforces **PDF/A-2b** compliance through the `pdfx` package.

Validation can be performed using online tools such as:

- https://www.pdfforge.org/online/en/validate-pdfa

---

## Changelog

### v1.2

- Updated University of Padua logos
- Fixed PDF/A-2b compliance
- Improved page geometry
- Corrected bookmark hierarchy for backmatter sections

---

## License

Released under CC license.

---

## Author

Francesco Barone 

GitHub: https://github.com/baronefr
