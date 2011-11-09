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



% Dependencies
% ------------

% Define papersize
\usepackage[paperwidth=210mm, paperheight=279mm, top=21mm, bottom=34mm, left=24mm, right=22mm, headsep=20mm, bindingoffset=0mm]{geometry}

\usepackage{graphicx}
% Mathematical symbols
\usepackage{mathabx}
% Colorize and customize the headings
\usepackage[xetex]{color}
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
% String modifications
\usepackage{xstring}
% TOC modifications
\usepackage{tocloft}
% Conditional statements
\usepackage{ifthen}



% Class options & definitions
% ---------------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}


% Select fonts
\setmainfont[Mapping=tex-text]{Garamond Premier Pro}
\setsansfont[Mapping=tex-text]{Futura}
  \newfontfamily\futuralight{Futura Light}
  \newfontfamily\futurabook{Futura Book}
  \newfontfamily\futuramedium{Futura Medium}
\setmonofont[Scale=0.7]{DejaVu Sans Mono}


% Colors                                             
\definecolor{white}{cmyk}{0, 0, 0, 0}                % #FFFFFF
\definecolor{printblack}{cmyk}{0, 0, 0, 1}           % #141413
\definecolor{orange1}{cmyk}{0, 0.56, 0.86, 0}        % #FF6600
\definecolor{orange2}{cmyk}{0, 0.34, 0.87, 0.01}     % #FF9900
\definecolor{orange3}{cmyk}{0.01, 0.12, 0.91, 0.01}  % #FFCC00
\definecolor{corange1}{cmyk}{0.0, 0.216, 0.42, 0.04} % #F5B58E
\definecolor{corange2}{cmyk}{0.0, 0.32, 0.51, 0.04}  % #F5A676
\definecolor{corange3}{cmyk}{0.0, 0.38, 0.62, 0.04}  % #F5975D
\definecolor{corange4}{cmyk}{0.0, 0.44, 0.72, 0.04}  % #F58845
\definecolor{corange5}{cmyk}{0.0, 0.50, 0.82, 0.04}  % #F5792C
\definecolor{red_dark}{cmyk}{0.2, 1, 1, 0.10}        % #B72126
\definecolor{red}{cmyk}{0.2, 1, 1, 0.1}              % #C80000
\definecolor{red2}{cmyk}{0, 0.45, 0.26, 0}           % #ff8182
\definecolor{red3}{cmyk}{0.1, 0.8, 0.6, 0}           % #a83b3b
\definecolor{grey1}{cmyk}{0, 0, 0, 0.7}              % #3C3C3C
\definecolor{grey2}{cmyk}{0.16, 0.11, 0.09, 0}       % #C6C7C8
\definecolor{grey3}{cmyk}{0, 0, 0, 0.4}              % #C6C7C8
\definecolor{grey4}{cmyk}{0.54, 0.59, 0.77, 0.23}    % #847a6f
\definecolor{green}{cmyk}{0.82, 0.16, 0.79, 0.03}    % #1F9863
\definecolor{green2}{cmyk}{0.53, 0, 0.77, 0}         % #81C56B
\definecolor{blue}{cmyk}{0.65, 0, 0.26, 0}           % #44C1C5
\definecolor{blue2}{cmyk}{0.55, 0, 0.22, 0}          % #56D8D8
\definecolor{purple}{cmyk}{0.49, 0.32, 0, 0}         % #7e7fff

                                                      

% Headings
  % Reset all sections
\titleformat{\section}{}{
  \centering \fontsize{24}{25}\color{red}\sffamily\thesection
}{-0.35em}{\centering\protect\linebreak}

\titleformat{\subsection}{}{
  \color{white}\sffamily\thesubsection
}{-0.5em}{\centering\protect\linebreak}

\titleformat{\subsubsection}{}{
  \color{white}\sffamily\thesubsubsection
}{-0.5em}{\centering\protect\linebreak}

% Redefine \section as \ssection and then as \sectionstar and \sectionnostar
% for numbered and unnumbered sections
\newcommand{\ssection}{\@ifstar
                     \sectionStar%
                     \sectionNoStar%
}
\newcommand{\sectionNoStar}[2][]{%
  \clearpage
  \section[#2]{%
    \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
    \vspace*{4mm}
    % Left column
    \begin{minipage}[t]{79mm}
      \color{red}
      \textsf{
        \begin{flushright}
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{78mm}
      \color{grey1}
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{#2}{--- }
            }
          }
        \end{flushleft}
      }
    \end{minipage}
    \vspace*{-12mm}
  }
}
\newcommand{\sectionStar}[2][]{%
  \clearpage
    \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
    \vspace*{4mm}
    % Left column
    \begin{minipage}[t]{79mm}
      \color{red}
      \textsf{
        \begin{flushright}
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{78mm}
      \color{grey1}    
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{#2}{--- }
            }
          }
        \end{flushleft}
      }
    \end{minipage}  
    \vspace*{1mm}
}

