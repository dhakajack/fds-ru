"FDS-RU" by Jack Welch

The story headline is "Рыцарь без мозга и упрека".
The story genre is "horror".
The release number is 1.
The story creation year is 2018.
The story description is "The one thing you don't miss is memory."

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.

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
	say "Рассказ: Джек Уэлч[line break]";
	say "Перевод: Валентин Коптелцев[line break]";
	say "Выпуск [release number] / Серийный Номер 180225 / Информ 7 вариант 6M62 (I6/v6.33 lib 6/12N)[line break]".
	

Rule for listing nondescript items:
	let L be a list of things;
	say "Ты видишь здесь ";
	repeat with item running through things in the location:
		if the item is a person or the item is a door:
			next;
		add item to L;
	repeat with N running from 1 to the number of entries in L:
		if N is greater than 1 and N is the number of entries in L:
			say " et ";
		let E be entry N of L;
		say "[an E]";
		if E is open and E contains exactly one thing:
			say " (contenant [a random thing in E])";
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
"[line break][italic type]Где я? И вообще, кто я?[roman type][paragraph break]Ты просыпаешься в одиночестве в пустой синеватой комнате.[paragraph break]","[italic type]Почему я не могу ничего вспомнить?[paragraph break]Мне надо сконцентрироваться! Что случилось? Давай, думай! Думай же![paragraph break]Как бы то ни было, здесь я ответов не найду -- мне придется осмотреть окрестности.[roman type]"
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
			say "This door is secured with an electronic lock.";
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
			say "Опа, здесь кровь -- в этой огромной синей комнате с металлическими стенами.";
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
			say "The torture chamber";
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
			say "Коридор, ведущий из моего уютного убежища на севере к комнате ужасов на западе. На восточной стене сияет красная кнопка";
			say "[liftDoorDogStatus]";
		-- 3:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east";
		-- 4:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". A red button shines on the wall to the east";
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

	
The cage is an openable closed container in the Laboratoire Zoologique. The printed name of the cage is "клетку[if the cage is closed]  (она закрыта)[end if]".

The chien is an edible thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]wolf[otherwise]dog[end if]". The chien can be dead. The chien is not dead. 

The animal body is a thing. It is in the void.

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
		say "doors close silently behind you";
	say " .".
	
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
			if Laboratoire de Pathologie is visited:
				tell kitchenDogDesc;
			otherwise:
				say "Обычная кухня с темной отделкой.";
		-- 3:
			say "Здесь исследователи готовят препараты для рассматривания под микроскопом.[paragraph break]Ты узнаешь микротом и печь СВЧ, но назначение всего остального расставленного на столах оборудования остается непонятным.";
		-- 4:
			say "Ультрасовременная лаборатория для подготовки препаратов и исследования образцов тканей".
			
The list of text called kitchenDogDesc is always { 
"Это помещение напоминает тебе о лучших временах в кругу твоей семьи -- до того, как тебя похитили. Судя по столам, уставленным"," едой полкам, раковинам и странным большим приборам, ты можешь без всякого сомнения утверждать, что это самая важная комната во всем доме: кухня"
}
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]". 

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "холодильник";
		-- 3:
			say "freezer";
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
"[italic type][quotation mark]Ммммм![quotation mark] говорит Лаки и облизывается.[line break][quotation mark]Чему это ты так обрадовался?[quotation mark][line break]","[quotation mark]Видишь вон тот здоровенный ящик? Вот он действительно волшебный: это холодильник![quotation mark][line break][quotation mark]Мы забираемся в холодильник, чтобы попасть в другое место?[quotation mark][line break]","[quotation mark]Нет, мы едим то, что внутри![quotation mark][roman type][paragraph break]"
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
"Войдя в санузел, ты замечаешь краем глаза какое-то движение.[paragraph break][italic type]Кто здесь?[roman type][paragraph break]","Коренастый мужчина в рваной униформе смотрит на тебя немигающим взглядом. Его бледная кожа, слезящиеся глаза и ввалившиеся щеки навевают мысли об ожившем мертвеце.[paragraph break]","Несколько минут вы играете в гляделки, пока до тебя, наконец, доходит, что ты смотришь на собственное отражение в зеркале."
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
			say "The showerheads are aimed at the center of a room bathed continuously in a deep, purple light";
		-- 4: 
			say "The high pressure nozzles that ring the room are designed to hose down personnel with an antiseptic solution as they come and go from potentially contaminated zones within the complex. The room is continuously illuminated by germicidal lights";
	say ". Doors lead eastward to the hallway and northward to the stairs"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "The showers";
		-- 4:
			say "Decontamination room".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "door to the showers";
		-- 4:
			say "decontamination suite door".
			
Instead of simplePushing when the player is in the Salle de Décontamination:
	if the consciousness of the player is:
		-- 3:
			say "You relax in the warm, gentle shower. After a moment, the shower stops spraying and you dry off.";
		-- 4:
			say "The personnel decontamination system blasts you with a phenolic-smelling spray.".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Stairway (first level)".

The esc1door is a locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "door between the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room and the stairs".

To say descEscalier1:
	say "The stairway climbs to the north and connects the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room to the south with the rest of the installation above".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "You climb the stairs towards the north".
	
To say downSouth:
	say "You go down the stairs southwards".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Stairway (second level)".

To say descEscalier2:
	say "The stairs go up towards the north and connect the lower set of stairs to the south with the airlock to the north".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Airlock".

The sasDoor is a locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "armored airlock door".

The scientist is an edible thing in the sas. The scientist has a truth state called introducedFlag. The introducedFlag of scientist is false. The scientist has a number called conversations. The conversations of the scientist is 0.

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "A long, tubular room bathed in red light";
		-- 4:
			say "The heavy armored doors, lack of windows, and tubular shape of the room remind you of a submarine. The light above the door at the other end of the room is red, signaling that the exterior door is locked";
		say ". The stairs downward are behind you, to the south".
			
Instead of going north when the player is in the sas:
	if scientist is in the sas:
		say "You would need to get past the scientist and she doesn't appear to be all that cooperative. More over, since you don't know the code to open the outer door, it wouldn't make much sense to try.";
	otherwise:
		say "Useless. The door is hermitically sealed and can only be opened by someone in the control room."
			
