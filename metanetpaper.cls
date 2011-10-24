\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[10pt, twoside]{scrartcl}
% Define papersize
\usepackage[paperwidth=210mm, paperheight=279mm, left=18mm, textwidth=169mm]{geometry}
%Images
\usepackage{graphicx}
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
% Two columns per page
\usepackage{pdfcolparallel}
% Linespacing
\usepackage[onehalfspacing]{setspace}
\usepackage{scrpage2}


% Own Markup
% -------------------

% Indent for new Paragraphs
\setlength\parindent{0pt}

% Select fonts
\setmainfont[Mapping=tex-text]{Adobe Garamond Pro}
\setsansfont[Mapping=tex-text]{Futura Std}
\setmonofont{Courier New}

% Colors
\definecolor{yellow}{rgb}{0.95,0.72,0}
\definecolor{orange}{rgb}{0.94,0.33,0}
\definecolor{lightorange}{rgb}{1,0.8,0.6}
\definecolor{red}{rgb}{0.7,0,0}
\definecolor{white}{rgb}{1,1,1}

% Headings - \section
\titleformat{\section}
{\color{red}\fontsize{18}{20}\selectfont \sffamily\bfseries}{\thesection}{1.12em}{}
% Headings - \subsection
\titleformat{\subsection}
{\vskip 0.5cm \color{orange}\fontsize{13}{15}\selectfont \sffamily\bfseries}{\thesubsection}{1em}{}
% Headings - \subsubsection
\titleformat{\subsubsection}
{\vskip 0.2cm \color{orange}\fontsize{11}{15}\selectfont \sffamily\bfseries}{\thesubsubsection}{0.62em}{}

% Unordered lists
\newenvironment{my_itemize}{
\begin{itemize}
  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}}{\end{itemize}
}

% Boxtexts
\newcommand{\boxtext}[1]{
	\begin{center}
		{\textbf{#1}}
	\end{center}
}

% Header and footer
	% SanSerif pagenumber
\setkomafont{pagenumber}{%
\normalfont\sffamily
}
	% Clear styling for head and foot
\clearscrheadings
\clearscrplain
\clearscrheadfoot 
	
	% Pagenumber on outer margin
\ohead[\pagemark]{\pagemark}
\setheadwidth[-20mm]{text}
\pagestyle{scrheadings}

% Titlepage
\renewcommand\maketitle{%
  \begin{titlepage}%
  	\ThisCenterWallPaper{1}{../media/titlepage.pdf}
  	\begin{center} 
  	  
      \textsf{{\Huge{
        \MakeUppercase{\@title}
      }}}
  	\end{center}
    \vfill
  \end{titlepage}
}

\endinput
