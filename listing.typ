#let labeled_frame(label: none, content) = {
  let font = (font: "Fira Code", size: 10pt)
  set text(..font)
  show raw: set text(..font)
  box(stroke: black + 2pt, radius: 1em)[
    #if label != none {
        block(
          stroke: black + 2pt,
          inset: 0.8em,
          below: 0.1em,
          radius: (top-left: 1em, bottom-right: 1.5mm),
          label,
        )
    }
    #block(
      width: 100%,
      inset: (rest: 0.5em),
      content,
    )
  ]
}

#let include_code_full(file_path, lang) = {
  labeled_frame(label: file_path)[
    #raw(read(file_path), lang: lang)
  ]
}

#let include_code_snippet(file_path, lang, start_line, end_line) = {
    let all = read(file_path)
    let selection = ""
    let counter = 1
    for x in all.split("\n") {
        if((start_line <= counter) and (counter <= end_line)){
        selection = selection+ x + "\n"
        }
        counter+=1
    }
  labeled_frame(label: file_path)[
    #raw(selection, lang: lang)
  ]
}