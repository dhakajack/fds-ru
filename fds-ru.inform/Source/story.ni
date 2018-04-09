"FDS-RU" by Jack Welch

The story headline is "Рыцарь без мозга и упрека".
The story genre is "horror".
The release number is 1.
The story creation year is 2018.
The story description is "The one thing you don't miss is memory."

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.

Use MAX_STATIC_DATA of 250000.

Use full-length room descriptions.
Use no scoring.

Release along with the "Vorple" interpreter.
Release along with style sheet "fds-ru.css".

Release along with cover art, a file of "Blurb" called "blurb.txt" and a file of "Solution" called "walkthrough.txt".

[********]
debugMode is a truth state that varies. debugMode is FALSE.
[*******]

forceScroll is a truth state that varies. forceScroll is TRUE.

Chapter 1 - Override Vorple

[To get around escaping of characters so I can use escaped unicode to render accented characters and symbols]

To display text (content - text) in all the/-- elements called (classes - text):
	execute JavaScript command "$('.[classes]').text('[content]')".

Chapter 2 - Block Dialogue

BlockChatterFlag is a truth state that varies. BlockChatterFlag is false.

Chapter 3 - Player

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false. The player has a number called conversations. The conversations of the player is 0. The player has a number called timesLapped. The timesLapped of the player is 0.

[Level					after eating….
0					nothing
1					a mouse
2					a dog
3					a slice of guard brain
4					the scientist's brain
]

The player has a number called knownCommands. The knownCommands of the player is 0.

[Niveau					Action
1					East
2					West
3					Eating
4					Opening
5					North
6					South
7					Push Button
8					Unlock
9					Talk
10					Repair]

Chapter 4 - Exit Lister

To listExits:
	clear all elements called "arrows";
	display text "[exitList]" in the element called "arrows".


To say exitList:
	let L be {west, north, south, east};
	repeat with way running through L:
		if the room the way from the location is not nothing:
			let D be the door the way from the location;
			if D is nothing or D is open or (D is simpleOpenable and the consciousness of the player is greater than 0) or (D is buttoned and the consciousness of the player is greater than one) or (D is locked and the consciousness of the player is greater than two):
				if the way is:
					-- west:
						say "\u2190 ";
					-- north:
						say "\u2191  ";
					-- south:
						say "\u2193 ";
					-- east:
						say "\u2192 ".
						
To listHiddenExits:
	place an inline element called "hidden" reading "Возможные выходы: [hiddenExitList]. "
	
To say hiddenExitList:
	let L be {west, north, south, east};
	let LL be a list of text;
	repeat with way running through L:
		if the room the way from the location is not nothing:
			let D be the door the way from the location;
			if D is nothing or D is open or (D is simpleOpenable and the consciousness of the player is greater than 0) or (D is buttoned and the consciousness of the player is greater than one) or (D is locked and the consciousness of the player is greater than two):
				if the way is:
					-- west:
						add "на запад" to LL;
					-- north:
						add "на север" to LL;
					-- south:
						add "на юг" to LL;
					-- east:
						add "на восток" to LL;
	let N be the number of entries in LL;
	repeat with X running from 1 to N:
		if (N is greater than 1 and X is N):
			say " и";
		say entry X of LL;
		if (N is greater than 2 and X is less than N):
			say ",".

Chapter 5 -Langauge-specific tweaks

Rule for printing the banner text: 
	place an inline element called "titre" reading "На Страже";
	say line break;
	say story headline;
	say paragraph break;
	say "Оригинальная история [unicode 8212] Джек Уэлч[line break]";
	say "Русский перевод [unicode 8212] Валентин Коптелцев[line break]";
	say "Релиз [release number] / Серийный Номер 180225 / Inform 7 build 6M62 (I6/v6.33 lib 6/12N)[line break]".
	
Rule for listing nondescript items:
	let L be a list of things;
	say "Ты видишь здесь ";
	repeat with item running through things in the location:
		if the item is a person or the item is a door:
			next;
		add item to L;
	repeat with N running from 1 to the number of entries in L:
		if N is greater than 1 and N is the number of entries in L:
			say " и ";
		let E be entry N of L;
		say "[E]";
		if E is open and E contains exactly one thing:
			say " (в которой находится [random thing in E])";
		if the number of entries in L is greater than 2 and N is less than (the number of entries in L minus 1):
			say ", ";
	say "."
	
Rule for implicitly taking something (called the target):
	try silently taking the target;
	say "(сначала ты берешь [target])[command clarification break]".

The can't go that way rule response (A) is "Этим путем не пройти."


Chapter 6 - Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.

Chapter 7 - Button Setup

Table of Palette
Palette-EN	Palette-RU
"black"	"черный"
"brown"	"коричневый"
"red"	"красный"
"orange"	"оранжевый"
"yellow"	"желтый"
"green"	"зеленый"
"blue"	"синий"
"violet"	"фиолетовый"
"gray"	"серый"
"white"	"белый"
	
Chapter 8 - Start of Play

When play begins:
	execute JavaScript command "function forceScroll() {if((navigator.userAgent.indexOf('Opera') || navigator.userAgent.indexOf('OPR') || navigator.userAgent.indexOf('Chrome')) != -1 ) {return false;} else {return true;}} forceScroll()";
	if the JavaScript command returned false:
		now forceScroll is false;
	if debugMode is false:
		hide the prompt;
	place a block level element called "arrows";
	sort the Table of Palette in random order.

After printing the banner text:
	listExits;
	listHiddenExits;
	tell bannerText;
	increment the knownCommands of the player.
	
The list of text called bannerText is always {
"[line break][italic type]Где я? И вообще, кто я?[roman type][paragraph break]Ты просыпаешься в одиночестве в пустой синеватой комнате.[paragraph break]","[italic type]Почему я не могу ничего вспомнить?[paragraph break]Мне надо сконцентрироваться! Что случилось? Давай, думай! Думай же![paragraph break]Как бы то ни было, здесь я ответов не найду -- мне придется осмотреть окрестности.[roman type][line break]"
}
	
[max 217 unicode characters between quotes due to expansion of intermediates during compliation как жал]

To tell ( blahblah - a list of text):
	repeat with phrase running through blahblah:
		say "[phrase]".

Chapter 9 - Geography

Section Location Generalities

Doors are usually closed. Doors are usually not locked.

Section Doors

A thing can be buttoned. Things are usually not buttoned.
A thing can be broken. Things are usually not broken.

Instead of going through a closed door (called la porte):
	if the consciousness of the player is less than 3:
		say "[bougePas].";
		try looking;
	otherwise:
		if la porte is locked:
			say "Эта дверь заперта на электронный замок.";
		otherwise:
			if la porte is buttoned:
				say "First, you have to ";
				if the player is in an elevator:
					say "indicate the destination floor.";
				otherwise:
					say "call the elevator.";
			otherwise:
				say "The door is closed."
			
To say bougePas:
	say "Стена не поддается".
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "Темное помещение[one of]. Здесь нет ничего интересного[or][stopping]";
		-- 1:
			say "Опа, здесь кровь [unicode 8212] в этой огромной синей комнате с металлическими стенами";
		-- 2:
			say "Голубая комната, в которой люди режут и потрошат животных";
		-- 3:
			say "The operating table stands in the middle of the blue room, surrounded by surgical equipment. The exit leads to the corridor";
		-- 4:
			say "The operating table in the middle of the room is covered in blue surgical drapes. The table has various straps and contraptions to immobilize animals during surgery. Just next to the table is an anesthesia machine, with knobs and dials, and tubes leading to the ceiling. Just above it, there are several vital signs monitors, all of which are off at present. A portable radiography machine has been wheeled in next to the table.[paragraph break]The central corridor for level two is just off to the east"
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "Голубая комната";
		-- 1:
			say "Жуткое место";
		-- 2:
			say "Камера пыток";
		-- 3:
			say "Operating room";
		-- 4:
			say "Surgical theater".

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique. The printed name of Couloir 2 is "[pnCouloir2]".

To say descCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Белый коридор безо всякой мебели";
		-- 1:
			say "Огромный белый коридор, соединяющий жуткое место на западе с логовом злого волка на севере";
		-- 2:
			say "Коридор, ведущий из моего уютного убежища на севере к комнате ужасов на западе";
			say "[liftDoorDogStatus]";
		-- 3:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east";
		-- 4:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". На восточной стене сияет красная кнопка";
	otherwise:
		say ". Проход к востоку исчез".
			
To say pnCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Коридор";
		-- 1:
			say "Огромный холл";
		-- 2:
			say "Опасный проход";
		-- 3:
			say "Corridor, Level 2";
		-- 4:
			say "Level 2: Physiological Experiments".
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	try looking;
	tell openLift.
	

The list of text called openLift is always {
"[italic type][quotation mark]Лаки, откуда ты знаешь, как открывать волшебный ящик?[quotation mark][line break][quotation mark]Я увидел кнопку. Я нажал ее. Вот и всё. И к чему весь этот эпатаж с волшебным ящиком?[quotation mark][line break]","[quotation mark]Гиганты…  [quotation mark][line break][quotation mark]Ты людей имеешь в виду?[quotation mark][line break][quotation mark]Наверно, да. Как бы там ни было, люди заходят в этот ящик и исчезают. А потом в том же самом ящике оказываются другие люди. Это явно магия.[quotation mark][line break]","[quotation mark]Хмм. Что ж, посмотрим.[quotation mark][roman type][paragraph break]"
}			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "Волк смотрит на тебя недобрым взглядом из своей клетки";
		-- 2:
			say "Комната, в которой тебя научили нажимать кнопку, чтобы получать лакомства из машины для поощрений";
		-- 3:
			say "A cage takes up half the space in this room; the rest is dedicated to animal training equipment";
		-- 4:
			say "Animals are kept here in a large cage, which allows them to remain active during experiments that can last up to several weeks[one of]. You notice a sign taped to the cage: [apostrophe]Subject 205-Alpha[apostrophe][or][stopping]"
			
To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "Логово волка";
		-- 2:
			say "Дом, милый дом";
		-- 3:
			say "The kennel";
		-- 4:
			say "Zoological laboratory".
	
To say openNord:
		say "Стена к северу отъезжает в сторону, открывая проход в соседнее помещение".

	
The cage is an openable closed container in the Laboratoire Zoologique. The printed name of the cage is "клетку[if the cage is closed] (она закрыта)[end if]".

