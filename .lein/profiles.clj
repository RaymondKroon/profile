{:user {:plugins [[cider/cider-nrepl "0.8.1"]
                  ]
        :dependencies [[raymond/debug-tools "0.1.4"]
                       [spyscope "0.1.5"]
                       [leiningen #=(leiningen.core.main/leiningen-version)]
                       [org.clojure/tools.namespace "0.2.8"]
                       [io.aviso/pretty "0.1.14"]
                       [im.chit/vinyasa "0.3.0"]]
        :signing {:gpg-key "raymond@clojars"}
        :injections
   [(require 'spyscope.core)
    (require '[vinyasa.inject :as inject])
    (require 'io.aviso.repl)
    (inject/in ;; the default injected namespace is `.`

     [debug-tools.core :refer [break]]

     ;; note that `:refer, :all and :exclude can be used
     [vinyasa.inject :refer [inject [in inject-in]]]
     [vinyasa.lein :exclude [*project*]]

     ;; imports all functions in vinyasa.pull
     [vinyasa.pull :all]

     ;; inject into clojure.core
     clojure.core
     [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

     ;; inject into clojure.core with prefix
     clojure.core >
     [clojure.pprint pprint]
     [clojure.java.shell sh])]}}
