{:repl {:dependencies [[alembic "0.3.2"]]}
 ;; :dev {:dependencies []
 ;;       :source-paths ["env/dev"]    ;additional source path
 ;;       :main user/-main             ;which namespace and function to start in
       }
 :user {:plugins [[io.aviso/pretty "1.1"]       ;make stack traces pretty
                  [jonase/eastwood "0.9.9"]     ; more linting
                  [lein-ancient "1.0.0-RC3"]    ;show out of date dependencies
                  [lein-bikeshed "0.5.2"]       ; linting
                  [lein-cljfmt "0.8.0"]         ; code prettification
                  [lein-kibit "0.1.8"]          ; make code more idiomatic
                  [lein-pprint "1.3.2"]         ;pretty print lein dependencies
                  [lein-try "0.4.3"]            ;easy to try new libraries
                  [metosin/bat-test "0.4.4"]    ;test runner
                  [mvxcvi/whidbey "2.2.1"]      ;repl pretty-printing

                  ;; vinyasa tools for REPL-coding
                  ;; [im.chit/vinyasa.pull "0.2.0"]
                  [im.chit/vinyasa.inject "0.2.0"]
                  [im.chit/vinyasa.lein "0.2.0"]
                  [im.chit/vinyasa.reimport "0.2.0"]]
        :middleware [;; io.aviso.lein-pretty/inject   ;starts pretty during REPL start-up
                     whidbey.plugin/repl-pprint]
        :dependencies [[com.bhauman/rebel-readline "0.1.4"]     ;nice REPL
                       [expectations/clojure-test "1.2.1"]      ;library for testing
                       [expound "0.8.10"]                       ;improve error messages
                       [io.aviso/pretty "1.1"]                  ;formatting of exceptions
                       [mvxcvi/puget "1.3.1"]                   ;colour print data
                       [org.clojure/tools.namespace "1.1.0"]    ;reload
                       ]
        :injections [;colours for stack traces in the REPL
                     (require 'io.aviso.repl)]
        :aliases {"omni" ["do"
                          ["clean"]
                          ["with-profile" "production" "deps" ":tree"]
                          ["ancient"]
                          ["kibit"]
                          ["bikeshed"]]
                  "rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}}}
