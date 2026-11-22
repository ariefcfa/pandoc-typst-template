// these values override base values if provided
// ----------
// forked notes:
// i tried to populate all keys from other file to here
// if the key doesn't works, then try to put it in the markdown YAML frontmatter
// example:
// ---
// toc: true
// ---

#let user_cfg = (
  // CUSTOM PAGE SIZE
  custom-page: true,
  custom-page-width: 100mm,
  custom-page-height: 190mm,
  custom-page-margin: (x: 0.5cm, top: 1.3cm, bottom: 1.3cm),
  custom-header-font-size: 0.9em,
  custom-footer-font-size: 1em,
  //
  // METADATA 
  // dateformat: "[day]/[month]/[year]",
  // authors: (),
  // title: "",
  // subtitle: "",
  // keywords: "",
  // lang: "world", // see parameter in typst docs Reference > Text > Text
  // region: "earth",  // idem
  //
  //// LAYOUT
  // margin: (x: 2.5cm, top: 3.5cm, bottom: 3.5cm),
  // paper: "a4",
  // columns: 1,
  // color-fg: black,
  // color-bg: white, 
  //
  //// NUMBERING
  page-numbering: "1|1", // "1" is like page 1, 2, ... "1 of 1" is like 1 of 3, 2 of 3, ...
  page-numbering-both: true,
  // number-sections: false,
  // section-numbering: "1.1.1.1.1",
  //
  // TYPOGRAPHY
  font: "Noto Sans",
  heading-font: "Roboto",
  code-font: "JetBrains Mono",
  header-footer-font: "Noto Sans",
  fontsize: 12pt,
  // leading: 0.65em,
  // spacing: 1.2em,
  // justify: true,
  // smartquote: true,
  //
  // TITLEPAGE
  // titlepage-rule: 3pt + black,
  // titlepage-bg: white,
  // titlepage-fg: black,
  // titlepage-logo: none,
  // titlepage-logo-width: none,
  // titlepage-supervisor: none,
  //
  // TABLE OF CONTENTS
  toc: true, // it's false in phd
  toc-depth: 6,
  toc-title: "Table of contents",
  toc-own-page: true,
  lof: true,
  lof-title: "List of figures",
  lof-own-page: true,
  lot: true,
  lot-title: "List of tables",
  lot-own-page: true,
  toc-page-numbering: "i",
  //
  // HEADER AND FOOTER
  // %title%, %date%, %author%, %page%
  // header-footer-stroke: 1pt + black,
  // disable-header: true,
  // disable-footer: false,
  // header-left: "%title%",
  // header-center: none,
  // header-right: "%date%",
  // footer-left: "%author%",
  footer-center: none,
  footer-right: "%page%",
  // 
  // ABSTRACT
  // abstract-title: "Abstract",
  // abstract: none,
  // abstract-own-page: false,
  // thanks-title: "Thanks",
  // thanks: none,
  // 
  // FIGURES
  // figure-prefix: "Fig.",
  // table-prefix: "Table",
  // listing-prefix: "Listing",
  // 
  // TABLES
  // table-header-bg: luma(200),
  // table-striped-bg: luma(230),
  // table-stroke-border-x: 1pt + black,
  // table-stroke-border-y: 1pt + black,
  // table-stroke-header-b: 1pt + black,
  // table-stroke-horizontal: 1pt + black,
  // table-stroke-vertical: 1pt + black,
  // table-inset: 6pt,
  // 
  // OTHER
  // listings: false,
  // equation-numbering: none,
  // glossary: none,
)
// end of user_cfg ----------


// ----------------------------
// Your's custom modification maybe can be written in here apparently
//
// all code examples below are from Claude Sonet 5.5 (not perfect, as my prompt and knowledge about typst is almost none)


// style the inline code
#show raw.where(block: false): it => {
  if it.lang == "zws-done" { return it }
  text(size: 1.5em, highlight(
    fill: rgb("#e5e7e9"),
    radius: 2pt,
    extent: 1.5pt,
    top-edge: 0.7em,
    bottom-edge: -0.05em,
    raw(
      it.text.clusters().join("\u{200B}"),
      lang: "zws-done",
    ),
  ))
}


// make the table breakable to next page
#set table(inset: (x: 6pt, top: 8pt, bottom: 12pt))
#show figure: set block(breakable: true)


// style the quote
#show quote.where(block: true): it => {
  block(
    stroke: (left: 3pt + rgb("#e5e7e9")),
    inset: (left: 10pt),
    above: 18pt,
    // below: 8pt,
  )[
    #set text(
      fill: rgb("#555555"),
      size: 11pt,
    )
    #it.body
  ]
}


// style underline only for external link 
#show link: it => {
  if type(it.dest) == str {
    underline(it)
  } else {
    it
  }
}
