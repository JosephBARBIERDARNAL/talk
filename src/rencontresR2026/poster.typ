#let paper = rgb("#fbfaf6")
#let ink = rgb("#17212b")
#let muted = rgb("#52606d")
#let line = rgb("#d9e0e7")
#let white = rgb("#ffffff")
#let code-bg = rgb("#f4f7fa")
#let r-blue = rgb("#276dc3")
#let rust = rgb("#c44536")
#let green = rgb("#1f9d8a")
#let gold = rgb("#f2b84b")
#let violet = rgb("#7357d6")
#let navy = rgb("#1d3557")

#set document(
  title: "Ce qui rend R unique : 5 fonctionnalités qui séduisent un développeur Python",
  author: "Joseph Barbier",
)

#set page(paper: "a0", margin: 34mm, fill: paper)

#set text(font: "Inter", size: 26pt, fill: ink, lang: "fr")
#set par(leading: 0.62em, justify: false)
#set list(marker: [--], indent: 18pt, body-indent: 9pt)
#show raw: it => {
  box(baseline: 20%, fill: rgb("#F4F7FA"), inset: 5pt, radius: 20%, it)
}

#let rule(color: line) = rect(width: 100%, height: 1.1pt, fill: color, stroke: none)

#let label(body, color: r-blue) = text(
  size: 17pt,
  weight: "bold",
  fill: color,
  tracking: 0.06em,
  upper(body),
)

#let chip(body, color: r-blue) = box(
  fill: color,
  inset: (x: 10pt, y: 5pt),
  radius: 4pt,
  text(size: 16pt, weight: "bold", fill: white, body),
)

#let codeblock(code, lang: "r") = block(
  width: 100%,
  fill: code-bg,
  stroke: 0.9pt + line,
  radius: 6pt,
  inset: 14pt,
)[
  #set text(font: "Menlo", size: 17.5pt, fill: ink)
  #raw(code, block: true, lang: lang)
]

#let micro(title, body, color: r-blue) = {
  box(fill: navy, inset: 25pt, radius: 15%)[
    #show raw: set text(fill: black)
    #set text(top-edge: 0.4em, bottom-edge: 0em)
    #text(size: 18pt, weight: "bold", fill: gold, tracking: 0.04em)[#upper(title)]
    #v(3pt)
    #text(size: 19pt, fill: white, eval(body, mode: "markup"))
  ]
}

#let card(num, title, hook, code-r, code-py, usage, works, python, color: r-blue) = {
  block(
    width: 100%,
    height: 211mm,
    fill: white,
    stroke: 1pt + line,
    radius: 8pt,
    inset: 20pt,
    breakable: false,
  )[
    #rect(width: 100%, height: 5pt, fill: color, stroke: none, radius: 2.5pt)
    #v(10pt)
    #text(size: 23pt, weight: "bold", fill: color)[#num]
    #h(12pt)
    #text(size: 36pt, weight: "bold", fill: ink)[#title]
    #v(5pt)
    #text(size: 21pt, fill: muted)[#hook]
    #v(15pt)
    #grid(
      columns: 2,
      column-gutter: 1cm,
      [
        #text(fill: color, size: 25pt)[#underline(
          "R",
          stroke: 0.8pt,
          extent: 1pt,
          offset: 6pt,
        )]
        #v(-0.5cm)
        #codeblock(code-r)
      ],
      [
        #text(fill: color, size: 25pt)[#underline(
          "Python",
          stroke: 0.8pt,
          extent: 1pt,
          offset: 6pt,
        )]
        #v(-0.5cm)
        #codeblock(code-py, lang: "python")
      ],
    )

    #v(14pt)
    #align(bottom, grid(
      columns: (1fr, 1fr),
      column-gutter: 13pt,
      micro("usage", usage, color: color),
      micro("comment ça marche", works, color: color),
    ))
  ]
}

#block(
  width: 100%,
  fill: white,
  stroke: 1pt + line,
  radius: 10pt,
  inset: 35pt,
)[
  #grid(
    columns: (1fr, 118mm),
    column-gutter: 24mm,
    [
      #label("Rencontres R 2026")
      #v(9pt)
      #text(size: 74pt, weight: "bold", fill: ink)[Ce qui rend R unique]
      #v(3pt)
      #text(
        size: 40pt,
        fill: muted,
      )[5 fonctionnalités qui séduisent un développeur Python]
    ],
    [
      #block(
        width: 100%,
        fill: rgb("#edf4ff"),
        stroke: none,
        radius: 9pt,
        inset: (x: 16pt, y: 17pt),
      )[
        #align(center)[
          #text(size: 92pt, weight: "bold", fill: r-blue)[R]
          #v(-4pt)
          #text(size: 17pt, weight: "bold", fill: navy)[expressif]
          #v(2pt)
          #text(size: 15pt, fill: muted)[compact - dynamique - extensible]
        ]
      ]
    ],
  )
]

#v(13mm)

#label("Résumé")
#v(6pt)
#text(size: 28pt)[
  R possède des particularités qui peuvent surprendre quand on vient de Python,
  mais qui rendent le langage particulièrement puissant pour l'analyse de données.
  Ce poster présente *5 mécanismes* qui changent la manière d'écrire du code :
  des opérateurs lisibles, du dispatch léger, des expressions que l'on peut capturer,
  un système objet simple et des arguments évalués seulement quand ils sont utilisés.
]

