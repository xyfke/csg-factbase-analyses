MATCH (:cVariable)-[vw:varWrite]->(:cVariable)
MATCH (:cVariable)-[pv:pubVar]->(:rosTopic)
WITH *, apoc.cfgPath.rosFindPaths(vw, {
    relSeq : "varWrite|parWrite|retWrite*",
    endE : pv,
    cfg : false,
    filter : "cVariable,cReturn",
    shortest : true,
    backward : true
}) As paths
UNWIND paths As path
RETURN DISTINCT path;