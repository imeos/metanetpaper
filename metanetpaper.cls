%                                     MMMMMMMMM
%
%  MMA    MM   MMMMMM  MMMMMMM   MM    MMMMMMMM   MMA   MM  MMMMMMM MMMMMMM
%  MMMA AMMM   MM        MM     MMMM              MMMM  MM  MM        MM
%  MM MMM MM   MMMMMM    MM    IM  MI   MMMMMMM   MM MMxMM  MMMMMM    MM
%  MM  M  MM   MM        MM   .MMMMMM.            MM  MMMM  MM        MM
%  MM     MM   MMMMMM    MM   MM    MM            MM   MMM  MMMMMMM   MM
%
%
%             - META-NET White Paper | XeTeX CLASS -
%
% 
% ---------------------------------------------------------------------
%
% Class options
% []      = Set the inner part of the LWP
% [cover] = Set the cover of the LWP
% [ebook] = Set the eBook version of the LWP (including cover and inner part)
% [plain] = Create a whitepaper without ISSN and third-party logo(s)
% [plain_cover] = Create a whitepaper without ISSN and third-party logo(s)
%
% ---------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[11pt, twoside, numbers=noendperiod]{scrartcl}


% Dependencies
% ---------------------------------------------------------------------

% Define papersize 210x279mm + 3mm bleed
\RequirePackage[paperwidth=216mm, paperheight=285mm, top=24mm, bottom=37mm, left=27mm, right=25mm, headsep=20mm, bindingoffset=0mm]{geometry}

\RequirePackage{graphicx}
\RequirePackage{mathabx} % Mathematical symbols
\RequirePackage[xetex]{color} % Colorize and customize the headings
\RequirePackage{titlesec} % Generate TOC with hyperlinks inside document, no border, no color
%\RequirePackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}
\RequirePackage{url}
\RequirePackage{wallpaper} % Custom background-images
\RequirePackage[T1]{fontenc} % XeLaTeX packages 
\RequirePackage{fontspec}
\RequirePackage{parallel} % Two columns per page
\RequirePackage{multicol}
\RequirePackage[onehalfspacing]{setspace} % Linespacing
\RequirePackage{scrpage2}
\RequirePackage{xstring} % String modifications
\RequirePackage{tocloft} % TOC modifications
\RequirePackage{ifthen} % Conditional statements
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabulary}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{rotating} % Sideways text and figures
\RequirePackage{colortbl}
\RequirePackage{etoolbox} % Conditionally select images based on doc. class
\newtoggle{lowres}


% Class definitions
% ---------------------------------------------------------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}


% Package multicol options
  % Gutter between columns
\setlength{\columnsep}{5mm}


% Figure format
\renewcommand*{\figureformat}{\sffamily\thefigure\autodot}


% Set fonts
\setmainfont[Mapping=tex-text]{Garamond Premier Pro}
\setsansfont[Mapping=tex-text]{Futura}
  \newfontfamily\futuralight{Futura Light}
  \newfontfamily\futurabook{Futura Book}
  \newfontfamily\futuramedium{Futura Medium}
\setmonofont[Scale=0.7]{DejaVu Sans Mono}
  \newfontfamily\linguistics[Scale=0.8]{DejaVu Serif}


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
\definecolor{blue}{cmyk}{0.92, 0.7, 0, 0}            % #2020c0


% Orphans and widows
% \widowpenalties 3 10000 10000 100 
% \clubpenalties 3 10000 10000 100
% CAREFUL: There are sideeffects with the "parallel" package!



% Headings
  % Reset all sections, subsections and subsubsections
\titleformat{\section}{}{
  \centering \fontsize{24}{1.2}\color{red}\sffamily\thesection
}{-0.35em}{\centering\protect\linebreak}

\titleformat{\subsection}[block]{}{\raggedright\LARGE\futuralight\thesubsection}{0.5em}{\linespread{1.1}\raggedright\LARGE\sffamily\MakeUppercase}\titlespacing{\subsection}{0pt}{*4}{*1}

\titleformat{\subsubsection}{}{\fontsize{14}{14}\futuralight\thesubsubsection}{0.5em}{\fontsize{14}{1.2}\sffamily}

  % Redefine \section as \ssection and then as \sectionstar and \sectionnostar
  % for numbered and unnumbered sections
