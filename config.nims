task backend, "build backend":
  exec "nim c -o:bin/back src/back/back.nim"

task frontend, "build frontend":
  exec "nim js -o:bin/static/front.js src/front/front.nim"

task run_backend, "run backend":
  exec "cd bin && ./back"
