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
\LoadClass[11pt, twoside]{scrartcl}
% Define papersize
\usepackage[paperwidth=210mm, paperheight=279mm, top=40mm, bottom=20mm, left=18mm, textwidth=169mm, headsep=20mm, bindingoffset=0mm]{geometry}

\usepackage{graphicx}

% Colorize and customize the headings
\usepackage{color}
\usepackage{titlesec}
% Generate TOC with hyperlinks inside document, no border, no color
\usepackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}
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

\usepackage{xstring}



% Own Markup
% -------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}


% Select fonts
\setmainfont[Mapping=tex-text]{Garamond Premier Pro}
\setsansfont[Mapping=tex-text]{Futura}
  \newfontfamily\futuralight{Futura Light}
  \newfontfamily\futuramedium{Futura Medium}
\setmonofont{Courier New}


% Colors
\definecolor{white}{RGB}{255,255,255} % #FFFFFF
\definecolor{orange1}{RGB}{255,110,0} % #FF6600
\definecolor{orange2}{RGB}{255,155,0} % #FF9900
\definecolor{orange3}{RGB}{1,0.8,0.6} % #FFCC00
\definecolor{red_dark}{RGB}{153,0,0}  % #990000
\definecolor{red}{RGB}{255,151,0}     % #FF3300
\definecolor{green}{RGB}{204,55,153}  % #FF3300
\definecolor{grey1}{RGB}{60,60,60}    % #3C3C3C
\definecolor{grey2}{RGB}{198,199,200} % #C6C7C8


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

% 
% \renewcommand\ParallelRText{}


% Wie den Abstand aendern?
\newenvironment{my_itemize}{
  \begin{list}{\labelitemi}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
  }
}
{\end{list}}

% Marginal notes
\newcommand\boxtext[1]{
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
  \normalfont\sffamily\color{grey1}
}
  % Clear styling for head and foot
\clearscrheadings
\clearscrplain
\clearscrheadfoot 
  
  % Pagenumber on outer margin
\ohead[\pagemark]{\pagemark}
\setheadwidth{text}
\pagestyle{scrheadings}


% Titlepage
\renewcommand\maketitle{%
  \begin{titlepage}%
  \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
    \vspace*{0.3cm}
    % Left column
    \begin{minipage}[t]{8.7cm}
      \color{grey2}
      \textsf{
        \begin{flushright}
          % Subtitle
          \StrBefore{\@subtitle}{---} \\
          \vspace*{0.5cm}
          % Title
          \fontsize{34}{40}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{\@title}{---}
            }
          }
        \end{flushright}
        \vspace*{0.7cm}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{0.5cm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{8.5cm}
      \color{white}
      \textsf{
        \begin{flushleft}
          % Subtitle
          \textcolor{white}{%
            \StrBehind{\@subtitle}{---}
          } \\
          \vspace*{0.5cm}
          % Title
          \fontsize{34}{40}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{\@title}{---}
            }
          }
        \end{flushleft}
        \vspace*{0.7cm}
      }
    \end{minipage}
    % Authors
    \begin{Parallel}[c]{8.5cm}{7.5cm}
      \ParallelLText{
        \begin{flushright}
          \fontsize{14}{20}\selectfont{%
            \textsf{
              \textcolor{grey2}{by}
            }
          }
        \end{flushright}
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{13}{16}\selectfont{%
            \textsf{%
              \textcolor{white}{%
                \@author
              }
            }
          }
        \end{flushleft}
      }
      \ParallelPar
    \end{Parallel}
  \end{titlepage}
}


% Table of contents
\renewcommand\tableofcontents{
  \vspace*{-1cm}
  \begin{spacing}{1.1}
    \@starttoc{toc}
  \end{spacing}
}

\endinput