\newcommand{\ssection}{\@ifstar
                     \sectionStar%
                     \sectionNoStar%
}
\newcommand{\sectionNoStar}[2][]{%
  \section[#1]{%
    \vspace*{1mm}
    \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
    \begin{minipage}[t]{\textwidth}
      \begin{flushleft}
        \begin{spacing}{2.2}
        \color{red}
        \textsf{%
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{#2}
          }
        }
        \end{spacing}
      \end{flushleft}
    \end{minipage}
    \vspace*{-8mm}
  }
}
\newcommand{\sectionStar}[2][]{%
  \clearpage
  \vspace*{9mm}
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  \begin{minipage}[t]{\textwidth}
    \begin{flushleft}
      \begin{spacing}{2.2}
      \color{red}
      \textsf{%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{#2}
        }
      }
      \end{spacing}
    \end{flushleft}
  \end{minipage}
}

  % Redefine bilingual \sections
  % Unstarred bsections will be added to the appendix of the TOC
\newcounter{bsectioncounter}
\renewcommand{\thebsectioncounter}{\Alph{bsectioncounter}}
\newcommand{\bsection}{\@ifstar
                     \bsectionStar%
                     \bsectionNoStar%
}
\newcommand{\bsectionNoStar}[2][]{%
  \clearpage
  \stepcounter{bsectioncounter}
  \ifx#1\@null
  \ifsecondargument
    \addcontentsline{toc}{section}{\thebsectioncounter\hskip0.75em #2}
  \else
    \addcontentsline{toc}{section}{\thebsectioncounter\hskip0.75em #1}
  \fi
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  % Numbering
  \begin{center}
    \textsf{%
      \fontsize{24}{24}\selectfont{%
        \textcolor{red}{%
          \thebsectioncounter\\
        }
      }
    }
  \end{center}
  \vspace*{-6mm}
  % original language
  \begin{minipage}[t]{78mm}
      \color{red}
      \textsf{%
        \begin{flushright}%
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
        \vspace*{3mm}
      }
  \end{minipage}
  % spacing between colums
  \begin{minipage}[t]{6.5mm}\ \end{minipage}
  % english version
  \begin{minipage}[t]{81mm}
    \color{grey1}
    \textsf{%
      \begin{flushleft}%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{%
            \protect\StrBehind{#2}{--- }
          }
        }
      \end{flushleft}
      \vspace*{3mm}
    }
  \end{minipage}
}
\newcommand{\bsectionStar}[2][]{%
  \clearpage
  \vspace*{1mm}
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  % original language
  \begin{minipage}[t]{78mm}
      \color{red}
      \textsf{%
        \begin{flushright}%
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
        \vspace*{3mm}
      }
  \end{minipage}
  % spacing between colums
  \begin{minipage}[t]{6.5mm}\ \end{minipage}
  % english version
  \begin{minipage}[t]{81mm}
    \color{grey1}
    \textsf{%
      \begin{flushleft}%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{%
            \protect\StrBehind{#2}{--- }
          }
        }
      \end{flushleft}
      \vspace*{3mm}
    }
  \end{minipage}
}


% Lists
  % List item style
\renewcommand{\labelitemi}{$\sqbullet$}
  % Unordered list spacing
\renewenvironment{itemize}{
  \begin{list}{\labelitemi}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
  }
}
{\end{list}
}
  % Ordered list spacing
\renewenvironment{enumerate}{
  \begin{list}{\arabic{enumi}.}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
    \usecounter{enumi}
  }
}
{\end{list}
}


% URL style
\urlstyle{same} 
%\urlstyle{rm}


% Get the \ref's to images right in the second (english part) of the LPW
% Use '\refstepcounter{refs_en}' before the label in every graphic in the 
% english part
\newcounter{refs_en}


% Marginal notes
  % \boxtext{your text}