Before eating scientist when the conversations of scientist are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]The scientist beats you back with her crowbar. Once out of reach of your slavering maw, she presses a button on the intercom and says, [quotation mark]Attention, control room, this is Doctor Rambaud in the airlock. Julien is here with me. Unfortunately, I have to report that the experiment has failed. Don't unlock the outer door no matter what.[quotation mark][line break][or]Doctor Rambaud does not budge from behind the desk, but as you approach she lands a series of blows with her crowbar that makes you reconsider your actions.[or]The scientist acknowledges, [quotation mark]I have to give you credit for your perseverance, but… [quotation mark] and she whacks you solidly on the nose. Stunned, you stagger back out of reach of her crowbar.[or]Doctor Rambaud beats you repeatedly with the crowbar.[stopping]";
	stop the action.
	

Chapter 10 - Verbs

Section 1 - simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Ты вводишь код на цифровой клавиатуре и слышишь, как замок ведущей на [way] двери отпирается.[no line break]";
			if the number of entries in unlockText is greater than zero:
				now the BlockChatterFlag is true;
				tell unlockText;
			say paragraph break;
	stop the action;
	say "You don't see any locked door."
	
The list of text called unlockText is always {
"[paragraph break][italic type][quotation mark]Постой-ка минутку[quotation mark] [unicode 8212] просит пес. [unicode 8212] [quotation mark]Что это был за фокус?[quotation mark][line break]","[quotation mark]Эти двери с электронными замками отпираются, если ввести правильный код.[quotation mark][line break][quotation mark]И ты его помнишь?[quotation mark] [unicode 8212] удивляется Мыш.[line break][quotation mark]Как видишь[quotation mark].[roman type]"
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
	say "Ты открываешь  [the item]";
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
			say "[one of]Speaking into the intercom, you explain your plan. The director of the installation grabs the microphone and wishes you good luck. Beyond that, he instructs you report back when you have succeeded. Short of that, though, he requests that you not use the intercom[or]The control room refuses to talk to you until you have a proven cure in hand[stopping]. They hang up on you and the intercom goes dark.";
			now the intercom is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					say "[quotation mark]Control room, Professor Drummond speaking.[quotation mark][line break][quotation mark]It's me, your dog, Lucky! I'm in the airlock! I am so happy to hear your voice![quotation mark][line break][quotation mark]Um. Huh? Are you messing with me? The intercom is only for official communications. Who is this?[quotation mark][paragraph break][italic type][quotation mark]It's him! It's the father of my family,[quotation mark] says Lucky.[line break][quotation mark]Calm down, Lucky,[quotation mark] insists the scientist. [quotation mark]Please let Julien do the talking.[quotation mark][roman type][paragraph break][quotation mark]Excuse me,[quotation mark] says Julien. [quotation mark]I can explain everything. I am Julien Truffaut.[quotation mark][line break][quotation mark]The guard?[quotation mark][line break][quotation mark]Yes.[quotation mark][line break][quotation mark]Impossible. Doctor Rambaud said that he had turned. Zombies can't talk. I don't have time for your crap, now get off the line.[quotation mark][paragraph break]";
				-- 2:
					say "[quotation mark]I'm not joking,[quotation mark] pleads Julien. [quotation mark]Doctor Rambaud has cured me.[quotation mark][line break][quotation mark]Okay, enough,[quotation mark] answers the professor. [quotation mark]If she's there, put her on.[quotation mark][line break][quotation mark]She is… occupied… at the moment.[quotation mark] While you are speaking, you drag the scientist's lifeless body around the corner to the stairwell.[paragraph break][quotation mark]Listen,[quotation mark] you continue, [quotation mark]if you don't believe me, turn on the surveillance cameras in the airlock. You'll be able to see me.[quotation mark][line break][quotation mark]Okay, give me a sec.[quotation mark][paragraph break]";
				-- 3:
					say "[quotation mark]Do you see me?[quotation mark] you ask.[line break][quotation mark]Yes. Got you on the screen. But how can you still be alive? I thought you'd been infected by the virus.[quotation mark][line break][quotation mark]Well, yes, you're right, but as I told you…[quotation mark][paragraph break][italic type][quotation mark]Let me explain,[quotation mark] interrupts the scientist.[roman type][paragraph break][quotation mark]Doctor Rambaud prepared a cure using the microfluidic biosynthesis workstation following protocol M13 as she discussed with you previously. My neural pathways were restored and I am entirely cured.[quotation mark][line break][quotation mark]Okay… But that would mean… this could be it. An end the pandemic![quotation mark][line break][quotation mark]Right. We need to move on this quickly.[quotation mark][paragraph break]";
				-- 4: 
					say "You request to speak to the director of the entire research complex, Colonel Greillier, and you relate everything that has happened, leaving out, for now, some of the details suggested by Lucky and the mouse.[paragraph break]After a couple hours of discussion and some blood tests, the colonel is convinced and orders that the airlock doors be unsealed, permitting you to exit. ";
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientist by 1;
		if the conversations of scientist is:
			-- 1:
				say "You start babbling incoherently, the words refusing to come. As the sounds trip off your tongue, the scientist stares at you incredulously.[paragraph break][quotation mark]Is it possible?[quotation mark] she asks. [quotation mark]Are you still capable of speaking somehow?[quotation mark][line break][quotation mark]Yes,[quotation mark] you groan painfully, [quotation mark]I… speak.[quotation mark][line break][quotation mark]Incredible! It's a miracle, Julien. What do you remember?[quotation mark][paragraph break][italic type][quotation mark]Julien? Who's Julien?[quotation mark] asks Lucky.[line break][quotation mark]Not me,[quotation mark] says the mouse. [quotation mark]Maybe the name belongs to our buddy, the slice of brain?[quotation mark][line break][quotation mark]I don't recall, but sure, I guess I could be this Julien. I mean, why not?[quotation mark][roman type][paragraph break][quotation mark]Nothing. I don't remember a thing… Julien… that's me?[quotation mark][line break][quotation mark]Yes, Julien. It's you. And I'm your Isabelle. Isabelle Rambaud,[quotation mark] replies the scientist in a disappointed tone.[paragraph break]";
			-- 2:
				say "[italic type][quotation mark]She has pretty eyes (for a giant),[quotation mark] remarks the mouse.[line break][quotation mark]Shut up,[quotation mark] say the slice of brain and Lucky in unison.[roman type][paragraph break]You force yourself to form the words, one after another.[paragraph break][quotation mark]What are we doing here?[quotation mark][line break][quotation mark]Listen, Julien, I don't have much time. I am a medical researcher and you are a guard. We both work at an installation dedicated to finding a cure for the zombie777 virus, which has devastated the entire world.[quotation mark][line break][quotation mark]A guard?[quotation mark][line break][quotation mark]Yes. Pay attention, Julien, this is important. A crowd of pandemic victims surrounded the lab complex and you were protecting me when you were scratched by one of them. I had to give you the experimental treatment to prevent you from turning into a zombie.[quotation mark][line break][quotation mark]So, I'm cured?[quotation mark][line break][quotation mark]No, not even close.[quotation mark][paragraph break]";
			-- 3:
				say "[quotation mark]So, the treatment didn't work?[quotation mark] you ask.[line break][quotation mark]No, not entirely it would seem. I had a problem with the microfluidic biosynthesis unit that produced the dose I gave you. I think that one of the ingredients must have been left out of that batch. I was trying to repair the unit when you caught me off guard. You attacked me, but I managed to hole up here in the airlock. So. That's where things stand.[quotation mark][line break][quotation mark]Sorry.[quotation mark][line break][quotation mark]It wasn't you. You were a full-blown zombie at the time. But… how is it that now you're able to talk? I've never heard of a zombie that could talk -- it just doesn't happen.[quotation mark][paragraph break]";
			-- 4:
				say "[quotation mark]It's really hard for us to talk.[quotation mark][line break][quotation mark]Naturally, your neural pathways are in a state of… hold on… what do you mean, [apostrophe]us[apostrophe]?[quotation mark][paragraph break][italic type][quotation mark]Tell her about me,[quotation mark] implores the mouse, full of excitement.[line break][quotation mark]And about me![quotation mark] adds Lucky.[roman type][paragraph break][quotation mark]Yeah. About that. I said [apostrophe]us[apostrophe] because there are three minds in my head: a mouse, a dog named Lucky, and a slice of brain. We work together as best we can to get around and talk.[quotation mark][line break][quotation mark]Well.[quotation mark] She stares a moment at the ceiling to gather her thoughts. [quotation mark]Well, I suppose that explains everything. Your brain was rebooted, more or less erased by the virus, but somehow you have managed to sort of reload it with normal brains. That slice of brain that you mentioned must have been the biopsy that I took from Julien before the virus had invaded that part of his brain.[quotation mark][paragraph break]";
			-- 5:
				say "[quotation mark]So, we're well and truly screwed?[quotation mark] you say.[paragraph break][italic type][quotation mark]Totally,[quotation mark] whines the mouse.[line break][quotation mark]Yeah, I'd say so,[quotation mark] agrees Lucky.[roman type][paragraph break][quotation mark]Maybe not… [quotation mark][line break][quotation mark]You have an idea?[quotation mark][line break][quotation mark]Yes, I think so. Do exactly what I say: I don't have long for this world. I can't even feel my legs; it's only a matter of time. However… if you eat my brain -- hang on, not yet! Let me finish talking -- thanks. As I was saying, if you eat my brain, my personality will meld with all of yours. You are still actively infected with the virus and in time it will destroy what's left of your brain, but the infection seems to have been slowed by the first treatment, even if it wasn't completely effective. If there's enough time, I can repair the synthesis unit and we can try one more time to produce a cure for the virus. If we succeed, I can live on in you, along with your thoughts.[quotation mark][line break][quotation mark]So, I should eat your brain now?[quotation mark][line break][quotation mark]Go for it.[quotation mark][paragraph break]";
			-- otherwise:
				say "There's nothing more to say."
									
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
	say "Ты проскальзываешь в волчье логово – это место неплохо тебе знакомо, но всё равно вызывает ужас.";
	try looking;
	say "Волк, как обычно, заперт в железной клетке, так что ничто не мешает тебе исследовать помещение, держась подальше от его хищных клыков.";
	increment the knownCommands of the Player.
	
After opening the cage:
	say "Ты открываешь клетку, но волк благоразумно остается внутри, продолжая наблюдать за тобой."
	
After eating the chien:
	now the chien is dead;
	now the animal body is in the cage;
	tell ateDog;
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
"[line break]Заглотив кусок мозга, ты машинально отмечаешь, что вкус у него был какой-то странноватый.[paragraph break]Несколько минут ничего не происходит, и ты начинаешь думать,"," что теперь можешь есть что угодно, не опасаясь последствий.[paragraph break]Внезапно мир взрывается фейерверком, наполняясь вместо мутных полутонов яркими сияющими цветами. ","Тебя словно пронзает электрический разряд, и ты, потеряв ориентацию, падаешь на пол. ","Когда спустя некоторое время ты встаешь, в ход твоих мыслей вклиниваются совершенно новые представления, и ты видишь всё в ином свете."
}

