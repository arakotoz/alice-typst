// Typst template that intends to mimic the LaTeX style of 
// the ALICE analysis notes.
//
// Several parts are taken from the Typst template rubber-article.
//
// -----------------------------------------------
// packages and templates
// elegant headers and footers
#import "@preview/chic-hdr:0.5.0": *
// authors, affiliations, abstract
#import "@preview/pubmatter:0.2.2"
// custom table, short caption, outlines for figures and tables
#import "@preview/rubber-article:0.5.1": ctable, fig-outline, tab-outline, shortcap, appendix
// customize and format enums and lists
#import "@preview/itemize:0.2.0" as el
// BibLaTex bib style for Typst
#import "@preview/pergamon:0.7.1": *
// drawing 
// #import "@preview/cetz:0.4.2": canvas, draw
// #import "@preview/cetz-plot:0.1.3": plot
//
// -----------------------------------------------
// setting styles for the document
// -----------------------------------------------

#let article-style(
  myfont: "Times New Roman",
  myfont-size: 11pt,
  myfont-header-size: 12pt,
  myfont-caption-size: 10pt,
  myfont-mono: "Latin Modern Mono",
  myfont-mono-size: 10pt,
  doc
) = {
 set page(
    paper: "a4",
    margin: (inside: 3cm, outside: 2cm, top: 3cm),
  )
  set text(
    font: myfont,
    lang: "en",
    size: myfont-size,
    weight: "regular"
  )
  show raw: set text(
    font: myfont-mono,
    size: myfont-mono-size
  )

  set heading(numbering: "1.1")
  show heading: it => {
    if it.numbering == none { it } else { 
      block(counter(heading).display(it.numbering) + h(0.65em) + it.body)
    }
  }
  show heading.where(level: 1): set text(size: myfont-header-size, weight: "bold")
  show heading.where(level: 2): set text(size: myfont-size, weight: "bold")
  show heading.where(level: 3): set text(size: myfont-size, weight: "bold", style: "italic")
  show heading: set block(above: 1.65em, below: 1.3em)

  show math.equation: set block(above: 2em, below: 2em)
  set math.equation(numbering: "(1.1)")

  set par(
    leading: 0.65em,
    spacing: 1.2em,
    justify: true
  )

  let markers = ([--], [--], [#sym.ast.op], [#sym.circle.filled.tiny])
  show: el.default-enum-list.with(
    indent: 0.8em,
    body-indent: 0.65em,
    enum-spacing: 1.2em,
    item-spacing: 1em
  )
  set list(marker: markers)
  
  // Used to determine if the long or short caption should be displayed.
  // (rubber-article)
  let outlined = state("outlined", false)
  show outline: it => {
    outlined.update(true)
    it
    outlined.update(false)
  }

  // outline styling for the table of contents (rubber-article)
  show outline.entry.where(level: 1): it => {
    set block(above: 1.65em, below: 1em)
    show link: set text(fill: black)
    link(it.element.location(), it.indented(
      strong(it.prefix()),
      strong((it.body()) + h(1fr) + it.page()),
        gap: 0.65em,
      )
    )
  }
  show outline.entry.where(level: 2): block.with(above: 0em, below: 1em)
  show outline.entry.where(level: 3): block.with(above: 0em, below: 1em)

  // outline styling for the image figures (rubber-article)
  show outline.where(target: figure.where(kind: image)): it => {
    show outline.entry.where(level: 1): {
      it => {
        show link: set text(fill: black)
        link(it.element.location(), it.indented(
          strong(it.prefix()),
          it.inner(),
        ))
      }
    }
    it
  }

  // outline styling for table figures (rubber-article)
  show outline.where(target: figure.where(kind: table)): it => {
    show outline.entry.where(level: 1): {
      it => {
        show link: set text(fill: black)
        link(it.element.location(), it.indented(
          strong(it.prefix()),
          it.inner(),
        ))
      }
    }
    it
  }

  // figures spacing vs text
  show figure: set block(above: 2em, below: 2em)

  // figure styles (slightly modified rubber-article)
  show figure.where(kind: table): set figure(
    supplement: strong([Table]),
    numbering: "1",
    gap: 1em
  )
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  show figure.where(kind: image): set figure(
    supplement: strong([Fig.]),
    numbering: "1",
    gap: 0.65em
  )

  // set table style (rubber-article)
  set table(stroke: none, gutter: auto, fill: none)

  // emphasize the figure caption numbering 
  // (slightly modified rubber-article)
  show figure.caption: it => {
    set par(justify: true)
    set text(
      size: myfont-caption-size
    )
    let prefix = {
      it.supplement + " " + context it.counter.display(it.numbering) + ": "
    }
    let caption-width = measure(it.body).width
    let cap = {
      set align(left) if caption-width > 14cm 
      strong(prefix)
      it.body
    }
    block(width: 92%, cap)
  }
  doc
}

// -----------------------------------------------
// setting the front matter
// -----------------------------------------------

#let front-matter(
  myfont: "Times New Roman",
  the-title: "A very very long and complicated title",
  the-short-title: none,
  the-authors: none,
  the-abstract: none,
  doc
) = {

  // title page

  if the-short-title == none {
    the-short-title = the-title
  }
  let fm = pubmatter.load((
    title: the-title,
    short-title: the-short-title,
    authors: the-authors,
    abstract: the-abstract,
  ))
  align(
    center,
    text(
      size: 16pt, 
      weight: "regular",
      font: myfont,
      [EUROPEAN ORGANIZATION OF NUCLEAR RESEARCH]
    )
  )
  box(
    height: 2cm,
    image("fig/alicelogo.pdf")
  )
  h(1fr)
  box(
    height: 2cm,
    image("fig/cernlogo.pdf")
  )
  let thedate = datetime.today().display("[month repr:long] [day], [year]")
  let theyear = datetime.today().year()
  align(
    right,
    text(
      size: 10pt,
      weight: "regular",
      font: myfont,
      [ALICE-ANA-#theyear\-xxx \ 
      #thedate ]
    )
  )
  v(3.5cm)
  let theme = (color: black, font: myfont)
  state("THEME").update(theme)
  align(center, pubmatter.show-title(fm))
  align(center, pubmatter.show-author-block(fm))
  grid(
    columns: (10%,80%,10%),
    rows: (auto),
    [] , pubmatter.show-abstract-block(fm) , []
  )
  pagebreak(to: "odd")

  // headers for odd and even pages after the title page

  show: chic.with(
    odd: (
      chic-header(
        left-side:fm.short-title,
        right-side: chic-page-number(),
      ),
      chic-separator(0.6pt)
    ),
    even: (
      chic-header(
        left-side: chic-page-number(),
        right-side: [ALICE Analysis Note #datetime.today().year()]
      ),
      chic-separator(0.6pt)
    )
  )

  // table of contents

  outline(title: [Contents], depth: 3,)
  doc
}

// -----------------------------------------------
// options for the document body
// -----------------------------------------------

#let document-body(
  line-number: true,
  hyperlink-color: rgb("#0000FF"),
  doc
) = {

  pagebreak(to: "odd")

  // toggle on/off the line numbering

  let line-number = true
  set par.line(
    numbering: i => if line-number and calc.rem(i, 5) == 0 {i},
    numbering-scope: "page"
  )

  // add hyperlink color
  // (use LaTeX blue #0000FF)

  show link: set text(fill: rgb("#0000FF"))
  show ref: set text(fill: rgb("#0000FF"))
  doc
}

