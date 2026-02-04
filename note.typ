#import "lib.typ": *

// -----------------------------------------------

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
// document body

#show: doc => document-body(
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
the differences in rates of energy loss.

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

#set text(
  font: "New Computer Modern"
)

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
#pagebreak(to: "odd")
#show: appendix.with(title: "Appendix")
// -----------------------------------------------

= Ambiguous tracks

#lorem(35)

// -----------------------------------------------
#fig-outline()
#tab-outline()
// -----------------------------------------------
