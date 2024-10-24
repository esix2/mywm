(in-package #:nyxt-user)

(define-command toggle-buffer-dark () "Toggle dark and refresh"
  (nyxt/mode/style:dark-mode)
  (reload-current-buffer))

(define-command openinternal () "Shows the whole history"
  (make-buffer-focus :url "nyxt:new"))

(define-command atlas () "Shows the whole history"
  (make-buffer-focus :url "https://search.atlas.engineer/searxng/"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SECTION:     Commands for openning different web pages"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
(define-command amazon () "Opens Bibliothek"
  (make-buffer-focus :url 
"https://www.amazon.de/-/en/Amazon-Video/b/?ie=UTF8&node=3010075031&ref_=nav_cs_prime_video_bf88699d61904c72940f61552dfe7a32"))

(define-command bibliothek () "Opens Bibliothek"
  (make-buffer-focus :url "https://intranet.fz-juelich.de/de/organisation/zb"))

(define-command confluence () "Opens 3D-ABC Confluence"
  (make-buffer-focus :url "https://spaces.awi.de/display/H3D/3D-ABC+Team"))

(define-command flex () "Opens Flex"
  (make-buffer-focus :url "https://booked.jsc.fz-juelich.de/Web/?"))

(define-command fzj () "Opens Forschungszentrum Jülich"
  (make-buffer-focus :url "https://www.fz-juelich.de"))

(define-command gitlab () "Opens Gitlab"
  (make-buffer-focus :url "https://gitlab.jsc.fz-juelich.de/"))

(define-command gmail () "Opens Gmail"
  (make-buffer-focus :url "https://gmail.com"))

(define-command gpt () "Opens ChatGPT"
  (make-buffer-focus :url "https://chatgpt.com"))

(define-command intra () "Opens Intranet"
  (make-buffer-focus :url "https://intranet.fz-juelich.de/de"))

(define-command invidious () "Opens Invidious"
  (make-buffer-focus :url "http://localhost:3000/feed/history"))

(define-command jsc () "Opens JSC"
  (make-buffer-focus :url "https://herten1.pages.jsc.fz-juelich.de/jsc-new-employees/#conf:hpcls,hpccdss,hpcase,tech,atmlpp,xdev,sarch,scsup,appreview,dma,esde"))

(define-command judoor () "Opens JuDoor"
  (make-buffer-focus :url "https://judoor.fz-juelich.de/login"))

(define-command jupyter-lab () "Opens Jupyter on remote side"
  (make-buffer-focus :url "http://localhost:8080"))

(define-command juwels-doc () "Opens Juwels documentatioin"
  (make-buffer-focus :url "https://apps.fz-juelich.de/jsc/hps/juwels/index.html#"))

(define-command leo () "Leo dictrionary"
  (make-buffer-focus :url "https://dict.leo.org/german-english"))

(define-command llview () "Open LLView"
  (make-buffer-focus :url "https://www.fz-juelich.de/en/ias/jsc/services/user-support/software-tools/llview"))

(define-command mitarbeiterportal () "Opens Mitarbeiterportal"
  (make-buffer-focus :url "https://service1.edv.kfa-juelich.de/cgi-bin/Prod/InfoSystem/eMapor/eMapor.pl"))

(define-command duckSearch () "Search in the current buffer"
  (set-url :url "https://start.duckduckgo.com"))

(define-command slack () "Opens Slack"
  (make-buffer-focus :url "https://app.slack.com/client/T01D7M1B6HF/D07PC2AH2GH"))

(define-command whatsapp () "Opens whatsaApp"
  (make-buffer-focus :url "https://web.whatsapp.com/"))

(define-command wiki () "Opens my Wiki page"
   (preview-file :file "/home/ehsan/git/wiki.wiki/Home.html"))


(define-command youtube () "Opens Youtube"
  (make-buffer-focus :url "https://www.youtube.com"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
             "Commands for openning different web pages"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

