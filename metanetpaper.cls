\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{/Users/chris/Documents/Studies/FHP/DFKI/metanetpaper/metanetpaper}[2011/09/19 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl'
\LoadClass[10pt]{scrartcl}

\usepackage[]{graphicx}
% Parallel, two-column layout
\usepackage[]{parallel}
% ...  in EN ISO 216 B5 format
\usepackage[paper=b5paper]{geometry}
% Colorize and customize the headings
\usepackage{color}
\usepackage{titlesec}
% XeLaTeX packages 
\usepackage[T1]{fontenc}
\usepackage{fontspec}



%Select fonts
\setmainfont[Mapping=tex-text]{Chaparral Pro Light}
\setsansfont[Mapping=tex-text]{DIN}
\setmonofont{Monaco}

% Color definitions
\definecolor{yellow}{rgb}{0.95,0.72,0}
\definecolor{orange}{rgb}{0.94,0.33,0}
\definecolor{brown}{rgb}{0.75,0,0}
\definecolor{white}{rgb}{1,1,1}

% The basic layout
\setlength{\textheight}{180mm}
\setlength{\textwidth}{125mm}
\setlength{\parindent}{0pt} % Indent for new paragraphs
\setlength{\parskip}{0.2cm} % Spacing between paragraphs

% Headings - \section
\titleformat{\section}
{\clearpage\color{brown}\fontsize{18}{20}\selectfont \sffamily\bfseries}{\thesection}{1.12em}{}
% Headings - \subsection
\titleformat{\subsection}
{\vskip 0.5cm \color{orange}\fontsize{13}{15}\selectfont \sffamily\bfseries}{\thesubsection}{1em}{}
% Headings - \subsubsection
\titleformat{\subsubsection}
{\vskip 0.2cm \color{orange}\fontsize{11}{15}\selectfont \sffamily\bfseries}{\thesubsubsection}{0.62em}{}



% The first page
\renewcommand\maketitle{%
  \begin{titlepage}%
	  {\pagecolor{orange}}
	  \null\vfil
	  \vskip 1cm%
	    {\color{white}\fontsize{30}{44}\selectfont \textsf{\textbf{\@title}} \par}%
	  \vskip 1cm%
	    {\fontsize{14}{17}\selectfont \textsf{\textbf{\@author}} \par}%
	  \vskip 1cm%
	    {\color{yellow}\fontsize{12}{15}\selectfont \textsf{\textbf{\@date}} \par}%
	  \vfill	
	    {\footnotesize The development of this white paper has been funded by the Seventh Framework Programme and the ICT Policy Support Programme of the European Commission under contracts T4ME (Grant Agreement 249119), CESAR (Grant Agreement 271022), METANET4U (Grant Agreement 270893) and META-NORD (Grant Agreement 270899).}
  \end{titlepage}
	{\pagecolor{white}}
}

\endinput
