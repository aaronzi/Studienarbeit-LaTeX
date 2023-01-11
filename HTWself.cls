
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

% Definieren der Primärfarben für die auswählbaren Optionen
\colorlet{htwLogo}{HTWGreen100}
\colorlet{htwWeiteres}{HTWGray100}

% setzen der Primärfarben je nach ausgewählter Option
\DeclareOption{htwLogo}{\newcommand{\usageCategoryColour}{\color{htwLogo}}}
\DeclareOption{htwWeiteres}{\newcommand{\usageCategoryColour}{\color{htwWeiteres}}}

% Setzen des Dokumentencovers ja nach ausgewählter Option
\newif\ifLabCover
\newif\ifExamCover
\DeclareOption{htwLogo}{\LabCovertrue}
\DeclareOption{htwWeiteres}{\ExamCovertrue}

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
    \cfoot{Page \thepage}
    \ofoot{}

% center without vspaces
\newenvironment{novspacecenter}
{\parskip=0pt\par\nopagebreak\centering}
{\par\noindent\ignorespacesafterend}

%    +--------------------------------------------------+
%    |    Dokumentencover                               |
%    +--------------------------------------------------+

\newcommand{\HTWCover}{
    % Prüfen ob Option htwLogo oder htwWeiteres ausgewählt ist

    % ------------------Dokumentencover für htwLogo------------------------------
    \ifLabCover

        \newgeometry{top=2cm, bottom=2cm, left=2cm, right=2cm}
        
        \begin{titlepage}

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
                    \textbf{Name: }&\hspace{1 cm} &\textbf{Matrikelnummer:} \\
                    \HTW@HTWStudent & & \HTW@HTWNumber
                \end{tabular}
            \end{flushleft}
        
            \vspace{1cm}
        
            % Daten
            \begin{tabular}{l l}
                \textbf{Fachbereich:}   & \HTW@HTWFB        \\
                \textbf{Studiengang:}   & \HTW@HTWCourse    \\
                \textbf{Fachsemester:}  & \HTW@HTWSemester  \\
                \textbf{Fach:}          & \HTW@HTWSubtitle  \\
                \textbf{Dozent:}        & \HTW@HTWReview    \\
                \textbf{Ort, Datum:}    & \HTW@HTWIssueDate \\ 
            \end{tabular}
    	    
        \end{titlepage}
        
        \restoregeometry

    % ------------------Dokumentencover für htwWeiteres--------------------------
    \else

        \newgeometry{top=2cm, bottom=2cm, left=2cm, right=2cm}
        
        \begin{titlepage}

            % HTW Logo
            \begin{novspacecenter}
                \includegraphics[width=80mm]{figures/logo/logoBW}
            \end{novspacecenter}
         
        \end{titlepage}
        
        \restoregeometry
    
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

\newcommand{\HTWListsOfx}{
    \setcounter{tocdepth}{1}
    \tableofcontents
    \addcontentsline{toc}{section}{Contents}
}

\endinput