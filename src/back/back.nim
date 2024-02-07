import karax/[karaxdsl, vdom]
import prologue
import prologue/middlewares/staticfile

proc home*(ctx: Context) {.async.} =
  let
    vnode =
      buildHtml(html):
        head:
          meta(charset = "utf-8")
          meta(content = "width=device-width, initial-scale=1", name = "viewport")
          title:
            text "Karax example"
        body(class = "site", id = "body"):
          tdiv(id = "ROOT")
          script(src = "/front.js", `type` = "text/javascript")
  resp htmlResponse("<!DOCTYPE html>\n" & $vnode)

let settings = loadSettings("config.debug.json")

var app = newApp(settings)
app.use(staticFileMiddleware("/static"))
app.addRoute(
  @[pattern("/", home), pattern("/front.js", redirectTo("/static/front.js"))], ""
)
app.run()
