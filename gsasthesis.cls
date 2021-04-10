% This is file `gsasthesis.cls',
%
% LaTeX2e class for publishing a PhD thesis according to Harvard GSAS
% requirements:
%
% http://www.gsas.harvard.edu/images/stories/pdfs/form%20of%20dissertation.pdf
%
% Modifies appearance of standard report class.
%
% Author: Michal Kolesár
% E-mail: kolesarmi at googlemail dot com
% Disclaimer: not endorsed by Harvard, use at your own risk.


% 1. Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gsasthesis}


% 2. Load extra packages

% Load the report class and send it all class options
\LoadClassWithOptions{report}

\RequirePackage{natbib}
\RequirePackage{url}
\usepackage{xcolor}
\usepackage{hyperref}

\definecolor{SchoolColor}{rgb}{0.6471, 0.1098, 0.1882} % Crimson
\definecolor{chaptergrey}{rgb}{0.6471, 0.1098, 0.1882} % for chapter numbers
\definecolor{citecolor}{rgb}{0.2, 0.2, 0.6}
\definecolor{darkblue}{rgb}{0, 0, 0.5}

%\definecolor{cuhkcolor}{rgb}{0.63, 0.36, 0.94}}

%\definecolor{blue(pigment)}{rgb}{}

\hypersetup{
    colorlinks,
    citecolor=darkblue,
    filecolor=black,
    linkcolor=black,
    urlcolor=darkblue,
}

% Dissertation should be double-spaced throughout nodisplayskipstretch makes
% sure equations are single-spaced. Otherwise array-like objects (say pmatrix)
% look rather ugly.
\RequirePackage[nodisplayskipstretch,doublespacing]{setspace}
% This makes tables single-spaced by default. Since they are supposed to be
% double-spaced unless they are too long, need to set double-spacing for tables
% manually using \renewcommand{\arraystretch}{2} inside the table environment

% Add references, to Table of Contents, but not TOC itself, or list of tables
% and figures
\RequirePackage[nottoc,notlot,notlof]{tocbibind}

% 3. Required and Optional fields
\newcommand\degreename[1]{\renewcommand\@degreename{#1}}
\newcommand\@degreename{\ClassError{gsasthesis}{No \noexpand\degreename given}{}}

\newcommand\degreefield[1]{\renewcommand\@degreefield{#1}}
\newcommand\@degreefield{\ClassError{gsasthesis}{No \noexpand\degreefield given}{}}

\newcommand\degreemonth[1]{\renewcommand\@degreemonth{#1}}
\newcommand\@degreemonth{\ClassError{gsasthesis}{No \noexpand\degreemonth given}{}}

\newcommand\degreeyear[1]{\renewcommand\@degreeyear{#1}}
\newcommand\@degreeyear{\ClassError{gsasthesis}{No \noexpand\degreeyear given}{}}

\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{\ClassError{gsasthesis}{No \noexpand\department given}{}}

\newcommand\principaladvisor[1]{\renewcommand\@principaladvisor{#1}}
\newcommand\@principaladvisor{\ClassError{gsasthesis}{No \noexpand\principaladvisor given}{}}

% Optional
\newcommand\secondadvisor[1]{\newcommand\@secondadvisor{#1}}


\newcommand{\committee}[1]{\def\@committee{#1}}
\newcommand{\thecommittee}{\@committee}

\committee{
\centering
  Professor AAA (Chair)\\
  Professor BBB (Thesis Supervisor)\\
  Professor CCC (Committee Member)\\
  Professor DDD (External Examiner)
%\end{flushleft}
}

\newcommand{\committeepage}{
    \newpage
    \thispagestyle{empty}
    \vspace*{10mm}
    \begin{center}
        \vfill
        %\Large
        \underline{Thesis Assessment Committee}
        \vskip 1cm{
            \thecommittee
        }
        \vfill
    \end{center}
    \par
    \vskip 1.5em
}


% 4. (Re)define commands and environments
\newcommand{\thesistitlepage}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \null\vfil
    %\addcontentsline{toc}{section}{Title Page} % seems silly to add it
    \begin{center}
      {\huge\bfseries{\@title}}\\[3em]
      %A dissertation presented\\
      %by\\[2em]
      {\Large\bfseries\@author}\\[2em]
      %\\[2em]
      %{\large\@department}\\[2em]
      A Thesis Submitted in Partial Fulfillment \\
      of the Requirements for the Degree of \\
      \@degreename\\
      in \\
      {\@department}\\[4em]
      %in\\
      %{\large\@department}\\[2em]
      %\@degreefield\\
      The Chinese University of Hong Kong\\
      \@degreemonth\ \@degreeyear
    \end{center}
    \vfil\null
  \end{titlepage}
  \addtocounter{page}{1} % titlepage is not numbered by default
}

\newcommand{\copyrightpage}
{
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \copyright\ \@degreeyear\ \@author\\
    All rights reserved.
  \end{center}
  \vfil\null
  \clearpage
}

\renewenvironment{abstract}%
{
  \clearpage
  % Standard spacing for the header
  \begin{spacing}{1.2}
  %  \begin{center}
  %    {\large\bfseries\@title}
  %  \end{center}
  %  \vspace{2em}
  \end{spacing}
  \addcontentsline{toc}{section}{Abstract}
  \chapter*{\abstractname}
  %\section*{\abstractname}
}%

\newenvironment{cabstract}%
{
  \clearpage
  \begin{spacing}{1.2}
  \end{spacing}
  % Standard spacing for the header
  %\addcontentsline{toc}{section}{Chinese Abstract}
  \chapter*{\begin{CJK}{UTF8}{gbsn}摘要\end{CJK}}
}%

{\clearpage}

% GSAS: "Table of contents, lists of figures and tables can be single-spaced".
% Let's redefine them to be single-spaced.

% Save the latex commands
\let\LaTeXTOC\tableofcontents
\let\LaTeXLOT\listoftables
\let\LaTeXLOF\listoffigures

% Redefine them
\renewcommand{\tableofcontents}%
{
  \begin{spacing}{1.2} % 1.2 looks nicer than 1
    \LaTeXTOC
  \end{spacing}
}
\renewcommand{\listoftables}%
{
  \begin{spacing}{1.2}
    \LaTeXLOT
  \end{spacing}
}
\renewcommand{\listoffigures}%
{
  \begin{spacing}{1.2}
    \LaTeXLOF
  \end{spacing}
}


\newenvironment{acknowledgments}
{
  \clearpage
  \addcontentsline{toc}{section}{Acknowledgments}
  \section*{\centering Acknowledgments}
}
{\clearpage}

\newenvironment{dedication}
{
  \clearpage
  \par\vspace*{.2\textheight}
  \begin{quotation}
}
{\end{quotation}\clearpage}

% 4. Odds and ends

% Quotations should be single-spaced
\expandafter\def\expandafter\quote\expandafter{\quote\singlespacing}
\expandafter\def\expandafter\quotation\expandafter{\quotation\singlespacing}

% Footnotes should single-spaced (setspace default), but there should be
% double-spacing between footnotes.
\setlength{\footnotesep}{0.8\baselineskip}

% Indicate that LaTeX can stop reading this file. LaTeX will ignore anything
% after this line. Not required, but good practice.
\endinput
