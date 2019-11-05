-- 1 Quantitat de registres de la taula de vols:
SELECT COUNT(flightID) FROM flights;
-- 2 Retard promig de sortida i arribada segons l’aeroport origen.
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM flights
GROUP BY Origin;
-- 3 Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
SELECT Origin, colYear, colMonth, AVG(ArrDelay) FROM flights
GROUP BY  DayOfMonths, ArrTime -- origin, colYear, colMonth 
ORDER BY Origin, colYear, colMonth;
-- 4 Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
SELECT City, colYear, colMonth, AVG(ArrDelay) FROM flights
INNER JOIN usairports ON Origin = IATA
GROUP BY ArrTime, DayOfMonths
ORDER BY City, colYear,colMonth;
SELECT * FROM usairports;
SELECT * FROM flights;
SELECT * FROM carriers;
-- 5 Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres.
SELECT UniqueCarrier, colYear, colMonth, AVG((ArrDelay)), SUM(cancelled) AS total_cancelled
FROM flights
GROUP BY UniqueCarrier, colYear,colMonth
ORDER BY total_cancelled DESC;
SELECT * FROM flights;
-- 6 L’identificador dels 10 avions que més distància han recorregut fent vols.
SELECT TailNum, SUM(Distance) AS total_distance FROM flights
GROUP BY TailNum
ORDER BY total_distance DESC
-- Es limita a 11 perque el primer valor no correspon a cap avio
LIMIT 11;

-- 7 Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 minuts.
SELECT UniqueCarrier, AVG(ArrDelay) AS avgDelay
FROM flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) >10
ORDER BY avgDelay DESC;

