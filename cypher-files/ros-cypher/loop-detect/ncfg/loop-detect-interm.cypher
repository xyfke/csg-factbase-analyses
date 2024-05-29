MATCH (:rosTopic)-[pt:pubTarget]->(:cVariable)
MATCH (b:cVariable)-[pv:pubVar]->(:rosTopic)
WITH *, apoc.cfgPath.rosFindPaths(pt, {
    relSeq : "varWrite|parWrite|retWrite*",
    endE : pv,
    shortest : true,
    cfg : false,
    filter : "cVariable,cReturn"
}) As paths
UNWIND paths As path
RETURN DISTINCT path;