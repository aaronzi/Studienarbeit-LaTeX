
%    +==================================================+
%    |    LaTeX class file                              |
%    +==================================================+
%    |    Name:    Template HTWself                     |
%    |                                                  |
%    |    Purpose: Study purpose (Internal + external). |
%    |                                                  |
%    |    Created: 2023                                 |
%    |                                                  |
%    |    Usage note: TBD                               |
%    +==================================================+

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HTWself}[2023/01/11 general purpose]

%    +--------------------------------------------------+
%    |    Corporate Identity                            |
%    +--------------------------------------------------+

\RequirePackage[RGB]{xcolor}

% Corporate Design der HTW Berlin
% Siehe https://corporatedesign.htw-berlin.de/schrift-farbe/markenfarben/
\definecolor{HTWGreen100}{RGB}{118 185 0}
\definecolor{HTWBlue100}{RGB}{0 130 209}
\definecolor{HTWOrange100}{RGB}{255 95 0}
\definecolor{HTWGray100}{RGB}{175 175 175}
% Generelles Design
\definecolor{Blue100}{RGB}{0 56 131}
\definecolor{Blue090}{RGB}{26 49 127}
\definecolor{Blue080}{RGB}{51 71 141}
\definecolor{Orange100}{RGB}{238 125 17}
\definecolor{Orange090}{RGB}{240 131 56}
\definecolor{Orange080}{RGB}{242 145 77}
\definecolor{Red100}{RGB}{175 42 66}
\definecolor{Gray100}{RGB}{101 120 125}
\definecolor{Green100}{RGB}{65 130 126}
\definecolor{Black100}{RGB}{0 0 0}
\definecolor{Grey100}{RGB}{113 113 113}
\definecolor{White100}{RGB}{255 255 255}

% Definieren der Primärfarben für die auswählbaren Optionen
\colorlet{htwLogo}{HTWGreen100}
\colorlet{htwWeiteres}{HTWGray100}

% Setzen des Dokumentencovers ja nach ausgewählter Option
\newif\ifHTWLogo
\newif\ifHTWWeiteres

\DeclareOption{htwLogo}{
    \HTWLogotrue
    \newcommand{\usageCategoryColour}{\color{htwLogo}}
}
\DeclareOption{htwWeiteres}{
    \HTWWeiterestrue
    \newcommand{\usageCategoryColour}{\color{htwWeiteres}}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{labbook}}
\ProcessOptions\relax

%    +--------------------------------------------------+
%    |    Class                                         |
%    +--------------------------------------------------+

\LoadClass[
    a4paper,
    oneside,
    hyperref,
    10pt
    ]{labbook}

%    +--------------------------------------------------+
%    |    Packages                                      |
%    +--------------------------------------------------+

\RequirePackage{geometry}

% Version 1
%\RequirePackage{sansmathfonts}
%\renewcommand*\familydefault{\sfdefault}    % base font is sans serif
% Version 2
\usepackage[sfdefault,lining]{FiraSans} % option 'sfdefault' activates Fira Sans as the default text font

%\RequirePackage[T1]{fontenc}
%\RequirePackage[utf8]{inputenc}
\RequirePackage{fontspec}
\setsansfont[
    Path=./ttf/,
	BoldFont=HTWBerlinOffice-Bold.ttf,
	ItalicFont=HTWBerlinOffice-Italic.ttf,
	BoldItalicFont=HTWBerlinOffice-BoldItalic.ttf
	]{HTWBerlinOffice-Regular.ttf}
\RequirePackage[main=ngerman, british]{babel}

\RequirePackage{blindtext}

\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{eso-pic}

% if both usepackages true: complie with Pdflatex -> View pdf (-shell-escape)
%\RequirePackage{pstricks}
%\RequirePackage{auto-pst-pdf}

\RequirePackage{siunitx}

\RequirePackage{hyperref}
\hypersetup{
%    colorlinks=true,
%    linkcolor={red!50!black},
%    citecolor={blue!50!black},
%    urlcolor={blue!80!black}
    hidelinks
}
\urlstyle{same}

\setlength{\parindent}{0pt}