The chien is an edible thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]wolf[otherwise]dog[end if]". The chien can be dead. The chien is not dead. 

The animal body is a thing. It is in the void. The printed name of the animal body is "труп животного".

The food dispenser is in the Laboratoire Zoologique. It is buttoned. The printed name of the food dispenser is "автоматическую кормушку".

Instead of pushing the food dispenser:
	say "Ты нажимаешь красную кнопку. ";
	if the consciousness of the player is:
		-- 2:
			say "В награду на пол высыпается несколько кусочков корма. Ты съедаешь их, но они не могут утолить твой голод.";
		-- 3:
			say "You don't find the reward nuggets that fall at your feet the least bit appetizing.";
			move the pile of dog food to the Laboratoire Zoologique;
		-- 4:
			say "The operant conditioning device dispenses a few dog food pellets that pile up on the ground.";
			move the pile of dog food to the Laboratoire Zoologique.
			
The pile of dog food is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 1 in 8 succeeds:
		say "Волк [one of]громко гавкает[or]грызет прутья своей клетки[or]чешет ухо[or]вышагивает взад-вперед по своей металлической клетке[in random order].";
	otherwise:
		if a random chance of 1 in 8 succeeds:
			say "[one of]воет во всю силу своих легких[or]принюхивается к чему-то в воздухе[or]обнюхивает клетку[or]обнюхивает самого себя[in random order].";
		otherwise:
			if a random chance of 1 in 8 succeeds:
				say "[one of]лижет свои лапы[or]скалится на тебя[or]угрожающе рычит[or]не обращает на тебя внимания[or]бегает вдоль клетки, не спуская с тебя глаз[in random order]."	
				
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:
		say "Маленькая комнатка";
		if Ascenseur 2 is visited:
			say ", которая вибрирует";
	otherwise:
		say "The elevator".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "Ты нажимаешь кнопку";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " своей мордой[one of] (которая, насколько ты помнишь, раньше была длиннее)[or][stopping] и замечаешь легкую вибрацию. Секунду спустя стена на западе отъезжает, и за ней оказывается коридор.";
			-- otherwise:
				say ", the elevator [if the location is Ascenseur 2]descends to the first level[otherwise]goes up to the second level[end if] and the doors open to the west."; 
		if the player is in Ascenseur 2:
			move the player to Ascenseur 1, without printing a room description;
			now Ascenseur1door is open;
		otherwise:
			move the player to Ascenseur 2, without printing a room description;
			now Ascenseur2door is open;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say ", и стена отъезжает в сторону, открывая проход на восток.";
			-- otherwise:
				say " and the elevator door opens to the east.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "Ты ";
	if the player is in an elevator:
		say "enter";
	otherwise:
		say "выходишь";
	say ", и ";
	if the consciousness of the player is less than 3:
		say "стена за твоей спиной бесшумно возвращается на место";
	otherwise:
		say "doors close silently behind you".
	
After going west from an Ascenseur 2:
	say "[portesReferment].";
	try looking;
	now Ascenseur2door is closed.
	

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The printed name of the Laboratoire Biochimique is "[pnLabBio]". 

The labBioDoor is a locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. The printed name of the labBioDoor is "[pnLabBioDoor]".

To say descLabBio:
	if the consciousness of the player is:
		-- 3:
			say "The room is lined floor to ceiling with high-tech equipment. On a typical day, the room would be full of blinking lights and the whir of robotic actuators, but right now the equipment is dark and you don't hear the slightest sound";
		-- 4:
			if the disjoncteurs are not broken:
				say "With power restored, the room is now lit up like a Christmas tree, the computer fans are whirring, and the microfluidic station stands ready to carry out even the most complex biochemical syntheses";
			otherwise:
				say "The room is entirely dark, and neither the computers nor the robotic molecular synthesis unit are working. It's obvious that somewhere electrical power to the room has been cut"
					
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Biochemical Laboratory";
		-- 4:
			say "Molecular Synthesis Laboratory".
			
To say pnLabBioDoor:
	say "laboratory door".
	

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Еще один коридор, выглядящий точно так же, как опасный проход рядом с твоей клеткой. Виден выход[if labPathDoor is closed] к югу и сдвижная дверь к северу[otherwise]ы к северу и югу[end if]";
			say "[liftDoorDogStatus]";
		-- 3:
			say "Центральный коридор уровня 1 соединяет туалеты на юге, душевые на западе, лабораторию на севере и лифт на востоке";
		-- 4:
			say "The central corridor on level one leads south to the restroom, west to the decontamination suite, north to the histopathology laboratory, and east to the elevator".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Новый коридор";
		-- 3:
			say "Коридор, уровень 1";
		-- 4:
			say "Level 1: Biocontainment".
			
After going east from Couloir 1:
		say "[portesReferment].";
		try looking;
		now the Ascenseur1door is closed.

Section Ascenseur 1

Ascenseur 1 is an elevator. The Ascenseur1door is an elevatorDoor. It is east of Couloir 1 and west of Ascenseur 1. 

To say descAscenseur1:
	say "На панели горит зеленая кнопка".
	
After going west from an Ascenseur 1:
	say "[portesReferment].";
	try looking;
	now Ascenseur1door is closed.

Section Laboratoire De Pathologie

Laboratoire de Pathologie is a room. The description of Laboratoire de Pathologie is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire de Pathologie. The printed name of Laboratoire de Pathologie is "[pnLabPath]".

To say pnLabPath:
	if the consciousness of the player is:
		-- 2:
			say "Кухня";
		-- 3: 
			say "Лаборатория подготовки препаратов";
		-- 4:
			say "Лаборатория патологической гистологии".

To say descLabPath:
	If the consciousness of the player is:
		-- 2:
			if Laboratoire de Pathologie is not visited:
				tell kitchenDogDesc;
			otherwise:
				say "Обычная кухня с темной отделкой";
		-- 3:
			say "Здесь исследователи готовят препараты для рассматривания под микроскопом.[paragraph break]Ты узнаешь микротом и печь СВЧ, но назначение всего остального расставленного на столах оборудования остается непонятным";
		-- 4:
			say "Ультрасовременная лаборатория для подготовки препаратов и исследования образцов тканей".
			
The list of text called kitchenDogDesc is always { 
"Это помещение напоминает тебе о лучших временах в кругу твоей семьи -- до того, как тебя похитили. Судя по столам, уставленным"," едой полкам, раковинам и странным большим приборам, ты можешь без всякого сомнения утверждать, что это самая важная комната во всем доме: кухня"
}
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]". 

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "холодильник[if the frigo is closed] (закрытый)[end if]";
		-- 3:
			say "морозильную камеру (пустую)"; [only mentioned in accusative, so okay]
		-- 4:
			say "Низкотемпературная камера для хранения патанатомических препаратов".
			
After opening the frigo:
	move the tupperware container to the location;
	say "Ты открываешь холодильник, и из него выпадает на пол пластиковая коробка."
	
The tupperware container is a closed openable container in the frigo.  The printed name of the tupperware container is "пластиковый контейнер".

The slice of brain is a edible thing in the tupperware container. The printed name of the slice of brain is "[one of]плоско срезанный [or][stopping]кусок мозга".

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	tell chopLicking;
	try looking.
	
The list of text called chopLicking is always {
"[italic type]«Ммммм!» [unicode 8212] говорит Лаки и облизывается.[line break]«Чему это ты так обрадовался?»[line break]","«Видишь вон тот здоровенный ящик? Вот он действительно волшебный: это холодильник!»[line break]«Мы забираемся в холодильник, чтобы попасть в другое место?»[line break]","«Нет, мы едим то, что внутри!»[roman type][paragraph break]"
}


Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 
To say descToilettes:
	if the consciousness of the player is less than 3:
		say "Здесь сильно пахнет мочой[one of]. Многие пометили эту территорию – судя по всему, она пользуется немалым спросом[or][stopping]";
	otherwise:
		say "Пол, выложенный черной и белой плиткой, настенные шкафы, унитазы и раковины"
	
To say pnToilettes:
	if the consciousness of the player is less than 3:
		say "Комната со стенами из кафеля";
	otherwise:
		say "Санузел".
		
Instead of simplePushing when the player is in les Toilettes:
	if the consciousness of the player is less than 3:
		say "Ты нажимаешь металлическую кнопку и немедленно слышишь какой-то громкий звук.";
	otherwise:
		say "Ты спускаешь воду в унитазе."
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "[if the potty is in Les Toilettes]Резервуар с водой уже открыт[otherwise]Ты поднимаешь крышку, под которой оказывается резервуар с водой[end if].";
	otherwise:
		say "[if the potty is in Les Toilettes]Крышка унитаза уже поднята.[otherwise]Ты поднимаешь крышку унитаза[end if].";
	now the potty is in Les Toilettes.
	
The potty is a thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "bowl full of water";
	otherwise:
		say "унитаз (с поднятой крышкой)". 
		
Instead of simpleEating when the player is in Les Toilettes:
	if the potty is in the void:
		continue the action;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				if the timesLapped of the player is:
					-- 0:
						say "Ты лакаешь воду из резервуара. Освежает!";
					-- 1:
						say "Не то, чтобы ты испытывал жажду, но ты делаешь несколько глотков из резервуара.";
					-- otherwise:
						say "Тебе совсем не хочется пить – как-никак, ты вылакал не один литр из резервуара.";
				increase the timesLapped of the player by one;
			-- 3:
				say "Нет, это было бы слишком отвратительно[one of] (даже для поедателя мозгов)[or][stopping]."; 
			-- 4:
				say "Do you have any idea how many species of pathogenic bacteria live in the water? No way."
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		tell bathroomGuardText;
		try looking.
		
The list of text called bathroomGuardText is always {
"Войдя в санузел, ты замечаешь краем глаза какое-то движение.[paragraph break][italic type]Кто здесь?[roman type][paragraph break]","Коренастый мужчина в рваной униформе смотрит на тебя немигающим взглядом. Его бледная кожа, слезящиеся глаза и ввалившиеся щеки навевают мысли об ожившем мертвеце.[paragraph break]","Несколько минут вы играете в гляделки, пока до тебя, наконец, доходит, что ты смотришь на собственное отражение в зеркале.[line break]"
}.
	
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
	now the BlockChatterFlag is true;
	tell bathroomScientistText;
	try looking.
	
