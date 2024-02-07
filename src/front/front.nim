import karax/[karax, karaxdsl, vdom]

proc main() =
  proc createDom(data: Routerdata): VNode =
    buildHtml(tdiv):
      text "Hello World"

  setRenderer createDom, "ROOT"

if isMainModule:
  main()
