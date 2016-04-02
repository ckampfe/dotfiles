#!/usr/bin/env boot

(set-env! :dependencies '[])
(require '[clojure.java.io :as io :only [file]])
(import '[java.time Instant ZoneOffset])

(def now (Instant/now))
(def log-location "/Users/clark/captains_log")

(defn date [timestamp]
  (-> timestamp
      (.atZone ZoneOffset/UTC)
      (.toLocalDate)
      (.toString)))

(defn log-entry [timestamp entry]
  (str "[" (.toString timestamp) "]" " :: " entry "\n"))

(defn update-log! [log-dir timestamp entry]
  (let [path (str log-dir "/" (.toString (date timestamp)))
        todays-log-file-exists? (if (.exists (io/file path)) true false)
        body `(spit ~path
                    ~(log-entry timestamp entry)
                    ~@(if todays-log-file-exists? (list :append true) nil))
        writer-fn (fn [] (eval body))]

    (writer-fn)))

(defn -main [& args]
  (if (not (first args))
    ((println "Usage: te \"message\"")
     (System/exit 0)))

  (let [entry (first args)]
    (update-log! log-location now entry)))