The list of text called bathroomScientistText is always {
"As you enter the bathroom, you catch some movement out of the corner of your eye.[paragraph break][italic type]Is somebody else here?[roman type][paragraph break]A burly man dressed in a tattered uniform stares at you with unblinking eyes. His pale skin, rheumy eyes and sunken cheeks call to mind a cadaver.[paragraph break]This awkward encounter goes on for several minutes before you realize that you are staring at your own reflection in a mirror."
}

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "Множество душевых головок направлены на центр помещения, который залит интенсивным фиолетовым светом";
		-- 4: 
			say "The high pressure nozzles that ring the room are designed to hose down personnel with an antiseptic solution as they come and go from potentially contaminated zones within the complex. The room is continuously illuminated by germicidal lights";
	say ". Дверь к востоку ведет в коридор, а к западу [unicode 8212] на лестницу"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "Душевая";
		-- 4:
			say "Decontamination room".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "дверь в душевую";
		-- 4:
			say "decontamination suite door".
			
Instead of simplePushing when the player is in the Salle de Décontamination:
	if the consciousness of the player is:
		-- 3:
			say "Ты расслабляешься под теплыми, ласковыми душевыми струями. Через некоторое время душ отключается, и ты высыхаешь.";
		-- 4:
			say "The personnel decontamination system blasts you with a phenolic-smelling spray.".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Лестница (первый уровень)".

The esc1door is a locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "дверь между [if the consciousness of the player is 3]душевой[otherwise]decontamination room[end if] и лестницей".

To say descEscalier1:
	say "Лестница ведет наверх к северу, соединяя [if the consciousness of the player is 3]душевые[otherwise]decontamination room[end if] на юге со всей остальной частью комплекса".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "Ты взбираешься по лестнице к северу".
	
To say downSouth:
	say "You go down the stairs southwards".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Лестница (второй уровень)".

To say descEscalier2:
	say "Лестница поднимается с юга на север, оканчиваясь перед дверью шлюза".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Шлюз".

The sasDoor is a locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "бронированную дверь шлюза".

The scientist is an edible thing in the sas. The scientist has a truth state called introducedFlag. The introducedFlag of scientist is false. The scientist has a number called conversations. The conversations of the scientist is 0. The printed name of the scientist is "женщину-ученого".

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "Длинное цилиндрическое помещение, залитое красноватым светом";
		-- 4:
			tell heavyDoor;
		say ". Позади тебя, к югу, расположена ведущая вниз лестница".
		
The list of text called heavyDoor is always{
"Тяжелые бронированные двери, отсутствие окон и цилиндрическая форма помещения вызывают у тебя ассоциации с подводной лодкой. Лампа над дверью в дальнем конце светится красным,"," сигнализируя, что дверь наружу заблокирована. Позади тебя, к югу, расположена ведущая вниз лестница"
}
			
Instead of going north when the player is in the sas:
	if scientist is in the sas:
		say "Тебе пришлось бы пройти мимо женщины, а она выглядит не слишком сговорчивой. Кроме того, ты все равно не знаешь кода от замка внешней двери, так что даже пробовать не стоит.";
	otherwise:
		say "Useless. The door is hermitically sealed and can only be opened by someone in the control room."
			
Before eating scientist when the conversations of scientist are less than 5:
	now the BlockChatterFlag is true;
	say "[one of][beat1][or][beat2][or][beat3][or][beat4][stopping].";
	stop the action.
	
The list of text called beat1text is always {
"Женщина отгоняет тебя ударом монтировки. Оказавшись вне твоей досягаемости, она нажимает клавишу на переговорном устройстве и говорит: «Внимание, комната управления, это доктор Рамбо"," из шлюза. Со мной тут Жюльен. К сожалению, вынуждена сообщить, что эксперимент не удался. Что бы ни случилось, не отпирайте наружную дверь»"
}.

To say beat1:
	tell beat1text.
	
To say beat2:
	say "Доктор Рамбо не двигается из-за стола, но при твоем приближении встречает тебя серией ударов монтировкой, которые заставляют тебя передумать".
	
To say beat3:
	say "Женщина говорит с уважением: «Восхищаюсь твоим упорством, но…», [unicode 8212]  после чего смачно прикладывает тебя монтировкой по носу. Оглушенный, ты отшатываешься так, чтобы ей было тебя не достать".
	
To say beat4:
	say "Доктор Рамбо вновь пускает в ход монтировку".


Chapter 10 - Verbs

Section 1 - simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Ты вводишь код на цифровой клавиатуре и слышишь, как замок ведущей на ";
			if the way is:
				-- east:
					say "восток";
				-- west:
					say "запад";
				-- north:
					say "север";
				-- south:
					say "юг";
			say " двери отпирается.[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "Здесь нет запертых дверей."
	
To say firstUnlocked:
	now the BlockChatterFlag is true;[hate to side effect this way, but here it is expedient]
	tell unlockText.
	
The list of text called unlockText is always {
"[paragraph break][italic type]«Постой-ка минутку», [unicode 8212] просит пес. [unicode 8212] Что это был за фокус?»[line break]","«Эти двери с электронными замками отпираются, если ввести правильный код».[line break]«И ты его помнишь?» [unicode 8212] удивляется Мыш.[line break]«Как видишь».[roman type]"
}
	
Section 2- simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "open" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
		if the door the way of the location is locked and the consciousness of the player is greater than 2:
			say "You would have to first unlock the door [the way].";
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "Здесь, похоже, нечего открывать." 
	
[this works here because things only contain a single item]
After opening something (called the item):
	say "Ты открываешь [item]";
	if the item contains exactly one thing:
		say " и обнаруживаешь [a random thing in item]";
	say "."

Section 3 - simpleEating

simpleEating is an action applying to nothing. Understand "eat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "Здесь нечего есть";
	if the pile of dog food is in the location:
		say " (at least, nothing that looks appetizing)";
	say "."
	
Rule for implicitly taking something (called the target) while eating:
	try silently taking the target.

Section 4- simplePushing

simplePushing is an action applying to nothing. Understand "push" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "There's nothing to push here."
	
Section 5- simpleTalking

simpleTalking is an action applying to nothing. Understand "talk" as simpleTalking.

Check simpleTalking:
	if the player is not in the sas:
		say "No one is around. Who are you talking to[one of]?[paragraph break]Do you want everyone to think you're nuts[or][stopping]?";
		stop the action;
	otherwise:
		if the bloody corpse of Docteur Rambaud is in the sas:
			if the intercom is not live:
				say "To talk to the control room, you must first activate the intercom.";
				stop the action.
				
Carry out simpleTalking:
	if the bloody corpse of Docteur Rambaud is in the sas:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of][intercom-zero][or]The control room refuses to talk to you until you have a proven cure in hand[stopping]. They hang up on you and the intercom goes dark.";
			now the intercom is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					tell intercomText1;
				-- 2:
					tell intercomText2;
				-- 3:
					tell intercomText3;
				-- 4: 
					tell intercomText4;
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientist by 1;
		if the conversations of scientist is:
			-- 1:
				tell parleyText1;
			-- 2:
				tell parleyText2;
			-- 3:
				tell parleyText3;
			-- 4:
				tell parleyText4;
			-- 5:
				tell parleyText5;
			-- otherwise:
				say "Говорить больше не о чем."
				
The list of text called parleyText1 is always {
"Ты начинаешь что-то бессвязно лепетать [unicode 8212] слова никак не хотят вспоминаться. Когда звуки слетают с твоего языка, женщина-ученый смотрит на тебя с недоверием.[paragraph break]","«Как такое возможно? [unicode 8212] удивляется она. [unicode 8212] Ты еще как-то ухитряешься говорить?»[line break]","«Да, [unicode 8212] произносишь ты с мучительным стоном, [unicode 8212] я… го-во-рю».[line break]","«Невероятно! Жюльен, это же чудо! Ты помнишь что-нибудь?»[paragraph break]","[italic type]«Жюльен? Это еще кто? [unicode 8212] спрашивает Лаки».[line break]","«Не я, [unicode 8212] отзывается Мыш. [unicode 8212] Может, это нашего друга Мозголомтика так зовут?»[line break]","«Я не знаю, но конечно, я вполне могу быть этим Жюльеном. В конце концов, почему бы и нет?»[roman type][paragraph break]«Ровным счетом ничего. Я совсем ничего не помню… Жюльен… Это я?»[line break]","«Да, Жюльен, это ты. А я [unicode 8212] твоя Изабель. Изабель Рамбо, [unicode 8212] отвечает женщина разочарованным тоном».[paragraph break]"
}.

The list of text called parleyText2 is always {
"[italic type]«У нее красивые глаза (для великанши, конечно)», [unicode 8212] замечает Мыш.[line break]","«Заткнись», [unicode 8212] в один голос говорят Мозголомтик и Лаки.[roman type][paragraph break]Ты заставляешь себя выговаривать слова, одно за одним.[paragraph break]","«Что. Ты. Здесь. Делаешь?»[line break]«Жюльен, у меня нет времени. Я [unicode 8212] исследователь-медик, а ты [unicode 8212] охранник. Мы оба работаем в учреждении, занимающимся поиском лекарства от вируса Зомби777, опустошившего всю планету».[line break]","«Охранник?»[line break]«Да. Слушай внимательно, Жюльен, это важно. Толпа жертв пандемии окружила наш лабораторный комплекс, и один из них"," поцарапал тебя, когда ты пытался меня защитить. Мне пришлось опробовать на тебе экспериментальной метод лечения, чтобы ты не превратился в зомби».[line break]","«Так я выздоровел?»[line break]«Если бы!»[paragraph break]"
}.

The list of text called parleyText3 is always {
"«То есть лечение не сработало?» [unicode 8212] спрашиваешь ты.[line break]«По-видимому, не до конца. У меня возникла проблема с микроструйной установкой биосинтеза, где была приготовлена"," доза, которую я тебе дала. Мне кажется, там не хватало одного ингредиента. Я пыталась отремонтировать установку и так увлеклась, что ты застал меня врасплох. Ты напал на"," меня, но мне удалось спрятаться здесь, в шлюзе. Вот так примерно и обстоят дела».[line break]","«Прости».[line break]«Это был не ты. На тот момент ты был самым настоящим зомби. Но... Как тебе удается говорить? Я никогда не слышала о говорящих зомби [unicode 8212] такого просто не бывает».[paragraph break]"
}.

