% =============================================================
%   LaTeX thesis template    ----------------------------------
%   ver 1.4.0 //  major review 1.4  //  November 2026, 6th
%
%   by Francesco Barone, github.com/baronefr
%   released under CC licence
%
%   This template is available on Overleaf and through the 
%   following repository:
%       https://github.com/baronefr/unipd-thesis-modern
%
% -------------------------------------------------------------
%
%  The cover of this thesis template and some elements of the 
%  class structure have been adapted from this template:
%   - Luca Martinelli: Computer Engineering MsC Thesis - UniPD,
%     https://www.overleaf.com/latex/templates/computer-engineering-msc-thesis-unipd/yvnskxpfyfkc
%
% -------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unipd-thesis-modern}[UniPd thesis template]



% -- GENERAL SETUP --

% ref class
\LoadClass[11pt, a4paper, twoside, openright]{book}

% kwargs
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=unipd,
  prefix=unipd@
}
\DeclareStringOption[english]{language}
\DeclareStringOption[156mm]{textwidth} % width of the text block (margins are computed)
\DeclareBoolOption[false]{boxedcaptions} % coloured square before caption labels
\DeclareBoolOption[false]{boxedsections} % section numbers in a coloured box
\DeclareStringOption[27.5mm]{chapterskip} % space between chapter title and text
\DeclareBoolOption[false]{phdcover} % title page following the PhD school facsimile
\DeclareBoolOption[false]{thmtriangles} % triangle marker in theorem headings
\DeclareBoolOption[false]{oldlogo} % use the pre-2026 logos of the University

\ProcessKeyvalOptions*


% page geometry
\RequirePackage[
  twoside, a4paper,
  textwidth=\unipd@textwidth, % class option textwidth (default 156mm)
  bindingoffset=10mm,   % gutter, added to the inner margin
  hmarginratio=1:1,     % split the remaining space equally
  % (alternatively, state the margins explicitly, e.g. inner=32mm, outer=22mm)
  top=27mm, bottom=27mm,
  headsep=5mm, headheight=14pt,
  footskip=11mm,
  marginparwidth=0mm, marginparsep=0mm, % not used in this template
]{geometry}




% packages to load here to avoid conflicts:
\RequirePackage{scrextend}
\RequirePackage[explicit]{titlesec}
% ---------



% -- FONTS --

%% OPTION 1 ------
%%   newpxtext has some problems compiling to PDF/A, but generates
%%   PDF/A correctly with LuaLaTeX
\RequirePackage[T1]{fontenc}
\RequirePackage{newpxtext} % add newpxmath optionally

%% OPTION 2 ------
%%   works with both pdfLaTeX and LuaLaTeX, slightly different font
%\RequirePackage{mathpazo}
%\RequirePackage{newpxmath} % (optional, depending on your tastes)

%% OPTION 3 ------
%\RequirePackage{tgpagella}
%\RequirePackage{tgtermes}


% -- LANGUAGE --
\RequirePackage[\unipd@language]{babel}
\input{template/\unipd@language.tex} % custom template strings for the selected language




% -- USEFUL PACKAGES --

% links
%\RequirePackage{hyperref} % hyperref loaded in pdfx
\RequirePackage{url}

% graphics
\RequirePackage{graphicx}


% colors
\RequirePackage[table]{xcolor}
    
    % color refs
    \definecolor{mainColor}{RGB}{155, 0, 20}
    \colorlet{chapterColor}{mainColor}
    \colorlet{partBoxColor}{mainColor}
    \colorlet{generalHyperColor}{mainColor}
    \colorlet{boxedColor}{mainColor}     % used by boxedcaptions & boxedsections
    \colorlet{boxedTextColor}{white}     % text inside the section number box
    \colorlet{thmMarkerColor}{black!70}  % triangles of the thmtriangles option
    \colorlet{sealColor}{black!70}       % seal on the phdcover title page
    %   Bookeeping: unipd color is {RGB}{155, 0, 20}


% mathematics
\RequirePackage{amsmath}
\RequirePackage{braket}
\RequirePackage[makeroom]{cancel}
\RequirePackage{bigints}
\RequirePackage{makecell}
\RequirePackage[bb=boondox]{mathalfa}
\RequirePackage{amsfonts}
\RequirePackage{witharrows} % look this ans: https://tex.stackexchange.com/questions/12621/multi-line-equations-with-explanations-on-some-lines