% !! special behavior for this document class !!
\RequirePackage[
%    headtopline,
    headsepline=0.25pt,
%    footsepline,
%    footbotline
    ]{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearpairofpagestyles
    \ihead{\HTW@HTWStudent}
    \chead{}
    \ohead{\HTW@HTWTitle}
    \ifoot{}
    \cfoot{Seite \thepage}
    \ofoot{}

% center without vspaces
\newenvironment{novspacecenter}
{\parskip=0pt\par\nopagebreak\centering}
{\par\noindent\ignorespacesafterend}

% Pakete für die Nutzung von PSTricks
\usepackage{pstricks} % Erstellung von Grafiken in LaTeX
\usepackage{pst-plot} % Koordinatensysteme 2D
\usepackage{pst-node} % Knoten (Nodes) 2D
\usepackage{multido}

%    +--------------------------------------------------+
%    |    Dokumentencover                               |
%    +--------------------------------------------------+

\newcommand{\HTWCover}{
    % Prüfen ob Option htwLogo oder htwWeiteres ausgewählt ist

    % ------------------Dokumentencover für htwLogo------------------------------
    \ifHTWLogo

        \newgeometry{top=2cm, bottom=2cm, left=2cm, right=2cm}
        
        \begin{titlepage}

            \AddToShipoutPictureBG*{\AtPageLowerLeft{%
            \usageCategoryColour\rule{\paperwidth}{0.4\paperheight}}}

            % HTW Logo
            \begin{flushright}
                \includegraphics[width=50mm]{figures/logo/logoColor}
            \end{flushright}

            \vspace{3cm}
            
            % Titel
            \ifx\HTW@HTWTitle\empty
                % pass
            \else
                \begin{center}
                    \Huge{\textbf{\HTW@HTWTitle}} \\
                \end{center}
            \fi
           
            \vspace{0.2cm}
           
            % Subtitel
            \ifx\HTW@HTWSubtitle\empty
                % pass
            \else
                \begin{center}
                    \Large{\HTW@HTWSubtitle} \\
                \end{center}
            \fi

            \vspace{0.4cm}

            % Referenz
            \ifx\HTW@HTWReference\empty
                % pass
            \else
                \begin{center}
                    \LARGE{\HTW@HTWReference} \\
                \end{center}
            \fi
        
            \vspace{7cm}
        
            % Name Student
            \begin{flushleft}
                \begin{tabular}{l c l }
                    \ifx\HTW@HTWStudent\empty
                    % pass
                    \else
                        \ifx\HTW@HTWStudent\empty \else \textbf{Name: } \fi & \hspace{1 cm} & \ifx\HTW@HTWNumber\empty \else \textbf{Matrikelnummer: } \fi \\
                        \ifx\HTW@HTWStudent\empty \else \HTW@HTWStudent \fi &               & \ifx\HTW@HTWNumber\empty \else \HTW@HTWNumber \fi
                    \fi
                \end{tabular}
            \end{flushleft}
        
            \vspace{1cm}
        
            % Daten
            \begin{tabular}{l l}
                \ifx\HTW@HTWFB\empty \else \textbf{Fachbereich:}        & \HTW@HTWFB        \\ \fi
                \ifx\HTW@HTWCourse\empty \else \textbf{Studiengang:}    & \HTW@HTWCourse    \\ \fi
                \ifx\HTW@HTWSemester\empty \else \textbf{Fachsemester:} & \HTW@HTWSemester  \\ \fi
                \ifx\HTW@HTWSubtitle\empty \else \textbf{Fach:}         & \HTW@HTWSubtitle  \\ \fi
                \ifx\HTW@HTWReview\empty \else \textbf{Dozent:}         & \HTW@HTWReview    \\ \fi
                \textbf{Ort, Datum:}                                    & \HTW@HTWIssueDate \\ 
            \end{tabular}
    	    
        \end{titlepage}
        
        \restoregeometry

    % ------------------Dokumentencover für htwWeiteres--------------------------
    \else
        \ifHTWWeiteres
    
            \newgeometry{top=2cm, bottom=2cm, left=2cm, right=2cm}
            
            \begin{titlepage}
    
                \AddToShipoutPictureBG*{\AtPageLowerLeft{%
                \usageCategoryColour\rule{\paperwidth}{0.8\paperheight}}}
    
                % HTW Logo
                \begin{novspacecenter}
                    \includegraphics[width=80mm]{figures/logo/logoBW}
                \end{novspacecenter}
    
                % Titel
                \ifx\HTW@HTWTitle\empty
                    % pass
                \else
                    \vskip50mm
            	{
                        \Huge
                        \bfseries
                        %\scshape
                        \boldmath            
                        \HTW@HTWTitle 
                        \par   	    
            	}
                \fi
         
                % Subtitel
                \ifx\HTW@HTWSubtitle\empty
                    % pass
                \else
                    \vskip5mm
                    {
                        \Large
                        \boldmath            
                        \HTW@HTWSubtitle 
                        \par   	    
                    }
                \fi
    
                % Thema
                \ifx\HTW@HTWReference\empty
                    % pass
                \else
                    \vskip8mm
                    {
                        \LARGE
                        \boldmath            
                        \HTW@HTWReference 
                        \par   	    
                    }
                \fi
                
                \vfill
                {
    	            \large
    	            \sffamily       	
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    				\ifx\HTW@HTWIssueDate\empty
    					% pass
    				\else
    					\textbf{Abgabedatum}\par
    					\HTW@HTWIssueDate
    				\fi
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    \ifx\HTW@HTWStudent\empty
                        % pass
                    \else
                        \vskip5mm
                        \textbf{Studierender}\par
                        \HTW@HTWStudent
                    \fi
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	            
    	            \ifx\HTW@HTWNumber\empty
    		          	% pass
    	            \else
                            \vskip5mm
    		            \textbf{Matrikelnummer}\par
    		            \HTW@HTWNumber
    	            \fi
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    \ifx\HTW@HTWReview\empty
                        % pass
                    \else
                        \vskip5mm
                        \textbf{Gutachter}\par
                        \HTW@HTWReview
                    \fi
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    \vskip5mm
                    \textbf{Hochschule für Technik und Wirtschaft Berlin}\par
                    Wilhelminenhofstr. 75A, 12459 Berlin, Germany
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    \edef\HTWPubPhraseSummary{\HTW@HTWPubPhrase\HTW@HTWPubPhraseAdditional}
                   	\ifx\HTWPubPhraseSummary\empty
                   		% pass
                   	\else
                   		\vskip5mm
                   		\textbf{Publishers Phrase}\par
                   		    \ifx\HTW@HTWPubPhrase\empty
                   		        % pass
                   		    \else
                   		        \HTW@HTWPubPhrase
                   		        \ifx\HTW@HTWPubPhraseAdditional\empty
                   		            % pass
                   		        \else
                   		            \par
                   		        \fi
                   		    \fi
                   		    \ifx\HTW@HTWPubPhraseAdditional\empty
                   		        % pass
                   		    \else
                   		        \HTW@HTWPubPhraseAdditional
                   		    \fi
                   	\fi
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                }
             
            \end{titlepage}
            
            \restoregeometry
        
        \else
            % pass
        \fi
    \fi
}

% Dokumententitel
\newcommand{\HTWTitle}[1]{ \def \HTW@HTWTitle{#1} }
\HTWTitle{}

% Dokumentenuntertitel
\newcommand{\HTWSubtitle}[1]{ \def \HTW@HTWSubtitle{#1} }
\HTWSubtitle{}

% Thema
\newcommand{\HTWReference}[1]{ \def \HTW@HTWReference{#1} }
\HTWReference{}

% Matrikelnummer
\newcommand{\HTWNumber}[1]{ \def \HTW@HTWNumber{#1} }
\HTWNumber{}

% Fachbereich
\newcommand{\HTWFB}[1]{ \def \HTW@HTWFB{#1} }
\HTWFB{}

% Studiengang
\newcommand{\HTWCourse}[1]{ \def \HTW@HTWCourse{#1} }
\HTWCourse{}

% Fachsemester
\newcommand{\HTWSemester}[1]{ \def \HTW@HTWSemester{#1} }
\HTWSemester{}

% Abgabedatum
\newcommand{\HTWIssueDate}[1]{ \def \HTW@HTWIssueDate{#1} }
\HTWIssueDate{}
\HTWIssueDate{Berlin, \today}

% Name des Studierenden
\newcommand{\HTWStudent}[1]{ \def \HTW@HTWStudent{#1} }
\HTWStudent{}

% Name des Prüfers
\newcommand{\HTWReview}[1]{ \def \HTW@HTWReview{#1} }
\HTWReview{}

\newcommand{\HTWPubPhrase}[1]{ \def \HTW@HTWPubPhrase{#1} }
\HTWPubPhrase{}
\HTWPubPhrase{}
\newcommand{\HTWPubPhraseAdditional}[1]{ \def \HTW@HTWPubPhraseAdditional{#1} }
\HTWPubPhraseAdditional{}
\HTWPubPhraseAdditional{}

% has to be set via Python
\newcommand{\testreportcomment}{Xxx ...}

%    +--------------------------------------------------+
%    |    Verzeichnisse                                 |
%    +--------------------------------------------------+

% ------------------Inhaltsverzeichnis--------------------------
\newcommand{\HTWListsOfx}{
    \setcounter{tocdepth}{2}
    \tableofcontents
    \addcontentsline{toc}{section}{Inhaltsverzeichnis}
}

%    +--------------------------------------------------+
%    |    Abbildungen                                   |
%    +--------------------------------------------------+

\newcommand{\DisplayContent}{
    \ifHTWLogo
        % Anzeigen des HTW Logos
        \begin{center}
        \begin{pspicture*}[showgrid=true](13,4)
            %------------Graue Quadrate des Logos-------------
            % Koordinaten
            \pnodes(0,3){P1}   (1,4){P2}
                   (0,1){P3}   (1,2){P4}
                   (0,0){P5}   (1,1){P6}
                   (1,2){P7}   (2,3){P8}
                   (2,1){P9}   (3,2){P10}
                   (2,0){P11}  (3,1){P12}
                   (12,0){P13} (13,1){P14}
            % Zeichnen in Schleife mittels multido
            \multido{\iKnotenX=1+2,\iKnotenY=2+2}{7}{
                \psframe[linecolor=HTWGray100,fillstyle=solid,fillcolor=HTWGray100](P\iKnotenX)(P\iKnotenY)
            }
            %------------Grauer Kreisausschnitt---------------
            \pswedge[linecolor=HTWGray100,fillstyle=solid,fillcolor=HTWGray100](2,2){1}{0}{90}
            %------------Grüne Quadrate des Logos-------------
            % Koordinaten
            \pnodes(4,3){Q1}   (5,4){Q2}
                   (4,2){Q3}   (5,3){Q4}
                   (5,2){Q5}   (6,3){Q6}
                   (4,1){Q7}   (5,2){Q8}
                   (5,0){Q9}   (6,1){Q10}
                   (7,2){Q11}  (8,3){Q12}
                   (7,1){Q13}  (8,2){Q14}
                   (8,0){Q15}  (9,1){Q16}
                   (9,0){Q17}  (10,1){Q18}
                   (9,1){Q19}  (10,2){Q20}
                   (9,2){Q21}  (10,3){Q22}
                   (10,0){Q23} (11,1){Q24}
                   (11,1){Q25} (12,2){Q26}
                   (11,2){Q27} (12,3){Q28}
            % Zeichnen in Schleife mittels multido
            \multido{\iKnotenX=1+2,\iKnotenY=2+2}{14}{
                \psframe[linecolor=HTWGreen100,fillstyle=solid,fillcolor=HTWGreen100](Q\iKnotenX)(Q\iKnotenY)
            }
            %------------Grüne Kreisausschnitte---------------
            % Koordinaten
            \pnodes(5,1){M1}(8,1){M2}
            % Zeichnen in Schleife mittels multido
            \multido{\iPos=1+1}{2}{
                \pswedge[linecolor=HTWGreen100,fillstyle=solid,fillcolor=HTWGreen100](M\iPos){1}{180}{270}
            }
        \end{pspicture*}
        \end{center}
    \else
        \ifHTWWeiteres
            % Anzeigen des Schachbrettes
            \begin{center}
            \begin{pspicture*}[showgrid=false](8.0,8.0)
                \multido{\iLowE=1+2, \iHighE=2+2, \iLowO=0+2, \iHighO=1+2, \iFarbeG=25+25, \iFarbeU=12+25}{4}
                {
                    % Zeichnen der geraden Reihen 
                    \multido{\iA=2+2,\iB=1+2}{4}{\psframe[linecolor=Black100,fillstyle=solid,fillcolor=blue!\iFarbeG,linewidth=0pt](\iA,\iLowE)(\iB,\iHighE)} % Schwarze Kästchen
                    \multido{\iA=0+2,\iB=1+2}{4}{\psframe[linecolor=Black100,fillstyle=solid,fillcolor=White100,linewidth=0pt](\iA,\iLowE)(\iB,\iHighE)} % Weiße Kästchen
                    % Zeichnen der ungeraden Reihen
                    \multido{\iA=0+2,\iB=1+2}{4}{\psframe[linecolor=Black100,fillstyle=solid,fillcolor=blue!\iFarbeU,linewidth=0pt](\iA,\iLowO)(\iB,\iHighO)} % Schwarze Kästchen
                    \multido{\iA=2+2,\iB=1+2}{4}{\psframe[linecolor=Black100,fillstyle=solid,fillcolor=White100,linewidth=0pt](\iA,\iLowO)(\iB,\iHighO)} % Weiße Kästchen
                }
            \end{pspicture*}
            \end{center}
        \else
            % pass
        \fi
    \fi
    % Anzeigen der Kurvenschaar
    \newpage
    \begin{center}
    \psset{algebraic, plotpoints=100, yunit=1, linewidth=1pt, subticks=2, ylabelPos=right}
    \begin{pspicture*}(-5,-5)(5,5)
        % Plot-Achsen deklarieren
        \psaxes[
            tickcolor=HTWGreen100
        ]{->}(0,0)(-5,-5)(5,5)
        % Plotten einer Kurvenschar eines Polynoms 5. Grades (4 Funktionen)
        \multido{\nA=-3+2,\nB=25+25}{4}{
            \psplot[
                linecolor=red!\nB,
                showpoints,
                dotsize=0.1
            ]{-5}{5}{%
                ((\nA*x+4)*(x+1)*(x-1)*(x-3)*(x-5))/100} % gewähltes Polynom
        }
    \end{pspicture*}
    \end{center}
}

\endinput