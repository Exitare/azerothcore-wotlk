-- DB update 2021_09_03_01 -> 2021_09_03_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_03_01 2021_09_03_02 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1630421521637477310'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1630421521637477310');

-- Adds movements for Quel`dorei Ghost
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `id` = 16325 AND `guid` IN (82177, 82178, 82180, 82183, 82184, 82185, 82186, 82187, 82189, 82190, 82193, 82198, 82200, 82205, 82208, 82241, 82254);

-- Adds movements for Quel`dorei Wraith
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `id` = 16326 AND `guid` IN (82175, 82179, 82181, 82182, 82188, 82191, 82194, 82195, 82196, 82197, 82199, 82207, 82210, 82253);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_09_03_02' WHERE sql_rev = '1630421521637477310';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;