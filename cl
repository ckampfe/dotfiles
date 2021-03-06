#!/usr/bin/env boot

(set-env! :dependencies '[])
(require '[clojure.java.io :as io :only [file]])
(import '[java.time Instant ZoneOffset])

(def now (Instant/now))
(def log-location "/Users/clark/captains_log")

(defn timestamp->date [timestamp]
  (-> timestamp
      (.atZone ZoneOffset/UTC)
      (.toLocalDate)
      (.toString)))

(defn log-entry [timestamp entry]
  (str "[" (.toString timestamp) "]" " :: " entry "\n"))

(defn update-log! [log-dir timestamp entry]
  (let [path (str log-dir "/" (timestamp->date timestamp))
        todays-log-file-exists? (.exists (io/file path))
        body `(spit ~path
                    ~(log-entry timestamp entry)
                    ~@(if todays-log-file-exists? (list :append true) nil))
        writer-fn (fn [] (eval body))]

    (writer-fn)))

(defn -main [& args]
  (if (not (first args))
    ((println "Usage: cl \"message\"")
     (System/exit 0)))

  (let [entry (first args)]
    (update-log! log-location now entry)))
