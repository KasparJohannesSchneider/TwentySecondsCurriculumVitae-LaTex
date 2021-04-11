%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Twenty Seconds Curriculum Vitae in LaTex
% ****************************************
% 
% License: MIT
%
% For further information please visit:
% https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%
% CLASS %
%%%%%%%%%
\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%
% PACKAGES %
%%%%%%%%%%%%
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{hyperref}


%%%%%%%%%%%
% OPTIONS %
%%%%%%%%%%%
% languages
% english
\newif\ifen
\entrue
\DeclareOption{en}{%
  \defalse
  \entrue
}
\newcommand{\en}[1]{\ifen#1\fi}

% german
\newif\ifde
\defalse
\DeclareOption{de}{%
  \enfalse
  \detrue
}
\newcommand{\de}[1]{\ifde#1\fi}

% icons
\newbool{icon}
\DeclareOption{icon}{%
  \booltrue{icon}
}

% don't add the about me section to the document
\newbool{no_aboutme}
\DeclareOption{no_aboutme}{%
  \booltrue{no_aboutme}
}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\ifbool{icon}{\RequirePackage[fixed]{fontawesome5}}{}

\usetikzlibrary{calc}

%%%%%%%%%%
% colors %
%%%%%%%%%%
\definecolor{black}{RGB}{0,0,0}          % black
\definecolor{white}{RGB}{255,255,255}    % white
\definecolor{darkgray}{HTML}{333333}     % darkgray
\definecolor{gray}{HTML}{4D4D4D}         % gray
\definecolor{sidecolor}{HTML}{E7E7E7}    % sidecolor
\definecolor{lightgray}{HTML}{999999}    % lightgray
\definecolor{green}{HTML}{C2E15F}        % green
\definecolor{orange}{HTML}{FDA333}       % orange
\definecolor{purple}{HTML}{D3A4F9}       % purple
\definecolor{red}{HTML}{FB0B00}          % red
\definecolor{blue}{HTML}{6CE0F1}         % blue
\definecolor{mainblue}{HTML}{0E5484}     % mainblue
\definecolor{cerulean}{HTML}{007BA7}     % cerulean
\definecolor{maingray}{HTML}{B9B9B9}     % maingray
\definecolor{maindarkgray}{HTML}{B3B3B3} % maindarkgray

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

% compute size of profile picture
\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

\newcommand{\profilesection}[2]{{\noindent\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt} \vspace{1pt}}}

\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}                % date
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}                % mail
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}    % phone
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}          % address
\newcommand{\cvlocation}[1]{\renewcommand{\givencvlocation}{#1}}        % location
\newcommand{\cvdriving}[1]{\renewcommand{\givencvdriving}{#1}}          % driver's licenses
\newcommand{\cvstack}[2]{\renewcommand{\givencvstack}{#1}               % stack
\renewcommand{\givencvstacklink}{#2}}                                   % stack link
\newcommand{\cvgithub}[1]{\renewcommand{\givencvgithub}{#1}}            % github
\newcommand{\cvlinkedin}[1]{\renewcommand{\givencvlinkedin}{#1}}        % linkedIn
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}} % about me
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}        % picture
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}                % name
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}        % job title

\newcommand{\givencvname}{REQUIRED!} % name
\newcommand{\givencvdate}{}          % date
\newcommand{\givencvmail}{}          % mail
\newcommand{\givennumberphone}{}     % phone
\newcommand{\givencvaddress}{}       % address
\newcommand{\givencvlocation}{}      % location
\newcommand{\givencvdriving}{}       % driver's licenses
\newcommand{\givenaboutme}{}         % about me
\newcommand{\givenprofilepic}{}      % picture
\newcommand{\givencvstack}{}         % stack
\newcommand{\givencvstacklink}{}     % stack link
\newcommand{\givencvgithub}{}        % github
\newcommand{\givencvlinkedin}{}      % linkedIn
\newcommand{\givencvjobtitle}{}      % job title

% icon in blue circle; #1 -> icon
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
  \node[shape=circle,draw,inner sep=-0.5pt, fill=mainblue,mainblue,text=white] (char) {#1};}
}

% Text in square node with rounded corners; #1 -> text, #2 -> color
\newcommand*\round[2]{%
\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle,
  rounded corners, inner sep=2pt, minimum size=5.5mm, text height=4.5mm,
  fill=#2,#2,text=white](char){#1};%
}

% skill bar graphs
\newcommand{\skillIcon}[1]{\textcolor{mainblue}#1~}
\newcommand{\barHeight}{0.35} % hight of each bar graph
\newcommand{\barVfact}{1.15}  % Factor that controls vertical spacing
\newcommand\skills[1]{
  \renewcommand{\givenskill}{
    \noindent
    \begin{tikzpicture}
    % loop through skills
    \foreach [count=\i] \ic/\x/\y in {#1}
    {
      % draw gray background
      \draw[fill=maingray,maingray] (0,{-(\i*\barVfact)}) rectangle (6,{-(\i*\barVfact)+\barHeight});
      % draw blue bar
      \draw[fill=white,mainblue](0,{-(\i*\barVfact)}) rectangle (1.2*\y,{-(\i*\barVfact)+\barHeight});
      \node [above right ] at (0,{-(\i*\barVfact)+\barHeight}) {\skillIcon{\ic}\x};
      % draw tick-markers
      \foreach \z in {0,1,2,...,10}
      {
        \coordinate (A\z) at ($(0,{-(\i*\barVfact)})+(1.2*\z*0.5cm,0)$) {};
        \ifodd\z
            \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
        \else
            \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
        \fi
      }
    }
    \end{tikzpicture}
  }
}

% text style skills
\newcommand{\givenskill}{}
  \newcommand\skillstext[1]{
    \renewcommand{\giventextskill}{
    \begin{flushleft}
    \noindent
    \foreach [count=\i] \x/\y in {#1}
    {
      \x$ \star $\y
    }
    \end{flushleft}
  }
}

\newcommand{\giventextskill}{}

\newcommand{\makeprofile}
{
  % gray bar on the left side
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.70cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  \begin{textblock}{6}(0.5, 0.2)
    \begin{flushleft}
      \hspace{13pt}

      % profile picture
      \ifthenelse{\equal{\givenprofilepic}{}}{}{\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
          \clip (600/2, 567/2) circle (567/2);
          \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
      \end{tikzpicture}}

      % name
      {\huge\color{mainblue}\givencvname}

      % jobtitle
      \begin{flushright}
        {\Large\color{black!80}\givencvjobtitle}
      \end{flushright}
      \renewcommand{\arraystretch}{1.6}

      % table with icons 
      \begin{tabular}{c @{\hskip 0.2cm} p{5cm}}
        % CV date
        \ifthenelse{\equal{\givencvdate}{}}{}{\textsc{\normalsize\icon{\faIcon{calendar-alt}}} & \givencvdate\\}
        % CV address
        \ifthenelse{\equal{\givencvaddress}{}}{}{\textsc{\normalsize\icon{\faHome}} & \givencvaddress\\}
        % CV location
        \ifthenelse{\equal{\givencvlocation}{}}{}{\textsc{\normalsize\icon{\faMapMarked*}} & \givencvlocation\\}
        % drivers License
        \ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\normalsize\icon{\faCar}} & \givencvdriving\\}
        % &\\
        % CV phone
        \ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\normalsize\icon{\faPhone}} & \givennumberphone\\}
        % CV mail
        \ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\normalsize\icon{\faEnvelope}} & \href{mailto:\givencvmail}{\textcolor{cerulean}\givencvmail}\\}
        &\\
        % CV stackoverflow
        \ifthenelse{\equal{\givencvstack}{}}{}{\textsc{\normalsize\icon{\faStackOverflow}} & \href{\givencvstacklink}{\textcolor{cerulean}\givencvstack}\\}
        % Github
        \ifthenelse{\equal{\givencvgithub}{}}{}{\textsc{\normalsize\icon{\faGithub}} & \href{https://www.github.com/\givencvgithub}{\textcolor{cerulean}\givencvgithub}\\}
        % LinkedIn
        \ifthenelse{\equal{\givencvlinkedin}{}}{}{\textsc{\normalsize\icon{\faLinkedin}} & \href{https://www.linkedin.com/in/\givencvlinkedin}{\textcolor{cerulean}\givencvlinkedin}\\}
        &
      \end{tabular}

      % about me text
      \ifbool{no_aboutme}{}{%
        \profilesection{\en{About me}\de{Über mich}}{3.2cm}
        \givenaboutme
      }%

      % skills with scale
      \profilesection{Skills}{4cm}
      \givenskill
      \giventextskill
      \noindent
      \scriptsize
      \noindent
      % (*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]

    \end{flushleft}
  \end{textblock}
  \vspace{-10pt}
}

%%%%%%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%%%%%%
\newcounter{colorCounter}
\newcommand{\@sectioncolor}[1]{ 
  {%
  % Switch between blue and gray
   \round{#1}{%
      \ifodd\value{colorCounter}%
        maingray%
      \else%
        mainblue%
      \fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

% Section without an icon
\renewcommand{\section}[1]{
  \par%
  {%
    \LARGE 
    \color{headercolor}%
    \@sectioncolor{#1}%
  }
  \par\vspace{\parskip}
}

% Section with an icon
\newcommand{\sectionicon}[2]{
  \par%
  {%
    \LARGE 
    #1 
    \color{headercolor}%
    \@sectioncolor{#2}%
  }
  \par\vspace{\parskip}
}

% Subsection
\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitem}[4]{%
\hspace{3pt}\parbox[t]{0.5cm}{\hfill}\hspace{2pt}\parbox[t]{1.9cm}{#1\hfill}&%
  \parbox[t]{10.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
      #4\vspace{\parsep}%
    }\\%
}
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyicon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemicon}[5]{%
  \hspace{3pt}\parbox[t]{0.5cm}{#1\hfill}\hspace{2pt}\parbox[t]{1.9cm}{#2\hfill}&%
  \parbox[t]{10.5cm}{%
  \textbf{#3}%
  \hfill%
  {\footnotesize#4}\\%
    #5\vspace{\parsep}%
  }\\%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{3pt}\parbox[t]{0.5cm}{\hfill}\hspace{2pt}\parbox[t]{1.9cm}{#1\hfill}&%
  \parbox[t]{10.5cm}{%
    \textbf{#2}%
  }\\%
}
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshorticon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshorticon}[3]{%
  \hspace{3pt}\parbox[t]{0.5cm}{#1\hfill}\hspace{2pt}\parbox[t]{1.9cm}{#2\hfill}&
  \parbox[t]{10.5cm}{%
    \textbf{#3}%
  }\\%
}

%%%%%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%%%%%
\RequirePackage[a4paper,left=7.3cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
