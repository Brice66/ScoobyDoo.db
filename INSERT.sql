INSERT INTO R0_monstre(épi,name,gender,type,subtype,species)
select épi, name, gender, type, subtype, species
FROM DBA.monsterSplit();

INSERT INTO tbTitle (titleName)
SELECT DISTINCT title FROM R0;

INSERT INTO tbCountryOrState (countryOrStateName)
SELECT DISTINCT settingCountryOrState FROM R0_;

INSERT INTO tbMName (monsterName)
SELECT DISTINCT "name" FROM R0_monstre;

INSERT INTO tbMSubtype (monsterSubtype)
SELECT DISTINCT subtype FROM R0_monstre;

INSERT INTO tbMSpecies (monsterSpecies)
SELECT DISTINCT species FROM R0_monstre;

INSERT INTO tbMType (monsterType)
SELECT DISTINCT "type" FROM R0_monstre;
--
INSERT INTO tbMGender(monsterGender)
SELECT distinct gender FROM R0_monstre;

INSERT INTO tbFormat (formatName)
SELECT DISTINCT format FROM R0_;

INSERT INTO tbNetwork (networkName)
SELECT DISTINCT network FROM R0_;

INSERT INTO tbTerrain (terrainName)
SELECT DISTINCT settingTerrain FROM R0_;

INSERT INTO tbActor (actorName)
SELECT DISTINCT fredVa AS actorName
FROM R0_
UNION
SELECT DISTINCT daphnieVa AS actorName
FROM R0_
UNION
SELECT DISTINCT velmaVa AS actorName
FROM R0_
UNION
SELECT DISTINCT shaggyVa AS actorName
FROM R0_
UNION
SELECT DISTINCT scoobyVa AS actorName
FROM R0_;

INSERT INTO tbCharacter (characterName)
SELECT DISTINCT 'Fred'
UNION
SELECT DISTINCT 'Daphnie'
UNION
SELECT DISTINCT 'Velma'
UNION
SELECT DISTINCT 'Shaggy'
UNION
SELECT DISTINCT 'Scooby';
--

INSERT INTO tbSerie(seriesName)
SELECT DISTINCT seriesName FROM R0_;
INSERT INTO tbSeason(seasonName)
SELECT DISTINCT season FROM R0_;

-- table complexe

INSERT INTO tbMonster(monsterNameID,monsterGenderID,monsterTypeID, monsterSubtypeID,monsterSpeciesID)
Select Distinct N.monsterNameID, G.monsterGenderID,T.monsterTypeID, Su.monsterSubtypeID, S.monsterSpeciesID
FROM R0_monstre as R
join tbMGender AS G ON G.monsterGender = R.gender
JOIn tbMName as N ON N.monsterName=R.name
join tbMSpecies AS S ON S.monsterSpecies = R.species
join tbMSubtype AS Su ON Su.monsterSubtype=R.subtype
JOIN tbMType AS T ON T.monsterType=R.type;
--Select Distinct N.monsterNameID, N.monsterName, G.monsterGenderID,G.monsterGender,T.monsterTypeID,T.monsterType, Su.monsterSubtypeID,Su.monsterSubtype, S.monsterSpeciesID, S.monsterSpecies
--FROM R0_monstre as R
--join tbMGender AS G ON G.monsterGender = R.gender
--JOIn tbMName as N ON N.monsterName=R.name
--join tbMSpecies AS S ON S.monsterSpecies = R.species
--join tbMSubtype AS Su ON Su.monsterSubtype=R.subtype
--JOIN tbMType AS T ON T.monsterType=R.type

INSERT INTO DBA.tbEpisode(seriesID,dateAired,runTime,formatID,seasonID,networkID,TerrainID,CountryOrStateID,titleID)
SELECT distinct S.seriesID, R.dateAired, R.runTime, F.formatID,Se.seasonID,N.networkID,T.terrainID,C.CountryOrStateID,Ti.titleID
FROM DBA.R0_ as R
join tbSerie AS S ON S.seriesName = R.seriesName
JOIN tbTitle as Ti ON Ti.titleName = R.title
JOIN tbFormat as F ON F.formatName = R.format
JOIN tbSeason as Se ON SE.seasonName = R.season
JOIN tbNetwork as N on N.networkName = R.network
JOIN tbTerrain as T on T.terrainName = R.settingTerrain
JOIN tbCountryOrState as C on c.countryOrStateName=R.settingCountryOrState;