\newcommand\boxtext[1]{
  \vskip4mm
  \begin{center}
  \colorrule{grey3}{0.5\textwidth-3.5mm}{1.5pt}
  \vskip1.5mm
  \fontsize{12}{9}\selectfont{\textsf{#1}}
  \colorrule{grey3}{0.5\textwidth-3.5mm}{1.5pt}
  \end{center}
}

% For IPA characters
\newcommand\lingua[1]{[{\selectfont\linguistics #1}]}


% Lines
  % \colorrule{<color>}{<width>}{<thickness>}
\newcommand*\colorrule[3]{%
  \color{#1}\rule{#2}{#3}\normalcolor
}


% Page header and footer
  % Sans-serif pagenumber
\setkomafont{pagenumber}{%
  \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}
}

  % Clear styling for head and foot
\clearscrheadfoot 

\setfootwidth[27mm]{text}
  
  % Pagenumber on outer margin
\lefoot{
  \colorrule{grey1}{22mm}{0.5pt}%
  \vskip1mm%
  \begin{minipage}[h]{23mm}%
    \begin{flushright}%
      \pagemark
    \end{flushright}
  \end{minipage}
}

\rofoot{
\colorrule{grey1}{22mm}{0.5pt}%
\vskip1mm%
  \begin{minipage}[h]{21.5mm}%
    \begin{flushleft}%
      \pagemark
    \end{flushleft}
  \end{minipage}
}


% Captions
\addtokomafont{caption}{\sffamily}


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
  % remove 'Contents'
\renewcommand\contentsname{}
  % set the depth
\setcounter{tocdepth}{2}
  % the sections
\renewcommand{\cftsecfont}{\fontsize{12}{9}\selectfont\futurabook}
\renewcommand{\cftsubsecfont}{\futuralight}
\renewcommand{\cftsubsubsecfont}{\futuralight}
  % the page numbers
\renewcommand{\cftsecpagefont}{\futurabook}  
\renewcommand{\cftsubsecpagefont}{\futuralight}
\renewcommand{\cftsubsubsecpagefont}{\futuralight}


% Mocktitle
  % Maketitle
\renewcommand\maketitle{%  
  \begin{titlepage}%  
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
    \begin{Parallel}[c]{80.5mm}{76.5mm}
      \ParallelLText{
        \
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{14}{24}\selectfont{%
            \textsf{%
              \textcolor{red}{%
                \ifx\@languageVersion\@null
                  \@authoraffiliation
                \else
                  \MakeUppercase{\@languageVersion}\\
                  \vspace*{10mm}
                  \@authoraffiliation
                \fi
              }
            }
          }
        \end{flushleft}
      }
      \ParallelPar
    \end{Parallel}
    \vfill
     % Left column
      \begin{minipage}[t]{81mm}\ \end{minipage}
      % spacing between colums
      \begin{minipage}[t]{5mm}\ \end{minipage}
      % Right column
      \begin{minipage}[t]{85mm}
        \textsf{\color{red}\@editors}
      \end{minipage}
    \cleardoublepage
  \end{titlepage}
}
  % Funding notices
  % Left funding notice
\long\def\FundingLNotice#1{\gdef\@FundingLNotice{#1}}
\def\@FundingLNotice{\@latex@warning@no@line{No \noexpand\FundingLNotice given}}
  % Rightfunding notice
\long\def\FundingRNotice#1{\gdef\@FundingRNotice{#1}}
\def\@FundingRNotice{\@latex@warning@no@line{No \noexpand\FundingRNotice given}}
\newcommand{\makefundingnotice}{%
  \vskip20mm
  \centerline{META-NET -- office@meta-net.eu -- http://www.meta-net.eu}

  \vfill

  \hskip90mm\colorrule{grey3}{110mm}{1.5pt}
  \vskip1mm

  \begin{minipage}[t]{81mm}
    \begin{small}
      \@FundingLNotice
    \end{small}
  \end{minipage}  
  % spacing between colums
  \begin{minipage}[t]{8mm}\ \end{minipage}
  \begin{minipage}[t]{82mm}
    \color{grey1}
    \begin{small}
      \@FundingRNotice
    \end{small}
  \end{minipage}
  
  \vskip6mm
  \hskip-29mm\colorrule{grey3}{110mm}{1.5pt}
  
  \clearpage
}


% Own command definitions
% ---------------------------------------------------------------------

  % Left text on spine
\def\SpineLText#1{\gdef\@SpineLText{#1}}
\def\@SpineLText{\@latex@warning@no@line{No \noexpand\SpineLText given}}
  % Right text on spine
\def\SpineRText#1{\gdef\@SpineRText{#1}}
\def\@SpineRText{\@latex@warning@no@line{No \noexpand\SpineRText given}}
  % Quotes
\def\quotes#1{\gdef\@quotes{#1}}
\def\@quotes{\@latex@warning@no@line{No \noexpand\quotes given}}
% Title for spine on cover
\long\def\spineTitle#1{\gdef\@spineTitle{#1}}
\def\@spineTitle{\@latex@warning@no@line{No \noexpand\spineTitle given}}
  % Editors
\def\editors#1{\gdef\@editors{#1}}
\def\@editors{\@latex@warning@no@line{No \noexpand\editors given}}
  % Autors with affiliation
\def\authoraffiliation#1{\gdef\@authoraffiliation{#1}}
\def\@authoraffiliation{\@latex@warning@no@line{No \noexpand\authoraffiliation given}}
  % Language version
\def\languageVersion#1{\gdef\@languageVersion{#1}}
  
  % LTInfoBox Definition
\long\def\LTInfoBox#1{\gdef\@LTInfoBox{#1}}
\def\@LTInfoBox{\@latex@warning@no@line{No \noexpand\LTInfoBox given}}
  % FundingNotice Definition
\long\def\FundingNotice#1{\gdef\@FundingNotice{#1}}
\def\@FundingNotice{\@latex@warning@no@line{No \noexpand\FundingNotice given}}


% Class options
% ---------------------------------------------------------------------

% Set the cover for the printversion
\DeclareOption{cover}{%
  % Define papersize for cover 420x279mm + 4mm Spine + 5mm bleed
  \setlength{\paperwidth}{434mm}%
  \setlength{\paperheight}{289mm}%
  \setlength{\textwidth}{380mm}%
%  \setlength{\width}{380mm}%
  
  % Titlepage
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%
    \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
      \vspace*{3mm}
      % Back cover
      \begin{minipage}[t]{168mm}  
        \vskip50mm
        \begin{minipage}[t]{81mm}
          \color{grey2}%
          \textsf{%
            \@SpineLText
          }
        \end{minipage}
        % Gutter 
        \begin{minipage}[t]{5mm}\ 
        \end{minipage}
        \begin{minipage}[t]{76mm}
          \color{white}%
          \textsf{%
            \@SpineRText
          }
        \end{minipage}
        \vskip10mm
        \begin{minipage}[t]{163.5mm}
          \textsf{%
            \textcolor{white}{\@quotes}
          }
        \end{minipage}
      \end{minipage}
      % Space between back and front cover
      \begin{minipage}[t]{20mm}\ \end{minipage}
      \begin{minipage}[t]{10mm}%
        \vskip-10mm
        \rotatebox{270}{%
          \color{white}
          \textsf{
            \MakeUppercase{%
              \hskip2.2mm \@spineTitle
            }
          }
        }
      \end{minipage}
      \begin{minipage}[t]{17mm}\ \end{minipage} 
      % Front cover
      \begin{minipage}[t]{185mm} 
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
        \begin{Parallel}[c]{81mm}{97mm}
          \ParallelLText{
            \
          }
          \ParallelRText{
            \begin{flushleft}
              \fontsize{14}{1.2}\selectfont{%
              \textsf{%
                \textcolor{white}{%
                  \ifx\@languageVersion\@null
                    \@author
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@author
                  \fi
                  }
                }
              }
            \end{flushleft}
          }
          \ParallelPar
        \end{Parallel}
      \end{minipage} % end Front cover
    \end{titlepage}
  }
}


% Set the ebook version
\DeclareOption{ebook}{%
  \AtEndOfClass{
    \RequirePackage{varioref}
    \RequirePackage{hyperref}
    \hypersetup{
        colorlinks=true,        % false: boxed links; true: colored links
        linkcolor=blue,         % color of internal links
        citecolor=blue,         % color of links to bibliography
        filecolor=blue,         % color of file links
        urlcolor=blue,          % color of external links
        pdffitwindow=false,     % don't fit window to page when opened
        pdfcreator={XeLaTeX},   % creator of the document
        pdfproducer={META-NET}, % producer of the document
    }
  }
  
  % Define papersize for cover 210x279mm + 0mm bleed
  \geometry{paperwidth=210mm, paperheight=279mm, top=24mm, bottom=31mm, left=23mm, right=23mm}%
  
  \setfootwidth[-22mm]{paper}
  \lefoot[\pagemark]{}

  \refoot[\pagemark]{
  \colorrule{grey1}{22mm}{0.5pt}%
  \vskip1mm%
    \begin{minipage}[h]{21mm}%
      \begin{flushleft}%
          \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}%
        \pagemark
      \end{flushleft}
    \end{minipage}
  }
  
  % Title & Mocktitle
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%  
      % Title
      \pagestyle{empty}
      \ThisCenterWallPaper{1}{../_media/titlepage_ebook.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{83mm}
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
      \begin{Parallel}[c]{83.5mm}{74.5mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
              \textsf{%
                \textcolor{white}{%
                  \ifx\@languageVersion\@null
                    \@author
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@author
                  \fi
                }
              }
            }
          \end{flushleft}
        }
        \ParallelPar
      \end{Parallel}
      % Mocktitle
      \cleardoublepage
      \ThisCenterWallPaper{1}{../_media/mocktitlepage_ebook.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{83mm}
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
      \begin{Parallel}[c]{83.5mm}{74.5mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
              \textsf{%
                \textcolor{red}{%
                  \ifx\@languageVersion\@null
                    \@authoraffiliation
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@authoraffiliation
                  \fi
                }
              }
            }
          \end{flushleft}
        }
        \ParallelPar
      \end{Parallel}
      \vfill
       % Left column
        \begin{minipage}[t]{83mm}\ \end{minipage}
        % spacing between colums
        \begin{minipage}[t]{5mm}\ \end{minipage}
        % Right column
        \begin{minipage}[t]{83mm}
          \textsf{\color{red}\@editors}
        \end{minipage}
      \clearpage
    \end{titlepage}
  }
  
  % Makespine
  \providecommand\makespine{%
    \clearpage
    \pagestyle{empty}
    \ThisCenterWallPaper{1}{../_media/spinepage_ebook.pdf}
    \vspace*{50mm}
    % Left column
    \begin{minipage}[t]{80mm}
      \color{grey2}%
      \textsf{%
        \@SpineLText
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{6mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{76mm}
      \color{white}%
      \textsf{%
        \@SpineRText
      }
    \end{minipage}
    \vskip10mm
    \begin{minipage}[t]{163.5mm}
      \textsf{%
        \textcolor{white}{\@quotes}
      }
    \end{minipage}
  }
}


% Set the plain version
\DeclareOption{plain}{%

  \AtEndOfClass{
    \RequirePackage{varioref}
    \RequirePackage{hyperref}
    \hypersetup{
        colorlinks=true,        % false: boxed links; true: colored links
        linkcolor=blue,         % color of internal links
        citecolor=blue,         % color of links to bibliography
        filecolor=blue,         % color of file links
        urlcolor=blue,          % color of external links
        pdffitwindow=false,     % don't fit window to page when opened
        pdfcreator={XeLaTeX},   % creator of the document
        pdfproducer={META-NET}, % producer of the document
    }
  }
  
  % Define papersize for cover 210x279mm + 0mm bleed
  \geometry{paperwidth=210mm, paperheight=279mm, top=24mm, bottom=31mm, left=21mm, right=21mm}%
  
  %\ihead{} 
  %\ohead{%
  %  \vskip6mm
  %  \normalfont\textsf{\leftmark}%
  %}
  %\chead{} 
  %\pagestyle{scrheadings} 
  %\automark[chapter]{section}
  
  %\setfootwidth[-22mm]{paper}
  %\lefoot[\pagemark]{}
  %
  %\refoot[\pagemark]{
  %\colorrule{grey1}{24mm}{0.5pt}%
  %\vskip1mm%
  %  \begin{minipage}[h]{23mm}%
  %    \begin{flushleft}%
  %        \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}%
  %      \pagemark
  %    \end{flushleft}
  %  \end{minipage}
  %}
  
    % Funding Notice
  \renewcommand{\makefundingnotice}{%
    \vskip20mm
    \centerline{META-NET -- office@meta-net.eu -- http://www.meta-net.eu}

    \vfill
    
    \begin{center}
      \@LTInfoBox
    \end{center}

    \vfill

    \hskip90mm\colorrule{grey3}{110mm}{1.5pt}
    \vskip3mm

    \begin{footnotesize}
      \begin{spacing}{1.2}
        \@FundingNotice
      \end{spacing}
    \end{footnotesize}
  
    \vskip1mm
    \hskip-29mm\colorrule{grey3}{110mm}{1.5pt}
  
    \clearpage
  }

  % Title & Mocktitle
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%  
      % Title
      \pagestyle{empty}
      \ThisCenterWallPaper{1}{../_media/titlepage_plain.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{84mm}
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
      \begin{minipage}[t]{88mm}
        \color{white}
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
      \begin{Parallel}[c]{83.5mm}{77mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
              \textsf{%
                \textcolor{white}{%
                  \ifx\@languageVersion\@null
                    \@author
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@author
                  \fi
                }
              }
            }
          \end{flushleft}
        }
        \ParallelPar
      \end{Parallel}
      % Mocktitle
      \cleardoublepage
      \ThisCenterWallPaper{1}{../_media/mocktitlepage_plain.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{84mm}
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
      \begin{minipage}[t]{88mm}
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
      \begin{Parallel}[c]{83.5mm}{77mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
              \textsf{%
                \textcolor{red}{%
                  \ifx\@languageVersion\@null
                    \@authoraffiliation
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@authoraffiliation
                  \fi
                }
              }
            }
          \end{flushleft}
        }
        \ParallelPar
      \end{Parallel}
      \vfill
       % Left column
        \begin{minipage}[t]{83mm}\ \end{minipage}
        % spacing between colums
        \begin{minipage}[t]{5mm}\ \end{minipage}
        % Right column
        \begin{minipage}[t]{83mm}
          \textsf{\color{red}\@editors}
        \end{minipage}
      \clearpage
    \end{titlepage}
  }
  
  % Makespine
  \providecommand\makespine{%
    \clearpage
    \pagestyle{empty}
    \ThisCenterWallPaper{1}{../_media/spinepage_plain.pdf}
    \vspace*{50mm}
    % Left column
    \begin{minipage}[t]{80mm}
      \color{grey2}%
      \textsf{%
        \@SpineLText
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{6mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{76mm}
      \color{white}%
      \textsf{%
        \@SpineRText
      }
    \end{minipage}
    \vskip10mm
    \begin{minipage}[t]{163.5mm}
      \textsf{%
        \textcolor{white}{\@quotes}
      }
    \end{minipage}
  }
}


% Set the cover for the plain printversion
\DeclareOption{plain_cover}{%
  % Define papersize for cover 420x279mm + 4mm Spine + 5mm bleed
  \setlength{\paperwidth}{434mm}%
  \setlength{\paperheight}{289mm}%
  \setlength{\textwidth}{380mm}%
%  \setlength{\width}{380mm}%
  
  % Titlepage
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%
    \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
      \vspace*{3mm}
      % Back cover
      \begin{minipage}[t]{168mm}  
        \vskip50mm
        \begin{minipage}[t]{81mm}
          \color{grey2}%
          \textsf{%
            \@SpineLText
          }
        \end{minipage}
        % Gutter 
        \begin{minipage}[t]{5mm}\ 
        \end{minipage}
        \begin{minipage}[t]{76mm}
          \color{white}%
          \textsf{%
            \@SpineRText
          }
        \end{minipage}
        \vskip10mm
        \begin{minipage}[t]{163.5mm}
          \textsf{%
            \textcolor{white}{\@quotes}
          }
        \end{minipage}
      \end{minipage}
      % Space between back and front cover
      \begin{minipage}[t]{20mm}\ \end{minipage}
      \begin{minipage}[t]{10mm}%
        \vskip-10mm
        \rotatebox{270}{%
          \color{white}
          \textsf{
            \MakeUppercase{%
              \hskip2.2mm \@spineTitle
            }
          }
        }
      \end{minipage}
      \begin{minipage}[t]{17mm}\ \end{minipage} 
      % Front cover
      \begin{minipage}[t]{185mm} 
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
        \begin{Parallel}[c]{81mm}{97mm}
          \ParallelLText{
            \
          }
          \ParallelRText{
            \begin{flushleft}
              \fontsize{14}{1.2}\selectfont{%
              \textsf{%
                \textcolor{white}{%
                  \ifx\@languageVersion\@null
                    \@author
                  \else
                    \MakeUppercase{\@languageVersion}\\
                    \vspace*{10mm}
                    \@author
                  \fi
                  }
                }
              }
            \end{flushleft}
          }
          \ParallelPar
        \end{Parallel}
      \end{minipage} % end Front cover
    \end{titlepage}
  }
}


\ProcessOptions\relax

\endinput
