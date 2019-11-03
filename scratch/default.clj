
(comment

  (require '[aleph.http :as http]
           '[byte-streams :as bs]
           '[cheshire.core :as json]
           '[clojure.java.io :as io]
           '[clojure.java.jdbc :as jdbc]
           '[clojure.spec-alpha2 :as s]
           '[datascript.core :as d]
           '[instaparse.core :as insta]
           '[loom.graph :as g]
           '[loom.io :as lio]
           )


  (def sqlite-db {:classname   "org.sqlite.JDBC"
                  :subprotocol "sqlite"
                  :subname     "a.db"})

  (def pg-db {:dbtype     "postgresql"
              :dbname     "mypgdatabase"
              :host       "mydb.server.com"
              :user       "myuser"
              :password   "secret"
              :ssl        true
              :sslfactory "org.postgresql.ssl.NonValidatingFactory"})


  )
