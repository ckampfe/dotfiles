#!/usr/bin/env boot

(boot.core/set-env! :dependencies '[[me.raynes/fs "1.4.6"]])

(require '[me.raynes.fs :as fs])

(def dotfiles-path (str (fs/home) "/code/dotfiles"))

(defn load-config [conf-path]
  (->> conf-path
       slurp
       clojure.edn/read-string))

(defn make-executable! [path] (fs/chmod "+x" path))

(defn link! [path target]
  (try
    (fs/sym-link path target)
    (catch java.nio.file.FileAlreadyExistsException e
      (str "Already exists: " path " -> " target))))

(defn -main [& args]
  (let [config (load-config (str dotfiles-path "/bootstrap.edn"))]
    (doall
      (for [grouping config
            input-file (:files grouping)
            :let [out-fn (eval (:out-fn grouping))
                  source-path (str dotfiles-path "/" (:source input-file))
                  target-path (out-fn input-file)
                  make-executable? (:+x input-file)]]
        (do
          (println (link! target-path source-path))
          (when make-executable?
            (println (make-executable! source-path))))))))
