-- DB update 2024_11_13_00 -> 2024_11_13_01
--
UPDATE `gameobject` SET `id` = 180396 WHERE `guid` IN (151423, 151424, 151425, 151426, 151427, 151428, 151429, 151430, 151431, 151432, 151433) AND `id` = 180398;

UPDATE `gameobject` SET `id` = 180398 WHERE `guid` IN (151434, 151435, 151436, 151437, 151438, 151439, 151440, 151441, 151442, 151443, 151444, 151445) AND `id` = 180396;
