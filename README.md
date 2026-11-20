# UniPd thesis modern template

Just a template for thesis at University of Padova.


A full preview is available in the [compiled demo PDF](main.pdf).
For a real-world example, you may also consult [my MSc thesis](https://hdl.handle.net/20.500.12608/65146), which was written using an earlier version of this template.

The template is also available on [Overleaf](https://www.overleaf.com/latex/templates/unipd-modern-thesis-template/qxcgfbvhfjtn).


## Features


### Logos

By default, the template uses the new logos of the University of Padova.
Some departments/schools still require the old ones: to use them, enable the `oldlogo` option:

```latex
\documentclass[
    oldlogo,
]{unipd-thesis-modern}
```

The option switches all the logos at once (cover logo, background seal, PhD cover seal).
I advice you check the logo requirement with your school/department before submitting your thesis.


### PhD cover

The PhD school requires a specific title page (see the *facsimile frontespizio tesi PhD* provided by the school).
To use it instead of the default cover, enable the `phdcover` option:

```latex
\documentclass[
    phdcover,
]{unipd-thesis-modern}
```

The PhD cover uses the following fields, in addition to `\title`, `\author`, `\advisor` and `\coadvisor`:

```latex
\department{Department of Physics and Astronomy ``G. Galilei''}
\phdCourse{Physics}
\phdCurriculum{Theoretical Physics}  % optional
\phdSeries{XXXIX}
\phdCoordinator{Prof. Name Surname}
% optional, only for grants financed by external institutions (full sentence):
\phdFunding{Thesis written with the financial contribution of Name of the Financing Institution}
```


### Language

This template supports localization in both **English** and **Italian**. By default, the template uses **English**.

To select a different language, use the `language` option when loading the document class:

```latex
\documentclass[
    language=italian,
]{unipd-thesis-modern}
```

The selected language is passed to `babel`, which automatically localizes all standard LaTeX elements, including chapter and section names, figure and table captions, the table of contents, bibliography titles, dates, and hyphenation rules.

In addition, the template localizes all custom text that is not handled by `babel`, such as *Supervisor*, *Co-supervisor*, *Academic Year*, and *Student ID*.

<details>

<summary>Adding a new language</summary>

You can extend the template to support additional languages by creating a new localization file in the `template/` directory. The file name must match one of the languages supported by `babel` (for example, `french.tex` or `german.tex`).

Inside this file, define all language-specific macros used by the template, following the structure of the existing localization files (e.g., `english.tex` and `italian.tex`). Once the file is added, the new language can be selected through the `language` option of the document class.

</details>


### Page layout

The width of the text block can be set with the `textwidth` option (default `156mm`):

```latex
\documentclass[
    textwidth=150mm,
]{unipd-thesis-modern}
```

The horizontal margins are computed automatically: a 10 mm gutter is added on the binding side, and the remaining space is split equally between the inner and outer margins. For instance, on A4 paper `textwidth=156mm` gives inner/outer margins of 32/22 mm, and `textwidth=150mm` gives 35/25 mm.
The chapter headings follow the margins automatically.
To change the gutter or the margin split, edit the `bindingoffset` and `hmarginratio` values of `geometry` in the class file.

The space between the title of a chapter and the text that follows can be set with the `chapterskip` option (default `27.5mm`):

```latex
\documentclass[
    chapterskip=7mm,  % compact look, e.g. for a Bachelor thesis
]{unipd-thesis-modern}
```

It is measured from the baseline of the last line of the title to the top of the capital letters of the first line of text, so it is the same for titles spanning one or more lines, and it does not depend on the margins.


### Style variations

The following optional flags tweak the look of the document.
They are all off by default and can be enabled independently:

```latex
\documentclass[
    boxedcaptions,  % coloured square before caption labels
    boxedsections,  % section numbers inside a coloured box
    thmtriangles,   % triangle markers in theorem headings
    pagenumberline, % bold page number with a line to the page edge
]{unipd-thesis-modern}
```

- `boxedcaptions` puts a small coloured square before the label of every caption (figures, tables, listings, algorithms). Captions from `algorithm2e` are supported as well.
- `boxedsections` prints the section number inside a coloured box. Unnumbered sections (`\section*`) are not affected.
- `thmtriangles` adds a small triangle (▶) before the heading of theorem-like environments (proofs keep the standard end-of-proof square). The marker applies to the `plain`, `definition` and `remark` styles.
- `pagenumberline` prints the page number in bold and in colour (`pageNumberColor`, defaults to `mainColor`), with a line below it that runs from the number to the outer edge of the paper. The thickness of the line and its distance from the number are the lengths `\UPDpagelinewidth` (1.4pt) and `\UPDpagelinesep` (2.5pt).


## Technicalities


### Compilation

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


<details>

<summary>PDF/A compliance</summary>

The University submission system requires thesis manuscripts to be submitted as **PDF/A-compliant documents**.

This template enforces **PDF/A-2b** compliance through the `pdfx` package.

> [!IMPORTANT]  
> The PDF/A compliance can be broken later by the user, for instance, with transparencies in plots, new packages, etc.
> Validation can be performed using online tools such as [pdfforge](https://www.pdfforge.org/online/en/validate-pdfa).

</details>


## Changelog


### v1.4

- Add options `boxedcaptions` and `boxedsections` for coloured caption squares and section number boxes
- Add option `chapterskip` to set the space between chapter titles and text
- Add option `phdcover` for the title page required by the PhD school
- Add option `thmtriangles` for triangle markers in theorem headings
- Add option `pagenumberline` for coloured page numbers with a line to the page edge
- Add option `oldlogo`, replacing the `\useoldlogo` command (still works)
- Add option `textwidth`: margins are computed from the text width and a 10 mm gutter
- Chapter headings follow the page margins and no longer need a second compilation to be placed correctly


### v1.3

- Add option for language (english and italian)
- Command `\useoldlogo` reverts the logo to the pre-2026 version. I advice you check the logo requirement with your school/department before submitting your thesis.


### v1.2

- Updated University of Padua logos
- Fixed PDF/A-2b compliance
- Improved page geometry
- Corrected bookmark hierarchy for backmatter sections



## License

Released under CC license.



## Author

[Francesco Barone](https://baronefr.github.io/)

GitHub: https://github.com/baronefr
