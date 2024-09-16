% =============================================================
%   LaTeX thesis template    ----------------------------------
%   ver 1.1 //  major review 1.1  //  September 2024, 15th
%
%   by Francesco Barone, github.com/baronefr
%   released under CC licence
%
%   This template is available on overleaf and through the 
%   following repository:
%       https://github.com/baronefr/unipd-thesis-modern
%
% -------------------------------------------------------------
%
%  The cover of this thesis template and some elements of the 
%  class structure has been adapted from this template:
%   - Luca Martinelli: Computer Engineering MsC Thesis - UniPD,
%     https://www.overleaf.com/latex/templates/computer-engineering-msc-thesis-unipd/yvnskxpfyfkc
%
% -------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unipd-thesis-modern}[UniPd thesis template]



% -- GENERAL SETUP --

% ref class
\LoadClass[11pt, a4paper, twoside, openright]{book}

% page geometry
\RequirePackage[
  twoside,a4paper,
  headheight=14pt,textwidth=5.3in, 
  textheight=8.1866in, top=45mm
]{geometry}


% inverse page offset for book print
\let\tmp\oddsidemargin
\let\oddsidemargin\evensidemargin
\let\evensidemargin\tmp
\reversemarginpar  

% packages to load here to avoid conflicts:
\RequirePackage{scrextend}
\RequirePackage[explicit]{titlesec}
% ---------


% language, font and encodings
\RequirePackage{newpxtext} %,newpxmath
\RequirePackage[T1]{fontenc}
\RequirePackage{amsfonts}
\RequirePackage[english]{babel}


% export in PDF/A or PDF/X
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}
\RequirePackage[a-3a,latxmp,mathxmp]{pdfx}
%   (to patch warnings)
\selectcolormodel{natural}
\RequirePackage{ninecolors}
\selectcolormodel{rgb}



% -- USEFUL PACKAGES --

% links
%\RequirePackage{hyperref} % hyperref loaded in pdfx
\RequirePackage{url}

% graphics
\RequirePackage{graphicx}


% colors
\RequirePackage{color}
%\RequirePackage[table]{xcolor}

    % generic colors
    \definecolor{pastelgreen}{RGB}{0.01, 0.75, 0.24}
    \definecolor{aliceblue}{RGB}{0.94, 0.97, 1.0}
    
    % color refs
    \definecolor{mainColor}{RGB}{155, 0, 20}
    \definecolor{chapterColor}{RGB}{155, 0, 20}
    %   Note: unipd color is {RGB}{155, 0, 20}


% mathematics
\RequirePackage{amsmath}
\RequirePackage{braket}
\RequirePackage[makeroom]{cancel}
\RequirePackage{bigints}
\RequirePackage{makecell}
\RequirePackage[bb=boondox]{mathalfa}
\RequirePackage{dsfont}
\RequirePackage{witharrows} % look this ans: https://tex.stackexchange.com/questions/12621/multi-line-equations-with-explanations-on-some-lines
\RequirePackage{amsthm} % for theorems
\RequirePackage{amssymb}






\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\renewcommand{\appendixname}{}%
\newcommand{\parallelslant}{\mathbin{\!/\mkern-5mu/\!}}
\headsep = 30pt