% appendix
\RequirePackage{appendix}

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}
\addtolength{\footnotesep}{1mm}

\makeatletter
\setlength{\@fptop}{0pt}
% aligning all floating figures/tables etc... to the top margin
\makeatother

% indent first line of paragraph
\setlength{\parindent}{11pt} % control indentation of paragraph

% captions and footnotes
\RequirePackage[font=small, labelfont=bf]{caption}
\RequirePackage{subcaption}

\RequirePackage{footnote}
\RequirePackage[bottom]{footmisc}

% insert overlay in cover
\RequirePackage{watermark}

% plots & drawings
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}

% bibliography
\RequirePackage[autostyle]{csquotes}
\RequirePackage[backend=biber]{biblatex}

% tables
\RequirePackage{tabularx}
\RequirePackage{multirow}






% -- DEFINITIONS --
\makeatletter

% thesis info
\def\thesisHeader#1{\gdef\@thesisHeader{#1}}
\def\academicYear#1{\gdef\@academicYear{#1}}
\def\graduationDate#1{\gdef\@graduationDate{#1}}
\def\studentId#1{\gdef\@studentId{#1}}
\def\secondpage#1{\gdef\@secondpage{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

% advisors
\def\advisor#1#2{\gdef\@advisor{#1} \gdef\@advisorUniversity{#2}}
\def\coadvisor#1#2{\gdef\@coadvisor{#1} \gdef\@coadvisorUniversity{#2}}
\newcommand{\otheradvisor}[3][\UPD@otheradvisor]{\gdef\@otheradvisor{#2} \gdef\@otheradvisorUniversity{#3} \gdef\@otheradvisorDenomination{#1}}

% PhD cover info (used only with the phdcover option)
\def\department#1{\gdef\@department{#1}}
\def\phdCourse#1{\gdef\@phdCourse{#1}}
\def\phdCurriculum#1{\gdef\@phdCurriculum{#1}}
\def\phdSeries#1{\gdef\@phdSeries{#1}}
\def\phdCoordinator#1{\gdef\@phdCoordinator{#1}}
\def\phdFunding#1{\gdef\@phdFunding{#1}} % full acknowledgement sentence
% override a label of the PhD cover, e.g. \setphdlabel{student}{Dottoranda:}
% keys: course, curriculum, series, coordinator, supervisor, cosupervisor, student
\newcommand{\setphdlabel}[2]{\expandafter\gdef\csname UPD@phd#1\endcsname{#2}}
\makeatother

% make these empty by default
\coadvisor{}{}
\otheradvisor{}{}
\graduationDate{}
\secondpage{}
\dedication{}
\department{}
\phdCourse{}
\phdCurriculum{}
\phdSeries{}
\phdCoordinator{}
\phdFunding{}

% default logo assets (modern)
\def\UPDlogoUnipdbg{template/unipdbg}
\def\UPDlogoUniversis{template/universis}
% seal for the phdcover option: same drawing as unipdbg.pdf, but without its own
% colour/opacity, so that it takes the current colour (sealColor)
\def\UPDlogoSeal{template/seal}

% switch to legacy logo assets (.old.pdf variants)
%   use the class option oldlogo; the \useoldlogo command is kept for
%   backward compatibility (v1.3) and does the same when used in the preamble
\newcommand{\useoldlogo}{%
  \gdef\UPDlogoUnipdbg{template/unipdbg.old}%
  \gdef\UPDlogoUniversis{template/universis.old}%
  \gdef\UPDlogoSeal{template/seal.old}%
}
\makeatletter
\ifunipd@oldlogo
  \useoldlogo
\fi
\makeatother







% -- ITEMS AND ENUMARATIONS --

% reduce spacing for items and enumerations
\let\saveditemize=\itemize
\let\savedenditemize=\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{1.0}\saveditemize\itemsep0em }
    {\savedenditemize\end{spacing}}

\let\savedenumerate=\enumerate
\let\savedendenumerate=\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{0.5}\savedenumerate}
    {\savedendenumerate\end{spacing}}

% italic for quotes
\let\savedquote\quote
\let\endsavedquote\endquote
\renewenvironment{quote}
    {\itshape\savedquote}
    {\endsavedquote}



% -- TITLES, HEADERS AND FOOTERS --
\RequirePackage{scrextend} % remove headers and footers in blank pages 
% NOTE: loaded before pdfx to avoid conflicts

\RequirePackage{fancyhdr} % custom headers and footers

% part style
\titleformat{\part}[display]
  {\centering}
  {}
  {0pt}
  {%
    \vspace*{\fill}
    \vspace*{-9cm}
    \setlength{\fboxsep}{5pt}
    \colorbox{partBoxColor}{\color{white}\LARGE\bfseries \partname~\thepart}\\
    \vspace{0.8cm}
    {\Huge\bfseries #1}
    \thispagestyle{empty}
    \vspace*{\fill}
  }


% chapter style
%% Horizontal positions are relative to the left text margin of the page
%% (\UPDchapmargin), so they follow the geometry settings:
%%   - the coloured box spans from the page edge to 0.5mm past the margin
%%   - the chapter number ends 3mm before the margin
%%   - the title starts 7mm after the margin and ends at the right text margin
%% To change the vertical position, edit the y values (distance from the page top).
%%
%% The heading is drawn in page coordinates through the shipout/background hook
%% (origin = top-left corner of the page), so it is placed correctly at the
%% first compilation, without relying on positions saved in the .aux file.
\newcommand*\chapterlabel{}
\newlength\UPDchapmargin
\newsavebox\UPDchapbox
% width of the chapter title (also used to measure it, see chapterskip below)
\newcommand*\UPDchaptitlewidth{\dimexpr\textwidth-7mm\relax}
% distance of the top of the chapter title from the top of the page
\newcommand*\UPDchaptitletop{5.1cm}
% #1: label (empty for numberless chapters), #2: title
\newcommand{\UPDchapterhead}[2]{%
  % left text margin of the current page (odd/even pages differ in twoside)
  \ifodd\value{page}%
    \setlength\UPDchapmargin{\dimexpr1in+\hoffset+\oddsidemargin\relax}%
  \else
    \setlength\UPDchapmargin{\dimexpr1in+\hoffset+\evensidemargin\relax}%
  \fi
  % typeset the heading now, place it on the page when it is shipped out
  \global\setbox\UPDchapbox=\hbox{%
    \begin{tikzpicture}[overlay]
      \fill[chapterColor] (0,-6cm) rectangle ++(\UPDchapmargin+0.5mm,15mm);
      \node[anchor=north east,minimum height=30mm,inner sep=0mm]
        at (\UPDchapmargin-3mm,-\UPDchaptitletop)
        {\parbox[top][30mm][t]{15mm}{\raggedleft\color{white}\bfseries #1}};
      \node[anchor=north west,text width=\UPDchaptitlewidth,minimum height=30mm,inner sep=0mm]
        at (\UPDchapmargin+7mm,-\UPDchaptitletop)
        {\parbox[top][30mm][t]{\UPDchaptitlewidth}{\color{black}#2}};
    \end{tikzpicture}}%
  \AddToHookNext{shipout/background}{\put(0,0){\box\UPDchapbox}}%
  \mbox{}% placeholder: keeps the vertical layout of the heading unchanged
}
\titleformat{\chapter}[display]
	{\normalfont\bfseries\Huge} % format of the chapter
	{\gdef\chapterlabel{\thechapter\ }} % label
 	{0pt} % separation between label and chapter-title
 	{\UPDchapterhead{\chapterlabel}{#1}%
   \unipdChapterExtraSkip{#1}
   \gdef\chapterlabel{}
}
% chapter style (numberless)
\titleformat{name=\chapter,numberless}[display]
	{\normalfont\bfseries\Huge} % format of the chapter
	{} % label
 	{0pt} % separation between label and chapter-title
 	{\UPDchapterhead{}{#1}%
   \unipdChapterExtraSkip{#1}
}

\renewcommand{\headrulewidth}{0pt} % remove line headers
\titlespacing*{\chapter}{0pt}{0pt}{0pt} % the space after the title is set by chapterskip
\renewcommand{\thesubsection}{\thesection.\alph{subsection}} % subsections with letters

\makeatletter
% option chapterskip: space between the chapter title and the text.
%   It is the white space between the baseline of the last line of the title
%   and the top of the capital letters of the first line of text, so it does
%   not depend on the length of the title, on the margins or on the fonts.
%   The title is drawn as an overlay (see above) and LaTeX does not know its
%   size, so the space after the heading is computed for each chapter:
%     chapterskip + (cap height of the text) + (last baseline of the title)
%     - (top of the text area) - (height of the heading material)
%   where the heading material (empty lines of the titlesec display shape)
%   takes 10.8pt + 2.3 times the \baselineskip of the chapter font.
\newlength\UPDchapterskip
\setlength\UPDchapterskip{\unipd@chapterskip}
\newlength\UPD@capheight
\newsavebox\unipd@chaptitlebox
\newif\ifUPDchapterskip \UPDchapterskiptrue % turned off for the ToC title
\newcommand\unipdChapterExtraSkip[1]{%
  \ifUPDchapterskip
    % the box height is the distance from the top of the title to its last baseline
    \sbox\unipd@chaptitlebox{\parbox[b]{\UPDchaptitlewidth}{#1}}%
    {\normalfont\normalsize\global\UPD@capheight=\fontcharht\font`H\relax}%
    \vspace*{\dimexpr \UPDchapterskip + \UPD@capheight
      + \UPDchaptitletop + \ht\unipd@chaptitlebox
      - (1in + \voffset + \topmargin + \headheight + \headsep)
      - 10.8pt - \baselineskip*23/10 \relax}%
  \fi
}

% option boxedsections: section number inside a coloured box
\ifunipd@boxedsections
  \titleformat{\section}
    {\normalfont\Large\bfseries}
    {\colorbox{boxedColor}{\color{boxedTextColor}\kern0.15em\thesection\kern0.15em}}
    {0.8em}{#1}
  \titleformat{name=\section,numberless}
    {\normalfont\Large\bfseries}{}{0pt}{#1}
\fi

% option boxedcaptions: coloured square before caption labels
\ifunipd@boxedcaptions
  \DeclareCaptionLabelFormat{boxed}{%
    {\color{boxedColor}\rule{0.73em}{0.73em}}\hspace*{0.67em}\bothIfFirst{#1}{~}#2}
  \captionsetup{labelformat=boxed}
  % algorithm2e does not rely on the caption package -> patch it if loaded
  \AtBeginDocument{%
    \@ifpackageloaded{algorithm2e}{%
      \renewcommand{\algocf@captiontext}[2]{%
        {\color{boxedColor}\rule{0.73em}{0.73em}}\hspace*{0.67em}%
        \small #1\algocf@capseparator\nobreakspace#2}%
    }{}%
  }
\fi

% option thmtriangles: triangle marker before theorem-like headings
% (based on amsthm. affects the plain, definition and remark styles)
\ifunipd@thmtriangles
  \RequirePackage{amssymb} % \blacktriangleright
  \RequirePackage{amsthm}
  \newcommand{\UPD@thmmarker}{%
    \textcolor{thmMarkerColor}{$\blacktriangleright$}\nobreakspace}
  % default head font (plain and definition styles)
  \thm@headfont{\UPD@thmmarker\bfseries}
  % remark style: same as amsthm, plus the marker
  \def\th@remark{%
    \thm@headfont{\UPD@thmmarker\itshape}%
    \normalfont % body font
    \thm@preskip\topsep \divide\thm@preskip\tw@
    \thm@postskip\thm@preskip
  }
\fi
\makeatother

% style for headers and footers
\newcommand{\setDefaultHF} {
    \fancyhf{}
    \fancyfoot[RO, LE]{\thepage}
    \fancyhead[LO]{{\footnotesize\nouppercase{\rightmark}}}
    \fancyhead[RE]{{\bfseries\footnotesize\leftmark}}
}

%\setlength{\footskip}{40pt} % Increase to move footer further down


% -- TOC --
\RequirePackage[titles]{tocloft}

% add some space before the section in ToC
\setlength{\cftbeforesecskip}{2pt}
% add more space before the Part in ToC
\setlength{\cftbeforepartskip}{2em}


% -- FRONTMATTER --
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

\renewcommand{\frontmatter} {
    
    % set cover style
    \pagenumbering{roman}
    \pagestyle{fancy}
    
    % create cover
    \maketitle
    \secondcoverpage
    \cleardoublepage
    
    % set preamble style
    \pagestyle{plain}
    \setlength{\headwidth}{\textwidth}
    \fancyhf{}
    \fancyfoot[RO, LE] {\thepage}
    
    % custom titles 
    \def\abstractname{Abstract}
    \def\abstractnameit{Sommario}
    
    % insert dedication page
    \dedicationpage
    
    % insert table of contents
    {\hypersetup{linkcolor=black}%
    \titlespacing*{\chapter}{0pt}{0pt}{0cm}% change contents header spacing (last value) if needed
    \UPDchapterskipfalse% (the chapterskip option does not apply to the ToC title)
    \tableofcontents}
    \cleardoublepage
    
    % insert abstract
    \abstractpage
}


\newcommand{\printlogos}[2][2cm]{
    \foreach \x [count=\xi] in {#2} 
       { \hspace{5mm}\includegraphics[height=#1]{\x} }
}



% -- TITLE/COVER --
\makeatletter
\renewcommand{\maketitle} {

    %set custom geometry
    \newgeometry{
        top=2cm, bottom=2cm,
        inner=4cm, outer=2cm,
        headheight=0cm,includehead,includefoot
    }
    
    \fancyhf{}
    \thispagestyle{empty}

    % add watermark
    \thiswatermark{\centering
    \put(-300,-775){\includegraphics[width=1.4\linewidth]{\UPDlogoUnipdbg}} % (-297,-780)
    }

    % logo(s)
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{\UPDlogoUniversis}}
    %  NOTE: you can add a list of images to add more logos. Example:
    %      \printlogos[2.4cm]{template/universis}

    % content
    \begin{flushleft}
    \vspace{7ex}
    \normalsize\textsc{\@thesisHeader}

    % title
    \vspace{10ex}
    
    \begin{spacing}{1.1}
    \noindent\huge\textbf{\@title}
    \end{spacing}
    \end{flushleft}


    % author and advisors 
    \doublespacing
    \vspace{1.7cm}
    \begin{flushleft}
    
        \large{\textbf{\@author}} \\
        \small{\UPD@studentid~\@studentId}\\

    % supervisor
    \vspace{2.7cm}
    \begin{minipage}[t]{7cm}
        \textsc{\UPD@advisor}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@advisor}}\\
        \indent\small\textbf{\@advisorUniversity}
        }
    \end{minipage}%
    \begin{minipage}[t]{7cm}
      % insert other advisor, if not empty
      \ifx\@otheradvisor\empty \else
        \textsc{\@otheradvisorDenomination}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@otheradvisor}}\\
        \indent\small\textbf{\@otheradvisorUniversity}
        }
      \fi
    \end{minipage}
      
      % insert co-advisor, if not empty
      \ifx\@coadvisor\empty \else
        \vspace{1cm}
        \textsc{\UPD@coadvisor}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@coadvisor}}\\
        \indent\small\textbf{\@coadvisorUniversity}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \normalsize\textsc{\UPD@academicyear~\@academicYear}
    \ifx\@graduationDate\empty \else
		\\
		\normalsize\textsc{\UPD@graduationDate~\@graduationDate}
		\fi
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}





% -- PHD TITLE PAGE --
% Layout of the PhD school facsimile (facsimile_frontespizio_tesi_phd):
% seal on top, centred course info and title, names at the bottom.
% Sizes and margins are taken from the official .docx template.
\newcommand{\makephdtitle} {
    \newgeometry{
        top=62.7mm, bottom=12.5mm,
        inner=15mm, outer=15mm,
        headheight=0pt, headsep=0pt, footskip=0pt
    }
    \fancyhf{}
    \thispagestyle{empty}

    % seal, centred in the top margin (drawn in page coordinates when the
    % page is shipped out, so it does not need a second compilation)
    \AddToHookNext{shipout/background}{%
        \put(0,0){\begin{tikzpicture}[overlay]
            \node[anchor=north,inner sep=0pt] at (0.5\paperwidth,-13.1mm)
                {\color{sealColor}\includegraphics[width=41.8mm]{\UPDlogoSeal}};
        \end{tikzpicture}}%
    }%

    % The page is a stack of blocks. The gap before a block is added only if
    % the block is printed, so empty fields leave no holes. Blocks spanning more
    % lines push the following ones down; if the page gets too full, the gaps
    % shrink (up to half their size) before anything spills to the next page.
    {\centering
        % university and department
        {\fontsize{18}{21}\selectfont \UPD@university\par}
        \ifx\@department\empty \else
            \UPD@phdgap{8pt}
            {\fontsize{16}{19}\selectfont \@department\par}
        \fi

        % course, curriculum and series (block skipped if all are empty)
        \@tempswafalse
        \ifx\@phdCourse\empty \else \@tempswatrue \fi
        \ifx\@phdCurriculum\empty \else \@tempswatrue \fi
        \ifx\@phdSeries\empty \else \@tempswatrue \fi
        \if@tempswa
            \UPD@phdgap{63pt}
            {\fontsize{17}{21}\selectfont
                \ifx\@phdCourse\empty \else
                    \UPD@phdcourse~\@phdCourse\par
                \fi
                \ifx\@phdCurriculum\empty \else
                    \UPD@phdcurriculum~\@phdCurriculum\par
                \fi
                \ifx\@phdSeries\empty \else
                    \UPD@phdseries~\@phdSeries\par
                \fi
            }
        \fi

        % title
        \UPD@phdgap{63pt}
        {\fontsize{20}{24}\selectfont \@title\par}

        % funding acknowledgement (optional, full sentence given by the user)
        \ifx\@phdFunding\empty
            \UPD@phdgap{78pt}
        \else
            \UPD@phdgap{78pt}
            {\fontsize{14}{17}\selectfont \@phdFunding\par}
            \UPD@phdgap{52pt}
        \fi
    }

    % names
    % (labels in bold, names in regular weight; \parskip spaces the lines)
    {\fontsize{14}{17}\selectfont
        \raggedright
        \setlength{\parskip}{8pt}
        \ifx\@phdCoordinator\empty \else
            \textbf{\UPD@phdcoordinator}~\@phdCoordinator\par
        \fi
        \ifx\@advisor\empty \else
            \textbf{\UPD@phdsupervisor}~\@advisor\par
        \fi
        \ifx\@coadvisor\empty \else
            \textbf{\UPD@phdcosupervisor}~\@coadvisor\par
        \fi
        \UPD@phdgap{17pt}
        {\raggedleft \textbf{\UPD@phdstudent}~\@author\par}
    }

    % leave the same line spacing as \maketitle does, so that the preamble
    % pages (dedication, ToC, abstract) look the same with both covers
    \doublespacing
    \restoregeometry
}
% vertical gap between blocks of the PhD title page (shrinks if the page is full)
\newcommand{\UPD@phdgap}[1]{\par\vspace{#1 minus 0.5\dimexpr#1\relax}}


% -- DEDICATION --
\newcommand{\dedicationpage} {
\ifx\@dedication\empty \else
    % set empty style for this page (no headers and footers)
    \thispagestyle{empty}
    \vspace*{2cm}
    \phantomsection

    \begin{flushright}
    \@dedication
    \end{flushright}
    
    \cleardoublepage
\fi
}

% -- SECOND COVER PAGE --
\newcommand{\secondcoverpage} {
\ifx\@secondpage\empty \else
    \phantomsection
    
    \@secondpage
\fi
}
\makeatother


% -- COVER --

% the following prints the cover page with bigger fonts and no watermark
\makeatletter
\newcommand{\makecover} {
    %set custom geometry
    \newgeometry{
        top=1.4cm, bottom=1.4cm,
        inner=4cm, outer=2cm,
        headheight=0cm,includehead,includefoot
    }
    
    \fancyhf{}
    \thispagestyle{empty}

    % logo
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{\UPDlogoUniversis}}

    % content
    \begin{flushleft}
    \vspace{7ex}
    \large\textsc{\@thesisHeader}
    
    % title
    \vspace{10ex}
    
    \begin{spacing}{1.1}
    \noindent\huge\textbf{\@title}
    \end{spacing}
    \end{flushleft}
    
    % author
    \doublespacing
    \begin{flushleft}
        \Large{\textbf{\@author}} \\
        {\UPD@studentid~\@studentId}\\
    % supervisor
    \vspace{1.8cm}
    \begin{minipage}[t]{8cm}
        \textsc{\UPD@advisor}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@advisor}}\\[-4mm]
        \large{\indent{\@advisorUniversity}}
        }
    \end{minipage}%
    \begin{minipage}[t]{7cm}
      % insert other advisor, if not empty
      \ifx\@otheradvisor\empty \else
        \textsc{\@otheradvisorDenomination}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@otheradvisor}}\\[-4mm]
        \large{\indent{\@otheradvisorUniversity}}
        }
      \fi
    \end{minipage}
      
      % insert co-advisor, if not empty
      \ifx\@coadvisor\empty \else
        \vspace{1cm}
        \textsc{\UPD@coadvisor}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@coadvisor}}\\[-4mm]
        \large{\indent{\@coadvisorUniversity}}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \Large\textsc{\UPD@academicyear~\@academicYear}
    \ifx\@graduationDate\empty \else
		\\
		\Large\textsc{\UPD@graduationDate~\@graduationDate}
		\fi
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}

% option phdcover: replace both cover styles with the PhD school title page
\ifunipd@phdcover
    \let\maketitle\makephdtitle
    \let\makecover\makephdtitle
\fi
\makeatother




% -- ABSTRACT --
\newenvironment{abstract}[1][en] {
    % get argument (en/it)
    \def\it{it}
    \def\arg{#1}
    
    \thispagestyle{plain}
    
    % set title in english or italian
    \ifx\arg\it
    \phantomsection
    \addcontentsline{toc}{section}{\abstractnameit}
        \section*{\LARGE\abstractnameit}
    \else
    \phantomsection
    \addcontentsline{toc}{chapter}{\abstractname}
        \section*{\LARGE\abstractname}
    \fi
} {
    \vfill \null
}

\newcommand{\abstractpage} {
    % english version
    \input{docs/abstract}
    % italian version
    \cleardoublepage
    \input{docs/sommario}
}

% -- ACRONYMS/ABBREVIATIONS --
\input{docs/glossary}


% -- MAIN MATTER --
\renewcommand{\mainmatter} {
    \cleardoublepage
    \pagestyle{fancy}
    \setDefaultHF
    \renewcommand{\headrulewidth}{1pt}
    
    % reset page counter
    \setcounter{page}{1}
    
    % set arabic page numbering
    \pagenumbering{arabic}
    
    % reset chapter counter
    \setcounter{chapter}{0}
    
    % inter-line spacing
    \setstretch{1.1}
}


% -- ACKNOWLEDGMENTS --
\makeatletter
\newcommand{\acknowledgments} {
  \chapter*{\UPD@acknowledgments}
  \markboth{\UPD@acknowledgments}{}
  \input{docs/acknowledgments}
}


% -- BACKMATTER --
\renewcommand{\backmatter}{
    %\cleardoublepage
    \bookmarksetup{startatroot}

    % glossary
    \begingroup     
    \let\clearpage\relax        
    \printglossaries
    \endgroup
    
    % references
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \printbibliography
  
    % acknowledgments
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\UPD@acknowledgments}
    \acknowledgments
}
\makeatother


% -- EXTRAS --
\input{template/extras}



% -- EXPORT --

\RequirePackage{etoolbox}
% The warning "Package pdfx Warning: Setting all color commands to rgb, consistent with the Color Model for PDF/A on input line 3126." is expected in pdfLaTeX 2025, so I will suppress it:
\RequirePackage{silence}
\WarningFilter{pdfx}{Setting all color commands to rgb}
%
\RequirePackage[a-2b]{pdfx}   % for PDF/A
% change hypersetup settings after loading it in pdfx

% -- LINKS SETUP --
\hypersetup{
  colorlinks=true,
  citecolor=generalHyperColor,
  filecolor=black,
  linkcolor=generalHyperColor,
  urlcolor=generalHyperColor,
  pdfborder={0 0 0}
}

%   (to patch warnings on Overleaf 2024 pdfLaTeX)
%\selectcolormodel{natural}
%ninecolors}
%\selectcolormodel{rgb}

% for placing conclusions & backmatter at root in the document outline
\RequirePackage{bookmark}