The list of text called parleyText4 is always {
"«Нам действительно тяжело говорить».[line break]«Конечно, при таком-то состоянии нейронных связей … Постой-ка… Что значит [unicode 8222]нам[unicode 8220]?»[paragraph break][italic type]«Расскажи ей про меня», [unicode 8212] умоляет Мыш, еле сдерживая эмоции.[line break]","«И про меня!» [unicode 8212] добавляет Лаки.[roman type][paragraph break]«Да. Насчет этого. Я сказал [unicode 8222]нам[unicode 8220], потому что в моей голове сразу три разума: мышь, собака по кличке Лаки и кусочек мозга. Мы стараемся действовать сообща, чтобы худо-бедно передвигаться и"," разговаривать».[line break]«Ну что ж, [unicode 8212] Изабель бросает задумчивый взгляд на потолок, собираясь с мыслями, [unicode 8212] похоже, это объясняет всё. Твой мозг был перезагружен, стерт"," вирусом, но каким-то образом ты сумел, так сказать, зарядить его нормальными мозгами. Тот кусочек мозга, о котором ты говоришь [unicode 8212] это, судя по всему, тот биопсийный"," образец, который я взяла у Жюльена до того, как вирус проник в эту часть его мозга».[paragraph break]"
}.

The list of text called parleyText5 is always {
"«Так что, для нас теперь всё потеряно?» [unicode 8212] спрашиваешь ты.[paragraph break][italic type]«Нам хана», [unicode 8212] жалобно пищит Мыш.[line break]«Похоже на то», [unicode 8212] вздыхает Лаки.[roman type][paragraph break]«Может, и нет…»[line break]«У тебя есть идеи?»","[line break]«Мне кажется, да. Делай, как я говорю: мне всё равно недолго осталось. Я уже и ног своих не чувствую, мое время подходит к концу. Но... если ты съешь мои мозги [unicode 8212] постой, не так"," быстро! Дай мне закончить [unicode 8212] спасибо. Как я уже сказала, если ты съешь мои мозги, моя личность сольется с вашими. Ты по-прежнему инфицирован, и со временем вирус"," разрушит остатки твоего мозга, но лекарство все-таки затормозило его распространение, хотя и не принесло полного исцеления. Хватило бы времени [unicode 8212] я бы тогда починила установку"," биосинтеза, и мы смогли бы еще раз попытаться изготовить лекарство от вируса. Если у нас всё получится, я буду жить внутри тебя, среди твоих мыслей».[line break]«А теперь можно съесть твои"," мозги?»[line break]«Угощайся».[paragraph break]"
}.

To say intercom-zero:
	tell intercomText0.
	
The list of text called intercomText0 is always {
"Speaking into the intercom, you explain your plan. The director of the installation grabs the microphone and wishes you good luck. Beyond that, he instructs you report back when you have succeeded. Short of that, though, he requests that you not use the intercom"
}

The list of text called intercomText1 is always {
"[quotation mark]Control room, Professor Drummond speaking.[quotation mark][line break][quotation mark]It's me, your dog, Lucky! I'm in the airlock! I am so happy to hear your voice![quotation mark][line break][quotation mark]Um. Huh? Are you messing with me? The intercom is only for official communications. Who is this?[quotation mark][paragraph break][italic type][quotation mark]It's him! It's the father of my family,[quotation mark] says Lucky.[line break][quotation mark]Calm down, Lucky,[quotation mark] insists the scientist. [quotation mark]Please let Julien do the talking.[quotation mark][roman type][paragraph break][quotation mark]Excuse me,[quotation mark] says Julien. [quotation mark]I can explain everything. I am Julien Truffaut.[quotation mark][line break][quotation mark]The guard?[quotation mark][line break][quotation mark]Yes.[quotation mark][line break][quotation mark]Impossible. Doctor Rambaud said that he had turned. Zombies can't talk. I don't have time for your crap, now get off the line.[quotation mark][paragraph break]"
}

The list of text called intercomText2 is always {
"[quotation mark]I'm not joking,[quotation mark] pleads Julien. [quotation mark]Doctor Rambaud has cured me.[quotation mark][line break][quotation mark]Okay, enough,[quotation mark] answers the professor. [quotation mark]If she's there, put her on.[quotation mark][line break][quotation mark]She is… occupied… at the moment.[quotation mark] While you are speaking, you drag the scientist's lifeless body around the corner to the stairwell.[paragraph break][quotation mark]Listen,[quotation mark] you continue, [quotation mark]if you don't believe me, turn on the surveillance cameras in the airlock. You'll be able to see me.[quotation mark][line break][quotation mark]Okay, give me a sec.[quotation mark][paragraph break]"
}

The list of text called intercomText3 is always {
"[quotation mark]Do you see me?[quotation mark] you ask.[line break][quotation mark]Yes. Got you on the screen. But how can you still be alive? I thought you'd been infected by the virus.[quotation mark][line break][quotation mark]Well, yes, you're right, but as I told you…[quotation mark][paragraph break][italic type][quotation mark]Let me explain,[quotation mark] interrupts the scientist.[roman type][paragraph break][quotation mark]Doctor Rambaud prepared a cure using the microfluidic biosynthesis workstation following protocol M13 as she discussed with you previously. My neural pathways were restored and I am entirely cured.[quotation mark][line break][quotation mark]Okay… But that would mean… this could be it. An end the pandemic![quotation mark][line break][quotation mark]Right. We need to move on this quickly.[quotation mark][paragraph break]"
}

The list of text called intercomText4 is always {
"You request to speak to the director of the entire research complex, Colonel Greillier, and you relate everything that has happened, leaving out, for now, some of the details suggested by Lucky and the mouse.[paragraph break]After a couple hours of discussion and some blood tests, the colonel is convinced and orders that the airlock doors be unsealed, permitting you to exit. "
}
									
Section 6 - simpleRepairing

simpleRepairing is an action applying to nothing. Understand "repair" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible broken things:
		try touching the item;
		stop the action;
	say "You don't see anything in need of repair."
	
Instead of touching something (called the item):
	now the item is not broken;
	say "You repair [the item]."
	[override touch with specific repair actions.]
	
Section 7 - Numbering

Numbering is an action applying to one number. Understand "[number]" as numbering. 

Carry out numbering:
	do nothing.
	
Chapter 11 - Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.


Chapter 12 - Known Commands

The list of actions called possibleActions is always {going east, going west,simpleEating,simpleOpening,going north,going south,simplePushing,simpleUnlocking,simpleTalking,simpleRepairing}.

The list of text called printedActions is always {"восток", "запад", "есть", "открыть", "север", "юг", "толкнуть", "отпереть ", "говорить","отремонтировать"}.

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	place an inline element called "hidden" reading "Появилась новая команда: ";
	choose row knownCommands of the player in Table of Palette;
	place a link to the command "[knownCommands of the player]" called "boutons box[knownCommands of the player] [Palette-EN entry]" reading "[knownCommands of the player]: [Palette-RU entry]", without showing the command;
	place an inline element called "hidden" reading ". ".

After reading a command:
	[To prevent players bypassing the CSS to play beyond end of game]
	if the knownCommands of the player is zero:
		say "The game has ended. To play again, reload the game in your browser.";
		reject the player's command;
	[To reject non-numerical input]
	if the player's command does not match "[number]":
		say "Please type the number corresponding to the desired command.";
		reject the player's command;
	[process numerical input]	
	let C be the number understood;
	[accept known commands only]
	if (C > knownCommands of the player) or (C < 1):
		say "Select from one of the above command links.";
		reject the player's command;
	place an inline element called "command" reading "> [entry C of printedActions]";
	try entry C of possibleActions.		
				
Chapter 13 - Milestones

After going east for the first time:
	try looking;
	say "Какое-то мелкое существо выскакивает из ниоткуда, прошмыгивает между твоих ног и исчезает на западе.";
	increment the knownCommands of the player.
	
After going west from Couloir 2 for the first time:
	move the small gray creature to the Bloc Opératoire;
	try looking;
	say "Оно, дрожа всем телом, прячется в тени.";
	increment the knownCommands of the player.
	
After eating the small gray creature:
	tell mouseEatingText;
	increment the consciousness of the player.
	
