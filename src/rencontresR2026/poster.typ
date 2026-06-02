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
  box(
    baseline: 20%,
    fill: rgb("#F4F7FA"),
    inset: (bottom: 7pt, top: 10pt, x: 5pt),
    radius: 20%,
    it,
  )
}

#let rule(color: line) = rect(width: 100%, height: 1.1pt, fill: color, stroke: none)

#let label(body, color: r-blue) = text(
  size: 34pt,
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
  #set text(font: "Menlo", size: 18pt, fill: ink)
  #raw(code, block: true, lang: lang)
]

#let micro(title, body, color: r-blue) = {
  box(width: 100%, fill: navy, inset: 25pt, radius: 15%)[
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
    height: 235mm,
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
    #v(2pt)
    #text(size: 21pt, fill: muted)[#hook]
    #v(5pt)
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
  #label("Rencontres R 2026")
  #v(9pt)
  #text(size: 74pt, weight: "bold", fill: ink)[Ce qui rend R unique]
  #v(3pt)
  #text(
    size: 40pt,
    fill: muted,
  )[5 fonctionnalités qui _séduisent_ un développeur Python]
]

#v(13mm)

#label("Résumé")
#v(6pt)
#text(size: 34pt)[
  R possède des particularités qui peuvent surprendre quand on vient de Python,
  mais qui rendent le langage particulièrement puissant, notamment par sa *flexibilité*.

  Ce poster présente *5 mécanismes* qui changent la manière d'écrire du code :
  des opérateurs lisibles, du dispatch léger, des expressions que l'on peut capturer,
  un système objet simple et des arguments évalués seulement quand ils sont utilisés.
]

#v(14mm)
#align(center, label("Les 5 mécanismes", color: navy))
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
    "class Infix:
    def __init__(self, f):
        self.f = f
    def __ror__(self, x):
        return Infix(lambda y: self.f(x, y))
    def __or__(self, y):
        return self.f(y)

within = Infix(lambda x, r: r[0] <= x <= r[1])

5 |within| (1, 10)   # True
12 |within| (1, 10)  # False",
    "Rendre le code plus proche du vocabulaire métier et du langage naturel.",
    "Un opérateur infixe est une fonction dont le nom est entouré par des %.",
    "Souvent remplacé par une fonction nommée ; ici, l'intention reste dans l'appel.",
    color: r-blue,
  ),

  card(
    "02",
    "Surcharger des opérateurs",
    "Adapter une syntaxe connue à vos propres objets.",
    "euros <- function(x) {
  structure(x, class = 'euros')
}

`+.euros` <- function(a, b) {
  euros(unclass(a) + unclass(b))
}

cat(euros(30) + euros(12), 'EUR')
# 42 EUR",
    "class Euros(int):
    def __add__(self, other):
        return Euros(int(self) + other)

print(Euros(30) + Euros(12), 'EUR')
# 42 EUR",
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

label(log(x + 1))
# log(x + 1)",
    "# Pas vraiment possible
def label(expr_src):
    return expr_src

label(\"log(x + 1)\")
# log(x + 1)",
    "Créer des messages, des formules, des messages de débogage ou des pipelines plus lisibles.",
    "`substitute()` récupère l'expression *avant* son évaluation. Python ne permet pas de passer une vraie expression en entrée.",
    "Proche d'une manipulation d'AST, avec beaucoup moins de cérémonie.",
    color: green,
  ),

  card(
    "04",
    "Utiliser S3 simplement",
    "Spécialiser une fonction existante pour un objet métier.",
    "order <- structure(
    list(id = 'A42', total = 89),
    class = 'order'
)

format.order <- function(x, ...) {
  paste0(x$id, ': ', x$total, ' EUR')
}

format(order)
# A42: 89 EUR",
    "class Order:
    def __init__(self, id, total):
        self.id = id
        self.total = total

    def label(self):
        return f'{self.id}: {self.total} EUR'

Order('A42', 89).label()
# A42: 89 EUR",
    "Personnaliser l'affichage d'objets réels : commandes, modèles ou résultats.",
    "`format()` appelle `format.<classe>()` selon la classe de l'objet.",
    "Le comportement vit souvent dans la classe ; S3 le garde à côté de la fonction.",
    color: violet,
  ),

  card(
    "05",
    "Profiter de l'évaluation paresseuse",
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
    "Offrir des valeurs par défaut intelligentes sans demander plus à l'utilisateur.",
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
    #v(0.5cm)
    #label("PDF en ligne", color: navy)
    #rule(color: rgb("#d9c8a5"))
    #align(horizon + center)[
      #image("qrcode.svg", width: 11cm, alt: "QR code du PDF en question")
    ]
  ],
)



#align(bottom)[
  #rule()
  #align(horizon, box(width: 100%, grid(
    columns: (20%, 70%, auto),
    align(left)[

      #v(5mm)
      #text(size: 20pt, weight: "bold")[Joseph Barbier]
      #h(7pt)
      #text(size: 19pt, fill: muted)[_Yellow Sunflower_ joseph\@ysunflower.com]
    ],
    [],
    align(right, image("logo.png", width: 3cm, alt: "Yellow Sunflower logo")),
  )))
]