#v(14mm)
#label("Les 5 mécanismes", color: navy)
#v(7mm)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 14mm,
  row-gutter: 15mm,

  card(
    "01",
    "Créer ses opérateurs",
    "Nommer une intention directement dans la syntaxe.",
    "`%within%` <- function(x, range) {
    x >= range[1] & x <= range[2]
}

5 %within% c(1, 10)    # TRUE
12 %within% c(1, 10)   # FALSE",
    "def within(x, range_):
    return range_[0] <= x <= range_[1]

within(5, (1, 10))     # True
within(12, (1, 10))    # False",
    "Rendre le code plus proche du vocabulaire métier et du langage naturel.",
    "Un opérateur infixe est une fonction dont le nom est entouré par des %.",
    "Souvent remplacé par une fonction nommée ; ici, l'intention reste dans l'appel.",
    color: r-blue,
  ),

  card(
    "02",
    "Surcharger des opérateurs",
    "Adapter une syntaxe connue à vos propres objets.",
    "`+.vec2` <- function(a, b) {
  vec2(a$x + b$x, a$y + b$y)
}

p1 + p2",
    "class Vec2:
    def __add__(self, other):
        return Vec2(
            self.x + other.x,
            self.y + other.y,
        )

p1 + p2",
    "Garder une API naturelle pour des objets spécialisés.",
    "R cherche une méthode S3 nommée comme l'opérateur et la classe.",
    "Même idée que `__add__`, mais portée par le système de méthodes de R.",
    color: rust,
  ),

  card(
    "03",
    "Capturer une expression",
    "Traiter du code comme une donnée manipulable.",
    "label <- function(expr) {
  deparse(substitute(expr))
}

label(log(x + 1))",
    "import ast

def label(expr):
    tree = ast.parse(expr, mode='eval')
    return ast.unparse(tree)

label('log(x + 1)')",
    "Créer des messages, formules, message de debug ou pipelines plus lisibles.",
    "`substitute()` récupère l'expression avant son évaluation.",
    "Proche d'une manipulation d'AST, avec beaucoup moins de cérémonie.",
    color: green,
  ),

  card(
    "04",
    "Utiliser S3 simplement",
    "Faire de l'orienté objet sans cérémonie.",
    "describe <- function(x) {
  UseMethod('describe')
}

describe.lm <- function(x) {
  'un modèle linéaire'
}",
    "from functools import singledispatch

@singledispatch
def describe(x):
    raise NotImplementedError

@describe.register
def _(x: LinearModel):
    return 'un modèle linéaire'",
    "Écrire une fonction générique puis spécialiser son comportement.",
    "Le dispatch appelle `describe.<classe>()` selon la classe de l'objet.",
    "Pas besoin de définir une hiérarchie complète pour un comportement polymorphe.",
    color: violet,
  ),

  card(
    "05",
    "Profiter de la lazy evaluation",
    "Définir des valeurs par défaut qui dépendent des autres arguments.",
    "scale2 <- function(x, mu = mean(x), sigma = sd(x)) {
  (x - mu) / sigma
}",
    "def scale2(x, mu = None, sigma = None):
    if mu is None:
        mu = mean(x)
    if sigma is None:
        sigma = sd(x)

    return (x - mu) / sigma",
    "Offrir des defaults intelligents sans demander plus à l'utilisateur.",
    "Les arguments sont des promesses : ils sont évalués seulement si nécessaire.",
    "Évite souvent les sentinelles du type `None` puis les tests manuels.",
    color: gold,
  ),

  block(
    width: 100%,
    height: 211mm,
    fill: rgb("#f7f2e8"),
    stroke: 1pt + line,
    radius: 8pt,
    inset: 20pt,
    breakable: false,
  )[
    #label("À retenir", color: navy)
    #v(8pt)
    #text(size: 34pt, weight: "bold", fill: ink)[
      R est plus qu'une syntaxe pour manipuler des tableaux.
    ]
    #v(10pt)
    #text(size: 25pt, fill: muted)[
      Ces mécanismes expliquent pourquoi beaucoup de packages R peuvent proposer
      une interface concise, expressive et agréable à lire. Les comprendre permet
      d'écrire du code plus clair, pas forcément plus complexe.
    ]
    #v(13pt)
    #rule(color: rgb("#d9c8a5"))
    #v(12pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 12pt,
      [
        #text(size: 17pt, weight: "bold", fill: navy, tracking: 0.04em)[PUBLIC]
        #v(3pt)
        #text(size: 22pt)[Utilisateurs R débutants ou confirmés.]
      ],
      [
        #text(size: 17pt, weight: "bold", fill: navy, tracking: 0.04em)[OBJECTIF]
        #v(3pt)
        #text(size: 22pt)[Démystifier les mécanismes dits « avancés ».]
      ],
    )
  ],
)

#v(1fr)
#rule()
#v(5mm)
#grid(
  columns: (1fr, auto),
  column-gutter: 16mm,
  [
    #text(size: 20pt, weight: "bold")[Joseph Barbier]
    #h(7pt)
    #text(size: 19pt, fill: muted)[Yellow Sunflower - joseph\@ysunflower.com]
  ],
  [
    #text(
      size: 18pt,
      fill: muted,
    )[Mots-clés : S3 - Métaprogrammation - Lazy evaluation - Syntaxe]
  ],
)