The list of text called mouseEatingText is always {
"[line break]Ты наугад проводишь рукой вдоль низа стены. Хотя тебя нельзя назвать быстрым и ловким, каким-то чудом тебе удается прижать крошечного зверька к стене. Ты крепко хватаешь его и чувствуешь в своей ладони что-то теплое, мохнатое, а теперь еще и влажное. ","Не задумываясь, ты засовываешь это в свой рот и сглатываешь.[paragraph break]Спустя мгновение тебя одолевает захлестнувший твое сознание поток новых мыслей.[paragraph break][italic type]Спасите! За мной гонится гигантское чудовище! Оно хочет меня ","съесть! Мне надо спрятаться.[paragraph break]Я…ох.  Я уже умер или что? Не понимаю. Что происходит?[roman type][paragraph break]"
}
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ах, этот огромный белый коридор. [paragraph break]Сколько раз я видел, как эти гиганты проходили прямо сквозь сплошные стены, проникая в секретные комнаты? Как они это делают?[roman type][line break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "Ты проскальзываешь в волчье логово [unicode 8212] это место неплохо тебе знакомо, но всё равно вызывает ужас.";
	try looking;
	say "Волк, как обычно, заперт в железной клетке, так что ничто не мешает тебе исследовать помещение, держась подальше от его хищных клыков.";
	increment the knownCommands of the Player.
	
After opening the cage:
	say "Ты открываешь клетку, но волк благоразумно остается внутри, продолжая наблюдать за тобой."
	
After eating the chien:
	now the chien is dead;
	now the animal body is in the cage;
	tell ateDog;
	say line break;
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	say "[italic type]«Извини».[line break]«Извинить за что?[no line break]»[line break]«Ну, типа я сожалею, что съел тебя».[line break]«Съел меня? И кто ты вообще?[no line break]»[line break]«Мышь».[roman type][line break]";
	increment the knownCommands of the player.
	
The list of text called ateDog is always {
"[line break]Повинуясь инстинкту, ты выедаешь ему мозг и швыряешь тело обратно в клетку. И вновь в твой разум вторгаются новые мысли.[paragraph break][italic type]",
"Предупреждаю: если подойдешь к клетке, я тебя съем! Стой, я не шучу… [paragraph break]Что? Что происходит? Что эта дохлая собака делает в моей клетке… заливая кровью мою любимую подушку?",
"[paragraph break]И почему я стою на задних лапах, как человек? Кажется, это проще, чем я мог себе представить."
}
	
After eating the slice of brain:
	tell flavorText;
	increment the consciousness of the player;
	now the BlockChatterFlag is true;
	tell patrolText;
	increment the knownCommands of the player.
	
The list of text called flavorText is always {
"[line break]Заглотив кусок мозга, ты машинально отмечаешь, что вкус у него был какой-то странноватый.[paragraph break]Несколько минут ничего не происходит, и ты начинаешь думать,"," что теперь можешь есть что угодно, не опасаясь последствий.[paragraph break]Внезапно мир взрывается фейерверком, наполняясь вместо мутных полутонов яркими сияющими цветами. ","Тебя словно пронзает электрический разряд, и ты, потеряв ориентацию, падаешь на пол. ","Когда спустя некоторое время ты встаешь, в ход твоих мыслей вклиниваются совершенно новые представления, и ты видишь всё в ином свете.[line break]"
}

The list of text called patrolText is always {
"[italic type][quotation mark]Нам пора отправляться патрулировать[quotation mark], [unicode 8212] командует новый голос.[line break]","[quotation mark]Патрулировать? Что это значит?[quotation mark] [unicode 8212] спрашивает мышь.[line break]","[quotation mark]Ну, это значит обойти каждый уголок и обеспечить безопасность здания[quotation mark], [unicode 8212] отвечает голос.[line break]","[quotation mark]Люблю прогулки![quotation mark] [unicode 8212] с энтузиазмом заявляет Лаки.[roman type][line break]"
}

	
After going north from Escalier 2 when the sasDoor is not closed for the first time:
	now the BlockChatterFlag is true;
	tell firstLook;
	try looking;
	say "Она настороженно смотрит на тебя.";
	increment the knownCommands of the player.
	
The list of text called firstLook is always {"За металлическим столом сидит женщина лет сорока, одетая в белый лаборантский халат. Она находится на полпути между тобой и еще одной"," дверью на другом конце помещения. Ее правое предплечье перевязано марлей, но повязка насквозь пропиталась кровью. Женщина, похоже, тяжело ранена, однако в здоровой руке"," она решительно сжимает монтировку.[line break]"}
	
After eating scientist:
	now the BlockChatterFlag is true;
	tell postScientistBrain;
	move the bloody corpse of Docteur Rambaud to the sas;
	move the intercom to the sas;
	move the panneau électrique to escalier 1;
	move the microfluidic synthesis unit to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
	
The list of text called postScientistBrain is always {
"[line break]Ты выедаешь исследовательнице мозг и немедленно начинаешь воспринимать мир под другим углом зрения, чувствуя себя более утонченным и эрудированным.[paragraph break][italic type][quotation mark]«Ты сделал это?» [unicode 8212] с сомнением спрашивает голос Изабель.","[line break]«Да, ты была просто объедение», [unicode 8212] делает ей комплимент Мыш.[line break]«Самая вкусная из всех», [unicode 8212] добавляет Лаки.","[line break]«Прости моих соседей по мозгу, им так не хватает такта», [unicode 8212] прерывает их Мозголомтик.[line break]«Эй!» [unicode 8212] возмущенно вскрикивают пес с мышью.","[line break]«Будь как дома, Изабель, [unicode 8212] продолжает Мозголомтик. [unicode 8212] Давай я представлю тебе нашу маленькую компанию: вот пес Лаки, а это Его Светлость Мышиный ","Герцог (или просто Мыш, поскольку он у нас очень скромный), ну, и я [unicode 8212] друзья называют меня Мозголомтиком. Мы все к твоим услугам».","[line break]«Привет, мальчики», [unicode 8212] приветливо говорит Изабель.[line break]"
}
		
Chapter 14 - Dialogue

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the servo motor is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			say "The robotic workstation emits a beep and fills a flask with fluorescent green fluid. You take the flask, propose a short toast to yourself, and kick it back in one gulp.[paragraph break][italic type][quotation mark]I don't feel anything,[quotation mark] worries the slice of brain.[line break][quotation mark]Wait for it,[quotation mark] reassures Isabelle.[line break][quotation mark]Me neither,[quotation mark] pipes up the mouse.[line break][quotation mark]Wait for it,[quotation mark] insists the scientist.[line break][quotation mark]Oh my![quotation mark] barks Lucky. [quotation mark]Something's starting to…[quotation mark][line break][quotation mark]And we're off![quotation mark] shouts the doctor.[italic type][paragraph break]You shake violently and pass out. When you are able to stand up again, you note that you skin has recovered its normal tint and that you can walk without lurching back and forth. In short, you've been cured.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type]«";
					tell entry 1 of mouseDogDialogue;
					say "».[roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say italic type;
					tell entry 1 of mouseDogGuardDialogue;
					say "[roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type][entry 1 of CuredDialogue][roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type]";
						tell entry 1 of EverybodyDialogue;
						say "[roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false;
	listExits;
	if the knownCommands of the player is greater than 0:
		listHiddenExits.
	

[This is a little kludgey, but necessary because the javascript library at present behaves differently 
across browers. For Chrome and Opera, it is not necessary. However, for Safari and Firefox (and 
perhaps others), when a hyperlink is clicked, the window scrolls upwards. This rule forces the window
to scroll back to the bottom. After that, the player can still manually scroll backwards to see previous bits 
of the story.]

This is the scroll update rule:
	if forceScroll is true:
		scroll to the bottom of the page.
	
The scroll update rule is listed last in the every turn rules.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"Как бы там ни было, я, кажется, прилично подрос. Хм, что бы это значило.",
"Мне явно чего-то хочется, но вот чего [unicode 8212] никак не пойму.",
"Ну-ка, чего мне обычно хочется?",
"Спать? Не-а. Пить? Не-а. Секса? Не-а.[paragraph break]Елки зеленые! Неужто я заболел?",
"Ах, вот оно что. Я голоден.",
"Но чего именно мне хочется? Никак не могу сообразить.",
"Может, сыра? Нет, вряд ли.",
"Мне нужно что-то мягкое, сочное...",
"Наверно, я пойму, чего хочу, когда увижу это."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of lists of text that varies. 

mouseDogDialogue is {	
{"Мышь? Что еще за мышь?»[line break]«Мышь, которая здесь живет».[line break]«Та самая проклятая мышь, которая постоянно тырит крошки вокруг моей кормушки?»[line break]«Да, именно так. Еще раз [unicode 8212] я просто хотел извиниться, если расстроил тебя"},
{"Не переживай из-за этого. На твоем месте я поступил бы так же».[line break]«Спасибо».[line break]«Скажи, мышь, у тебя есть имя?»[line break]","«Нет, мы, мыши, обходимся без имен. Так что можешь звать меня просто Мышью, точнее [unicode 8212] [unicode 8222]Мышом[unicode 8220]. Ну, а тебя как звать?»[line break]","«[unicode 8222]Лаки[unicode 8220]. Ну, по крайней мере так называли меня в моей семье, пока я не попал сюда. Местные живодеры называют меня [unicode 8222]Объект 205-Альфа[unicode 8220], но [unicode 8222]Лаки[unicode 8220] мне как-то больше нравится».[line break]«Хорошо, Лаки"},
{"Мыш, ты можешь мне кое-что объяснить? Как так получилось, что ты, крошечная мышка, проглотил меня [unicode 8212] крупного, сильного пса, в десятки раз превосходящего тебя в размерах?»[line break]","«Ты знаешь, я задавался тем же вопросом. Постой-ка [unicode 8212] ты сказал [unicode 8222]пес[unicode 8220]? Я думал, ты волк!»[line break]«Нет, я собака».[line break]«Ты уверен?»[line break]«Да, вполне"},
{"Никак не могу догадаться, как же я тебя съел».[line break]«Ты что-нибудь об этом помнишь?»[line break]«Я неожиданно почувствовал непреодолимое желание съесть мозги».[line break]«Мозги? Что за мозги?»[line break]«В данном случае твои».[line break]«А, понятно… Точнее, ничего не понятно"},
{"Мыш, ты всегда здесь жил?»[line break]«Мы обитаем здесь много поколений, это наше родовое гнездо. Мы охраняем его от посягательств всяких захватчиков. Мыши-полевки – это сплошь бандиты, гопники и воры».[line break]","«Ты когда-нибудь видел мир снаружи?»[line break]«У меня нет ни малейшего желания. Конечно, мне рассказывали там про небо, облака всякие, поля и тому подобное, но меня это не интересует"},
{"А у тебя как, Лаки? Ты вроде говорил про семью. У тебя есть жена? Мы, мыши, не особо верим в брак, но я слыхал, что собаки в этом отношении более консервативны».[line break]","«Семья, да, но не жена (хотя соседская пуделиха… ну ладно, это другая история). Нет, когда я говорю про семью, то имею в виду семью людей"},
{"Ты был у них в рабстве?» [unicode 8212] спрашивает Мыш.[line break]","«Да нет, ну что ты. Я играл с детьми, они меня кормили, дни напролет ласкали и гладили меня, у меня даже кровать своя была».","[line break]«Ты выдумываешь. Никогда ничего подобного не видел. Люди не выносят животных [unicode 8212] они так и норовят раздавить нас ногой"},
{"Да ты просто вообще ничего не знаешь о людях», [unicode 8212] заключает Лаки.[line break]","«Что характерно [unicode 8212] и знать не хочу, благодарю покорно».[line break]","«Тебе бы понравилась моя семья».[line break]«В таком случае, разреши поинтересоваться, что же заставило тебя покинуть такую замечательную семью?»[line break]","«Не то чтобы я ушел от них специально. Мы гуляли в лесу, я увидел белку, а дальше ты сам можешь всё себе представить. С тех пор я их не видел».[line break]","«Только не говори мне про белок. Они еще хуже полевок"},
{"Лаки, как ты думаешь, ты найдешь свою семью?»[line break]«Очень на это надеюсь».[line break]","«Я тоже. Мы бы с тобой показали этим белкам!»[line break]«Ага, это было бы круто"}
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of lists of text that varies. 

mouseDogGuardDialogue is { 
{"«Разреши задать вопрос, [unicode 8212] начинает Мыш,  [unicode 8212] кто ты, собственно, такой?»[line break]","«Меня зовут... эээ... как же его... секундочку... мда, хороший вопрос. Похоже, я не могу сейчас вспомнить свое имя. Почему бы вам не придумать его самим?»[line break]","«Давай назовем его [unicode 8222]маленький кусочек мозга, который мы нашли в холодильнике и у которого был странноватый вкус[unicode 8220]», [unicode 8212] предлагает Лаки.[line break]","«Нет, это слишком длинно. Давай просто назовем его [unicode 8222]Мозголомтиком[unicode 8220]. Как тебе такое имя?»","[line break]«Подойдет, [unicode 8212] соглашается Мозголомтик. [unicode 8212] С учетом всех обстоятельств я предпочитаю короткие имена»."},
{"«Ребят, а у вас есть имена?» [unicode 8212] спрашивает Мозголомтик.[line break]","«Да, [unicode 8212] отвечает пес. [unicode 8212] Извини, что пренебрегли этикетом. Меня зовут [unicode 8222]Лаки[unicode 8220], а моего друга мышь можно просто звать [unicode 8222]Мышом[unicode 8220]».[line break]","«Именно», [unicode 8212] подтверждает мышь.[line break]«Друзья, очень приятно с вами познакомиться»."}, 
{"«Ну, Мозголомтик, расскажи, каким животным ты был до того, как попал сюда. Я был собакой, а Мыш всегда был мышью».[line break]","«Я был кем-то другим, чем кусочек мозга?»[line break]","«Мне кажется, ты был холодильником, [unicode 8212] высказывает предположение Мыш. [unicode 8212] Я съел мозг собаки, и появился Лаки. После этого мы открыли холодильник и съели его содержимое, и появился ты».[line break]","«Сомневаюсь, что это работает именно так», [unicode 8212] вполголоса замечает Лаки."}, 
{"«Когда ты появился, ты сказал, что нам надо „обеспечить безопасность здания[quotation mark]. Что ты имел в виду?» [unicode 8212] спрашивает Лаки.[line break]","«Я имел в виду, что мы должны осмотреть всё здание, чтобы обеспечить защиту от любых угроз».[line break]","«Хорошo, [unicode 8212] говорит Мыш, стараясь не терять нить беседы, [unicode 8212] но что ты имеешь в виду под зданием?»","[line break]«Здание? Ну, это комплекс... точнее, это место, где все работают... Хм... В общем, это то, где мы есть», [unicode 8212] заключает Мозголомтик."}, 
{"«О каких угрозах ты говоришь?» [unicode 8212] спрашивает мышь.[line break]","«Если честно, я не помню, [unicode 8212] вздыхает Мозголомтик. [unicode 8212] Просто рехнуться можно! Я не могу их вспомнить, но я уверен, что их полным-полно и одна хуже другой».[line break]","«Ты знаешь, похоже, у тебя паранойя», [unicode 8212] замечает пес.[line break]","«Всё может быть, но если бы я мог вернуть свои воспоминания... Нет, боюсь, они утрачены»."}, 
{"«Думаешь, мы можем как-нибудь вернуть твои воспоминания?» [unicode 8212] интересуется Лаки.[line break]","«Как бы мы это сделали? Я пытался вспомнить самые разные вещи, но ничего в голову не приходит».[line break]","«Возможно, это потому, что ты просто маленький кусочек мозга, [unicode 8212] замечает Мыш. [unicode 8212] Если бы нам удалось найти оставшуюся часть твоего мозга [unicode 8212] ","а она, не исключено, находится где-то здесь [unicode 8212] мы бы могли съесть ее и восстановить твою потерянную память, не так ли?»[line break]","«Ты и вправду так думаешь?» [unicode 8212] недоверчиво переспрашивает Мозголомтик.[line break]","«Даже не сомневайся», [unicode 8212] подтверждает пес."}, 
{"«Но что, если оставшийся мозг найдет нас до того, как мы найдем его?» [unicode 8212] задает вопрос Мыш.[line break]","«И что с того?» [unicode 8212] говорит Лаки.[line break]","«Тогда он сможет съесть нас до того, как мы съедим его», [unicode 8212] с тревогой отвечает грызун.[line break]","«Но это же ничего не изменит! Мы же в любом случае останемся вместе, разве не так?» [unicode 8212] замечает Мозголомтик.[line break]","«Да, но вообще мне больше нравится съедать других до того, как они съедят меня»."}, 
{"«Знаете, что нам нужно? [unicode 8212] спрашивает Лаки. [unicode 8212] План. Нам нужен план действий.»[line break]","«Согласен, [unicode 8212] отзывается Мыш. [unicode 8212] Что ты предлагаешь?»[line break]","«Во-первых, [unicode 8212] начинает пес, [unicode 8212] нам надо продолжить обход, чтобы, как сказал Мозголомтик, обеспечить защиту здания от угроз. Во-вторых, найти недостающий мозг. И в-... эээ, ну в каких-то там после двух, нам надо бежать отсюда».[line break]","«Класс! Лаки, ты просто гений», восхищается Мозголомтик."},
{"«Бежать отсюда? Хочешь сказать, во внешний мир? [unicode 8212] возражает Мыш. [unicode 8212] Чего там хорошего? Я бы сказал, ничего, кроме проблем. Здесь у меня наследные владения и"," даже титул [unicode 8212] вы знаете, что я герцог? Это правда, я не шучу. Я восемнадцатый герцог в своем роду. Вы что, хотите, чтобы я отказался от всего этого?»[line break]","«Но снаружи ведь целый огромный мир!» [unicode 8212] взвывает пес.[line break]","«Мне кажется, я жил там, [unicode 8212] добавляет Мозголомтик. [unicode 8212] Где-то недалеко от этого здания вместе с моей девушкой... Как же ее звали?»"}, 
{"«О, у тебя была девушка?» [unicode 8212] неожиданно проявляет заинтересованность Лаки.[line break]","«Можно поподробнее», [unicode 8212] присоединяется к нему Мыш.[line break]","«Ну, если честно, я почти ничего не могу про нее вспомнить, даже ее имени. Хотя… я помню, что она была необыкновенно умна... ","у нее было замечательное чувство юмора и такой громкий, заразительный смех... и миндалевидные ","глаза темно-фиалкового цвета... и у нее были огромные... как их... забыл слово»."},
{"«Как ты думаешь, если нам удастся выбраться из здания, ты сможешь найти свой дом?» [unicode 8212] спрашивает Лаки.[line break]","«Конечно, без сомнения. Тут всего ничего помещений, которые отделяют нас от выхода. Мой дом совсем рядышком, нам просто надо идти по улице... не помню, правда, по какой, но я узнаю ее, когда увижу».[line break]","«Твоя амнезия как-то не внушает мне доверия», [unicode 8212] вздыхает Мыш.[line break]","«Если по пути к выходу мы сумеем найти оставшийся мозг, всё встанет на свои места», [unicode 8212] предполагает Лаки."}, 
{"«Если нам таки удастся найти выход, мы поможем Лаки найти его семью?» [unicode 8212] задает очередной вопрос Мыш.[line break]","«Ну, наверно, может быть. Лаки, твой дом тоже где-то поблизости?» [unicode 8212] осведомляется Мозголомтик.[line break]","«Кажется, да, [unicode 8212] отвечает пес. [unicode 8212] Моя семья живет в большом белом доме в окружении высоких деревьев. Вряд ли существует много подобных домов».[line break]","«А кошки там есть?» [unicode 8212] прерывает Мыш.[line break]«Ни одной», [unicode 8212] с гордостью заявляет Лаки."},
{"«Меня беспокоит одна мысль», [unicode 8212] нервничает мышь.[line break]","«Какая же?» [unicode 8212] откликается Мозголомтик.[line break]","«Что нам делать, если мы вдруг встретим кошку?»[line break]","«Съесть ее мозг, разве нет? [unicode 8212] говорит Мозголомтик. [unicode 8212] Делов-то!»[line break]","«Не всё так просто, [unicode 8212] возражает пес. [unicode 8212] Мы тогда постоянно будем слышать кошкины мысли. Это было бы невыносимо».[line break]","«Именно! [unicode 8212] соглашается Мыш. [unicode 8212] Съесть кошку? Конечно, всегда пожалуйста. ","С удовольствием приму в этом участие. Но вот мысли ее слушать [unicode 8212] это уж увольте, благодарю покорно»."}, 
{"«Когда мы выберемся наружу, что нам надо будет сделать, чтобы найти дом Лаки?» [unicode 8212] спрашивает Мыш.[line break]","«Сначала нам надо будет добраться до моего дома, [unicode 8212] отвечает Мозголомтик. [unicode 8212] У меня есть машина, с ней поиски пойдут быстрее».[line break]","«Давай-ка проясним этот момент, [unicode 8212] хмыкает Мыш, [unicode 8212] ты даже имени своего не помнишь, но знаешь, как водить машину?»[line break]","«С этим в случае чего и я справлюсь, [unicode 8212] успокаивает его Лаки. [unicode 8212] Я много раз видел, как люди это делают, ничего в этом сложного нет»."},
{"«Слушайте, парни, [unicode 8212] говорит Мозголомтик, [unicode 8212] мне всё труднее и труднее сохранять концентрацию. Может, прервем пока нашу беседу, чтобы я мог, так сказать, отдышаться?»[line break]","«Конечно, [unicode 8212] соглашается Мыш. [unicode 8212] А то голова прямо-таки раскалывается. Надо бы отдохнуть».[line break]","«Я тоже за. Обожаю марш-броски всей стаей, но пора уже сделать привал».[line break]","«Всем спокойной ночи», [unicode 8212] резюмирует Мыш."}
}

Section Everybody Dialogue

EverybodyDialogue is a list of lists of text that varies. 

EverybodyDialogue is {
{"«Какое невероятное чувство!» [unicode 8212] восхищается женщина.[line break]«Со временем к этому привыкаешь», [unicode 8212] лаконично замечает Мыш.[line break]«","Расскажи ей наш план, Лаки», [unicode 8212] предлагает Мозголомтик.[line break]«Хорошо, [unicode 8212] отзывается пес, [unicode 8212] пойдем с самого начала… Во-первых, нам надо найти оставшуюся часть мозга Жюльена. Во-вторых, нам надо"," выбраться из здания; и в-что там после двух, мы займемся поисками моей семьи»."},
{"«Пусть так, [unicode 8212] говорит Изабель, [unicode 8212] но прежде всего нам надо пройти за пределы помещения, где вы меня встретили, а для этого нам надо синтезировать лекарство».[line break]","«Это невозможно», [unicode 8212] отрезает Мыш.[line break]«Почему?» [unicode 8212] слегка ошарашено спрашивает исследовательница.[line break]","«Это вопрос математики, [unicode 8212] педантично разъясняет Мыш. [unicode 8212] План Лаки начинается с пункта номер один. Перед номером один ничего нет».[line break]","«Номер ноль?» [unicode 8212] высказывает предположение Изабель.[paragraph break][roman type]«…»[paragraph break][italic type]«Ладно, [unicode 8212] соглашается она, [unicode 8212] а как насчет перенумерации? Первый пункт: приготовить лекарство; второй пункт: выбраться из здания; третий пункт: найти семью Лаки. Так пойдет?»[line break]","«Конечно, [unicode 8212] говорит Лаки, [unicode 8212] это звучит вполне разумно.»[line break]","«И к тому же совершенно корректно с точки зрения математики», [unicode 8212] добавляет Мыш."},
{"«Listen,[quotation mark] says Lucky, still counting the steps in Isabelle's plan. [quotation mark]What are we going to do about the missing brain? If I have this right, we need it to put Julien back together.[quotation mark][line break]«Unfortunately,[quotation mark] replies Isabelle, [quotation mark]the slice of brain is all that's left of Julien now. Right now we're all using the neural pathways of his entire brain to think, but nothing is left of Julien's original personality except what was stored in the brain biopsy. It's a heavy loss, particularly for me.[quotation mark][line break]«Why for you?[quotation mark] asks the mouse.[line break]«Because we were to be married, Julien and I.[quotation mark][line break]«Sorry,[quotation mark] consoles the slice of brain. [quotation mark]I'm sure that if I could remember you, I would really like you.[quotation mark]"},
{"«Isabelle, do you think that one day we'll find my family?[quotation mark] asks Lucky.[line break]«Yes, I'm certain of it.[quotation mark][line break]«How can you be so sure?[quotation mark] asks the slice of brain.[line break]«Because I know the family: Jean-Paul and Alexandra Drummond and their daughters, Léa et Camille. They live not more than a hundred meters from me and Julien.[quotation mark][line break]«Yes, I've heard those names often around my house. I'm sure you're right! But, how could you know who I was talking about?[quotation mark] asks Lucky.[line break]«Because I saw them in your thoughts,[quotation mark] answers the scientist."},
{"«Are you saying that you can see what Lucky is thinking?[quotation mark] asks the mouse. [quotation mark]How could that be possible?[quotation mark][line break]«We're all part of one brain now. Our minds are more or less merged. I can access his thoughts and conversely, he can access mine.[quotation mark][line break]«Cool![quotation mark] says the mouse. [quotation mark]We've got superpowers.[quotation mark]"},
{"«I have to say that I find that somewhat improbable,[quotation mark] says the dog. [quotation mark]If you can see my thoughts, what number am I thinking of right now?[quotation mark][line break]The scientist ponders for a moment and says, «The number one.[quotation mark][line break]«Well, yes,[quotation mark] admits the dog. [quotation mark]But perhaps that was a random guess. Try again…[quotation mark][line break]«You're thinking of the number two,[quotation mark] says the scientist with conviction.[line break]«Yes again![quotation mark] says the dog, now satisfied.[line break]«But,[quotation mark] objects the mouse, [quotation mark]Lucky only knows two numbers… what does that prove?[quotation mark]"},
{"«Fine,[quotation mark] says the scientist patiently, [quotation mark]let's take another example. Mouse, I am thinking at this very moment of this morning's breakfast. I am trying to visualize it in as much detail as I can… try to see it.[quotation mark][line break]«Where?[quotation mark] asks the mouse. [quotation mark]I can't smell anything.[quotation mark][line break]«Ah,[quotation mark] says Isabelle, [quotation mark]Therein lies the problem. I was thinking in visual terms. Here, let me imagine its aroma, its taste… [quotation mark][line break]«Oh! Yes, yes! I'm starting to sense it! My gods! It was a huge meal! This is fabulous. Can I relive every meal you've ever eaten? Pinch me, I'm dreaming.[quotation mark]"},
{"«Even though I find the memory of your last meal delicious, right now I don't feel like eating anything but brains. That's kind of weird, isn't it?[quotation mark] remarks the mouse.[line break]«In fact, it's entirely normal for someone who has been zombified,[quotation mark] replies the scientist.[line break]«We're zombies?[quotation mark] asks Lucky.[line break]«No,[quotation mark] clarifies the scientist. [quotation mark]Together we constitute a single zombie, sharing Julien's body.[quotation mark][line break]«At least I'm in my own body,[quotation mark] remarks the slice of brain."}, 
{"«Are other zombies as pleasant as we are?[quotation mark] asks Lucky.[line break]«No,[quotation mark] replies Isabelle, [quotation mark]they are monsters. We're something else entirely. I'd say that we're sort of a pseudozombie, having received a partially effective treatment. Your typical zombie can't talk or think, all they can do is eat brains.[quotation mark][line break]«And that's a problem?[quotation mark] asks the mouse.[line break]«Rather a big one,[quotation mark] remarks the scientist. [quotation mark]They've just about destroyed civilization![quotation mark]"}, 
{"«How is that possible?[quotation mark] asks the slice of brain.[line break]«The virulence of this virus is without precedent,[quotation mark] replies the scientist. [quotation mark]The slightest scratch is enough to transmit the virus. The first cases were reported in Cambodia and twenty-four hours later thousands of cases appeared around the world thanks to international flights. A week later: global chaos. Without electricity, food, and water, the largest cities collapsed almost immediately. Fires have swept the countryside. Only a few pockets of humanity remain.[quotation mark]"},
{"«What about animals?[quotation mark] asks the mouse. [quotation mark]Were they affected?[quotation mark][line break]«In fact,[quotation mark] replies Isabelle, [quotation mark]we think that the disease was canine in origin. Before we lost communications with the Pasteur Institute in Ho Chi Minh City, they had isolated a mutant form of rabies putatively responsible for the pandemic.[quotation mark][line break]«Rabies![quotation mark] Lucky cries, [quotation mark]There's nothing more terrifying than rabies![quotation mark][line break]«Until now,[quotation mark] corrects the slice of brain."},
{"«If zombie-ism spreads so quickly,[quotation mark] worries Lucky, [quotation mark]do you think that my family has survived?[quotation mark][line break]«Yes, I know so,[quotation mark] reassures the scientist. [quotation mark]The Drummonds work here at the installation and all staff families are housed within the compound. You're not far from them right now.[quotation mark][line break]«That's great![quotation mark] exclaims the dog."}, 
{"«Isabelle,[quotation mark] says the mouse, [quotation mark]if the cure works as expected, what will become of us?[quotation mark][line break]«In what sense?[quotation mark][line break]«Will we remain individuals with our own thoughts or do you think that we'll somehow blend together into one mind?[quotation mark][line break]«Impossible to say. Up until now, we've all lead our own separate lives. You have your memories, I have mine. But in the future, we'll see everything from the same point of view. We'll share one body and it's possible that over time we'll end up as a single mind. Can't really say right now how that will go.[quotation mark]"}, 
{"«I never wanted to be anything other than a mouse. What you say terrifies me -- that my mind might be diluted or even fade out of existence.[quotation mark][line break]«But look at the plus side,[quotation mark] says Lucky. [quotation mark]Look into my thoughts -- this is how it feels to chase a squirrel. And here's what it feel like to be scratched between the ears.[quotation mark][line break]«Yes, I suppose.[quotation mark][line break]«And here,[quotation mark] says the scientist, [quotation mark]is what Earth looks like from space -- something that no other mouse has ever seen.[quotation mark][line break]«Hmm. Impressive. And I suppose that for my part, I have some memories to share as well: the warmth of sleeping huddled with the other mice, the joy of stealing bits and scraps from around Lucky's food dispenser…[quotation mark][line break]«Hey![quotation mark] howls the dog."}, 
{"«When I saw Julien's body enter the airlock, I noticed that he was getting around with difficulty, shambling, if you will,[quotation mark] says the scientist.[line break]«Right. I know how to walk,[quotation mark] says the slice of brain, [quotation mark]but I find it infuriatingly difficult to do it.[quotation mark][line break]«The mouse doesn[apostrophe]t help,[quotation mark] whines Lucky. [quotation mark]He's always moving the legs, and I don't think he knows what he's doing.[quotation mark][line break]«Me?[quotation mark] says the mouse with indignation, [quotation mark]You're the one who's always trying to run on all fours.[quotation mark][line break]«Okay, gentlemen,[quotation mark] says the scientist, [quotation mark]Do you think I could convince you to let one of us drive at a time?[quotation mark][line break]«Yes, certainly,[quotation mark] agrees the slice of brain, [quotation mark]You have the wheel.[quotation mark]"}, 
{"«Okay[quotation mark], says the scientist. [quotation mark]I need to concentrate on how we're going to produce an effective cure.[quotation mark][line break]«Right -- enough chit-chat, fellows, let her focus,[quotation mark] suggests the slice of brain.[line break]«Right, okay,[quotation mark] say the mouse and dog."}
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"«It's done,[quotation mark] says the scientist. [quotation mark]Time for roll call: Lucky?[quotation mark][line break]«Here.[quotation mark][line break]«The Duke of Mousedom?[quotation mark][line break]«Present.[quotation mark][line break]«The slice of Julien's brain?[quotation mark][line break]«Here.[quotation mark][line break]«Good,[quotation mark] says Isabelle, [quotation mark]it sounds like we all made it safe and sound.[quotation mark]",
"«So, now we get out of here?[quotation mark] suggests the dog.[line break]«Yes,[quotation mark] says Isabelle.[line break]«But the exterior airlock door is still electronically locked. No one can open it aside from Colonel Greillier in the control room,[quotation mark] says the slice of brain.[line break]«Yes, we will need to convince him to open it,[quotation mark] agrees the scientist.",
"«That sort of surprises me, that you remember Colonel Greillier. I thought that you couldn't remember names.[quotation mark][line break]«Of the Colonel?[quotation mark] asks the slice of brain. [quotation mark]How could I forget your boss? Just last week he tumbled into our pool at his birthday party. I suppose we were all a little soused that evening.[quotation mark][line break]«Soused?[quotation mark] asks the mouse. [quotation mark]Oh, I can see it in your thoughts. Soused, huh? Looks like fun.[quotation mark][line break]«Hang on a minute, mouse.[quotation mark] says Isabelle, [quotation mark]Julien, you just expressed a complicated thought. Do you think your memory is returning?[quotation mark][line break]«Hmph. How could I know?[quotation mark]",
"«Julien,[quotation mark] says the scientist, [quotation mark]What did you give me as a gift our first Christmas?[quotation mark][line break]«Gloves?[quotation mark][line break]«And they were… [quotation mark][line break]«Far too large for you! Yes, I had bought them for my brother, but when you gave me a present and I didn't have anything for you… yes, um, are you still upset about that?[quotation mark][line break]«No, not really. I was just testing your memory.[quotation mark]",
"«Give me another test![quotation mark][line break]«Okay. What do you call me when we're all alone?[quotation mark][line break]«Isabelle?[quotation mark][line break]«No, think! When it's just the two of us… [quotation mark][line break]«I'd rather not say in front of Lucky and the mouse.[quotation mark][line break]«Oh, come on,[quotation mark] says the dog. [quotation mark]We're all sharing one mind now; there aren't any real secrets here.[quotation mark][line break]«Very well,[quotation mark] says Julien, still a bit hesitant, [quotation mark]I call you my bunny rabbit.[quotation mark][line break]«Bunny?[quotation mark] says the mouse. [quotation mark]She used to be a rabbit? Now I am totally confused.[quotation mark]",
"«Good, Julien, it seems to me that you're on the road to recovering your memory,[quotation mark] says the scientist.[line break]«You think so? Even though you said that I'm just a little slice of brain? Is it possible that these memories aren't really mine, but I'm just reading them from your thoughts?[quotation mark][line break]«I would have to say that a little slice of brain wouldn't be capable of proposing such an elaborate hypothesis. It seems to me your whole brain is now back at work.[quotation mark]",
"«But, if I understood you correctly,[quotation mark] says Lucky, [quotation mark]you said that the virus completely wipes zombie brains, leaving nothing.[quotation mark][line break]«Yes, that is what I said,[quotation mark] admits the scientist, [quotation mark]but we've never had a case like this one to study. I'd say it's time to revise our understanding about what's going on. It seems that the brain isn't destroyed, but rather that higher thought processes are suppressed. The neural pathways are still intact. In fact, that has to be the case: our very existence is a matter of piggy-backing on those pathways.[quotation mark]",
"«That's great![quotation mark] says Julien. [quotation mark]Then, we can restore all the zombies![quotation mark][line break]«My God, Julien, you're right. We haven't lost them,[quotation mark] replies the scientist. [quotation mark]For the first time, there's a chance that we could put the world back on its feet and end this nightmare.[quotation mark][line break]«Even the sick dogs?[quotation mark] asks Lucky.[line break]«Yes, including dogs and every other species infected by the virus,[quotation mark] replies the scientist.",
"«So, now what?[quotation mark] asks the mouse.[line break]«Julien,[quotation mark] says Isabelle, [quotation mark]we have to talk with the Colonel and convince him that you're cured and that we now have a way to reverse the damage caused by the virus.[quotation mark][line break]«Okay, I'll do my best,[quotation mark] says Julien.[line break]«Onward, comrades![quotation mark] cries the mouse."
}.

Chapter 15 - The Void

The void is a room.

The small gray creature is an edible thing. It is in the void. The printed name of the small gray creature is "маленькое серое существо".

The bloody corpse of Docteur Rambaud is a thing in the void. The printed name of the bloody corpse of Docteur Rambaud is "окровавленный труп доктора Рамбо".

The intercom is a buttoned thing in the void. The intercom can be live. The intercom is not live. The printed name of the intercom is "переговорное устройство".

Instead of pushing the intercom:[only present at consciousness 4]
	if the intercom is not live:
		say "На переговорном устройстве загорается маленький красный светодиод, показывающий, что линия связи с комнатой управления включена.";
		now the intercom is live;
	otherwise:
		say "You have already activated the intercom; the red LED is still on."

The panneau électrique is an openable closed container in the void. The printed name of the panneau électrique is "electrical panel".

The disjoncteurs are in the panneau électrique. The disjoncteurs are plural-named. The disjoncteurs are broken. The printed name of the disjoncteurs is "[if the disjoncteurs are broken]flipped[otherwise]reset[end if] circuit breakers".

Instead of touching the disjoncteurs:
	say "You reset the circuit breakers";
	now the disjoncteurs are not broken;
	if the servo motor is broken:
		say ".[paragraph break]There's a sharp clicking sound from the electrical panel and you notice that the circuit breakers have again tripped";
		now the disjoncteurs are broken;
	say "."

The microfluidic synthesis unit is an openable closed container in the void. The printed name of the microfluidic synthesis unit is "microfluidic synthesis unit".

The servo motor is in the microfluidic synthesis unit. The servo motor is broken. The printed name of the servo motor is "[pnServo]". 

To say pnServo:
	say "servo motor";
	if the servo motor is not broken:
		say " that you have repaired".

After opening the microfluidic synthesis unit:
	say "You open the service panel and immediately recognize the problem: a fleck of solder has fallen across the terminals of a servo motor, shorting it out."
	
Instead of touching the servo motor:
	now the servo motor is not broken;
	say "You brush aside the bit of solder. The machine should work normally now, when powered up."

Chapter 16 - End Game

To terminate the game:
	remove all elements called "vorple-link";
	say "[VictoryText]";
	infos;
	credits;
	[to prevent players bypassing CSS from continuing past this point]
	now the knownCommands of the player is 0.
	
To say VictoryText:
	say "[paragraph break]        *** YOU HAVE WON ***[roman type][paragraph break]You have saved the world from the scourge of the zombie777 virus.[paragraph break]".
	
To infos:
	say "[bold type]>about[roman type][line break]This game was originally created as part of the ";
	place a link to web site "http://www.fiction-interactive.fr/concours/concours-2018/" reading "2018 French Interactive Fiction Competition";
	say ". The English translation of the game was submitted to the ";
	place a link to web site "https://ifcomp.org/" reading "2018 IFcomp";
	say ". The game was written in ";
	place a link to web site "http://inform7.com/" reading "Inform 7";
	say ". The source code is available on ";
	place a link to web site "https://github.com/dhakajack/web-engarde" reading "github";
	say " and is provided under ";
	place a link to web site "https://github.com/dhakajack/web-engarde/blob/master/LICENSE" reading "MIT license";
	say ". Please report any errors using the ";
	place a link to web site "https://github.com/dhakajack/web-engarde/issues" reading "online bug tracker";
	say ".[paragraph break]";
	
To credits:
	say "[bold type]>credits[roman type]";
	open HTML tag "ul";
	open HTML tag "li";
	say "Organizers of both competitions.";
	close HTML tag;
	open HTML tag "li";
	place a link to web site "http://www.ifwiki.org/index.php/Graham_Nelson" reading "Graham Nelson";
	say " for having conceived and written Inform.";
	close HTML tag;
	open HTML tag "li";
	say "Authors of the extensions used in this work and its previous versions : ";
	place a link to web site "http://www.ifwiki.org/index.php/Eric_Forgeot" reading "Éric Forgeot";
	say ", ";
	place a link to web site "http://www.ifwiki.org/index.php/Emily_Short" reading "Emily Short";
	say ", ";
	place a link to web site "http://www.ifwiki.org/index.php/Erik_Temple" reading "Erik Temple";
	say ", and ";
	place a link to web site "http://www.ifwiki.org/index.php/Juhana_Leinonen" reading "Juhana Leinonen";
	say ".";
	close HTML tag;
	open HTML tag "li";
	place a link to web site "http://www.ifwiki.org/index.php/Ben_Collins-Sussman" reading "Ben Collins-Sussman";
	say ", who painted the cover.";
	close HTML tag;
	open HTML tag "li";
	say "Proofers and beta-testers: ";
	place a link to web site "http://www.ifwiki.org/index.php/Eric_Forgeot" reading "Éric Forgeot";
	say ", ";
	place a link to web site "http://www.ifwiki.org/index.php/St%C3%A9phane_Flauder" reading "Stéphane Flauder";
	say ", Denise Jobin, ";
	place a link to web site "http://www.ifwiki.org/index.php/Mathbrush" reading "Brian Rushton";
	say ", and ";
	place a link to web site "http://www.ifwiki.org/index.php/Hugo_Labrande" reading "Hugo Labrande";
	say " (original version). Lara Welch, ";
	place a link to web site "http://www.ifwiki.org/index.php/Ben_Collins-Sussman" reading "Ben Collins-Sussman";
	say " (English version).";
	close HTML tag;
	open HTML tag "li";
	place a link to web site "http://www.fiction-interactive.fr/author/corax/" reading "Corax";
	say " for suggestions regarding accessibility.";
	close HTML tag;
	close HTML tag;
	say "[bold type]FIN."
	
Chapter 17 - Testing

Test me with "east / west / eat /east / open / north / open / eat / push / south / push /east / push / west / south / open / eat / eat / eat / north / open / north / open / open / eat / south / west / unlock / open / west / unlock / open / north / north / unlock / open / north / talk / talk / talk / talk / talk / eat / south / south / south /east / push /east / push / west / unlock / open / south / open / repair / north / push /east / push / west / west / north / open / repair / south /east / push /east / push / west / south / north / push /east / push / west / west / north / north / north / push / talk / talk / talk /  talk ".

Test full with "east /east / west / west / eat /east / west / open /east / open / north / south / west / south /east / north / z / z / z / z / z / z / z / z / z / z / z / eat / open / eat / push / eat / north / south / west / west /east /east / push /east / push / west / west / south / open / push / eat / eat / eat / eat / north / west / north / north / open / north / eat / push / open / open / eat / south / south / open / push / north / west / unlock / west / open / west / north / unlock / north / open / north / north / north / north / unlock / north / open / north / eat / eat / eat / eat / eat / eat / push / unlock / north / talk / talk / talk / talk / talk / talk / eat / talk / push / talk / push / push / talk / north / south / south / south / open / repair / open / repair / push / south /east / south / push / open / eat / north / north / repair / south / push /east / push / west / west /east / north / push / eat / repair / south / south / unlock / open / south / repair / open / repair / north / push /east / push / west / west / north / open / repair / south /east /east / push /east / push / west / south / repair / north / push /east / push / west / south / north / west / north / north / north / eat /talk / push / talk / talk / south / north / talk / talk ".