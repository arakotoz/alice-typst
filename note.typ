#import "lib.typ": *

// -----------------------------------------------

#let vspace = v(1.5em, weak: true)
#show: doc => article-style(doc)

// -----------------------------------------------

#let the-title = "Test-beam performance of a tracking TRD prototype"
#let the-short-title = "Test-beam performance of a TRD prototype"
#show: doc => front-matter(
  the-title: the-title,
  the-short-title: the-short-title,
  the-authors: (
    (
      name: "Alice Smith",
      email: "alice@example.com",
      affiliations: ((name: "University A", index: 1),),
    ),
    (
      name: "Bob Jones",
      email: "bob@example.com",
      corresponding: true,
      roles: "Corresponding author",
      affiliations: (
        (name: "University B", index: 2),
        (name: "Research Institute C", index: 3),
      ),
    ),
    (
      name: "Carol Davis",
      email: "carol@example.com",
      affiliations: ((name: "University A", index: 1),),
    ),
  ),
  the-abstract: [
    Replace with the abstract content. #lorem(50)
  ],
  doc
)

// -----------------------------------------------
// bib file and bib citation style

#add-bib-resource(read("papers.bib"))
#let bib-style = format-citation-numeric(
  compact: true,
)

#show: doc => refsection(format-citation: bib-style.format-citation, doc)

// -----------------------------------------------
// document body

#show: doc => document-body(
  // toggle on/off the line numbering here
  line-number: true,
  doc
)

= Introduction

To optimally reject the combinatorial background while preserving
the interesting signal from the data, sophisticated selections
exploiting a Machine-Learning (ML) algorithm, trained to distinguish among
prompt $upright(D)^+_(upright(s))$, non-prompt $upright(D)^+_(upright(s))$,
and the combinatorial background, were applied.

The biological effect of radiation depends on the quality of
the radiation as well as on the amount of energy absorbed. Evidence
suggests that this quality dependence is primarily caused by
the differences in rates of energy loss #cite("Raby1966", "Dupont1961").
The general criteria that have been used are:
#set enum(numbering: "(i)")
+ to terminate the iteration when the residue between iterated and experiment values is of the order of experimental errors #cite("Raby1966","Appleman1959","vanBerg1965","Bryant1985","Allen1977");
+ to terminate when the smoothest solution has been obtained.

For an overall appreciation of the work carried out in this field,
see Refs. #cite("Keil1969") and #cite("Guignard1983").

In this report, we will explore the various factors that influence fluid
dynamics in glaciers and how they contribute to the formation and behaviour 
of these natural structures.
- The climate
  - Temperature
  - Precipitation
- The topography
- The geology

Glaciers as the one shown in @logo will cease to exist if we don't take 
action soon!

#figure(
  image("fig/alicelogo.pdf"),
  caption: [
    _Logo_ for the ALICE experiment at CERN.
  ]
)<logo>

The flow rate of a glacier is defined by the following equation:

$ Q = rho A v + C $

Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 $

$ v := vec(x_1, x_2, x_3) $

= Background

In the case of glaciers, fluid
dynamics principles can be used
to understand how the movement
and behaviour of the ice is
influenced by factors such as
temperature, pressure, and the
presence of other fluids (such as
water).

#lorem(50) Here is the paragraph spacing with default settings.

#lorem(60) Here the vspace function is used to add some space between paragraphs on demand to

#vspace
#lorem(100)
$
  x_(1,2) = (-b plus.minus sqrt(b^2 - 4 a c))/ (2 a)
$
#lorem(100)

== In this paper

#lorem(70)

#figure(
  rect(width: 4cm, height: 3cm),
  caption: shortcap(
    [A short caption of the image],
    [#lorem(30)]
  )
)

#lorem(20)

=== Contributions

#lorem(40)

#lorem(40)

= Related Work

#lorem(200)

$
  y = k x + d
$

#lorem(50)

// Example of a custom table
#figure(
  ctable(
    cols: "l|cr", [A], [B], [C], ..range(1, 16).map(str)),
    caption: shortcap(
      "Short caption", "This is a custom table",
    )
)

// -----------------------------------------------
// Appendix
// -----------------------------------------------

#pagebreak(to: "odd")
#show: appendix.with(title: "Appendix")

= Construction on a flat site

== General considerations

Following on ECFA recommendation, the project described in this
report is based on the assumption that the machine is built close
to the present CERN site, and has been taken into account in
the cost estimate.

== Effects on the construction

The general layout of the machine would be very similar to that
shown in the main body of the report.

// -----------------------------------------------
// Back matter
// -----------------------------------------------

#pagebreak(to: "odd")

#fig-outline()
#tab-outline()

// bibliography

#pagebreak(to: "odd")
#let bib-format-ref = format-reference(
  reference-label: bib-style.reference-label,
)
#print-bibliography(
  title: "References",
  format-reference: bib-format-ref,
  label-generator: bib-style.label-generator,
)
// -----------------------------------------------
