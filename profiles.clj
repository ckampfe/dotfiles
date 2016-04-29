{:repl {:dependencies [[org.clojure/tools.nrepl "0.2.12"]]}
 :user {:plugins [[cider/cider-nrepl "0.12.0"]
                  [org.clojure/tools.nrepl "0.2.12"]
                  [refactor-nrepl "2.2.0"]
                  [lein-exec "0.3.6"]
                  ]
        :dependencies [[org.clojure/clojure "1.8.0"]]
        :dev {:dependencies [[org.clojure/tools.nrepl "0.2.12"]] }
        :mirrors {#"clojars" {:name "clojars mirror"
                              :url "https://clojars-mirror.tcrawley.org/repo/"}}}}
