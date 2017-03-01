(require 'boot.repl)

(swap! boot.repl/*default-dependencies* concat
       '[[refactor-nrepl "2.3.0-SNAPSHOT"]
         [cider/cider-nrepl "0.15.0-SNAPSHOT"]])

(swap! boot.repl/*default-middleware* concat
       ['cider.nrepl/cider-middleware
        'refactor-nrepl.middleware/wrap-refactor
        'cider.nrepl.middleware.apropos/wrap-apropos
        'cider.nrepl.middleware.version/wrap-version])

(defn dep
  "a convenience function to add dependencies to the current repl session"
  [& dependencies]
  (set-env! :dependencies `[~@dependencies]))