The list of text called patrolText is always {
"[italic type][quotation mark]Нам пора отправляться патрулировать[quotation mark] [unicode 8212] командует новый голос.[line break]","[quotation mark]Патрулировать? Что это значит?[quotation mark] [unicode 8212] -- спрашивает мышь.[line break]","[quotation mark]Ну, это значит обойти каждый уголок и обеспечить безопасность здания[quotation mark], [unicode 8212] отвечает голос.[line break]","[quotation mark]Люблю прогулки![quotation mark] [unicode 8212] с энтузиазмом заявляет Лаки.[roman type][line break]"
}

	
After going north from Escalier 2 when the sasDoor is not closed for the first time:
	now the BlockChatterFlag is true;
	say "A women in her forties, dressed in a white lab coat sits behind a metal desk. She is half way between you and the door at the other end of the room. Her upper right arm is swathed in gauze, but the bandages are drenched in blood and she appears gravely injured. In her other hand, she brandishes a crowbar with determination.";
	try looking;
	say "She stares at you warily.";
	increment the knownCommands of the player.
	
After eating scientist:
	now the BlockChatterFlag is true;
	say "[line break]You eat the scientist's brain and immediately perceive the world from a more refined and erudite perspective.[paragraph break][italic type][quotation mark]Is it done?[quotation mark] asks the voice of Isabelle with hesitation.[line break][quotation mark]Yes, you were delicious,[quotation mark] compliments the mouse.[line break][quotation mark]The best yet,[quotation mark] adds Lucky.[line break][quotation mark]Excuse my co-brains, they are sorely lacking in tact,[quotation mark] interjects the slice of brain.[line break][quotation mark]Hey![quotation mark] complain the mouse and dog.[line break][quotation mark]Make yourself at home, Isabelle,[quotation mark] continues the slice of brain. [quotation mark]Let me present our little company: here's Lucky the dog, and that's the Duke of Mousedom (or just [apostrophe]the mouse[apostrophe], as he's rather modest), and me. I'm the one they call [apostrophe]slice of brain[apostrophe]. We are at your service.[quotation mark][line break][quotation mark]Good morning, boys,[quotation mark] says Isabelle warmly.";
	move the bloody corpse of Docteur Rambaud to the sas;
	move the intercom to the sas;
	move the panneau électrique to escalier 1;
	move the microfluidic synthesis unit to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
		
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
					say "[italic type][quotation mark]";
					tell entry 1 of mouseDogDialogue;
					say "[quotation mark][roman type][paragraph break]";
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
						say "[italic type][entry 1 of EverybodyDialogue][roman type][paragraph break]";
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
"Мне явно чего-то хочется, но вот чего – никак не пойму.",
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
{"Мышь? Что еще за мышь?[quotation mark][line break][quotation mark]Мышь, которая здесь живет.[quotation mark][line break][quotation mark]Та самая проклятая мышь, которая постоянно тырит крошки вокруг моей кормушки?[quotation mark][line break][quotation mark]Да, именно так. Еще раз – я просто хотел извиниться, если расстроил тебя."},
{"Не переживай из-за этого. На твоем месте я поступил бы так же.[quotation mark][line break][quotation mark]Спасибо.[quotation mark][line break][quotation mark]Скажи, мышь, у тебя есть имя?[quotation mark][line break]","[quotation mark]Нет, мы, мыши, обходимся без имен. Так что можешь звать меня просто Мышью, точнее – „Мышом[quotation mark]. Ну, а тебя как звать?[quotation mark][line break]","[quotation mark]„Lucky[quotation mark]. Ну, по крайней мере так называли меня в моей семье, пока я не попал сюда. Местные живодеры называют меня „Объект 205-Альфа[quotation mark], но „Лаки[quotation mark] мне как-то больше нравится.[quotation mark][line break][quotation mark]Хорошо, Лаки."},
{"Мыш, ты можешь мне кое-что объяснить? Как так получилось, что ты, крошечная мышка, проглотил меня – крупного, сильного пса, в десятки раз превосходящего тебя в размерах?[quotation mark][line break]","[quotation mark]Ты знаешь, я задавался тем же вопросом. Постой-ка -- ты сказал «пес»? Я думал, ты волк![quotation mark][line break][quotation mark]Нет, я собака.[quotation mark][line break][quotation mark]Ты уверен?[quotation mark][line break][quotation mark]Да, вполне."},
{"Никак не могу догадаться, как же я тебя съел.[quotation mark][line break][quotation mark]Ты что-нибудь об этом помнишь?[quotation mark][line break][quotation mark]Я неожиданно почувствовал непреодолимое желание съесть мозги.[quotation mark][line break][quotation mark]Мозги? Что за мозги?[quotation mark][line break][quotation mark]В данном случае твои.[quotation mark][line break][quotation mark]А, понятно… Точнее, ничего не понятно."},
{"Мыш, ты всегда здесь жил?[quotation mark][line break][quotation mark]Мы обитаем здесь много поколений, это наше родовое гнездо. Мы охраняем его от посягательств всяких захватчиков. Мыши-полевки – это сплошь бандиты, гопники и воры.[quotation mark][line break]","[quotation mark]Ты когда-нибудь видел мир снаружи?[quotation mark][line break][quotation mark]У меня нет ни малейшего желания. Конечно, мне рассказывали там про небо, облака всякие, поля и тому подобное, но меня это не интересует."},
{"А у тебя как, Лаки? Ты вроде говорил про семью. У тебя есть жена? Мы, мыши, не особо верим в брак, но я слыхал, что собаки в этом отношении более консервативны.[quotation mark][line break]","[quotation mark]Семья, да, но не жена (хотя соседская пуделиха… ну ладно, это другая история). Нет, когда я говорю про семью, то имею в виду семью людей."},
{"Ты был у них в рабстве?[quotation mark] [unicode 8212] спрашивает Мыш.[line break]","[quotation mark]Да нет, ну что ты. Я играл с детьми, они меня кормили, дни напролет ласкали и гладили меня, у меня даже кровать своя была.[quotation mark]","[line break][quotation mark]Ты выдумываешь. Никогда ничего подобного не видел. Люди не выносят животных [unicode 8212] они так и норовят раздавить нас ногой."},
{"Да ты просто вообще ничего не знаешь о людях[quotation mark], [unicode 8212] заключает Лаки.[line break]","[quotation mark]Что характерно [unicode 8212] и знать не хочу, благодарю покорно.[quotation mark][line break]","[quotation mark]Тебе бы понравилась моя семья[quotation mark].[line break][quotation mark]В таком случае, разреши поинтересоваться, что же заставило тебя покинуть такую замечательную семью?[quotation mark][line break]","[quotation mark]NНе то чтобы я ушел от них специально. Мы гуляли в лесу, я увидел белку, а дальше ты сам можешь всё себе представить. С тех пор я их не видел[quotation mark].[line break]","[quotation mark]Только не говори мне про белок. Они еще хуже полевок."},
{"Лаки, как ты думаешь, ты найдешь свою семью?[quotation mark][line break][quotation mark]Очень на это надеюсь.[quotation mark][line break]","[quotation mark]Я тоже. Мы бы с тобой показали этим белкам[quotation mark][line break][quotation mark]Ага, это было бы круто."}
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of lists of text that varies. 