--épi-monster
INSERT INTO dba.tbEpisode_Monster(episodeID,monsterID)
SELECT distinct E.episodeID,M.monsterID
FROM R0_ as R
JOIN tbTitle as T ON T.titleName = R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired
JOIN dba.monsterSplit() as MS ON MS.épi like string('%'+R.dateAired+'%')
JOIN tbMName as N ON N.monsterName = MS.name
Join tbMonster as M ON M.monsterNameID = N.monsterNameID;


---- verif
--SELECT E.episodeID, T.titleName, M.monsterID, N.monsterName
--FROM DBA.tbEpisode as E
--JOIN DBA.tbepisode_monster as EM
--JOIN DBA.tbTitle as T
--JOIN DBA.tbMonster as M
--JOIN DBA.tbMName as N
--ORDER BY T.titleName

----Tout roule (normalement)
----Plus que le casting :/

---- idée je vais insèrer un perso à la fois
--SELECT distinct R.fredVa
--FROM R0_ AS R
--JOIN tbActor as A ON A.actorName = R.fredVa
--JOIN tbTitle as T ON T.titleName=R.title
--JOIN DBA.tbEpisode

----INSERT INTO tbCasting(episodeId,characterId,actorId)
--SELECT distinct E.episodeID,1 as characterId, A.actorID, A.actorName
--FROM R0_ AS R
--JOIN tbActor as A ON A.actorName = R.fredVa
--JOIN tbTitle as T ON T.titleName=R.title
--JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
--ORDER BY E.episodeID;


INSERT INTO tbCasting(episodeId,characterId,actorId)
SELECT distinct E.episodeID,1 as characterId, A.actorID
FROM R0_ AS R
JOIN tbActor as A ON A.actorName = R.fredVa
JOIN tbTitle as T ON T.titleName=R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
ORDER BY E.episodeID;

INSERT INTO tbCasting(episodeId,characterId,actorId)
SELECT distinct E.episodeID,2 as characterId, A.actorID
FROM R0_ AS R
JOIN tbActor as A ON A.actorName = R.scoobyVa
JOIN tbTitle as T ON T.titleName=R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
ORDER BY E.episodeID;

INSERT INTO tbCasting(episodeId,characterId,actorId)
SELECT distinct E.episodeID,3 as characterId, A.actorID
FROM R0_ AS R
JOIN tbActor as A ON A.actorName = R.shaggyVa
JOIN tbTitle as T ON T.titleName=R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
ORDER BY E.episodeID;

INSERT INTO tbCasting(episodeId,characterId,actorId)
SELECT distinct E.episodeID,4 as characterId, A.actorID
FROM R0_ AS R
JOIN tbActor as A ON A.actorName = R.velmaVa
JOIN tbTitle as T ON T.titleName=R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
ORDER BY E.episodeID;

INSERT INTO tbCasting(episodeId,characterId,actorId)
SELECT distinct E.episodeID,5 as characterId, A.actorID
FROM R0_ AS R
JOIN tbActor as A ON A.actorName = R.daphnieVa
JOIN tbTitle as T ON T.titleName=R.title
JOIN DBA.tbEpisode as E ON E.dateAired = R.dateAired AND E.titleID = T.titleID
ORDER BY E.episodeID;



------TEST FINAL------
/*SELECT distinct Ser.seriesName, N.networkName, Sea.seasonName,Ti.titleName, dateAired,runTime,F.formatName
FROM DBA.tbEpisode
JOIN tbTitle as Ti
JOIN tbFormat AS F
JOIN tbNetwork AS N
JOIN tbTerrain AS Te
JOIN tbSeason as Sea
JOIN tbSerie as Ser 
JOIN tbCountryOrState as COS
JOIN tbEpisode_Monster as EM
JOIN tbMonster as MO
JOIN tbMGender as MG
JOIN tbMName as MN
JOIN tbMSpecies as MS
JOIn tbMSubtype as MSU
JOIN tbMType as MT
JOIN tbCasting as C
JOIN tbActor as Ac
JOIN tbCharacter as Ch*/

-- correspond à la R0_
---- Si on enlève le distinct il y a plein de ligne ??? c'est normal !!! car les monstres ne sont plus regroupée ensemble, si un épisode possède 4 monstres il y aura 4 lignes du même épisode (avec le monstre différent.)



