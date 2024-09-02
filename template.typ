// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!

#let project(
  title: "",
  author: "",
  date: none,
  logo: none,
  subjects: (),
  body,
) = {
  // Set the document's basic properties.
  set document(author: author, title: title)
  set page(numbering: none, number-align: center)
  // set page(background: rect(height: 100%, width: 100%, fill: yellow, ))
  set text(font: "Linux Libertine", lang: "de", size: 11pt)
  set heading(numbering: "1.1")

  
  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  // v(0.6fr)
  // if logo != none {
  //   align(right, image(logo, width: 40%))
  // }
  // v(4.0fr)
  
  // text(2em, weight:200, font: "Linux Libertine Display", title)
  // v(1.2em, weak: true)
  // text(1.2em, [Rosa-Luxemburg-Gymnasium])
  // v(1.1em, weak: true)
  // text(1em, [#smallcaps("Philosophie"), Psychologie])
  // // Author information.
  // v(1.1em, weak: true)
  // text(authors.at(0), size: 1.1em)
  // h(0.4em)
  // sym.bullet
  // h(0.4em)
  // text("Abitur " + date, size: 1.1em)
  // v(1.2em, weak: true)
  // [ABGABEDATUM]
  // v(2.4fr)
  // set page(background: none)

  let spacing = 1em
  align(center + horizon)[
    #image(logo, width: 30%)
        
    #text(size: 1.5em)[Rosa-Luxemburg-Gymnasium]
    #v(spacing)
    #text(font: "Linux Libertine Display", size: 2.3em)[#title]
    #v(spacing)
    #text(size: 1.5em)[Liam Stedman]
    #v(spacing * 2)
    #text(size: 1.3em)[Besondere Lernleistung im]
    #v(spacing)
    #text(size: 1.5em)[ Abitur ]
    #v(spacing)
    #text(size: 1.3em)[in den Fächern]
    #v(spacing)
    #text(size: 1.5em)[#smallcaps([#subjects.at(0)]) \ #subjects.at(1)]
    #v(spacing)
    #text(size: 1.5em, date)
    
  ]
  
  pagebreak()
  
  set page(margin: (left: 4cm, right: 2cm))

  // Table of contents.

  set page(numbering: "1", number-align: center)
  outline(depth: 3, indent: true)
  
  pagebreak()  
  
  // Main body.

  // set page(numbering: "1", number-align: center)
  // counter(page).update(1)
  set par(justify: true)
  set par(leading: 0.65 * 1.5em)

  // custom italicized quotes
  // show quote.where(block: false): it => [_ #it _]
  
  body

  pagebreak()
  
  bibliography("__bibliographie.bib", full: true, style: "chicago-fullnotes", title: "Literatur")

  pagebreak()
  align(right, [Hiermit erkläre ich, dass ich die schriftliche Arbeit ohne fremde Hilfe angefertigt und nur die im Literaturverzeichnis angeführten Quellen und Hilfsmittel benutzt habe.
  ])

  h(1em)
  align(line(length: 6cm), right) 
  align(right, author)
}