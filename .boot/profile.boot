;; go here for more:
;; https://github.com/boot-clj/boot/wiki/Cider-REPL

(deftask cider "CIDER profile"
   []
   (require 'boot.repl)
   (swap! @(resolve 'boot.repl/*default-dependencies*)
          concat '[[org.clojure/tools.nrepl "0.2.13"]
                   [cider/cider-nrepl "0.16.0"]
                   [refactor-nrepl "2.4.0-SNAPSHOT"]
                   [com.cemerick/piggieback "0.2.2"]
                   ])
   (swap! @(resolve 'boot.repl/*default-middleware*)
          concat '[cider.nrepl/cider-middleware
                   refactor-nrepl.middleware/wrap-refactor
                   cemerick.piggieback/wrap-cljs-repl
                   ])
   identity)

(defn dep
  "a convenience function to add dependencies to the current repl session"
  [& dependencies]
  (set-env! :dependencies `[~@dependencies]))
