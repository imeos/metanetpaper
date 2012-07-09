# DFKI META-NET whitepaper

LaTeX class and files to typeset (bilingual) papers of the META-NET project in a one- or twocolumn layout in all languages of the project.

([www.meta-net.eu](http://www.meta-net.eu/))


## Class options
`[]     ` = Set the inner part of the LWP  
`[cover]` = Set the cover of the LWP  
`[ebook]` = Set the eBook version of the LWP (including cover and inner part)  
`[plain]` = Create a whitepaper without ISSN and third-party logo(s)


## Custom, class specific commands

### For use within the *_preamble.tex-files
`[\spineTitle]`: Title for the spine of the cover, english version first  
`[\languageVersion]`: (optional) Version of a language e.g. bokmålsversjon or nynorskversjon  
`[\authoraffiliation]`: Author(s) and the organizations their affiliated with   
`[\FundingLNotice]  `: Funding notice left column  
`[\FundingRNotice]  `: Funding notice right column  
`[\editors]         `: The editors of the current LWP  
`[\SpineLText]      `: Text in left column on backside of the cover  
`[\SpineRText]      `: Text in right column on backside of the cover  
`[\quotes]          `: Quotes from VIPs on backside of the cover

### For use within the *_content.tex-files
`[\ssection[]{}]      `: Replacement for normal \section  
`[\bsection[]{}]      `: Replacement for normal \section to be printed bilingually  
`[\boxtext{}]         `: Marginal notes to be emphasized with sans-serif font and borders on top and bottom  
`[\lingua]            `: Prints IPA characters inside square brackets  
`[\colorrule{1}{2}{3}]`: Prints a horizontal line with 1=color, 2=width, 3=thickness


## Available color definitions
`[white]     ` =~ #ffffff  
`[printblack]` =~ #141413  
`[orange1]   ` =~ #ff6600  
`[orange2]   ` =~ #ff9900  
`[orange3]   ` =~ #ffcc00  
`[corange1]  ` =~ #f5b58e  
`[corange2]  ` =~ #f5a676  
`[corange3]  ` =~ #f5975d  
`[corange4]  ` =~ #f58845  
`[corange5]  ` =~ #f5792c  
`[red_dark]  ` =~ #b72126  
`[red]       ` =~ #c80000  
`[red2]      ` =~ #ff8182  
`[red3]      ` =~ #a83b3b  
`[grey1]     ` =~ #3c3c3c  
`[grey2]     ` =~ #c6c7c8  
`[grey3]     ` =~ #c6c7c8  
`[grey4]     ` =~ #847a6f  
`[green]     ` =~ #1f9863  
`[green2]    ` =~ #81c56b  
`[blue]      ` =~ #44c1c5  
`[blue2]     ` =~ #56d8d8  
`[purple]    ` =~ #7e7fff

## Sample screenshots
![Danish Ebook Cover](http://stuff.imeos.org/persistent/lwp_icelandic_ebook_cover.png)
Danish Ebook Cover

![Danish Ebook Content](http://stuff.imeos.org/persistent/lwp_danish_ebook_content.png)
Danish Ebook Content
