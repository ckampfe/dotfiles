(require 'boot.repl)

;; go here for more:
;; https://github.com/boot-clj/boot/wiki/Cider-REPL

(deftask cider "CIDER profile"
   []
   (require 'boot.repl)
   (swap! @(resolve 'boot.repl/*default-dependencies*)
          concat '[[org.clojure/tools.nrepl "0.2.13"]
                   [cider/cider-nrepl "0.15.1"]
                   [refactor-nrepl "2.4.0-SNAPSHOT"]])
   (swap! @(resolve 'boot.repl/*default-middleware*)
          concat '[cider.nrepl/cider-middleware
                   refactor-nrepl.middleware/wrap-refactor])
   identity)

(defn dep
  "a convenience function to add dependencies to the current repl session"
  [& dependencies]
  (set-env! :dependencies `[~@dependencies]))
