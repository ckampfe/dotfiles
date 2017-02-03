(def project 'proto)
(def version "0.0.1")

(set-env! :source-paths   #{"dev" "src"}
          :dependencies   '[[org.clojure/clojure "1.9.0-alpha14"]
                            [org.clojure/tools.namespace "0.2.11"]
                            [org.clojure/test.check "0.9.0" :scope "dev"]
                            [proto-repl-charts "0.3.2"]
                            [proto-repl"0.3.1"]])

(deftask dev [])
