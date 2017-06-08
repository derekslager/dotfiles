{:user {:plugins [[acyclic/squiggly-clojure "0.1.8" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.2.4" :exclusions [org.clojure/clojure]]
                  [lein-ancient "0.6.10"]
                  [lein-monolith "1.0.1"]
                  [lein-pprint "1.1.2"]
                  [lein-try "0.4.3"]]}
 :my/repl ^:repl {:plugins [[cider/cider-nrepl "0.14.0"]
                            [refactor-nrepl "2.2.0"]]}}
