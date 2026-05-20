# UniPd thesis modern template

Just a template for thesis at University of Padova.


A full preview is available in the [compiled demo PDF](main.pdf).
For a real-world example, you may also consult [my MSc thesis](https://hdl.handle.net/20.500.12608/65146), which was written using an earlier version of this template.

The template is also available on [Overleaf](https://www.overleaf.com/latex/templates/unipd-modern-thesis-template/qxcgfbvhfjtn).


## Compilation

**LuaLaTeX** is the recommended compiler for full PDF/A compatibility with the default font configuration.

Alternative: **pdfLaTeX**.
The template works fine with **pdfLaTeX**, but some PDF/A compatibility issues may arise when using the default `newpxtext` font package (as of May 2026).

If pdfLaTeX is required, consider switching to:
```latex
\RequirePackage{mathpazo}
```
inside the class file.

> [!TIP]
> For further details, see the PDF/A compatibility notes in the demo document.


## PDF/A compliance

The University submission system requires thesis manuscripts to be submitted as **PDF/A-compliant documents**.

This template enforces **PDF/A-2b** compliance through the `pdfx` package.

> [!IMPORTANT]  
> The PDF/A compliance can be broken later by the user, for instance, with transparencies in plots, new packages, etc.
> Validation can be performed using online tools such as [pdfforge](https://www.pdfforge.org/online/en/validate-pdfa).



## Changelog

### v1.2

- Updated University of Padua logos
- Fixed PDF/A-2b compliance
- Improved page geometry
- Corrected bookmark hierarchy for backmatter sections



## License

Released under CC license.



## Author

Francesco Barone 

GitHub: https://github.com/baronefr
