{:user {:plugins []
        :dependencies []
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
