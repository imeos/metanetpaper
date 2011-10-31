%                                     MMMMMMMMM                                         
%                                                                             
%  MMO    MM   MMMMMM  MMMMMMM   MM    MMMMMMMM   MMD   MM  MMMMMMM MMMMMMM   
%  MMM   MMM   MM        MM     ?MMM              MMM$  MM  MM         MM     
%  MMMM 7MMM   MM        MM     MM8M    MMMMMMM   MMMMD MM  MM         MM     
%  MM MMMMMM   MMMMMM    MM    MM  MM             MM MMDMM  MMMMMM     MM     
%  MM  MM MM   MM        MM    MMMMMM             MM  MMMM  MM         MM     
%  MM     MM   MMMMMM    MM   MM    MM            MM   MMM  MMMMMMM    MM
%
%
%                - META-NET Language Whitepaper | CLASS -



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[10pt, twoside]{scrartcl}
% Define papersize
\usepackage[paperwidth=210mm, paperheight=279mm, top=40mm, bottom=20mm, left=18mm, textwidth=169mm, headsep=20mm, bindingoffset=0mm]{geometry}

\usepackage{graphicx}
\usepackage{hyperref}

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
\setlength{\parindent}{0pt}


% Table of contents
\renewcommand\tableofcontents{
  \vspace*{0.1cm}
  \begin{spacing}{1.2}
    \@starttoc{toc}
  \end{spacing}
}


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
\definecolor{grey}{rgb}{0.7,0.7,0.7}


% Headings - \section
\titleformat{\section}{
  \fontsize{18}{20}\selectfont \sffamily  \uppercase
}{\centering--- \thesection \ ---}{-1.5em}{\centering\protect\linebreak}
% Headings - \subsection
\titleformat{\subsection}{
  \vskip 0.5cm \fontsize{13}{15}\selectfont \sffamily
}{\thesubsection}{1em}{}
% Headings - \subsubsection
\titleformat{\subsubsection}{
  \vskip 0.2cm \fontsize{11}{15}\selectfont \sffamily
}{\thesubsubsection}{0.62em}{}


% Unordered lists
\newenvironment{my_itemize}{
  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}
}


% Marginal notes
\newcommand{\boxtext}[1]{
  {\vspace*{0.2cm}}
  \begin{center}
    \large{
      \textsf{
        \MakeUppercase{
          #1
        }
      }
    }
  \end{center}    
    {\vspace*{0.2cm}}
}


% Header and footer
	% Sans-serif pagenumber
\setkomafont{pagenumber}{%
  \normalfont\sffamily\color{grey}
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
        \parbox{11cm}{
      	  \begin{center}
        	  \vspace*{3.2cm}
        	  \begin{spacing}{2.5}
        	    \textsf{
          	    \Huge{
                  \MakeUppercase{
                    \@title % title
                  }
                }
              }\\[0.5cm]
              \textit{
                \fontsize{13}{15}\selectfont{
                  -- \@subtitle \ -- % subtitle
                }
              }
            \end{spacing}
        	\end{center}
        }  
      	\end{center}
    \vfill
  \end{titlepage}
}

\endinput
