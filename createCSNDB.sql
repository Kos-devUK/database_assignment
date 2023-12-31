CREATE DATABASE csndb;

USE csndb;

CREATE TABLE Article (
  `ID` SMALLINT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(50) NOT NULL,
  `Text` MEDIUMTEXT NOT NULL,
  `PublishStatus` BOOLEAN NOT NULL DEFAULT '0',
  `Topic` VARCHAR(30),
  `Author` VARCHAR(20) NOT NULL,
  `PublicationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

CREATE TABLE Topic (
  `Name` VARCHAR(30) NOT NULL,
  `Description` VARCHAR(200),
  PRIMARY KEY (`Name`)
);

CREATE TABLE Author (
  `Username` VARCHAR(20) NOT NULL,
  `DisplayName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Username`)
);

CREATE TABLE Course (
  `ShortName` VARCHAR(20) NOT NULL,
  `FullName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ShortName`)
);

CREATE TABLE Relevant_For (
  `ArticleID` SMALLINT NOT NULL,
  `Course` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ArticleID`,`Course`)
);

