USE Project0506_07

CREATE TABLE [UMDAlumni.Location](
	locCode CHAR(4) NOT NULL,
	locDescription VARCHAR(35),
	CONSTRAINT pk_Location_locCode PRIMARY KEY (locCode)
)

CREATE TABLE [UMDAlumni.Group](
    grpId CHAR(3) NOT NULL,
	grpCode VARCHAR(4) NOT NULL,
	grpPurpose VARCHAR (20), 
	grpAudience VARCHAR(20),
	CONSTRAINT pk_Group_grpId PRIMARY KEY (grpId)
)

CREATE TABLE [UMDAlumni.Activity] (
    actId CHAR(4) NOT NULL,
	actCode CHAR(5) NOT NULL,
	actDescription VARCHAR(50), 
	actEventName VARCHAR(90),
	CONSTRAINT pk_Activity_actId PRIMARY KEY (actId)
)

CREATE TABLE [UMDAlumni.FiscalYear](
	fyrEventDate DATE NOT NULL,
	fyrCode	CHAR(7) NOT NULL,
	CONSTRAINT pk_FiscalYear_fyrEventDate PRIMARY KEY (fyrEventDate)
)

CREATE TABLE [UMDAlumni.Occurrence](
	actId CHAR(4) NOT NULL,
	locCode CHAR(4) NOT NULL,
	grpId CHAR(3) NOT NULL,
	fyrEventDate DATE NOT NULL,
	participated INT, 
	averageAge INT,
	firstTimeAttendees INT, 
	majorProspect INT,      
	CONSTRAINT pk_Occur_actId_locCode_grpId_fyrEventDate PRIMARY KEY (actId, locCode, grpId, fyrEventDate),
	CONSTRAINT fk_Occur_actId FOREIGN KEY (actId)
		REFERENCES [UMDAlumni.Activity] (actId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Occur_fyrEventDate FOREIGN KEY (fyrEventDate)
		REFERENCES [UMDAlumni.FiscalYear] (fyrEventDate)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Occur_locCode FOREIGN KEY (locCode)
		REFERENCES [UMDAlumni.Location] (locCode)
		ON DELETE NO ACTION ON UPDATE CASCADE,
   CONSTRAINT fk_Occur_grpId FOREIGN KEY (grpId)
		REFERENCES [UMDAlumni.Group] (grpId)
		ON DELETE CASCADE ON UPDATE CASCADE
)

