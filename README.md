# *FORK OF*: Twenty Seconds Curriculum Vitae in LaTex

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/) 
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/) 
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex/graphs/commit-activity) 

[![Donate](https://img.shields.io/badge/PayPal-Donate%20to%20the%20original%20Author-blue.svg)](https://www.paypal.me/CarmineSpagnuolo) 
## About this FORK
This fork is a derivative of [TwentySecondsCurriculumVitae-LaTex](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex) created by [Carmine Spagnuolo](https://github.com/spagnuolocarmine).  Mainly the following changes have been made to the original repo:
- This version uses A4 paper
- `fontawesome` has been updated to `fontawesome5` that supports fixed-width icons and consists of more icons
- Some optional blue icons for the sidebar have been added
- The skill bar graphs have been equipped with icons
- The alignment of `\twentyitem`, `\twentyitemicon` and `\twentyitemshort` has been changed
## HOT!

- Support Fontawesome Icons, new class option ```\documentclass[icon]{twentysecondcv}```, using the name of the icon available in the documentation of the package [here](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex/raw/master/fontawesome.pdf).
- The Fontawesome version requires the Fontawesome installed. Notice that the  Fontawesome is already available on Overleaf.com.
- Section with Icon:
```tex
\sectionicon{icon-name}{section-name}
```
- Twenty icon items environment
```tex
\begin{twentyicon}
  \twentyitemicon
    {icon name}
    {year}
    {title}
    {place}
    {description}
\end{twentyicon}
```
- Twenty items icon short environment
```tex
\begin{twentyshorticon}
  \twentyitemshorticon
    {icon name}
    {year}
    {description}
\end{twentyshorticon}
```


# Curricula Vitae - Résumés
A curriculum vitae, otherwise known as a CV or résumé, is a document used by individuals to communicate their work history, education and skill set. This is a style template for your curriculum written in LaTex. The main goal of this template is to provide a curriculum that is able to survive the résumés screening of "twenty seconds".

_The author assumes no responsibility for the topicality, correctness, completeness or quality of the information provided and for the obtained résumés._

This is designed for computer scientists but there is no limitation to use it for résumés in other disciplines.

### If you like this curriculum, please don't forget to leave a star, to help the development and improvement.

## The basic idea is KISS - Keep It Simple, Stupid.

In a nutshell _**"It is vain to do with more what can be done with fewer"**_ -- Occam's razor --

* **This template has been designed to create a "one-page" résumé and is therefore not suitable to create a curriculum of more than one-page.** 

* _Please do not try to create a curriculum with more than one-page._ 

### How to describe your experiences?

There are many theories about the résumé screening process of "Big" companies.
Resume screeners and the interviewers look in your résumé for:

- Are you smart?
- Can you code (act for what you apply)?

Anyway according to the guidelines of this template you should use a really simple form to describe each item in your résumé: 

	Accomplished <X> by implementing <Y> which led to <Z>

Here's an example:
	
	Reduced object rendering time by 75% by applying Floyd's algorithm, leading to a 10% reduction in system boot time.
	
-- _Cracking the Coding Interview, Book, Gayle Laakmann Mcdowell_ --

## Toy Résumé with Fontawesome Icons (document class option _icon_)
***
![sample résumé](https://raw.githubusercontent.com/KasparJohannesSchneider/TwentySecondsCurriculumVitae-LaTex/kaspar/Twenty-Seconds_cv_icons.png)
***

# Build 
This guide will walk you through building your résumé.

Build requirements:

* LaTex installation.
	* additionals packages:	 	
		- ClearSans, fontenc
		- tikz
		- xcolor
		- textpos
		- ragged2e
		- etoolbox
		- ifmtarg
		- ifthen
		- pgffor
		- marvosym
		- parskip

### Build through GNU Make command
Clean your project résumé.
	
	make clean
	
Build your project résumé.

	make all
	
-- _Alternately you can build through your favorite LaTex editor._ --

# Environment style and list of commands

The style is divided into two parts. The former is the left sidebar: which contains personal information, profile picture, and information about your professional skills. The second part is the body that should contain details about your academic studies, professional experiences and all the information that you want (remember the KISS principle).

The class is `\documentclass[icon]{twentysecondcv}`, the **icon** option enable to use Fontawesome package in sections and twenty items. In order to use the icon option, you need to install the Fontawesome package and use the Fontawesome icon name, available in the package documentation [here](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex/raw/master/fontawesome.pdf).

### Profile environment
These are the commands to set up the profile information.

* Set up the image profile.
	
		\profilepic{path_name}
* Set up your name.
	
		\cvname{your name}
* Set up your job profile.
	
		\cvjobtitle{your job title}
* Set up your date of birth.
	
		\cvdate{date}	
* Set up your address.
	
		\cvaddress{address}		
* Set up your telephone number.
	
		\cvnumberphone{phone number}
* Set up your email.
	
		\cvmail{email address}
* Set up your personal home page.
	
		\cvsite{home page address}
* [optional] Set up your GitHub profile (⚠ requires option `icon`). 
	
		\cvgithub{GitHub username}
* [optional] Set up your LinkedIn profile (⚠ requires option `icon`).
Linked in public profile url name can be set up on LinkedIn under `Me` -> `View Profile` -> `Edit public profile & URL` -> `Edit your custom URL`
	
		\cvlinkedin{LinkedIn public profile url name}
* Set up a brief description of you.
	
		\about{brief description}
* Set up the skills with chart style. Each skill has to be a `{name/value}` pair, where the value is a floating-point value between `0` and `6`. This is an agreement for the graphics issues, the `0` correspond to a Fundamental awareness while `6` to an Expert awareness level.
	
		\skills{{name skill1/5.8},{name skill2/4}} 
* Set up the skills with text style.
	
		\skillstext{{name skill1/5.8},{name skill2/4}} 

To create the profile, use the command:

	\makeprofile

### Body environment
The body document part is composed of sections.
In the sections, you can use two kinds of list items.

The first (_Twenty items environment_) is intended for a list of detailed information with four parts: **Data** -- **Title** -- **Place** -- **Description**. 

The second (_Twenty items short environment_) is intended for less information (you can customize this list more easily): **Data** -- **Description**.
#### Sections (also wiht icon)
* Set up a new section in the body part.
		
		\section{sction name}
		\section{icon name}{section name}, require the icon option in the document declaration.


#### Twenty items environment (also wiht icon)
```tex
\begin{twenty}
  \twentyitem
    {year}
    {title}
    {place}
    {description}
\end{twenty}

\begin{twentyicon}
  \twentyitemicon
    {icon name}
    {year}
    {title}
    {place}
    {description}
\end{twentyicon}
```

#### Twenty items short environment (also wiht icon)
```tex
\begin{twentyshort}
  \twentyitemshort
    {year}
    {description}
\end{twentyshort}

\begin{twentyshorticon}
  \twentyitemshorticon
    {icon name}
    {year}
    {description}
\end{twentyshorticon}
```
### Other commands
There are two other fun commands: \icon and \round; that enables to wrap the text in oval shape.

```tex
	\icon{text}
	\round{text}{color}
```

### Colors
The following colors are defined and used by this class:

|Name|Color|Usage|
|:---:|:---:|---------|
|black|![#000000](https://via.placeholder.com/60x15/000000/000000?text=+)| black text | 
|white|![#ffffff](https://via.placeholder.com/60x15/ffffff/000000?text=+)| white text | 
|gray|![#4D4D4D](https://via.placeholder.com/60x15/4D4D4D/000000?text=+)|   |
|sidecolor|![#E7E7E7](https://via.placeholder.com/60x15/E7E7E7/000000?text=+)| background of the sidebar |
|lightgray|![#999999](https://via.placeholder.com/60x15/999999/000000?text=+)|   |
|green|![#C2E15F](https://via.placeholder.com/60x15/C2E15F/000000?text=+)|   |
|orange|![#FDA333](https://via.placeholder.com/60x15/FDA333/000000?text=+)|   |
|purple|![#D3A4F9](https://via.placeholder.com/60x15/D3A4F9/000000?text=+)|   |
|red|![#FB0B00](https://via.placeholder.com/60x15/FB0B00/000000?text=+)|   |
|blue|![#6CE0F1](https://via.placeholder.com/60x15/6CE0F1/000000?text=+)|   |
|mainblue|![#0E5484](https://via.placeholder.com/60x15/0E5484/000000?text=+)| section titles & skills bar graphs & circle around icons, `\icon{text}` |
|cerulean|![#007BA7](https://via.placeholder.com/60x15/007BA7/000000?text=+)| text color for links  |
|maingray|![#B9B9B9](https://via.placeholder.com/60x15/B9B9B9/000000?text=+)| section titles |
|maindarkgray|![#B3B3B3](https://via.placeholder.com/60x15/B3B3B3/000000?text=+)|   |
