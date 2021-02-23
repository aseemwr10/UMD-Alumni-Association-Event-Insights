USE Project0506_07

--What are the top five locations with the highest number of First Time Attendees?
SELECT TOP(5) l.locCode, l.locDescription, SUM(o.firstTimeAttendees) AS 'Highest number of First time attendees' 
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Location] l
WHERE o.locCode = l.locCode
GROUP BY l.locCode, l.locDescription
ORDER BY SUM(o.firstTimeAttendees) desc

--What are the top five locations with the highest number of Major Prospects?
SELECT TOP(5) l.locCode, l.locDescription, SUM(o.majorProspect) AS 'Highest number of Major Prospects' 
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Location] l
WHERE o.locCode = l.locCode
GROUP BY  l.locCode, l.locDescription
ORDER BY SUM(o.majorProspect) desc

--Which 5 Group Purposes attract the maximum number of First Time Attendees ?
SELECT TOP(5) g.grpPurpose, SUM(o.firstTimeAttendees) AS 'Highest number of First time attendees' 
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Group] g
WHERE o.grpId = g.grpId
GROUP BY g.grpPurpose
ORDER BY SUM(o.firstTimeAttendees) desc

--Which 5 Group Purposes attract the maximum number of Major Prospects ?
SELECT TOP(5) g.grpPurpose, SUM(o.majorProspect) AS 'Highest number of Major Prospects'  
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Group] g
WHERE o.grpId = g.grpId
GROUP BY g.grpPurpose
ORDER BY SUM(o.majorProspect) desc

--Which 5 Group Audiences attract the maximum number of First Time Attendees ?
SELECT TOP(5) g.grpAudience, SUM(o.firstTimeAttendees) AS 'Highest number of First time attendees' 
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Group] g
WHERE o.grpId = g.grpId
GROUP BY g.grpAudience
ORDER BY SUM(o.firstTimeAttendees) desc

--Which 5 Group Audiences attract the maximum number of Major Prospects ?
SELECT TOP(5) g.grpAudience, SUM(o.majorProspect) AS 'Highest number of Major Prospects'  
FROM [UMDAlumni.Occurrence] o, [UMDAlumni.Group] g
WHERE o.grpId = g.grpId
GROUP BY g.grpAudience
ORDER BY SUM(o.majorProspect) desc

--How does the average age of participants in events co-relate with number of First Time Attendees ?
SELECT floor(o.averageAge/5.00)*5 as bucket_floor, floor(o.averageAge/5.00)*5 + 5 as bucket_ceiling, SUM(o.firstTimeAttendees) as 'Number of First Time Attendess'
FROM [UMDAlumni.Occurrence] o
GROUP BY  floor(o.averageAge/5.00)*5, floor(o.averageAge/5.00)*5 + 5
HAVING floor(o.averageAge/5.00)*5 IS NOT NULL AND
	   floor(o.averageAge/5.00)*5 + 5 IS NOT NULL AND
	   SUM(o.firstTimeAttendees) != 0
ORDER BY SUM(o.firstTimeAttendees) DESC

--How does the average age of participants in events co-relate with number of Major Prospects.
SELECT floor(ad.averageAge/5.00)*5 as bucket_floor, floor(ad.averageAge/5.00)*5 + 5 as bucket_ceiling, SUM(ad.majorProspect) as 'Number of Major Prospects'
FROM [UMDAlumni.Occurrence] ad
GROUP BY  floor(ad.averageAge/5.00)*5, floor(ad.averageAge/5.00)*5 + 5
HAVING floor(ad.averageAge/5.00)*5 IS NOT NULL AND
	   floor(ad.averageAge/5.00)*5 + 5 IS NOT NULL AND
	   SUM(ad.majorProspect) != 0
ORDER BY SUM(ad.majorProspect) DESC

--How does the number of First Time Attendees change with time ?
SELECT DATENAME(month, o.fyrEventDate) AS 'Month Name' , AVG(o.firstTimeAttendees) as 'Number of First Time Attendess'
FROM [UMDAlumni.Occurrence] o
GROUP BY  DATENAME(month, o.fyrEventDate) 


--How does the number of Major Prospects change with time ?
SELECT  DATENAME(month, o.fyrEventDate) AS 'Month Name' , AVG(o.majorProspect) as 'Number of Major Prospects'
FROM [UMDAlumni.Occurrence] o
GROUP BY  DATENAME(month, o.fyrEventDate) 


