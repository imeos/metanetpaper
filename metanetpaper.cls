\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[10pt,twoside]{scrartcl}

\usepackage{graphicx}
% Parallel, two-column layout
%\usepackage{parallel}
% ...  in EN ISO 216 B5 format
\usepackage[paper=b5paper,hcentering,bindingoffset=10mm]{geometry}
% Alles weg und oddside und evenside nehmen


% Colorize and customize the headings
\usepackage{color}
\usepackage{titlesec}
% Generate TOC with hyperlinks inside document
\usepackage{hyperref}
% Custom background-images
\usepackage{wallpaper}
% XeLaTeX packages 
\usepackage[T1]{fontenc}
\usepackage{fontspec}
% Header and footer
\usepackage{fancyhdr}
%Margin
\usepackage{marginnote}
\newcommand{\margin}[1]{\marginnote{\scriptsize #1}}
\setlength{\marginparwidth}{30mm}
%\setlength{\marginparpush}{80mm}
\reversemarginpar
\setlength{\oddsidemargin}{2cm}

%Select fonts
\setmainfont[Mapping=tex-text]{Georgia}
\setsansfont[Mapping=tex-text]{DIN}
\setmonofont{Courier New}

% Color definitions
\definecolor{yellow}{rgb}{0.95,0.72,0}
\definecolor{orange}{rgb}{0.94,0.33,0}
\definecolor{lightorange}{rgb}{1,0.8,0.6}
\definecolor{red}{rgb}{0.7,0,0}
\definecolor{white}{rgb}{1,1,1}

% The basic layout
\setlength{\textheight}{200mm}
\setlength{\textwidth}{80mm}
\setlength{\parindent}{0pt} % Indent for new paragraphs
\setlength{\parskip}{0.2cm} % Spacing between paragraphs

% Headings - \section
\titleformat{\section}
{\color{red}\fontsize{18}{20}\selectfont \sffamily\bfseries}{\thesection}{1.12em}{}
% Headings - \subsection
\titleformat{\subsection}
{\vskip 0.5cm \color{orange}\fontsize{13}{15}\selectfont \sffamily\bfseries}{\thesubsection}{1em}{}
% Headings - \subsubsection
\titleformat{\subsubsection}
{\vskip 0.2cm \color{orange}\fontsize{11}{15}\selectfont \sffamily\bfseries}{\thesubsubsection}{0.62em}{}

% Header and footer
\pagestyle{fancy}
\fancyhead[LE]{\textsf \rightmark}
\fancyhead[RO]{\textsf \leftmark}
\fancyhead[LO,RE]{}
\fancyfoot[C]{}
\fancyfoot[LE]{\textsf \thepage \hskip 0.4cm \rule[-1.1cm]{0.25pt}{1.6cm}}
\fancyfoot[RO]{\rule[-1.1cm]{0.25pt}{1.6cm} \hskip 0.2cm \textsf \thepage}



% The first page
\renewcommand\maketitle{%
  \begin{titlepage}%
	\ThisLRCornerWallPaper{1.02}{../media/titlepage_bg.jpg} 
	\begin{flushright} \includegraphics[width=4cm]{../media/metanet_logo_white.pdf}
	  \null\vfil
	  \vskip 1cm%
	    {\color{white}\fontsize{30}{44}\selectfont \textsf{\textbf{\@title}} \par}%
	  \vskip 1cm%
	    {\color{lightorange}\fontsize{14}{17}\selectfont \textsf{\@author} \par}%
	  \vskip 1cm%
	    {\color{yellow}\fontsize{12}{15}\selectfont \textsf{\textbf{\@date}} \par}%
	  \vfill
	  \colorbox{white}{
			\hskip -0.08cm 
			\includegraphics[height=1cm]{../media/eu_flag.pdf} 
			\hskip 0.4cm 
			\includegraphics[height=1cm]{../media/fp7_logo.pdf} 
			\hskip 0.2cm 
			\includegraphics[height=1cm]{../media/ictpsp_logo.pdf}
	  }
  \end{flushright}
	    {\color{white}\footnotesize The development of this white paper has been funded by the Seventh Framework Programme and the ICT Policy Support Programme of the European Commission under contracts T4ME (Grant Agreement 249119), CESAR (Grant Agreement 271022), METANET4U (Grant Agreement 270893) and META-NORD (Grant Agreement 270899).}
  \end{titlepage}
}

\endinput
