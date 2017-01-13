;;#!/usr/bin/env boot

(set-env! :dependencies '[[me.raynes/fs "1.4.6"]
                          [org.clojure/test.check "0.9.0"]])

(require '[me.raynes.fs :as fs])

(defn slashes [& args]
  (clojure.string/join "/" (remove nil? args)))

(def dotfiles-path (slashes (.toString (fs/home))
                            "code"
                            "dotfiles"))

(def tilde (assoc {}
                  :target-dir (.toString (fs/home))
                  :files [{:name ".spacemacs"}
                          {:name ".tmux.conf"}
                          {:name ".zshrc"}
                          {:name ".hyper.js"}
                          {:name ".ideavimrc"}
                          {:name ".atom/config.cson"}
                          {:name ".atom/styles.less"}]))

(def config (assoc {}
                   :target-dir (slashes (.toString (fs/home))
                                        ".config")
                   :files [{:name "init.vim"
                            :sub-path "nvim"}]))

(def usr-local-bin (assoc {}
                          :target-dir (slashes "/usr"
                                               "local"
                                               "bin")
                          :files [{:name "clj-new-script"}
                                  {:name "sbt-new.sc" :link-name "sbt-new"}
                                  {:name "sbt-new-script"}]))

(def compute-target-path nil)
(defmulti compute-target-path (fn [target-dir f] (into #{} (keys f))))
(defmethod compute-target-path #{:name} [target-dir f]
  (slashes target-dir
           (:name f)))
(defmethod compute-target-path #{:link-name :name} [target-dir f]
  (slashes target-dir
           (:link-name f)))
(defmethod compute-target-path #{:name :sub-path} [target-dir f]
  (slashes target-dir
           (:sub-path f)
           (:name f)))

(defn make-link-pair [target-dir file]
  (let [link-target-path (compute-target-path target-dir file)
        link-source-path (slashes dotfiles-path (:name file))]
    [link-source-path link-target-path]))

(defn make-executable! [{:keys [name]}]
  (fs/chmod "+x" (slashes dotfiles-path
                          name)))

(defn link! [[source target]]
  (try
    (fs/link source target)
    (catch java.nio.file.FileAlreadyExistsException e
      (str "Already exists: " source " -> " target))))

(defn do-linking! [batch]
  (let [link-pairs (do (map (partial make-link-pair (:target-dir batch))
                            (:files batch)))
        link-results (map link! link-pairs)]
    link-results))

(defn -main [& args]
  (let [link-results (mapcat do-linking!
                             [tilde config usr-local-bin])
        ;; only make /usr/local/bin files executable
        executable-results (map make-executable!
                                (:files usr-local-bin))]

    (doseq [result executable-results] (println result))
    (doseq [result link-results] (println result))))