mouseDogGuardDialogue is { 
{"[quotation mark]Разреши задать вопрос[quotation mark], [unicode 8212] начинает Мыш,  [unicode 8212] [quotation mark]кто ты, собственно, такой?[quotation mark][line break]","[quotation mark]Меня зовут... эээ... как же его... секундочку... мда, хороший вопрос. Похоже, я не могу сейчас вспомнить свое имя. Почему бы вам не придумать его самим?[quotation mark][line break]","[quotation mark]Давай назовем его „маленький кусочек мозга, который мы нашли в холодильнике и у которого был странноватый вкус[quotation mark], [unicode 8212] предлагает Лаки.[line break]","[quotation mark]Нет, это слишком длинно. Давай просто назовем его „Мозголомтиком[quotation mark]. Как тебе такое имя?[quotation mark]","[line break][quotation mark]Подойдет[quotation mark], [unicode 8212]  соглашается Мозголомтик. [unicode 8212]  [quotation mark]С учетом всех обстоятельств я предпочитаю короткие имена.[quotation mark]"},
{"[quotation mark]Ребят, а у вас есть имена?[quotation mark] [unicode 8212] спрашивает Мозголомтик.[line break]","[quotation mark]Да[quotation mark], [unicode 8212] отвечает пес. [unicode 8212] [quotation mark]Извини, что пренебрегли этикетом. Меня зовут Лаки, а моего друга мышь можно просто звать Мышом.[quotation mark][line break]","[quotation mark]Именно[quotation mark], [unicode 8212] подтверждает мышь[line break][quotation mark]Друзья, очень приятно с вами познакомиться.[quotation mark]"}, 
{"[quotation mark]Ну, Мозголомтик, расскажи, каким животным ты был до того, как попал сюда. Я был собакой, а Мыш всегда был мышью.[quotation mark][line break]","[quotation mark]Я был кем-то другим, чем кусочек мозга?[quotation mark][line break]","[quotation mark]Мне кажется, ты был холодильником[quotation mark],  [unicode 8212] высказывает предположение Мыш. [unicode 8212] [quotation mark]Я съел мозг собаки, и появился Лаки. После этого мы открыли холодильник и съели его содержимое, и появился ты[quotation mark].[line break]","[quotation mark]Сомневаюсь, что это работает именно так[quotation mark], [unicode 8212] вполголоса замечает Лаки."}, 
{"[quotation mark]Когда ты появился, ты сказал, что нам надо „обеспечить безопасность здания[quotation mark]. Что ты имел в виду?[quotation mark] [unicode 8212] спрашивает Лаки.[line break]","[quotation mark]Я имел в виду, что мы должны осмотреть всё здание, чтобы обеспечить защиту от любых угроз.[quotation mark][line break]","[quotation mark]Хорошo[quotation mark], [unicode 8212] говорит Мыш, стараясь не терять нить беседы, [unicode 8212] [quotation mark]но что ты имеешь в виду под зданием?[quotation mark]","[line break][quotation mark]Здание? Ну, это комплекс... точнее, это место, где все работают... Хм... В общем, это то, где мы есть[quotation mark], [unicode 8212] заключает Мозголомтик."}, 
{"[quotation mark]О каких угрозах ты говоришь?[quotation mark] [unicode 8212] спрашивает мышь.[line break]","[quotation mark]Если честно, я не помню[quotation mark], [unicode 8212] вздыхает Мозголомтик. [unicode 8212] [quotation mark]Просто рехнуться можно! Я не могу их вспомнить, но я уверен, что их полным-полно и одна хуже другой.[quotation mark][line break]","[quotation mark]Ты знаешь, похоже, у тебя паранойя[quotation mark], [unicode 8212] замечает пес.[line break]","[quotation mark]Всё может быть, но если бы я мог вернуть свои воспоминания... Нет, боюсь, они утрачены[quotation mark]."}, 
{"[quotation mark]Думаешь, мы можем как-нибудь вернуть твои воспоминания?[quotation mark] [unicode 8212]  интересуется Лаки.[line break]","[quotation mark]Как бы мы это сделали? Я пытался вспомнить самые разные вещи, но ничего в голову не приходит[quotation mark].[line break]","[quotation mark]Возможно, это потому, что ты просто маленький кусочек мозга[quotation mark], [unicode 8212] замечает Мыш. [unicode 8212]  [quotation mark]Если бы нам удалось найти оставшуюся часть твоего мозга [unicode 8212] ","а она, не исключено, находится где-то здесь [unicode 8212] мы бы могли съесть ее и восстановить твою потерянную память, не так ли?[quotation mark][line break]","[quotation mark]Ты и вправду так думаешь?[quotation mark] [unicode 8212] недоверчиво переспрашивает Мозголомтик.[line break]","[quotation mark]Даже не сомневайся[quotation mark],  [unicode 8212] подтверждает пес."}, 
{"[quotation mark]Но что, если оставшийся мозг найдет нас до того, как мы найдем его?[quotation mark] [unicode 8212] задает вопрос Мыш.[line break]","[quotation mark]И что с того?[quotation mark] [unicode 8212] говорит Лаки.[line break]","[quotation mark]Тогда он сможет съесть нас до того, как мы съедим его[quotation mark], [unicode 8212] с тревогой отвечает грызун.[line break]","[quotation mark]Но это же ничего не изменит! Мы же в любом случае останемся вместе, разве не так?[quotation mark] [unicode 8212] – замечает Мозголомтик.[line break]","[quotation mark]Да, но вообще мне больше нравится съедать других до того, как они съедят меня.[quotation mark]"}, 
{"[quotation mark]You know what we need?[quotation mark] asks Lucky. [quotation mark]A plan. We need a plan.[quotation mark][line break][quotation mark]Yes, I agree,[quotation mark] says the mouse. [quotation mark]What do you propose?[quotation mark][line break][quotation mark]Number one[quotation mark], explains the dog, [quotation mark]we need to explore a bit to, as the slice of brain says, secure the installation. Number two: to search for the missing brain. And number… um, the number that comes after two: we need to escape.[quotation mark][line break][quotation mark]Amazing! You're a genius, Lucky,[quotation mark] says the slice of brain."},
{"[quotation mark]Escape? You mean out of here? Outside?[quotation mark] asks the mouse. [quotation mark]What does the outside world offer? Nothing but headaches, I'd say. Here, I have inherited lands and even a title -- did you know that I am a duke? It's true, I'm not kidding. I am the eighteenth duke of my line. You want me to throw all that away?[quotation mark][line break][quotation mark]But, there's a whole world out there![quotation mark] howls the dog.[line break][quotation mark]I've lived out there,[quotation mark] adds the slice of brain. [quotation mark]I think I lived not too far from the installation with my girlfriend… what was her name?[quotation mark]"}, 
{"[quotation mark]Eww, a girlfriend, huh?[quotation mark] asks Lucky, suddenly interested.[line break][quotation mark]Details, please,[quotation mark] encourages the mouse.[line break][quotation mark]Well, to tell you the truth, I don't remember much about her, not even her name. That said, I do recall that was blindingly clever… she had a great sense of humor and a loud, rowdy laugh… and almond-shaped eyes of the deepest violet… and she had huge… hmm…  Sorry, I don't recall the word.[quotation mark]"},
{"[quotation mark]If we manage to get out of the installation, do you think you could find your house?[quotation mark] asks Lucky.[line break][quotation mark]Sure, no doubt. There are only a handful of rooms to get through and we'll be out. The house is not far at all, we just have to follow the street… I don't remember which one, but I'd recognize it.[quotation mark][line break][quotation mark]Your amnesia does not fill me with confidence,[quotation mark] complains the mouse.[line break][quotation mark]If we can find the rest of the brain on our way out, everything will fall into place,[quotation mark] suggests Lucky."}, 
{"[quotation mark]If we do manage to find a way out of the installation, do you think you can help Lucky find his family?[quotation mark] asks the mouse.[line break][quotation mark]Maybe. Probably. Lucky, is your house also nearby?[quotation mark] inquires the slice of brain.[line break][quotation mark]I think so,[quotation mark] replies the dog. [quotation mark]My family lives in a large, white house surrounded by tall trees. There can't be many houses like that.[quotation mark][line break][quotation mark]Are there any cats?[quotation mark] interrupts the mouse.[line break][quotation mark]Not one,[quotation mark] says the dog proudly."},
{"[quotation mark]I had a troubling thought,[quotation mark] says the mouse.[line break][quotation mark]What?[quotation mark] asks the slice of brain.[line break][quotation mark]What are we going to do if we run into a cat?[quotation mark][line break][quotation mark]We'd eat its brains, wouldn't we?[quotation mark] answers the slice of brain. [quotation mark]I don't see a problem there.[quotation mark][line break][quotation mark]Oh, but I do,[quotation mark] says the dog. [quotation mark]We'd hear cat thoughts all the time. That would be intolerable.[quotation mark][line break][quotation mark]Absolutely![quotation mark] agrees the mouse. [quotation mark]Eating a cat? Sure. No problem. Count me in. But no way am I willing to listen to its thoughts. That would be too much.[quotation mark]"}, 
{"[quotation mark]When we're outside, what do we need to do to find Lucky's house?[quotation mark] asks the mouse.[line break][quotation mark]First, let's head to my house,[quotation mark] replies the slice of brain. [quotation mark]I have a car, and that will speed up the search.[quotation mark][line break][quotation mark]Let me get this straight,[quotation mark] says the mouse, [quotation mark]you don't remember your own name, but you know how to drive?[quotation mark][line break][quotation mark]If not, I can,[quotation mark] says Lucky. [quotation mark]I've watched humans do it many times. Driving doesn't seem all that complicated.[quotation mark]"},
{"[quotation mark]Listen, guys,[quotation mark] says the slice of brain, [quotation mark]It's getting harder and harder for me to focus; could I suggest that we hold off on the conversation for a bit so I can catch my figurative breath?[quotation mark][line break][quotation mark]Yeah, me too,[quotation mark] agrees the mouse. [quotation mark]I have a splitting headache. A little rest would be nice.[quotation mark][line break][quotation mark]I agree. I like to run with the pack as much as anyone, but I could do with a little downtime.[quotation mark][line break][quotation mark]Good night, everyone,[quotation mark] says the mouse."}
}

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "[quotation mark]What an incredible sensation![quotation mark] marvels the scientist.[line break][quotation mark]You get used to it after a while,[quotation mark] says the mouse laconically.[line break][quotation mark]Tell her the plan, Lucky,[quotation mark] suggests the slice of brain.[line break][quotation mark]Okay,[quotation mark] says the dog, [quotation mark]From the top… Number one: we find the rest of Julien's brain; number two: we find a way out of the installation; and finally, number more-than-two: we look for my family.[quotation mark]",
"[quotation mark]Um, okay,[quotation mark] says Isabelle. [quotation mark]But first we have to get beyond the room where you found me, and to do that, we have to synthesize an effective cure.[quotation mark][line break][quotation mark]Impossible,[quotation mark] remarks the mouse with finality.[line break][quotation mark]Why?[quotation mark] asks the scientist, a bit off balance.[line break][quotation mark]It's a question of mathematics,[quotation mark] answers the mouse pedantically. [quotation mark]Lucky's plan starts with item number one. There is nothing before number one.[quotation mark][line break][quotation mark]Number zero?[quotation mark] suggests Isabelle.[paragraph break][roman type][quotation mark]…[quotation mark][paragraph break][italic type][quotation mark]Okay,[quotation mark] says Isabelle. [quotation mark]How about we renumber? One: prepare the cure; two: get out of the installation; three: find Lucky's family. Does that work for you?[quotation mark][line break][quotation mark]Sure,[quotation mark] says Lucky, [quotation mark]that sounds entirely reasonable.[quotation mark][line break][quotation mark]And it's mathematically correct,[quotation mark] adds the mouse.",
"[quotation mark]Listen,[quotation mark] says Lucky, still counting the steps in Isabelle's plan. [quotation mark]What are we going to do about the missing brain? If I have this right, we need it to put Julien back together.[quotation mark][line break][quotation mark]Unfortunately,[quotation mark] replies Isabelle, [quotation mark]the slice of brain is all that's left of Julien now. Right now we're all using the neural pathways of his entire brain to think, but nothing is left of Julien's original personality except what was stored in the brain biopsy. It's a heavy loss, particularly for me.[quotation mark][line break][quotation mark]Why for you?[quotation mark] asks the mouse.[line break][quotation mark]Because we were to be married, Julien and I.[quotation mark][line break][quotation mark]Sorry,[quotation mark] consoles the slice of brain. [quotation mark]I'm sure that if I could remember you, I would really like you.[quotation mark]",
"[quotation mark]Isabelle, do you think that one day we'll find my family?[quotation mark] asks Lucky.[line break][quotation mark]Yes, I'm certain of it.[quotation mark][line break][quotation mark]How can you be so sure?[quotation mark] asks the slice of brain.[line break][quotation mark]Because I know the family: Jean-Paul and Alexandra Drummond and their daughters, Léa et Camille. They live not more than a hundred meters from me and Julien.[quotation mark][line break][quotation mark]Yes, I've heard those names often around my house. I'm sure you're right! But, how could you know who I was talking about?[quotation mark] asks Lucky.[line break][quotation mark]Because I saw them in your thoughts,[quotation mark] answers the scientist.",
"[quotation mark]Are you saying that you can see what Lucky is thinking?[quotation mark] asks the mouse. [quotation mark]How could that be possible?[quotation mark][line break][quotation mark]We're all part of one brain now. Our minds are more or less merged. I can access his thoughts and conversely, he can access mine.[quotation mark][line break][quotation mark]Cool![quotation mark] says the mouse. [quotation mark]We've got superpowers.[quotation mark]",
"[quotation mark]I have to say that I find that somewhat improbable,[quotation mark] says the dog. [quotation mark]If you can see my thoughts, what number am I thinking of right now?[quotation mark][line break]The scientist ponders for a moment and says, [quotation mark]The number one.[quotation mark][line break][quotation mark]Well, yes,[quotation mark] admits the dog. [quotation mark]But perhaps that was a random guess. Try again…[quotation mark][line break][quotation mark]You're thinking of the number two,[quotation mark] says the scientist with conviction.[line break][quotation mark]Yes again![quotation mark] says the dog, now satisfied.[line break][quotation mark]But,[quotation mark] objects the mouse, [quotation mark]Lucky only knows two numbers… what does that prove?[quotation mark]",
"[quotation mark]Fine,[quotation mark] says the scientist patiently, [quotation mark]let's take another example. Mouse, I am thinking at this very moment of this morning's breakfast. I am trying to visualize it in as much detail as I can… try to see it.[quotation mark][line break][quotation mark]Where?[quotation mark] asks the mouse. [quotation mark]I can't smell anything.[quotation mark][line break][quotation mark]Ah,[quotation mark] says Isabelle, [quotation mark]Therein lies the problem. I was thinking in visual terms. Here, let me imagine its aroma, its taste… [quotation mark][line break][quotation mark]Oh! Yes, yes! I'm starting to sense it! My gods! It was a huge meal! This is fabulous. Can I relive every meal you've ever eaten? Pinch me, I'm dreaming.[quotation mark]",
"[quotation mark]Even though I find the memory of your last meal delicious, right now I don't feel like eating anything but brains. That's kind of weird, isn't it?[quotation mark] remarks the mouse.[line break][quotation mark]In fact, it's entirely normal for someone who has been zombified,[quotation mark] replies the scientist.[line break][quotation mark]We're zombies?[quotation mark] asks Lucky.[line break][quotation mark]No,[quotation mark] clarifies the scientist. [quotation mark]Together we constitute a single zombie, sharing Julien's body.[quotation mark][line break][quotation mark]At least I'm in my own body,[quotation mark] remarks the slice of brain.", 
"[quotation mark]Are other zombies as pleasant as we are?[quotation mark] asks Lucky.[line break][quotation mark]No,[quotation mark] replies Isabelle, [quotation mark]they are monsters. We're something else entirely. I'd say that we're sort of a pseudozombie, having received a partially effective treatment. Your typical zombie can't talk or think, all they can do is eat brains.[quotation mark][line break][quotation mark]And that's a problem?[quotation mark] asks the mouse.[line break][quotation mark]Rather a big one,[quotation mark] remarks the scientist. [quotation mark]They've just about destroyed civilization![quotation mark]", 
"[quotation mark]How is that possible?[quotation mark] asks the slice of brain.[line break][quotation mark]The virulence of this virus is without precedent,[quotation mark] replies the scientist. [quotation mark]The slightest scratch is enough to transmit the virus. The first cases were reported in Cambodia and twenty-four hours later thousands of cases appeared around the world thanks to international flights. A week later: global chaos. Without electricity, food, and water, the largest cities collapsed almost immediately. Fires have swept the countryside. Only a few pockets of humanity remain.[quotation mark]",
"[quotation mark]What about animals?[quotation mark] asks the mouse. [quotation mark]Were they affected?[quotation mark][line break][quotation mark]In fact,[quotation mark] replies Isabelle, [quotation mark]we think that the disease was canine in origin. Before we lost communications with the Pasteur Institute in Ho Chi Minh City, they had isolated a mutant form of rabies putatively responsible for the pandemic.[quotation mark][line break][quotation mark]Rabies![quotation mark] Lucky cries, [quotation mark]There's nothing more terrifying than rabies![quotation mark][line break][quotation mark]Until now,[quotation mark] corrects the slice of brain.",
"[quotation mark]If zombie-ism spreads so quickly,[quotation mark] worries Lucky, [quotation mark]do you think that my family has survived?[quotation mark][line break][quotation mark]Yes, I know so,[quotation mark] reassures the scientist. [quotation mark]The Drummonds work here at the installation and all staff families are housed within the compound. You're not far from them right now.[quotation mark][line break][quotation mark]That's great![quotation mark] exclaims the dog.", 
"[quotation mark]Isabelle,[quotation mark] says the mouse, [quotation mark]if the cure works as expected, what will become of us?[quotation mark][line break][quotation mark]In what sense?[quotation mark][line break][quotation mark]Will we remain individuals with our own thoughts or do you think that we'll somehow blend together into one mind?[quotation mark][line break][quotation mark]Impossible to say. Up until now, we've all lead our own separate lives. You have your memories, I have mine. But in the future, we'll see everything from the same point of view. We'll share one body and it's possible that over time we'll end up as a single mind. Can't really say right now how that will go.[quotation mark]", 
"[quotation mark]I never wanted to be anything other than a mouse. What you say terrifies me -- that my mind might be diluted or even fade out of existence.[quotation mark][line break][quotation mark]But look at the plus side,[quotation mark] says Lucky. [quotation mark]Look into my thoughts -- this is how it feels to chase a squirrel. And here's what it feel like to be scratched between the ears.[quotation mark][line break][quotation mark]Yes, I suppose.[quotation mark][line break][quotation mark]And here,[quotation mark] says the scientist, [quotation mark]is what Earth looks like from space -- something that no other mouse has ever seen.[quotation mark][line break][quotation mark]Hmm. Impressive. And I suppose that for my part, I have some memories to share as well: the warmth of sleeping huddled with the other mice, the joy of stealing bits and scraps from around Lucky's food dispenser…[quotation mark][line break][quotation mark]Hey![quotation mark] howls the dog.", 
"[quotation mark]When I saw Julien's body enter the airlock, I noticed that he was getting around with difficulty, shambling, if you will,[quotation mark] says the scientist.[line break][quotation mark]Right. I know how to walk,[quotation mark] says the slice of brain, [quotation mark]but I find it infuriatingly difficult to do it.[quotation mark][line break][quotation mark]The mouse doesn[apostrophe]t help,[quotation mark] whines Lucky. [quotation mark]He's always moving the legs, and I don't think he knows what he's doing.[quotation mark][line break][quotation mark]Me?[quotation mark] says the mouse with indignation, [quotation mark]You're the one who's always trying to run on all fours.[quotation mark][line break][quotation mark]Okay, gentlemen,[quotation mark] says the scientist, [quotation mark]Do you think I could convince you to let one of us drive at a time?[quotation mark][line break][quotation mark]Yes, certainly,[quotation mark] agrees the slice of brain, [quotation mark]You have the wheel.[quotation mark]", 
"[quotation mark]Okay[quotation mark], says the scientist. [quotation mark]I need to concentrate on how we're going to produce an effective cure.[quotation mark][line break][quotation mark]Right -- enough chit-chat, fellows, let her focus,[quotation mark] suggests the slice of brain.[line break][quotation mark]Right, okay,[quotation mark] say the mouse and dog."
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"[quotation mark]It's done,[quotation mark] says the scientist. [quotation mark]Time for roll call: Lucky?[quotation mark][line break][quotation mark]Here.[quotation mark][line break][quotation mark]The Duke of Mousedom?[quotation mark][line break][quotation mark]Present.[quotation mark][line break][quotation mark]The slice of Julien's brain?[quotation mark][line break][quotation mark]Here.[quotation mark][line break][quotation mark]Good,[quotation mark] says Isabelle, [quotation mark]it sounds like we all made it safe and sound.[quotation mark]",
"[quotation mark]So, now we get out of here?[quotation mark] suggests the dog.[line break][quotation mark]Yes,[quotation mark] says Isabelle.[line break][quotation mark]But the exterior airlock door is still electronically locked. No one can open it aside from Colonel Greillier in the control room,[quotation mark] says the slice of brain.[line break][quotation mark]Yes, we will need to convince him to open it,[quotation mark] agrees the scientist.",
"[quotation mark]That sort of surprises me, that you remember Colonel Greillier. I thought that you couldn't remember names.[quotation mark][line break][quotation mark]Of the Colonel?[quotation mark] asks the slice of brain. [quotation mark]How could I forget your boss? Just last week he tumbled into our pool at his birthday party. I suppose we were all a little soused that evening.[quotation mark][line break][quotation mark]Soused?[quotation mark] asks the mouse. [quotation mark]Oh, I can see it in your thoughts. Soused, huh? Looks like fun.[quotation mark][line break][quotation mark]Hang on a minute, mouse.[quotation mark] says Isabelle, [quotation mark]Julien, you just expressed a complicated thought. Do you think your memory is returning?[quotation mark][line break][quotation mark]Hmph. How could I know?[quotation mark]",
"[quotation mark]Julien,[quotation mark] says the scientist, [quotation mark]What did you give me as a gift our first Christmas?[quotation mark][line break][quotation mark]Gloves?[quotation mark][line break][quotation mark]And they were… [quotation mark][line break][quotation mark]Far too large for you! Yes, I had bought them for my brother, but when you gave me a present and I didn't have anything for you… yes, um, are you still upset about that?[quotation mark][line break][quotation mark]No, not really. I was just testing your memory.[quotation mark]",
"[quotation mark]Give me another test![quotation mark][line break][quotation mark]Okay. What do you call me when we're all alone?[quotation mark][line break][quotation mark]Isabelle?[quotation mark][line break][quotation mark]No, think! When it's just the two of us… [quotation mark][line break][quotation mark]I'd rather not say in front of Lucky and the mouse.[quotation mark][line break][quotation mark]Oh, come on,[quotation mark] says the dog. [quotation mark]We're all sharing one mind now; there aren't any real secrets here.[quotation mark][line break][quotation mark]Very well,[quotation mark] says Julien, still a bit hesitant, [quotation mark]I call you my bunny rabbit.[quotation mark][line break][quotation mark]Bunny?[quotation mark] says the mouse. [quotation mark]She used to be a rabbit? Now I am totally confused.[quotation mark]",
"[quotation mark]Good, Julien, it seems to me that you're on the road to recovering your memory,[quotation mark] says the scientist.[line break][quotation mark]You think so? Even though you said that I'm just a little slice of brain? Is it possible that these memories aren't really mine, but I'm just reading them from your thoughts?[quotation mark][line break][quotation mark]I would have to say that a little slice of brain wouldn't be capable of proposing such an elaborate hypothesis. It seems to me your whole brain is now back at work.[quotation mark]",
"[quotation mark]But, if I understood you correctly,[quotation mark] says Lucky, [quotation mark]you said that the virus completely wipes zombie brains, leaving nothing.[quotation mark][line break][quotation mark]Yes, that is what I said,[quotation mark] admits the scientist, [quotation mark]but we've never had a case like this one to study. I'd say it's time to revise our understanding about what's going on. It seems that the brain isn't destroyed, but rather that higher thought processes are suppressed. The neural pathways are still intact. In fact, that has to be the case: our very existence is a matter of piggy-backing on those pathways.[quotation mark]",
"[quotation mark]That's great![quotation mark] says Julien. [quotation mark]Then, we can restore all the zombies![quotation mark][line break][quotation mark]My God, Julien, you're right. We haven't lost them,[quotation mark] replies the scientist. [quotation mark]For the first time, there's a chance that we could put the world back on its feet and end this nightmare.[quotation mark][line break][quotation mark]Even the sick dogs?[quotation mark] asks Lucky.[line break][quotation mark]Yes, including dogs and every other species infected by the virus,[quotation mark] replies the scientist.",
"[quotation mark]So, now what?[quotation mark] asks the mouse.[line break][quotation mark]Julien,[quotation mark] says Isabelle, [quotation mark]we have to talk with the Colonel and convince him that you're cured and that we now have a way to reverse the damage caused by the virus.[quotation mark][line break][quotation mark]Okay, I'll do my best,[quotation mark] says Julien.[line break][quotation mark]Onward, comrades![quotation mark] cries the mouse."
}.

Chapter 15 - The Void

The void is a room.

The small gray creature is an edible thing. It is in the void. The printed name of the small gray creature is "маленькое серое существо".

The bloody corpse of Docteur Rambaud is a thing in the void. The indefinite article of bloody corpse of Doctor Rambaud is "the".

The intercom is a buttoned thing in the void. The intercom can be live. The intercom is not live. 

Instead of pushing the intercom:[only present at consciousness 4]
	if the intercom is not live:
		say "A little red LED lights up on the intercom indicating that the connection to the control room is live.";
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