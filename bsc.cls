\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsc}[2015/07/22 Style for my bachelor thesis]

\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption{digital}{\@printfalse}

\ProcessOptions\relax


% General
\LoadClassWithOptions{scrreprt}

% Language
\RequirePackage[ngerman,english]{babel} % all languages being used, with main language last in list

% Geometry
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage[a4paper,width=150mm,top=30mm,bottom=30mm]{geometry}

% Links
\RequirePackage{color,xcolor}
\RequirePackage{hyperref}
\if@print % switch link coloring off for printing
	\hypersetup{colorlinks=false}
\else
	\hypersetup{colorlinks=true}
\fi
\definecolor{uhd}{RGB}{196,19,47} % the red UHD brand color
\hypersetup{
	allcolors=uhd
}
\AtBeginDocument{
	\hypersetup{ % set pdf metadata
	    pdfauthor={\@author},
		pdftitle={\@title}
	}
}

% Fonts
\RequirePackage{fontspec,xunicode}
\setmainfont{Palatino}
\setsansfont{Optima}
\setmonofont[Scale=MatchLowercase]{Menlo}

% Units
\RequirePackage[separate-uncertainty]{siunitx}

% Tables
\RequirePackage{array} % for math mode in tables
\RequirePackage{booktabs} % for hline rules

% Quotations
\RequirePackage{epigraph}
\setlength{\epigraphwidth}{.8\textwidth}
\setlength{\epigraphrule}{0pt}

% Page Layout
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\usepackage{include/flipbook}
\newlength{\pagenumberwidth}
\setlength{\pagenumberwidth}{2em}
\fancyhf{}
\if@twoside
	\fancyhead[LE]{
	    \textit{\nouppercase{\leftmark}}%
	}
	\fancyhead[RO]{
		\textit{\nouppercase{\rightmark}}%
	}
	\fancyfoot[RO]{
		\labeledflipbookframe[0][0.5]{flipbook_frames/plus_}[pgf][0.2]{r}{\thepage}{\pagenumberwidth}%
	}
	\fancyfoot[LE]{
		\labeledflipbookframe[0][0.5]{flipbook_frames/cross_}[pgf][0.2]{l}{\thepage}{\pagenumberwidth}%
	}
\else
	\fancyhead[L]{
	    \textit{\nouppercase{\leftmark}}%
	}
	\fancyfoot[C]{
		\labeledflipbookframe[-2]{flipbook_frames/plus_}[pgf][0.2]{c}{\thepage}{\pagenumberwidth}%
	}
\fi
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
	\fancyhead{}
	\renewcommand{\headrulewidth}{0pt}
}

% Type optimization
\RequirePackage{microtype}

% Bibliography
\RequirePackage[style=numeric-comp,backend=biber,maxnames=10,maxcitenames=2]{biblatex}
%\nocite{*} % print all references, even those not used

% Appendix
\RequirePackage[toc,page]{appendix}


\endinput