\newcommand{\equalexpl}[1]{%
  \underset{\substack{\uparrow\\\mathrlap{\text{\hspace{-1em}#1}}}}{=}}



% appendix
\RequirePackage{appendix}

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}
\addtolength{\footnotesep}{1mm}

\makeatletter
\setlength{\@fptop}{0pt}
% for aligning all floating figures/tables etc... to the top margin
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
\def\studentId#1{\gdef\@studentId{#1}}
\def\secondpage#1{\gdef\@secondpage{#1}}
\def\dedication#1{\gdef\@dedication{#1}}

% advisors
\def\advisor#1#2{\gdef\@advisor{#1} \gdef\@advisorUniversity{#2}}
\def\coadvisor#1#2{\gdef\@coadvisor{#1} \gdef\@coadvisorUniversity{#2}}
\newcommand{\otheradvisor}[3][Internal Supervisor]{\gdef\@otheradvisor{#2} \gdef\@otheradvisorUniversity{#3} \gdef\@otheradvisorDenomination{#1}}
\makeatother

% make these empty by default
\coadvisor{}{}
\otheradvisor{}{}
\secondpage{}
\dedication{}







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
\RequirePackage[explicit]{titlesec} % custom title style


% chapter style
\newcommand*\chapterlabel{}
\titleformat{\chapter}[display]
	{\normalfont\bfseries\Huge} % format of the chapter
	{\gdef\chapterlabel{\thechapter\ }} % label 
 	{0pt} % separation between label and chapter-title
 	  {\begin{tikzpicture}[remember picture,overlay]
    \node[yshift=-8cm] at (current page.north west)
      {\begin{tikzpicture}[remember picture, overlay]
        \fill[chapterColor] (0,0) rectangle(35.5mm,15mm);
        \node[anchor=north east,yshift=-7.1cm,xshift=32mm,minimum height=30mm,inner sep=0mm] at (current page.north west)
        {\parbox[top][30mm][t]{15mm}{\raggedleft 
        \color{white}\bfseries\chapterlabel}};
        \node[anchor=north west,yshift=-7.1cm,xshift=45mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north west)
              {\parbox[top][30mm][t]{\textwidth}{\color{black}#1}};
       \end{tikzpicture}
      };
   \end{tikzpicture}
   \gdef\chapterlabel{}
}
% chapter style (numberless)
\titleformat{name=\chapter,numberless}[display]
	{\normalfont\bfseries\Huge} % format of the chapter
	{\gdef\chapterlabel{\thechapter\ }} % label 
 	{0pt} % separation between label and chapter-title
 	  {\begin{tikzpicture}[remember picture,overlay]
    \node[yshift=-8cm] at (current page.north west)
      {\begin{tikzpicture}[remember picture, overlay]
        \fill[chapterColor] (0,0) rectangle(35.5mm,15mm);
        \node[anchor=north west,yshift=-7.1cm,xshift=45mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north west)
              {\parbox[top][30mm][t]{\textwidth}{\color{black}#1}};
       \end{tikzpicture}
      };
   \end{tikzpicture}
   \gdef\chapterlabel{}
}

\renewcommand{\headrulewidth}{0pt} % remove line headers
\titlespacing*{\chapter}{0pt}{50pt}{70pt}
\renewcommand{\thesubsection}{\thesection.\alph{subsection}} % subsections with letters

% style for headers and footers
\newcommand{\setDefaultHF} {
    \fancyhf{}
    \fancyhead[RO, LE]{\thepage}
    \fancyhead[LO]{{\footnotesize\rightmark}}
    \fancyhead[RE]{{\footnotesize\leftmark}}
}



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
    \fancyhead[RO, LE] {\thepage}
    
    % custom titles 
    \def\abstractname{Abstract}
    \def\abstractnameit{Sommario}
    \def\listacronymname{Acronyms}
    \def\acknowledgmentsname{Acknowledgments}
    %\renewcommand{\bibname}{References}
    
    % insert dedication page
    \dedicationpage
    
    % insert table of contents
    {\hypersetup{linkcolor=black}\titlespacing*{\chapter}{0pt}{10pt}{10pt}\tableofcontents}
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
        top=1.4cm, bottom=2cm,
        inner=4cm, outer=2cm,
        headheight=0cm,includehead,includefoot
    }
    
    \fancyhf{}
    \thispagestyle{empty}

    % add watermark
    \thiswatermark{\centering
    \put(-294,-750){\includegraphics[width=1.4\linewidth]{template/unipdbg}}
    }

    % logo(s)
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{template/universis}}
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
        \small{ ID \@studentId}\\

    % supervisor
    \vspace{2.7cm}
    \begin{minipage}[t]{7cm}
        \textsc{Supervisor}\\
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
        \textsc{Co-supervisor}\\
        {\setlength\parindent{1mm}
        \indent\large{\textbf{\@coadvisor}}\\
        \indent\small\textbf{\@coadvisorUniversity}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \normalsize\textsc{Academic Year \@academicYear}
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}





% -- DEDICATION --
\newcommand{\dedicationpage} {
\ifx\@dedication\empty \else
    % set empty style for this page (no headers and footers)
    \thispagestyle{empty}
    
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
    {\hspace{-22.5mm}\noindent\printlogos[2.4cm]{template/universis}}

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
        { ID \@studentId}\\
    % supervisor
    \vspace{1.8cm}
    \begin{minipage}[t]{8cm}
        \textsc{Supervisor}\\
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
        \textsc{Co-supervisor}\\
        {\setlength\parindent{1mm}
        \indent\Large{\textbf{\@coadvisor}}\\[-4mm]
        \large{\indent{\@coadvisorUniversity}}
        }
      \fi
    \end{flushleft}

    \vspace*{\fill}
    \begin{flushleft}
    \Large\textsc{Academic Year \@academicYear}
    \end{flushleft}
    \vspace{5mm}
    
    % restore defaults
    \restoregeometry
    %\onehalfspacing
}
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
        \section*{\abstractnameit}
    \else
    \phantomsection
    \addcontentsline{toc}{chapter}{\abstractname}
        \section*{\abstractname}
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
\newcommand{\acknowledgments} {
  \chapter*{\acknowledgmentsname}
  \markboth{\acknowledgmentsname}{}
  \input{docs/acknowledgments}
}

% -- ACRONYMS/ABBREVIATIONS --

\input{docs/glossary}




% -- BACKMATTER --
\renewcommand{\backmatter}{
    %\cleardoublepage

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
    \addcontentsline{toc}{chapter}{\acknowledgmentsname}
    \acknowledgments
}



% -- EXTRAS --
\input{template/extras}


% -- LINKS SETUP --
%\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  citecolor=mainColor,
  filecolor=black,
  linkcolor=mainColor,
  urlcolor=mainColor
}