% Redefine \subsection as \ssubsection
\newcommand{\ssubsection}[1]{%
  \subsection[#1]{%
    % Left column
    \begin{minipage}[t]{79mm}
      \vspace*{-13mm}
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{14}{16}\selectfont{%
            \MakeUppercase{%
              \thesubsection \ \protect\StrBefore{#1}{ ---}
            }
          }
        \end{flushleft}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{78mm}
      \vspace*{-13mm}
      \color{grey1}
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{14}{16}\selectfont{%
            \MakeUppercase{%
              \thesubsection \ \protect\StrBehind{#1}{--- }
            }
          }
        \end{flushleft}
      }
    \end{minipage}
    \vspace*{-11mm}
  }
}

% Redefine \subsubsection as \ssubsubsection
\newcommand{\ssubsubsection}[1]{%
  \subsubsection[#1]{%
    % Left column
    \begin{minipage}[t]{79mm}
      \vspace*{-14mm}
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{14}{16}\selectfont{%
            \protect\StrBefore{#1}{ ---}
          }
        \end{flushleft}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{78mm}
      \vspace*{-14mm}
      \color{grey1}
      \textsf{
        \begin{flushleft}
          % Title
          \fontsize{14}{16}\selectfont{%
            \protect\StrBehind{#1}{--- }
          }
        \end{flushleft}
      }
    \end{minipage}
    \vspace*{-14mm}
  }
}


%\renewcommand\ParallelRText[1]{{
%	\textcolor{grey1}{#1} }}



% Lists
  % List item style
%\renewcommand{\labelitemi}{$\sqbullet$}
  % List spacing
\newenvironment{my_itemize}{
  \begin{list}{\labelitemi}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
  }
}
{\end{list}
}


% Marginal notes
% \boxtext{your text}
\newcommand\boxtext[1]{
  \begin{center}
  \vspace*{2mm}
  \colorrule{printblack}{78mm}{0.25pt}
  \fontsize{11}{9}\selectfont{
    \textsf{
      #1
    }
  }
  \vspace*{2mm}
  \colorrule{printblack}{78mm}{0.25pt}
  \end{center}
}


% Lines
% \colorrule{<color>}{<width>}{<thickness>}
\newcommand*\colorrule[3]{%
  \color{#1}\rule{#2}{#3}\normalcolor
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
\ofoot[\pagemark]{\pagemark}
\pagestyle{scrheadings}


% Captions
\addtokomafont{caption}{\sffamily}


% Autors with affiliation
\def\authoraffiliation#1{\gdef\@authoraffiliation{#1}}
\def\@authoraffiliation{\@latex@warning@no@line{No \noexpand\authoraffiliation given}}

% Titlepage
\renewcommand\maketitle{%
  \begin{titlepage}%
  \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
    \vspace*{3mm}
    % Left column
    \begin{minipage}[t]{81mm}
      \color{grey2}
      \textsf{
        \begin{flushright}
          % Subtitle
          \StrBefore{\@subtitle}{ ---} \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{\@title}{--- }
            }
          }
        \end{flushright}
        \vspace*{7mm}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{85mm}
      \color{white}
      \textsf{
        \begin{flushleft}
          % Subtitle
          \textcolor{white}{%
            \StrBehind{\@subtitle}{--- }
          } \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{\@title}{ ---}
            }
          }
        \end{flushleft}
        \vspace*{7mm}
      }
    \end{minipage}
    % Authors
    \begin{Parallel}[c]{81mm}{77mm}
      \ParallelLText{
        \begin{flushright}
          \fontsize{14}{24}\selectfont{%
            \textsf{
              \textcolor{grey2}{by}
            }
          }
        \end{flushright}
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{14}{24}\selectfont{%
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
    
    % Mocktitle
    \cleardoublepage
    \pagestyle{empty} 
    \ThisCenterWallPaper{1}{../_media/mocktitlepage.pdf}
    \vspace*{3mm}
    % Left column
    \begin{minipage}[t]{81mm}
      \color{grey3}
      \textsf{
        \begin{flushright}
          % Subtitle
          \StrBefore{\@subtitle}{ ---} \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{\@title}{--- }
            }
          }
        \end{flushright}
        \vspace*{7mm}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{85mm}
      \color{red}
      \textsf{
        \begin{flushleft}
          % Subtitle
          \StrBehind{\@subtitle}{--- } \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{\@title}{ ---}
            }
          }
        \end{flushleft}
        \vspace*{7mm}
      }
    \end{minipage}
    % Authors
    \begin{Parallel}[c]{81mm}{77mm}
      \ParallelLText{
        \begin{flushright}
          \fontsize{14}{24}\selectfont{%
            \textsf{
              \textcolor{grey3}{by}
            }
          }
        \end{flushright}
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{14}{24}\selectfont{%
            \textsf{%
              \textcolor{red}{%
                \@authoraffiliation
              }
            }
          }
        \end{flushleft}
      }
      \ParallelPar
    \end{Parallel}
    
    \clearpage
  \end{titlepage}
}
\global\let\@authoraffiliation\@empty


% Bibliography
\renewenvironment{thebibliography}[1]{
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \vspace*{1cm}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
{\def\@noitemerr
 {\@latex@warning{Empty `thebibliography' environment}}%
\endlist}
      

% Table of contents
  % the sections
\renewcommand{\cftsecfont}{\fontsize{12}{9}\selectfont\futurabook}
\renewcommand{\cftsubsecfont}{\futuralight}
\renewcommand{\cftsubsubsecfont}{\futuralight}
  % the page numbers
\renewcommand{\cftsecpagefont}{\futurabook}  
\renewcommand{\cftsubsecpagefont}{\futuralight}
\renewcommand{\cftsubsubsecpagefont}{\futuralight}
  % remove 'Contents'
\renewcommand*\contentsname{}
  % set the depth
\setcounter{tocdepth}{2}

\endinput
