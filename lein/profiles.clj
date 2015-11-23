{:user {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  [refactor-nrepl "1.2.0-SNAPSHOT"]
                  [lein-ancient "0.6.8"]
                  [jonase/eastwood "0.2.1"]
                  [lein-kibit "0.1.2"]
                  [lein-pprint "1.1.1"]
                  [lein-bikeshed "0.2.0"]]
        :dependencies [[leiningen #=(leiningen.core.main/leiningen-version)]
                       [alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [difform "1.1.2"]
                       [im.chit/vinyasa "0.4.2"]
                       [org.clojars.gjahad/debug-repl "0.3.3"]]
        :injections [(require 'com.georgejahad.difform)
                     (require 'alex-and-georges.debug-repl)
                     (require '[vinyasa.inject :as inject])
                     (inject/in
                      ;; note that `:refer, :all and :exclude can be used
                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.lein :exclude [*project*]]

                      ;; imports all functions in vinyasa.pull
                      [alembic.still [distill pull]]

                      clojure.core
                      [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                      clojure.core >
                      ;; [clojure.java.io :as io]
                      ;; [clojure.set :as set]
                      ;; [clojure.string :as str]
                      ;; [clojure.test :as test]
                      ;; [clojure.repl :refer [apropos dir doc find-doc pst source]]
                      [clojure.java.javadoc :refer [javadoc]]
                      [clojure.reflect :refer [reflect]]
                      [clojure.pprint pprint]
                      [clojure.java.shell sh]
                      [com.georgejahad.difform difform]
                      [alex-and-georges.debug-repl debug-repl])]
        :aliases {"omni" ["do"
                          ["clean"]
                          ["with-profile" "production" "deps" ":tree"]
                          ["ancient"]
                          ["kibit"]
                          ["bikeshed"]]}}}
