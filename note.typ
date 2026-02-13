#import "lib.typ": *

// -----------------------------------------------
// define a few global variables
// -----------------------------------------------

// vertical space
#let vspace = v(1.5em, weak: true)

// LaTeX DIY logo
#let LaTeX = {
  [L];
  box(move(dx: -4.2pt, dy: -1.2pt, box(scale(65%)[A])));
  box(move(dx: -5.7pt, dy: 0pt, [T]));
  box(move(dx: -7.0pt, dy: 2.7pt, box(scale(100%)[E])));
  box(move(dx: -8.0pt, dy: 0pt, [X]));
  h(-8.0pt)
}
#show "LaTeX": LaTeX

// -----------------------------------------------
// setting article-style for the document
// -----------------------------------------------

#show: doc => article-style(doc)

// -----------------------------------------------
// front matter
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
      name: "Josiah Carberry",
      email: "josiah@example.com",
      orcid: "0000-0002-1825-0097",
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
    Each paper should be preceded by a short Abstract of not more than 
    150 words, which should be written as a single paragraph and should not 
    contain references. #lorem(50)
  ],
  doc
)

// edit PDF metadata
#set document(
  title: the-title,
  author: ("Alice Smith", "Josiah Carberry", "Carol Davis")
)

// -----------------------------------------------
// bib file and bib citation style
// -----------------------------------------------

#add-bib-resource(read("papers.bib"))
#let bib-style = format-citation-numeric(
  compact: true,
)

#show: doc => refsection(format-citation: bib-style.format-citation, doc)

// -----------------------------------------------
// document body
// -----------------------------------------------

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

= Examples of figures and tables

== Including tabular material

Smith tabulated the average values of mean linear energy transfer
(LET) obtained by the different methods used in
Ref. #cite("Appleman1959"), and these are reproduced in @tab-LET.

Note that a table is produced with the `ctable()` environment 
from the Typst package `rubber-article`, and should be called inside 
the `#figure()` command. It mimics the `table` environment from LaTeX. The 
caption should be positioned _above_ the tabular material.

// Example of a custom table
#figure(
 ctable(
    cols: "l[6cm]|cc", 
    [Radiation], [Smith], [Jones],
    [1 MeV $alpha$], [], [],
    [200 kVp X-rays total], [3.25], [1.79],
    table.hline(stroke: .75pt),
    [200 kVp X-rays (primary)], [2.60], [1.48]
  ),
  caption: shortcap(
    "Mean LET values in water", "Calculated mean LET values in water (keV/mm)",
  )
)<tab-LET>

@tab-LET is reproduced from the publication mentioned
earlier and shows the good agreement between predictions and
calculations. Comparison should be made with the decay curves shown
in Figs.~6 and 7 of Ref.~#cite("vanBerg1965"), and further information
is given in @sec-curvature and #ref(<sec-app>, supplement: "Appendix").


== Including figures

Figures can also be imported, in PDF, PNG and JPEG format. #ref(<fig-residual-plot>, supplement: "Figure") show 
how to include a figure from an external file with the `#figure(image())` 
command of Typst. The `shortcap()` command from the `rubber-article` package 
allows to give both a short and a long caption. The short caption is used in 
the outline with the list of figures.

#figure(
  image("fig/norm-logy-dcacorr-pass2-lhc23e-dcacorr-rot-pass2-lhc23e-residual-distr-h1-l3.pdf"),
  caption: shortcap(
    "Including a figure from an external file",
    "Including a figure from an external file. Here, we are plotting the cluster-track residual distributions for the back face (layer 3) of the top half (h1) disk 1 of the MFT detector for two alignment geometries that only differ by global translations and global rotations of each half MFT."
  )
)<fig-residual-plot>

== Examples of equations <sec-curvature>

#ref(<eq-a1>, supplement: "Equation") representing a straight line at an angle $theta$, is 

$ n^(k)(h)u = lambda h t g q_(k) $<eq-a1>

and

$ n^(k)(h) = k h frac(k, 3 2) $

where:
- $lambda$ is the distance between two consecutive sweep lines,
- $u$ is the least count.

We consider a parabola, the tangent of which is parallel to the vertical axis of the 
main matrix. A sufficiently good approximation to a parabola [see @eq-a3] drawn inside 
the matrix can be given by the following formula:

$ n_(q) = alpha q^(2) alpha = frac(lambda^(2), 3 R u) $<eq-a3>

where $R$ is the radius of curvature. We have defined the following relationship:

$ n_(q) + mu_(q) "with" mu_(q) = alpha (2 q + 1) $

= Background

In this report, we will explore the various factors that influence fluid
dynamics in glaciers and how they contribute to the formation and behaviour 
of these natural structures.
- The climate
  - Temperature
  - Precipitation
- The topography
- The geology

The flow rate of a glacier is defined by the following equation:

$ Q = rho A v + C $

Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 $

$ v := vec(x_1, x_2, x_3) $



In the case of glaciers, fluid dynamics principles can be used
to understand how the movement and behaviour of the ice is
influenced by factors such as temperature, pressure, and the
presence of other fluids (such as water).

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

#lorem(50)

// Example of a custom table
#figure(
  ctable(
    cols: "l|cr", [A], [B], [C], ..range(1, 16).map(str)),
    caption: shortcap(
      "Short caption", "This is a custom table",
    )
)

= Conclusion

The theoretical considerations presented have been confirmed
by their close agreement with the results of practical experiments.
An account of the earlier work carried out in this field can
be found in the bibliography.

It is expected that in the next few years many new results will
be published, since a significant number of new experiments have
recently been launched.

= Acknowledgements

We wish to thank C. Brown for his most enlightening comments
on this topic.

// -----------------------------------------------
// Appendix
// -----------------------------------------------

#pagebreak(to: "odd")
#show: appendix.with(title: "Appendix")

= Construction on a flat site <sec-app>

== General considerations

Following on ECFA recommendation, the project described in this
report is based on the assumption that the machine is built close
to the present CERN site, and has been taken into account in
the cost estimate.

== Effects on the construction

The general layout of the machine would be very similar to that
shown in the main body of the report.

// -----------------------------------------------
// back matter
// -----------------------------------------------

#pagebreak(to: "odd")

// list of figures

#fig-outline()

// list of tables

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
