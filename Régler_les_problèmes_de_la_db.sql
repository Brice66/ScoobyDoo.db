UPDATE R0_
set monsterType = 'Ancient|Ghost|Extraterrestrial|Animal|Disguised|Ghost|Possessed Object|Magician|Magician|Ghost|Undead|Possessed Object'
where title like 'One Minuite Mysteries!';

//2
UPDATE R0_
SET monsterSpecies = 'Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human'
WHERE title like 'The Many Faces of Evil';

//3
UPDATE R0_ 
SET monsterName = 'Mamba Wamba|Zombie Lila|Mamba Zombie'
WHERE title like 'Mamba Wamba and the Voodoo Hoodoo';

//4
UPDATE R0_
SET runTime=22 
WHERE trim(title) ='A Bungle in the Jungle';

//5
UPDATE R0_
SET settingCountryOrState = 'Kentucky'
WHERE title like 'Gold Paw';
//6
UPDATE R0_
SET runTime = 24, dateAired = '20/08/91'
WHERE title like 'Catcher on the Sly';
//7
UPDATE R0_
SET monsterName ='Bogel|Weerd|Captain Ghost|Ghosts on the Ship|Tornado'
WHERE title like 'Ship of Ghouls';

//8
UPDATE R0_
SET monsterName ='Bogel|Weerd|Captain Ghost|Ghosts on the Ship|Tornado Demon'
WHERE title like 'Ship of Ghouls';

//9
UPDATE R0_
SET monsterSpecies = 'Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human'
WHERE title like 'Zoinksman';

// 10
SELECT monsterName, monsterSpecies FROM R0_
UPDATE R0_
SET monsterName = 'Count Dracula|Wolfgong|Frankenstein|Repulsa|Witch Sisters|Witch Sisters|Mummy|Bonejangles|Swamp Thing|Vanna Pira|YDinconnu1|YDinconnu2|Werewolf Shaggy|Dr. Jackyll|Dragonfly|Webman|Schlockness Monster|Genghis Kong|Man-Eating Plant'
WHERE title like 'Scooby-Doo! and the Reluctant Werewolf';

//11
UPDATE R0_
SET monsterGender = 'Female|Male'
WHERE title like 'The Ozrk Witch';

//12
UPDATE R0_
SET monsterSubtype = 'Witch|NULL'
WHERE title like 'Scared a Lot in Camelot';

//13
UPDATE R0_
SET monsterGender ='Male|Male|Male|Male|Male|Male|Male|Male|Male|Male', monsterType = 'Super-Villain|Disguised|Disugised|Disguised|Super-Villain|Super-Villain|Super-Villain|Super-Villain|Animal|Animal', monsterSubtype = 'Doctor|Agent|Agent|Agent|Nerd|Nerd|Doctor|Wrestler|Bull|Giant',monsterSpecies ='Human|Human|Human|Human|Human|Human|Human|Human|Bull|Rooster'
WHERE title like 'Scooby Dudes'

//14
UPDATE R0_
SET monsterName ='Dr. Phineus Phibes|Agent 1|Agent 2|Agent 3|Agent 4|Agent 5|Agent 6|Agent 7|Agent8|Agent9|Agent 10|Agent 11|Agent 12|Agent 13|Dr. Trebal', monsterSpecies ='Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human'
WHERE title like 'Shags to Riches';

//15
UPDATE R0_
SET runTime = 22
WHERE title like 'Alaskan King Coward';

//16
UPDATE R0_
SET monsterName ='Super-Villain|Disguised|Disguised|Disguised|Super-Villain|Super-Villain|Super-Villain|Super-Villain'
WHERE title like 'Almost Purr-fect';

//17
UPDATE R0_
SET monsterName = 'Dr. Phineus Phibes|Agent 3|Agent 4|Agent 5|Agent 6|Agent 7|Agent9|Agent 10|Agent 11|Agent 12|Agent 13|Dr. Trebal|Misty Swiss', monsterSpecies ='Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human|Human', monsterGender= 'Male|Male|Male|Male|Male|Male|Male|Male|Male|Male|Male|Male|Female'
WHERE title like 'More Fondue for Scooby-Doo';

//18 Changer les string en date
UPDATE R0_
SET dateAired = CONVERT(DATE, dateAired, 103);

UPDATE R0_
SET dateAired = '1991-08-10'
where title = 'Catcher on the Sly'
