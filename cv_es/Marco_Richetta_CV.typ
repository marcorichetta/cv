
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Marco Richetta"
#let locale-catalog-page-numbering-style = context { "Marco Richetta - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Feb 2025"
#let locale-catalog-language = "es"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(64, 138, 224)
#let design-colors-links = rgb(0, 0, 255)
#let design-section-titles-font-family = "Lato"
#let design-section-titles-bold = false
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-full-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 12pt
#let design-text-leading = 0.8em
#let design-text-font-family = "Lato"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = left
#let design-header-photo-width = 2.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Lato"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "Lato"
#let design-header-vertical-space-between-name-and-connections = 0.4cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.5cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.4cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 0.5cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Marco Richetta

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Copenhagen, Denmark],
  [#box(original-link("mailto:marcorichetta@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)marcorichetta\@gmail.com])],
  [#box(original-link("https://marcorichetta.vercel.app/")[#fa-icon("link", size: 0.9em) #h(0.05cm)marcorichetta.vercel.app])],
  [#box(original-link("https://linkedin.com/in/marco-richetta")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)marco-richetta])],
  [#box(original-link("https://github.com/marcorichetta")[#fa-icon("github", size: 0.9em) #h(0.05cm)marcorichetta])],
)
#connections(connections-list)



== Sobre Mí


#one-col-entry(
  content: [Me gusta compartir conocimiento dando #link("https://www.youtube.com/live/EWofHnNngoc?si=1OpnvzkN-R0NSc2i")[charlas], #link("https://www.linkedin.com/in/marco-richetta/overlay/experience/2020463733/multiple-media-viewer/?profileId=ACoAABQf7hUBZUJgMc0bcZABQZwPRzETisnwoTM&treasuryMediaId=1635515512870")[presentaciones], también como #link("https://frontend.cafe/mentorias")[mentor] o simplemente ayudando a otros a #link("https://forum.djangoproject.com/u/marcorichetta/summary")[resolver problemas].]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Actualmente interesado en mejorar la #strong[Developer Experience \(DX\)] a través de IaC, MLOps, documentación y testing. También me interesan Go y la Programación Funcional.]
)


== Experiencia


#two-col-entry(
  left-content: [
    #strong[Software Engineer], Mercado Libre -- Córdoba, Argentina
  ],
  right-content: [
    Jul 2022 a Jun 2024
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Trabajé mejorando la #strong[DX en Python], manteniendo herramientas usadas por miles de desarrolladores en la compañía \(Soporte general, nuevas funcionalidades, corrección de bugs, deprecado de versiones\).],[Con la experiencia en Python, impulsamos actualizaciones en más de 1000 aplicaciones y bibliotecas obsoletas de Java mediante #link("https://sourcegraph.com/batch-changes")[cambios de código a gran escala],  supervisando un roadmap y coordinando con los equipos responsables para implementar y monitorear las actualizaciones.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Software Developer], Flux IT -- Córdoba, Argentina
  ],
  right-content: [
    Ene 2021 a Jun 2022
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Desarrollo fullstack para integrar sistemas de terceros con aplicaciones internas de la compañía.],[Posteriormente, en un rol más orientado a DevOps, ayudé en la migración de la infraestructura interna a Kubernetes aplicando GitOps.],)
  ],
)



== Educación


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
     #strong[Analista de Sistemas de Computación], Instituto Superior 25 de Mayo 
  ],
  right-content: [
    Dec 2020
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Languages:] Python, React\/JavaScript, Go]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Technologies:] Django, Pytest, Kubernetes, FluxCD, Docker]
)


