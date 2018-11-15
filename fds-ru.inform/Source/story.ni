"FDS-RU" by Jack Welch

The story headline is "Рыцарь без мозга и упрека".
The story genre is "ужастик".
The release number is 9.
The story creation year is 2018.
The story description is "По чему ты не скучаешь, так это по своей памяти."

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.

Use MAX_STATIC_DATA of 250000.

Use full-length room descriptions.
Use no scoring.

Release along with the "Vorple" interpreter.
Release along with style sheet "fds-ru.css".

Release along with cover art ("Трупный мужчина, женщина-ученый, мышь, собака и электродвигатель."), a file of "Reklama" called "reklama.txt", a file of "Prokhozhdenie" called "prokhozhdenie.txt" and a file of "Blagodarnosti" called "blagodarnosti.txt".

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

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false. The player has a number called conversations [number of times talked on the intercom]. The conversations of the player is 0. The player has a number called timesLapped [number of times drank from the toilet ]. The timesLapped of the player is 0.

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
	place an inline element called "hidden" reading "Возможные выходы:[hiddenExitList]. "
	
To say hiddenExitList:
	let L be {west, north, south, east};
	let LL be a list of text;
	repeat with way running through L:
		if the room the way from the location is not nothing:
			let D be the door the way from the location;
			if D is nothing or D is open or (D is simpleOpenable and the consciousness of the player is greater than 0) or (D is buttoned and the consciousness of the player is greater than one) or (D is locked and the consciousness of the player is greater than two):
				if the way is:
					-- west:
						add " на запад" to LL;
					-- north:
						add " на север" to LL;
					-- south:
						add " на юг" to LL;
					-- east:
						add " на восток" to LL;
	let N be the number of entries in LL;
	repeat with X running from 1 to N:
		if (N is greater than 1 and X is N):
			say " и";
		say entry X of LL;
		if (N is greater than 2 and X is less than N - 1):
			say ", ".

Chapter 5 -Langauge-specific tweaks

A container can be male or female. A container is usually male.

Rule for printing the banner text: 
	place an inline element called "titre" reading "На Страже";
	say line break;
	say story headline;
	say paragraph break;
	say "Оригинальная история [unicode 8212] Джек Уэлч[line break]";
	say "Русский перевод [unicode 8212] Валентин Коптельцев[line break]";
	say "Релиз [release number] / Серийный Номер 181130 / Inform 7 build 6M62 (I6/v6.33 lib 6/12N)[line break]".
	
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
			say " (в которо[if E is female]й[otherwise]м[end if] [random thing in E])";
		if the number of entries in L is greater than 2 and N is less than (the number of entries in L minus 1):
			say ", ";
	say "."

The can't go that way rule response (A) is "Этим путем не пройти."

[max 217 unicode characters between quotes due to expansion of intermediates during compliation как жал]

To tell ( blahblah - a list of text):
	repeat with phrase running through blahblah:
		say "[phrase]".

Chapter 6 - Additional Accessibility Tweaks

To say headchatter:
	place an inline element called "hidden" reading "В твоей голове проносятся мысли: ".
	
To say realworldchatter:
	place an inline element called "hidden" reading "Разговор возобновляется: ".
	
Rule for printing the name of a room:
	place an inline element called "hidden" reading "Текущее местоположение [unicode 8212] ";
	say "[printed name of the location]";
	place an inline element called "hidden" reading "."
	
After reading a command:
	if the toggle flag is true:
		 execute JavaScript command "$( '#window0').empty()".

Chapter 7 - Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.

Chapter 8 - Suppress Container Open/Closed Messages

The examine containers rule is not listed in any rulebook.

Chapter 9 - Button Setup

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
	
Chapter 10 - Start of Play

When play begins:
	if debugMode is false:
		hide the prompt;
	place an inline element called "hidden" reading "Если вы используете вспомогательные технологии – например, скринридер или экранный диктор – и обнаружили, что после каждого хода весь текст игры зачитывается целиком";
	place an inline element called "hidden" reading ", вы можете в любой момент выбрать ссылку [quotation mark]переключить экран[quotation mark], чтобы на экране отображался только текст последнего хода.";
	 place an inline element called "hidden" reading " Повторный выбор этой ссылки восстановит обычный вид экрана начиная с момента выбора, однако просмотреть более ранний текст будет невозможно."; 
	place an inline element called "hidden" reading "[paragraph break]В начале игры команды обозначаются цветами, и вам предстоит самостоятельно выяснить, что они означают. По ходу истории будут появляться дополнительные команды.";
	place an inline element called "hidden" reading "Набирать текст в этой игре не требуется: чтобы отдать команду, просто выберите соответствующую ссылку.";
	place an element called "leftgutter" at the top level; 
	set output focus to the element called "leftgutter";
	place link to the command "0" called "hidden" reading "переключить экран";
	place a block level element called "arrows";
	set output focus to the main window;
	sort the Table of Palette in random order.

After printing the banner text:
	listExits;
	listHiddenExits;
	tell postBannerText;
	increment the knownCommands of the player.
	
The list of text called postBannerText is always {
"[line break][headchatter][italic type]Где я? И вообще, кто я?[roman type][paragraph break]Ты просыпаешься в одиночестве в пустой голубоватой комнате.[paragraph break]","[italic type]Почему я не могу ничего вспомнить?[paragraph break]Мне надо сконцентрироваться! Что случилось? Давай, думай! Думай же![paragraph break]Как бы то ни было, здесь я ответов не найду [unicode 8212] мне придется осмотреть окрестности.[roman type][line break]"
}

Chapter 11 - Geography

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
				say "Сначала надо ";
				if the player is in an elevator:
					say "определиться с этажом назначения.";
				otherwise:
					say "вызвать лифт.";
			otherwise:
				say "Дверь закрыта."
			
To say bougePas:
	say "Стена не поддается".
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "Темное помещение[one of]. Здесь нет ничего интересного[or][stopping]";
		-- 1:
			say "[one of]Опа, здесь кровь [unicode 8212] в этой огромной голубой комнате[or]Огромная голубая комната[stopping] с металлическими стенами";
		-- 2:
			say "Голубая комната, в которой люди режут и потрошат животных";
		-- 3:
			say "Посреди синей комнаты стоит операционный стол в окружении хирургического оборудования. Выход ведет в коридор";
		-- 4:
			tell ORtext.
			
The list of text called ORtext is always {
"Стоящий в середине помещения операционный стол покрыт хирургическими простынями голубого цвета. Он оборудован целым набором ремней и приспособлений для фиксации животных во время операции. ","Рядом со столом стоит наркозный аппарат с россыпью ручек-крутилок и шкал; от него куда-то к потолку уходят шланги. Прямо над наркозником висит несколько мониторов жизненной активности пациента, которые сейчас все выключены. ","Кто-то подкатил передвижной рентген прямо к столу.[paragraph break]Центральный коридор второго уровня находится к востоку"
}
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "Голубая комната";
		-- 1:
			say "Жуткое место";
		-- 2:
			say "Камера пыток";
		-- 3:
			say "Операционная";
		-- 4:
			say "Операционный зал".
			
Instead of simplePushing when the player is in the Bloc Opératoire:
	if the consciousness of the player is less than 4:
		say "Ты не знаешь, как именно работает то или иное оборудование здесь, и боишься, что метод проб и ошибок может довести тебя до саморасчленения[one of]. Вот это был бы эпик фейл[or][stopping]!";
	otherwise:
		say "Ты не провела дезинфекцию рук и не надела хирургический костюм, а всё оборудование здесь стерильное. Как-то не хочется его контаминировать."

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
		-- otherwise:
			say "Центральный коридор второго уровня. Операционная находится к западу, помещение для содержания собак [unicode 8212] к северу, лаборатория [unicode 8212]  на юге, а лифт [unicode 8212] на востоке".
			
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
			say "Коридор, Уровень 2";
		-- 4:
			say "Уровень 2: Отдел физиологических экспериментов".
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	try looking;
	tell openLift.
	
The list of text called openLift is always {
"[headchatter][italic type]«Лаки, откуда ты знаешь, как открывать волшебный ящик?»[line break]«Я увидел кнопку. Я нажал ее. Вот и всё. И к чему весь этот эпатаж с волшебным ящиком?»[line break]","«Гиганты…  »[line break]«Ты людей имеешь в виду?»[line break]«Наверно, да. Как бы там ни было, люди заходят в этот ящик и исчезают. А потом в том же самом ящике оказываются другие люди. Это явно магия».[line break]","«Хмм. Что ж, посмотрим».[roman type][paragraph break]"
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
			say "Огромная клетка занимает половину помещения; на оставшейся площади размещено оборудование для тренировки животных";
		-- 4:
			say "Животных держат здесь в здоровенной клетке, которая позволяет им не терять подвижности во время экспериментов, которые могут длиться неделями. Ты замечаешь этикетку, приклеенную к клетке: [unicode 8222]Объект 205-Альфа[unicode 8220]"
			
To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "Логово волка";
		-- 2:
			say "Дом, милый дом";
		-- 3:
			say "Kонура";
		-- 4:
			say "Зоологическая лаборатория".
	
To say openNord:
		say "Стена к северу отъезжает в сторону, открывая проход в соседнее помещение".

The cage is an openable closed female container in the Laboratoire Zoologique. The printed name of the cage is "[if the cage is open]от[otherwise]за[end if]крытую клетку".

The chien is an edible thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]волк[otherwise]собака[end if]". The chien can be dead. The chien is not dead. 

The food dispenser is in the Laboratoire Zoologique. It is buttoned. The printed name of the food dispenser is "автоматическую кормушку".

After choosing notable locale objects when the player is in the Laboratoire Zoologique:
	set the locale priority of the food dispenser to 9.
	
Rule for printing a locale paragraph about the food dispenser:
	say "Рядом с [if cage is open]от[otherwise]за[end if]крытой клеткой[if chien is dead], в которой валяется растерзанный труп животного,[end if] стоит автоматическая кормушка.";
	now the chien is mentioned; 
	now the food dispenser is mentioned;
	now the cage is mentioned.

Instead of pushing the food dispenser:
	say "Ты нажимаешь красную кнопку. ";
	if the consciousness of the player is:
		-- 2:
			say "В награду на пол высыпается несколько кусочков корма. Ты съедаешь их, но они не могут утолить твой голод.";
		-- 3:
			say "Предназначенные для поощрения животных кусочки корма, выпавшие к твоим ногам из автокормушки, не кажутся тебе аппетитными.";
			move the pile of dog food to the Laboratoire Zoologique;
		-- 4:
			say "Из прибора для тренировки условного рефлекса вываливается на пол несколько кусочков собачьего лакомства.";
			move the pile of dog food to the Laboratoire Zoologique.
			
The pile of dog food is in the void. The printed name of the pile of dog food is "кучкy корма для собак".

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 1 in 8 succeeds:
		say "Волк [one of]громко гавкает[or]грызет прутья своей клетки[or]чешет ухо[or]вышагивает взад-вперед по своей металлической клетке[in random order].";
	otherwise:
		if a random chance of 1 in 8 succeeds:
			say "Волк [one of]воет во всю силу своих легких[or]принюхивается к чему-то в воздухе[or]обнюхивает клетку[or]обнюхивает самого себя[in random order].";
		otherwise:
			if a random chance of 1 in 8 succeeds:
				say "Волк [one of]лижет свои лапы[or]скалится на тебя[or]угрожающе рычит[or]не обращает на тебя внимания[or]бегает вдоль клетки, не спуская с тебя глаз[in random order]."	
				
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:		
		say "Маленькая комнатка";
		if Ascenseur 2 is visited:
			say ", которая вибрирует";
	otherwise:
		say "Лифт".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "Ты нажимаешь кнопку";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " своей мордой[one of] (которая, насколько ты помнишь, раньше была длиннее)[or][stopping] и замечаешь легкую вибрацию. Секунду спустя стена на западе отъезжает, и за ней оказывается коридор.";
			-- otherwise:
				say ", и лифт [if the location is Ascenseur 2]спускается на первый уровень[otherwise]поднимается на второй уровень[end if], после чего его дверь отъезжает в сторону, открывая проход на запад."; 
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
				say ", и на востоке открывается дверь лифта.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "Как только ты ";
	if the player is in an elevator:
		say "захoдишь[if the consciousness of the player is greater than 2] в кабину[end if]";
	otherwise:
		say "выходишь";
	say ", ";
	if the consciousness of the player is less than 3:
		say "стена за твоей спиной бесшумно возвращается на место";
	otherwise:
		say "дверь бесшумно закрывается за твоей спиной".
	
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
			say "Помещение от пола до потолка заставлено сложным оборудованием. Обычно здесь повсюду сияют лампочки и жужжат роботизированные приводы, но сейчас ни один из приборов не подает признаков жизни, а тишина не нарушается никакими звуками";
		-- 4:
			if the disjoncteurs are not broken:
				say "Теперь, когда электроснабжение восстановлено, все помещение сияет огнями, как рождественская елка, и наполнено жужжанием компьютерных кулеров. Микроструйная установка готова к любым, даже самым сложным операциям биохимического синтеза";
			otherwise:
				say "Помещение погружено во тьму, не работают ни компьютеры, ни роботизированная установка молекулярного синтеза. Судя по всему, электроснабжение данной комнаты где-то отключено"
					
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Биохимическая лаборатория";
		-- 4:
			say "Лаборатория молекулярного синтеза".
			
To say pnLabBioDoor:
	say "дверь лаборатории".
	
After choosing notable locale objects when the player is in the Laboratoire Biochimique:
	if the microfluidic synthesis unit is in the location, set the locale priority of the microfluidic synthesis unit to 9.
	
Rule for printing a locale paragraph about the microfluidic synthesis unit:
	say "Половину комнаты занимает микроструйная установка молекулярного синтеза последнего поколения; ";
	if disjoncteurs are broken:
		say "ни один из индикаторов на ее лицевой части не горит";
	otherwise:
		say "индикаторы на ее лицевой части помигивают";
		if the microfluidic synthesis unit is broken:
			say "– видимо, что-то с ней не так";
		otherwise:
			say ", как от них в общем-то и ожидается";
	say ". ";
	if the microfluidic synthesis unit is closed:
		say "Сервисная панель установки закрыта";
	otherwise:
		say "Через открытую сервисную панель ";
		if the disjoncteurs are broken:
			say "видны внутренности установки виден ";
		otherwise:
			if the microfluidic synthesis unit is broken:
				say "дефектный";
			otherwise:
				say "исправный";
			say " сервопривод";
	say ".";
	now the microfluidic synthesis unit is mentioned.
	
Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Еще один коридор, выглядящий точно так же, как опасный проход рядом с твоей клеткой. Виден выход[if labPathDoor is closed] к югу и сдвижная дверь к северу[otherwise]ы к северу и югу[end if]";
			say "[liftDoorDogStatus]";
		-- 3:
			say "Центральный коридор первого уровня соединяет туалеты на юге, душевые на западе, лабораторию на севере и лифт на востоке";
		-- 4:
			say "Центральный коридор на первом уровне соединяет туалеты на юге, санпропускники на западе, лабораторию на севере и лифт на востоке".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Новый коридор";
		-- 3:
			say "Коридор, уровень 1";
		-- 4:
			say "Уровень 1: биобезопасность".
			
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
"Это помещение напоминает тебе о лучших временах в кругу твоей семьи [unicode 8212] до того, как тебя похитили. Судя по столам, уставленным"," едой полкам, раковинам и странным большим приборам, ты можешь без всякого сомнения утверждать, что это самая важная комната во всем доме: кухня"
}
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]". 

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "[if the frigo is closed]закрытый [end if]холодильник";
		-- 3:
			say "пустую морозильную камеру"; [only mentioned in accusative, so okay]
		-- 4:
			say "низкотемпературную камеру для хранения патанатомических препаратов".
			
After opening the frigo:
	move the plastic container to the location;
	say "Ты открываешь холодильник, и из него выпадает на пол пластиковая коробка."
	
The plastic container is a closed openable container in the frigo. The printed name of the plastic container is "пластиковый контейнер".

The slice of brain is a edible thing in the plastic container. The printed name of the slice of brain is "[one of]плоско срезанный [or][stopping]кусок мозга".

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	tell chopLicking;
	try looking.
	
The list of text called chopLicking is always {
"[headchatter][italic type]«Ммммм!» [unicode 8212] говорит Лаки и облизывается.[line break]«Чему это ты так обрадовался?»[line break]","«Видишь вон тот здоровенный ящик? Вот он действительно волшебный: это холодильник!»[line break]«Мы забираемся в холодильник, чтобы попасть в другое место?»[line break]","«Нет, мы едим то, что внутри!»[roman type][paragraph break]"
}

Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 
To say descToilettes:
	if the consciousness of the player is less than 3:
		say "Здесь сильно пахнет мочой[one of]. Многие пометили эту территорию [unicode 8212] судя по всему, она пользуется немалым спросом[or][stopping]";
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
		say "[if the potty is in Les Toilettes]Крышка унитаза уже поднята[otherwise]Ты поднимаешь крышку унитаза[end if].";
	now the potty is in Les Toilettes.
	
The potty is a thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "резервуар с водой";
	otherwise:
		say "унитаз с поднятой крышкой". 
		
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
						say "Тебе совсем не хочется пить [unicode 8212] как-никак, ты вылакал не один литр из резервуара.";
				increase the timesLapped of the player by one;
			-- 3:
				say "Нет, это было бы слишком отвратительно[one of] (даже для поедателя мозгов)[or][stopping]."; 
			-- 4:
				say "Знаешь, сколько видов патогенных бактерий живет в сырой воде? Нет уж."
				
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
	now the BlockChatterFlag is true;
	tell bathroomScientistText;
	try looking.
	
The list of text called bathroomScientistText is always {
"Войдя в санузел, ты замечаешь краем глаза какое-то движение.[paragraph break][headchatter][italic type]«Кто здесь? Какой-то мужчина… Ой, Жюльен, смотри —  это же ты!»[roman type]","[paragraph break]Ты закрываешь лицо ладонью, и Жюльен в зеркале, все так же одетый в свою униформу охранника и кепи, делает то же самое. Непросто будет к этому привыкнуть.[line break]"
}
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		tell bathroomGuardText;
		try looking.
		
The list of text called bathroomGuardText is always {
"Войдя в санузел, ты замечаешь краем глаза какое-то движение.[paragraph break][headchatter][italic type]Кто здесь?[roman type][paragraph break]","Коренастый мужчина в рваной униформе смотрит на тебя немигающим взглядом. Его бледная кожа, слезящиеся глаза и ввалившиеся щеки навевают мысли об ожившем мертвеце.[paragraph break]","Несколько минут вы играете в гляделки, пока до тебя, наконец, доходит, что ты смотришь на собственное отражение в зеркале.[line break]"
}.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "Множество душевых головок направлены на центр помещения, который залит интенсивным фиолетовым светом";
		-- 4: 
			tell showerDesc;
	say ". Дверь к востоку ведет в коридор, а к западу [unicode 8212] на лестницу"
	
The list of text called showerDesc is always {
"Распылители высокого давления по периметру помещения служат для того, чтобы обмывать персонал, приходящий из потенциально контаминированных зон"," комплекса, раствором антисептика. Помещение залито интенсивным фиолетовым светом"
}

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "Душевая";
		-- 4:
			say "Санпропускник".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "дверь в душевую";
		-- 4:
			say "дверь санпропускника".
			
Instead of simplePushing when the player is in the Salle de Décontamination:
	if the consciousness of the player is:
		-- 3:
			say "Ты расслабляешься под теплыми, ласковыми душевыми струями. Через некоторое время душ отключается, и ты высыхаешь.";
		-- 4:
			say "Дезинфекционный душ обдает тебя струями пахнущего фенолом антисептика.".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Лестница (первый уровень)".

The esc1door is a locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "дверь между [if the consciousness of the player is 3]душевой[otherwise]санпропускники[end if] и лестницей".

To say descEscalier1:
	say "Лестница ведет наверх к северу, соединяя [if the consciousness of the player is 3]душевые[otherwise]санпропускники[end if] на юге со всей остальной частью комплекса".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "Ты взбираешься по лестнице к северу".
	
To say downSouth:
	say "Ты спускаешься по ступеням к югу".

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
	
After choosing notable locale objects when the player is in Escalier 1 and the panneau électrique is in Escalier 1:
	set the locale priority of the panneau électrique to 9.
	
Rule for printing a locale paragraph about the panneau électrique:
	say "Ты видишь здесь [if the panneau électrique is open]от[otherwise]за[end if]крытый электрощит";
	if the panneau électrique is open:
		say " [if the disjoncteurs are broken]со сброш[otherwise]с включ[end if]енными автоматическими предохранителями";
	say ".";
	now the panneau électrique is mentioned.

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
		
The list of text called heavyDoor is always {
"Тяжелые бронированные двери, отсутствие окон и цилиндрическая форма помещения вызывают у тебя ассоциации с подводной лодкой. Лампа над дверью в дальнем конце светится красным,"," сигнализируя, что дверь наружу заблокирована"
}
			
Instead of going north when the player is in the sas:
	if scientist is in the sas:
		say "Тебе пришлось бы пройти мимо женщины, а она выглядит не слишком сговорчивой. Кроме того, ты все равно не знаешь кода от замка внешней двери, так что даже пробовать не стоит.";
	otherwise:
		say "Бесполезно. Дверь абсолютно герметична, открыть ее можно только из комнаты управления."
			
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
	
After choosing notable locale objects when player is in sas:
	If the bloody corpse of Docteur Rambaud is in sas, set the locale priority of the bloody corpse of Docteur Rambaud to 9. [this assures Inform looks for the corpse first]
	
Rule for printing a locale paragraph about the bloody corpse of Docteur Rambaud when the bloody corpse of Docteur Rambaud is in the sas:
	say "Скорченный труп доктора Рамбо лежит на полу неподалеку от переговорного устройства.";
	now the bloody corpse of Docteur Rambaud is mentioned;
	now the intercom is mentioned.

Chapter 12 - Verbs

Section 1 - Toggling

The toggle flag is a truth state that varies. Toggle flag is false.

Toggling is an action applying to nothing. Understand "toggle" as Toggling.

Carry out Toggling:
	if the toggle flag is false:
		now the toggle flag is true;
		 execute JavaScript command "$( '#window0').empty()";
	otherwise:
		now the toggle flag is false.
		
Report Toggling:
	say "Теперь экран [if toggle flag is false]больше не [end if]будет очищаться после каждого хода."

Section 2 - simpleUnlocking

To say (kuda - a direction) po-russki:
	if kuda is:
		-- east:
			say "восток";
		-- west:
			say "запад";
		-- north:
			say "север";
		-- south:
			say "юг";

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			now the door the way from the location is open;
			say "Ты вводишь код на цифровой клавиатуре и слышишь, как замок ведущей на ";
			say the way po-russki;
			say " двери отпирается.[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "Здесь нет запертых дверей";
	if the location is the sas:
		say ", кроме бронированной двери к северу, ведущей внутрь комплекса. Но ты понимаешь, что эту дверь могут открыть только с другой стороны. Твой пароль уже не сработает";
		if the consciousness of the player is 4:
			say " в связи с активацией протокола безопасности";
	say "."
	
To say firstUnlocked:
	now the BlockChatterFlag is true;[hate to side effect this way, but here it is expedient]
	tell unlockText.
	
The list of text called unlockText is always {
"[paragraph break][headchatter][italic type]«Постой-ка минутку», [unicode 8212] просит пес. [unicode 8212] Что это был за фокус?»[line break]","«Эти двери с электронными замками отпираются, если ввести правильный код».[line break]«И ты его помнишь?» [unicode 8212] удивляется Мыш.[line break]«Как видишь».[roman type]"
}
	
Section 3 simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "open" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
		if the door the way of the location is locked and the consciousness of the player is greater than 2:
			say "Сначала тебе придется отпереть дверь, ведущую нa ";
			say the way po-russki;
			say ".";	
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "Непонятно, что здесь открывать." 
	
After opening the plastic container:
	say "Ты хватаешь пластиковый контейнер за уголок и трясешь его до тех пор, пока он не разваливается. Из него вылетает влажно поблескивающий кусок мозга и, пролетев через всю кухню, с резиновым звуком шмякается об стену и соскальзывает на пол."

Section 4 - simpleEating

simpleEating is an action applying to nothing. Understand "eat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "Здесь нет ничего съестного";
	if the consciousness of the player is 1 and the chien is in the cage:
		say " (по крайней мере в пределах твоей досягаемости).";
	if the pile of dog food is in the location:
		say " (по крайней мере такого, что бы вызывало у тебя аппетит)";
	say "."
	
Rule for implicitly taking something (called the target) while eating:
	try silently taking the target.

Section 5 simplePushing

simplePushing is an action applying to nothing. Understand "push" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "Здесь нечего нажимать."
	
Section 6 simpleTalking

simpleTalking is an action applying to nothing. Understand "talk" as simpleTalking.

Check simpleTalking:
	if the player is not in the sas:
		say "Здесь нет никого, с кем можно было бы поговорить.";
		stop the action;
	otherwise:
		if the bloody corpse of Docteur Rambaud is not in the void:
			if the intercom is not live:
				say "Чтобы выйти на связь с комнатой управления, сначала надо включить переговорное устройство.";
				stop the action.
				
Carry out simpleTalking:
	if the bloody corpse of Docteur Rambaud is not in the void:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of][plan1][or]Судя по всему, там что-то происходит. Ты ждешь, сгорая от нетерпения, но никто не отвечает[or]До тех пор, пока ты не синтезируешь лекарство, общаться с комнатой управления не имеет смысла. Ты решаешь не тратить попусту их время (да и свое тоже) и пока не звонить им[stopping].";
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
				
To say plan1:
	say "Склонившись к переговорному устройству, ты рассказываешь свой план. Техник на другом конце поспешно желает тебе удачи. Пытаясь перекричать звуки выстрелов, он дает тебе указание сообщить, когда ты всё успешно закончишь. Однако ";
	say "до этого момента он просит тебя не пользоваться связью. На той стороне вешают трубку, и светодиод переговорного устройства гаснет".
				
The list of text called intercomText1 is always {
"«Комната управления, профессор Драммонд у аппарата».[line break]","«Это я, твой пес Лаки! Я в шлюзе! Я так счастлив слышать твой голос!»[line break]","«Эээ… Что, простите? Что за шутки? Переговорное устройство предназначено только для служебных переговоров. ","Кто это?»[paragraph break][headchatter][italic type]«Это он! Отец моего семейства», [unicode 8212] задыхается от нетерпения пес.[line break]","«Успокойся, Лаки, [unicode 8212] настаивает Изабель. [unicode 8212] Пусть говорит Жюльен».[roman type][paragraph break]«Извините, [unicode 8212] говоришь ты. [unicode 8212] Я всё могу объяснить. Я Жюльен Трюффо».","[line break]«Охранник?»[line break]«Да».[line break]","«Не может быть. Доктор Рамбо сказала, что он превратился в зомби, а зомби не могут говорить. У меня нет времени на ерунду, освободите линию».[paragraph break]"
}

The list of text called intercomText2 is always {
"«Я не шучу, [unicode 8212] взываешь ты к нему. [unicode 8212] Доктор Рамбо смогла меня исцелить».[line break]","«Ладно, хватит, [unicode 8212] раздраженно бросает профессор. [unicode 8212] Если она с вами, дайте ее».[line break]","«Прямо сейчас она … занята», [unicode 8212] говоришь ты, отволакивая труп женщины-ученого за угол, на лестницу.[paragraph break]«","Послушайте, [unicode 8212] продолжаешь ты, [unicode 8212] если не верите мне, включите камеры наблюдения в шлюзе, и тогда сможете меня увидеть».[line break]","«Ну ладно. Секундочку... »[paragraph break]"
}

The list of text called intercomText3 is always {
"«Видите меня?» спрашиваешь ты.[line break]«Да, вы на экране. Но как вы смогли выжить? Я думал, вы заразились».[line break]","«Ну да, вы правы, но я же вам говорил... »[paragraph break][headchatter][italic type]«Дай я объясню», [unicode 8212] вмешивается Изабель.[roman type][paragraph break]","«Доктор Рамбо приготовила лекарство в микроструйной установке биосинтеза, используя протокол M13, как она ранее обсуждала с вами. Мои нейронные связи восстановились, и теперь я полностью исцелен».[line break]","«Да... Но ведь это значит... даже не верится. Конец пандемии!»[line break]","«Точно. Нам надо срочно заняться этим».[paragraph break]"
}

The list of text called intercomText4 is always {
"Ты просишь, чтобы тебя соединили с директором всего исследовательского комплекса, полковником Грелье, и рассказываешь ему, что случилось, опустив до времени некоторые детали, предложенные Лаки и Мышом.","[paragraph break]Через пару часов обсуждений и нескольких анализов крови полковника удается убедить, и он отдает приказ открыть дверь шлюза, чтобы ты мог выйти."
}

The list of text called parleyText1 is always {
"Ты начинаешь что-то бессвязно лепетать [unicode 8212] слова никак не хотят вспоминаться. Когда звуки слетают с твоего языка, женщина-ученый смотрит на тебя с недоверием.[paragraph break]","«Как такое возможно? [unicode 8212] удивляется она. [unicode 8212] Ты еще как-то ухитряешься говорить?»[line break]","«Да, [unicode 8212] произносишь ты с мучительным стоном, [unicode 8212] я… го-во-рю».[line break]","«Невероятно! Жюльен, это же чудо! Ты помнишь что-нибудь?»[paragraph break]","[headchatter][italic type]«Жюльен? Это еще кто? [unicode 8212] спрашивает Лаки».[line break]","«Не я, [unicode 8212] отзывается Мыш. [unicode 8212] Может, это нашего друга Мозголомтика так зовут?»[line break]","«Я не знаю, но конечно, я вполне могу быть этим Жюльеном. В конце концов, почему бы и нет?»[roman type][paragraph break]«Ровным счетом ничего. Я совсем ничего не помню… Жюльен… Это я?»[line break]","«Да, Жюльен, это ты. А я [unicode 8212] твоя Изабель. Изабель Рамбо», [unicode 8212] отвечает женщина разочарованным тоном.[paragraph break]"
}.

The list of text called parleyText2 is always {
"[headchatter][italic type]«У нее красивые глаза (для великанши, конечно)», [unicode 8212] замечает Мыш.[line break]","«Заткнись», [unicode 8212] в один голос говорят Мозголомтик и Лаки.[roman type][paragraph break]Ты заставляешь себя выговаривать слова, одно за одним.[paragraph break]","«Что. Ты. Здесь. Делаешь?»[line break]«Жюльен, у меня нет времени. Я [unicode 8212] исследователь-медик, а ты [unicode 8212] охранник. Мы оба работаем в учреждении, занимающимся поиском лекарства от вируса Зомби777, опустошившего всю планету».[line break]","«Охранник?»[line break]«Да. Слушай внимательно, Жюльен, это важно. Толпа жертв пандемии окружила наш лабораторный комплекс, и один из них"," поцарапал тебя, когда ты пытался меня защитить. Мне пришлось опробовать на тебе экспериментальной метод лечения, чтобы ты не превратился в зомби».[line break]","«Так я выздоровел?»[line break]«Если бы!»[paragraph break]"
}.

The list of text called parleyText3 is always {
"«То есть лечение не сработало?» [unicode 8212] спрашиваешь ты.[line break]«По-видимому, не до конца. У меня возникла проблема с микроструйной установкой биосинтеза, где была приготовлена"," доза, которую я тебе дала. Мне кажется, там не хватало одного ингредиента. Я пыталась отремонтировать установку и так увлеклась, что ты застал меня врасплох. Ты напал на"," меня, но мне удалось спрятаться здесь, в шлюзе. Вот так примерно и обстоят дела».[line break]","«Прости».[line break]«Это был не ты. На тот момент ты был самым настоящим зомби. Но... Как тебе удается говорить? Я никогда не слышала о говорящих зомби [unicode 8212] такого просто не бывает».[paragraph break]"
}.

The list of text called parleyText4 is always {
"«Нам действительно тяжело говорить».[line break]«Конечно, при таком-то состоянии нейронных связей … Постой-ка… Что значит [unicode 8222]нам[unicode 8220]?»[paragraph break][headchatter][italic type]«Расскажи ей про меня», [unicode 8212] умоляет Мыш, еле сдерживая эмоции.[line break]","«И про меня!» [unicode 8212] добавляет Лаки.[roman type][paragraph break]«Да. Насчет этого. Я сказал [unicode 8222]нам[unicode 8220], потому что в моей голове сразу три разума: мышь, собака по кличке Лаки и кусочек мозга. Мы стараемся действовать сообща, чтобы худо-бедно передвигаться и"," разговаривать».[line break]«Ну что ж, [unicode 8212] Изабель бросает задумчивый взгляд на потолок, собираясь с мыслями, [unicode 8212] похоже, это объясняет всё. Твой мозг был перезагружен, стерт"," вирусом, но каким-то образом ты сумел, так сказать, зарядить его нормальными мозгами. Тот кусочек мозга, о котором ты говоришь [unicode 8212] это, судя по всему, тот биопсийный"," образец, который я взяла у Жюльена до того, как вирус проник в эту часть его мозга».[paragraph break]"
}.

The list of text called parleyText5 is always {
"«Так что, для нас теперь всё потеряно?» [unicode 8212] спрашиваешь ты.[paragraph break][headchatter][italic type]«Нам хана», [unicode 8212] жалобно пищит Мыш.[line break]«Похоже на то», [unicode 8212] вздыхает Лаки.[roman type][paragraph break]«Может, и нет…»[line break]«У тебя есть идеи?»","[line break]«Мне кажется, да. Делай, как я говорю: мне всё равно недолго осталось. Я уже и ног своих не чувствую, мое время подходит к концу. Но... если ты съешь мои мозги [unicode 8212] постой, не так"," быстро! Дай мне закончить [unicode 8212] спасибо. Как я уже сказала, если ты съешь мои мозги, моя личность сольется с вашими. Ты по-прежнему инфицирован, и со временем вирус"," разрушит остатки твоего мозга, но лекарство все-таки затормозило его распространение, хотя и не принесло полного исцеления. Хватило бы времени [unicode 8212] я бы тогда починила установку"," биосинтеза, и мы смогли бы еще раз попытаться изготовить лекарство от вируса. Если у нас всё получится, я буду жить внутри тебя, среди твоих мыслей».[line break]«А теперь можно съесть твои"," мозги?»[line break]«Угощайся».[paragraph break]"
}.
									
Section 7 - simpleRepairing

simpleRepairing is an action applying to nothing. Understand "repair" as simpleRepairing.
	
Carry out simpleRepairing:
	repeat with the item running through visible things:
		if the item is:
			-- the microfluidic synthesis unit:
				if the microfluidic synthesis unit is broken and the microfluidic synthesis unit is open:
					say "Ты смахиваешь кусок припоя с контактов. Можно надеяться, что теперь установка будет работать нормально (если подать на нее питание).";
					now the microfluidic synthesis unit is not broken;
				otherwise:
					if the curedFlag of the player is true:
						say "Всё оборудование работало безупречно, так что чинить здесь больше нечего.";
					otherwise: [broken mfsu means flipped circuit breakers, so this would be true]	
						say "Само оборудование выглядит исправным [unicode 8212] похоже, дело в отсутствии электричества в помещении.";	
				stop the action;
			-- the disjoncteurs:
				if the the microfluidic synthesis unit is broken:
					say "Едва ты отпускаешь предохранители, внутри щита раздается громкий щелчок, и ты видишь, что они вновь оказались сброшены[one of][or][or]. [circuitHint2][or]. [circuitHint3][or]. [circuitHint4][or][stopping].";
				otherwise:
					if the disjoncteurs are broken:
						say "Ты включаешь предохранители. Подача электричества в лабораторию молекулярного синтеза, по идее, должна быть восстановлена.";
						now the disjoncteurs are not broken;
					otherwise:
						say "Предохранители уже включены, так что электричество, скорее всего, поступает ко всем потребителям на втором уровне комплекса.";
				stop the action;
	[if it falls through to this point, give the default blocking message]
	say "Ты не видишь здесь ничего, что нуждалось бы в ремонте."
	
To say circuitHint2:
	say "До тех пор, пока не будет устранена проблема в цепи питания, предохранители будут автоматически сбрасываться, чтобы нежное оборудование в лаборатории не было повреждено".
	
To say circuitHint3:
	say "Предохранители так и будут сбрасываться, пока ты не разберешься с проблемой, вызывающей мощную утечку тока в лаборатории".
	
To say circuitHint4:
		say "Очень вероятно, что там что-то перемкнуло. Вот этим тебе бы и заняться в первую очередь".

	
Section 8 - Numbering

Numbering is an action applying to one number. Understand "[number]" as numbering. 

Carry out numbering:
	do nothing.
	
Chapter 13 - Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.

Chapter 14 - Known Commands

The list of actions called possibleActions is always {going east, going west,simpleEating,simpleOpening,going north,going south,simplePushing,simpleUnlocking,simpleTalking,simpleRepairing}.

The list of text called printedActions is always {"восток", "запад", "есть", "открыть", "север", "юг", "нажать", "отпереть ", "говорить","починить"}.

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	if the knownCommands of the player is 8:
		remove all elements called "boutons";
		place an inline element called "hidden" reading "Commands have switched from colors to actual command words, which are:";
		repeat with N running from 1 to 7:
			set output focus to the element called "leftgutter";
			place a link to the command "[N]" called "boutons box[N] literate" reading "[entry N of printedActions]", without showing the command;
			set output focus to the main window;
			place an inline element called "hidden" reading " [if N is 7]и [end if]";
			place an inline element called "hidden" reading "[entry N of printedActions] ";
	place an inline element called "hidden" reading "Появилась новая команда: ";
	if the knownCommands of the player is less than 8:
		choose row knownCommands of the player in the Table of Palette;
		place an inline element called "hidden" reading "[knownCommands of the player]: [Palette-RU entry].";
		set output focus to the element called "leftgutter";
		place a link to the command "[knownCommands of the player]" called "boutons box[knownCommands of the player] [Palette-EN entry]" reading "[knownCommands of the player]: [Palette-RU entry]", without showing the command;
	otherwise:
		place an inline element called "hidden" reading "[entry knownCommands of the player of printedActions].";
		set output focus to the element called "leftgutter";
		place a link to the command "[knownCommands of the player]" called "boutons box[knownCommands of the player] literate" reading "[entry knownCommands of the player of printedActions]", without showing the command;
	set output focus to the main window.

After reading a command:
	[To prevent players bypassing the CSS to play beyond end of game]
	if the knownCommands of the player is zero:
		say "Игра окончена. Для повторного прохождения перезапустите игру в браузере.";
		reject the player's command;
	[To reject non-numerical input]
	if the player's command does not match "[number]":
		say "Выберите одну из команд выше.";
		reject the player's command;
	[process numerical input]	
	let C be the number understood;
	[accept known commands only]
	if (C > knownCommands of the player) or (C < 0):
		say "Выберите одну из ссылок на команды, указанных выше.";
		reject the player's command;
	if C is 0:
		place an inline element called "command" reading "> переключить экран";
		try toggling;
	otherwise:
		place an inline element called "command" reading "> [entry C of printedActions]";
		try entry C of possibleActions.
				
Chapter 15 - Milestones

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
	say "[headchatter][italic type]Ах, этот огромный белый коридор. [paragraph break]Сколько раз я видел, как эти гиганты проходили прямо сквозь сплошные стены, проникая в секретные комнаты? Как они это делают?[roman type][line break]";
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
	move the chien to the void;
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
"[headchatter][italic type]«Нам пора отправляться патрулировать», [unicode 8212] командует новый голос.[line break]","«Патрулировать? Что это значит?» [unicode 8212] спрашивает мышь.[line break]","«Ну, это значит обойти каждый уголок и обеспечить безопасность здания», [unicode 8212] отвечает голос.[line break]","«Люблю прогулки!» [unicode 8212] с энтузиазмом заявляет Лаки.[roman type][line break]"
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
"[line break]Ты выедаешь исследовательнице мозг и немедленно начинаешь воспринимать мир под другим углом зрения, чувствуя себя более утонченным и эрудированным.[paragraph break][headchatter][italic type]«Ты сделал это?» [unicode 8212] с сомнением спрашивает голос Изабель.","[line break]«Да, ты была просто объедение», [unicode 8212] делает ей комплимент Мыш.[line break]«Самая вкусная из всех», [unicode 8212] добавляет Лаки.","[line break]«Прости моих соседей по мозгу, им так не хватает такта», [unicode 8212] прерывает их Мозголомтик.[line break]«Эй!» [unicode 8212] возмущенно вскрикивают пес с мышью.","[line break]«Будь как дома, Изабель, [unicode 8212] продолжает Мозголомтик. [unicode 8212] Давай я представлю тебе нашу маленькую компанию: вот пес Лаки, а это Его Светлость Мышиный ","Герцог (или просто Мыш, поскольку он у нас очень скромный), ну, и я [unicode 8212] друзья называют меня Мозголомтиком. Мы все к твоим услугам».","[line break]«Привет, мальчики», [unicode 8212] приветливо говорит Изабель.[roman type][line break]"
}
		
Chapter 16 - Dialogue

The list of text called curedText is always {
"Роботизированная станция издает короткий писк и заполняет флакончик зеленоватой флуоресцентной жидкостью. Ты берешь ","флакончик, произносишь короткий тост за собственное здоровье и выпиваешь всю жидкость одним глотком.[paragraph break][headchatter][italic type]","«Я ничего не чувствую», [unicode 8212] беспокоится Мозголомтик.[line break]«Подожди», [unicode 8212] успокаивает его Изабель.[line break]","«И я тоже», [unicode 8212] подает голос Мыш.[line break]","«Имей же терпение», [unicode 8212] повторяет женщина.[line break]","«Ёшкин кот!» [unicode 8212] гавкает Лаки. «Кажется, что-то…»[line break]","«Поехали!» [unicode 8212] выкрикивает доктор Рамбо.[roman type][paragraph break]","Тебя начинает бить дрожь, и ты оседаешь на пол, теряя сознание. Когда ты приходишь в себя и вновь встаешь, то ","обращаешь внимание, что твоя кожа приобрела свой нормальный оттенок, и ты теперь в состоянии ходить, не ","раскачиваясь, словно тростник на ветру. Короче говоря, ты исцелен.[paragraph break]"
}

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the the microfluidic synthesis unit is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			tell curedText;
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[headchatter][italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[headchatter][italic type]«";
					tell entry 1 of mouseDogDialogue;
					say "».[roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[headchatter][italic type]";
					tell entry 1 of mouseDogGuardDialogue;
					say "[roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[headchatter][italic type]";
						tell entry 1 of CuredDialogue;
						say "[roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[headchatter][italic type]";
						tell entry 1 of EverybodyDialogue;
						say "[roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false;
	listExits;
	if the knownCommands of the player is greater than 0:
		listHiddenExits.
	
This is the scroll update rule:
	execute javascript command "$('html, body').animate({scrollTop:$(document).height()}, 1);".
	
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
{"Не переживай из-за этого. На твоем месте я поступил бы так же».[line break]«Спасибо».[line break]«Скажи, мышь, у тебя есть имя?»[line break]","«Нет, мы, мыши, обходимся без имен. Так что можешь звать меня просто Мышью, точнее [unicode 8212] Мышом. Ну, а тебя как звать?»[line break]","«Лаки. Ну, по крайней мере так называли меня в моей семье, пока я не попал сюда. Местные живодеры называют меня [unicode 8222]Объект 205-Альфа[unicode 8220], но Лаки мне как-то больше нравится».[line break]«Хорошо, Лаки"},
{"Мыш, ты можешь мне кое-что объяснить? Как так получилось, что ты, крошечная мышка, проглотил меня [unicode 8212] крупного, сильного пса, в десятки раз превосходящего тебя в размерах?»[line break]","«Ты знаешь, я задавался тем же вопросом. Постой-ка [unicode 8212] ты сказал [unicode 8222]пес[unicode 8220]? Я думал, ты волк!»[line break]«Нет, я собака».[line break]«Ты уверен?»[line break]«Да, вполне"},
{"Никак не могу догадаться, как же я тебя съел».[line break]«Ты что-нибудь об этом помнишь?»[line break]«Я неожиданно почувствовал непреодолимое желание съесть мозги».[line break]«Мозги? Что за мозги?»[line break]«В данном случае твои».[line break]«А, понятно… Точнее, ничего не понятно"},
{"Мыш, ты всегда здесь жил?»[line break]«Мы обитаем здесь много поколений, это наше родовое гнездо. Мы охраняем его от посягательств всяких захватчиков. Мыши-полевки [unicode 8212] это сплошь бандиты, гопники и воры».[line break]","«Ты когда-нибудь видел мир снаружи?»[line break]«У меня нет ни малейшего желания. Конечно, мне рассказывали там про небо, облака всякие, поля и тому подобное, но меня это не интересует"},
{"А у тебя как, Лаки? Ты вроде говорил про семью. У тебя есть жена? Мы, мыши, не особо верим в брак, но я слыхал, что собаки в этом отношении более консервативны».[line break]","«Семья, да, но не жена (хотя соседская пуделиха… ну ладно, это другая история). Нет, когда я говорю про семью, то имею в виду семью людей"},
{"Ты был у них в рабстве?» [unicode 8212] спрашивает Мыш.[line break]","«Да нет, ну что ты. Я играл с детьми, они меня кормили, дни напролет ласкали и гладили меня, у меня даже кровать своя была».","[line break]«Ты выдумываешь. Никогда ничего подобного не видел. Люди не выносят животных [unicode 8212] они так и норовят раздавить нас ногой"},
{"Да ты просто вообще ничего не знаешь о людях», [unicode 8212] заключает Лаки.[line break]","«Что характерно [unicode 8212] и знать не хочу, благодарю покорно».[line break]","«Тебе бы понравилась моя семья».[line break]«В таком случае, разреши поинтересоваться, что же заставило тебя покинуть такую замечательную семью?»[line break]","«Не то чтобы я ушел от них специально. Мы гуляли в лесу, я увидел белку, а дальше ты сам можешь всё себе представить. С тех пор я их не видел».[line break]","«Только не говори мне про белок. Они еще хуже полевок"},
{"Лаки, как ты думаешь, ты найдешь свою семью?»[line break]«Очень на это надеюсь».[line break]","«Я тоже. Мы бы с тобой показали этим белкам!»[line break]«Ага, это было бы круто"}
}

Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of lists of text that varies. 

mouseDogGuardDialogue is { 
{"«Разреши задать вопрос, [unicode 8212] начинает Мыш,  [unicode 8212] кто ты, собственно, такой?»[line break]","«Меня зовут... эээ... как же его... секундочку... мда, хороший вопрос. Похоже, я не могу сейчас вспомнить свое имя. Почему бы вам не придумать его самим?»[line break]","«Давай назовем его [unicode 8222]маленький кусочек мозга, который мы нашли в холодильнике и у которого был странноватый вкус[unicode 8220]», [unicode 8212] предлагает Лаки.[line break]","«Нет, это слишком длинно. Давай просто назовем его Мозголомтиком. Как тебе такое имя?»","[line break]«Подойдет, [unicode 8212] соглашается Мозголомтик. [unicode 8212] С учетом всех обстоятельств я предпочитаю попроще имена»."},
{"«Ребят, а у вас есть имена?» [unicode 8212] спрашивает Мозголомтик.[line break]","«Да, [unicode 8212] отвечает пес. [unicode 8212] Извини, что пренебрегли этикетом. Меня зовут Лаки, а моего друга мышь можно просто звать Мышом».[line break]","«Именно», [unicode 8212] подтверждает мышь.[line break]«Друзья, очень приятно с вами познакомиться»."}, 
{"«Ну, Мозголомтик, расскажи, каким животным ты был до того, как попал сюда. Я был собакой, а Мыш всегда был мышью».[line break]","«Я был кем-то другим, чем кусочек мозга?»[line break]","«Мне кажется, ты был холодильником, [unicode 8212] высказывает предположение Мыш. [unicode 8212] Я съел мозг собаки, и появился Лаки. После этого мы открыли холодильник и съели его содержимое, и появился ты».[line break]","«Сомневаюсь, что это работает именно так», [unicode 8212] вполголоса замечает Лаки."}, 
{"«Когда ты появился, ты сказал, что нам надо [unicode 8222]обеспечить безопасность здания[unicode 8220]. Что ты имел в виду?» [unicode 8212] спрашивает Лаки.[line break]","«Я имел в виду, что мы должны осмотреть всё здание, чтобы обеспечить защиту от любых угроз».[line break]","«Хорошo, [unicode 8212] говорит Мыш, стараясь не терять нить беседы, [unicode 8212] но что ты имеешь в виду под зданием?»","[line break]«Здание? Ну, это комплекс... точнее, это место, где все работают... Хм... В общем, это то, где мы есть», [unicode 8212] заключает Мозголомтик."}, 
{"«О каких угрозах ты говоришь?» [unicode 8212] спрашивает мышь.[line break]","«Если честно, я не помню, [unicode 8212] вздыхает Мозголомтик. [unicode 8212] Просто рехнуться можно! Я не могу их вспомнить, но я уверен, что их полным-полно и одна хуже другой».[line break]","«Ты знаешь, похоже, у тебя паранойя», [unicode 8212] замечает пес.[line break]","«Всё может быть, но если бы я мог вернуть свои воспоминания... Нет, боюсь, они утрачены»."}, 
{"«Думаешь, мы можем как-нибудь вернуть твои воспоминания?» [unicode 8212] интересуется Лаки.[line break]","«Как бы мы это сделали? Я пытался вспомнить самые разные вещи, но ничего в голову не приходит».[line break]","«Возможно, это потому, что ты просто маленький кусочек мозга, [unicode 8212] замечает Мыш. [unicode 8212] Если бы нам удалось найти оставшуюся часть твоего мозга [unicode 8212] ","а она, не исключено, находится где-то здесь [unicode 8212] мы бы могли съесть ее и восстановить твою потерянную память, не так ли?»[line break]","«Ты и вправду так думаешь?» [unicode 8212] недоверчиво переспрашивает Мозголомтик.[line break]","«Даже не сомневайся», [unicode 8212] подтверждает пес."}, 
{"«Но что, если оставшийся мозг найдет нас до того, как мы найдем его?» [unicode 8212] задает вопрос Мыш.[line break]","«И что с того?» [unicode 8212] говорит Лаки.[line break]","«Тогда он сможет съесть нас до того, как мы съедим его», [unicode 8212] с тревогой отвечает грызун.[line break]","«Но это же ничего не изменит! Мы же в любом случае останемся вместе, разве не так?» [unicode 8212] замечает Мозголомтик.[line break]","«Да, но вообще мне больше нравится съедать других до того, как они съедят меня»."}, 
{"«Знаете, что нам нужно? [unicode 8212] спрашивает Лаки. [unicode 8212] План. Нам нужен план действий».[line break]","«Согласен, [unicode 8212] отзывается Мыш. [unicode 8212] Что ты предлагаешь?»[line break]","«Во-первых, [unicode 8212] начинает пес, [unicode 8212] нам надо продолжить обход, чтобы, как сказал Мозголомтик, обеспечить защиту здания от угроз. Во-вторых, найти недостающий мозг. И в [unicode 8212] ... эээ, ну в каких-то там после двух, нам надо бежать отсюда».[line break]","«Класс! Лаки, ты просто гений», [unicode 8212] восхищается Мозголомтик."},
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
{"«Какое невероятное чувство!» [unicode 8212] восхищается женщина.[line break]«Со временем к этому привыкаешь», [unicode 8212] лаконично замечает Мыш.[line break]«","Расскажи ей наш план, Лаки», [unicode 8212] предлагает Мозголомтик.[line break]«Хорошо, [unicode 8212] отзывается пес, [unicode 8212] хотя план слегка поменялся… ","Во-первых, нам надо найти оставшуюся часть мозга Жюльена. ","Во-вторых, нам надо выбраться из здания; и в-что там после двух, мы займемся поисками моей семьи»."},
{"«Пусть так, [unicode 8212] говорит Изабель, [unicode 8212] но прежде всего нам надо пройти за пределы помещения, где вы меня встретили, а для этого нам надо синтезировать лекарство».[line break]","«Это невозможно», [unicode 8212] отрезает Мыш.[line break]«Почему?» [unicode 8212] слегка ошарашено спрашивает исследовательница.[line break]","«Это вопрос математики, [unicode 8212] педантично разъясняет Мыш. [unicode 8212] План Лаки начинается с пункта номер один. Перед номером один ничего нет».[line break]","«Номер ноль?» [unicode 8212] высказывает предположение Изабель.[paragraph break][roman type]«…»[paragraph break][italic type]«Ладно, [unicode 8212] соглашается она, [unicode 8212] а как насчет перенумерации? Первый пункт: приготовить лекарство; второй пункт: выбраться из здания; третий пункт: найти семью Лаки. Так пойдет?»[line break]","«Конечно, [unicode 8212] говорит Лаки, [unicode 8212] это звучит вполне разумно».[line break]","«И к тому же совершенно корректно с точки зрения математики», [unicode 8212] добавляет Мыш."},
{"«Послушайте, [unicode 8212] говорит Лаки, снова и снова пересчитывая пункты плана, предложенного Изабель, [unicode 8212] а что нам делать по поводу пропавшего мозга? Если я ничего не путаю, без него нам не привести Жюльена в норму».[line break]","«К сожалению, [unicode 8212] отвечает Изабель, [unicode 8212] тот кусочек мозга [unicode 8212] это всё, что на данный момент осталось от Жюльена. Хотя мы сейчас и используем его нейронные связи для своих мыслей, от ","первоначальной личности Жюльена не осталось ничего, кроме частички, сохраненной в биопсийной пробе его мозга. Это тяжелая потеря, особенно для меня».[line break]","«Почему именно для тебя?» [unicode 8212] интересуется Мыш.[line break]","«Потому что мы, Жюльен и я, собирались пожениться».[line break]","«Прости, [unicode 8212] пытается утешить ее Мозголомтик. [unicode 8212] Уверен, что если бы я смог вспомнить тебя, то обязательно полюбил бы»."},
{"«Изабель, как ты думаешь, мы сможем когда-нибудь найти мою семью?» [unicode 8212] спрашивает Лаки.[line break]","«Да, несомненно».[line break]«Почему ты так уверена?» [unicode 8212] недоумевает Мозголомтик.[line break]","«Потому что я знаю эту семью: Жан-Поль и Александра Драммонды и их дочери, Леа и Камилла. Они живут всего-то метрах в ста от нас с Жюльеном».[line break]","«Да, я часто слышал эти имена у себя дома. Точно, ты права! Но как ты догадалась, о ком я говорю?» [unicode 8212] удивляется Лаки.[line break]","«Просто я видела их в твоих мыслях», [unicode 8212] отвечает она."},
{"«Ты хочешь сказать, что можешь видеть, о чем думает Лаки? [unicode 8212] изумляется Мыш. [unicode 8212] Как такое возможно?»[line break]","«Мы все сейчас являемся частями одного мозга. Наши умы в той или иной степени соединены друг с другом. Я могу проникнуть в его мысли, а он, в свою очередь [unicode 8212] в мои».[line break]","«Круто! [unicode 8212] восклицает Мыш. [unicode 8212] У нас теперь есть суперспособности»."},
{"«Должен сказать, мне как-то с трудом в это верится, [unicode 8212] сомневается пес. [unicode 8212] Если ты видишь мои мысли, скажи, какое число я сейчас загадал?»[line break]","Женщина на мгновение задумывается и выдает: «Единицу».[line break]","«Угадала, [unicode 8212] нехотя признает пес. [unicode 8212] Но, возможно, это просто случайное совпадение. Попробуй-ка еще раз…»[line break]","«Теперь ты думаешь о числе два», [unicode 8212] уверенно заявляет Изабель.[line break]","«И снова угадала!» [unicode 8212] говорит пес, на сей раз убежденный в ее способностях.[line break]","«Да ну, [unicode 8212] возражает Мыш, [unicode 8212] Лаки всего до двух умеет считать... Тоже мне доказательство!»"},
{"«Ладно, [unicode 8212] терпеливо отвечает исследовательница, [unicode 8212] давайте еще один пример. Мыш, в данный момент я вспоминаю свой сегодняшний завтрак. Я пытаюсь представить его себе во всех подробностях... Попробуй его увидеть».[line break]","«Где? [unicode 8212] спрашивает Мыш. [unicode 8212] Я ничего не чую».[line break]","«Ах, [unicode 8212] говорит Изабель, [unicode 8212] вот в чем проблема. Я думала зрительными образами. Ну, давай я представлю себе его аромат, его вкус… »[line break]","«О! Да, да! Я чувствую! Офигеть! Сколько еды! Это фантастика. И я могу заново пережить все твои завтраки, обеды и ужины? Ущипните меня, я сплю»."},
{"«Хотя твои воспоминания о последнем завтраке просто восхитительны, сейчас мне не хочется есть ничего, кроме мозгов. Это как-то странно, правда?» [unicode 8212] замечает Мыш.[line break]","«Вообще-то это совершенно нормально для зомби», [unicode 8212] отвечает Изабель.[line break]","«То есть мы [unicode 8212] компания зомби?» [unicode 8212] спрашивает Лаки.[line break]","«Не совсем так, [unicode 8212] поясняет женщина. [unicode 8212] Поскольку мы делим одно тело, то и зомби мы всего один».[line break]","«Ну, хоть я нахожусь в своем собственном теле», [unicode 8212] вздыхает Мозголомтик."}, 
{"«А другие зомби такие же милые, как мы?» [unicode 8212] задает вопрос Лаки.[line break]","«Ну что ты, [unicode 8212] отвечает Изабель, [unicode 8212] они настоящие чудовища. Мы совершенно другие. Я бы сказала, что после частично успешного лечения мы стали чем-то вроде псевдозомби. Обычный зомби не умеет ни говорить, ни думать, а только пожирает мозги».[line break]","«А это проблема?» [unicode 8212] спрашивает Мыш.[line break]","«Еще какая! [unicode 8212] говорит исследовательница. [unicode 8212] Они почти уничтожили цивилизацию!»"}, 
{"«Неужели такое могло случиться?» [unicode 8212] удивляется Мозголомтик.[line break]","«Способность этого вируса к распространению беспрецедентна, [unicode 8212] поясняет женщина-ученый. [unicode 8212] Малейшей царапины достаточно, чтобы заразиться. Первые случаи заболевания были зарегистрированы в Камбодже,"," а уже через двадцать четыре часа пассажиры международных авиарейсов разнесли заразу по всему миру [unicode 8212] счет жертв пошел на тысячи. Еще через"," неделю наступил глобальный хаос. Во всех крупнейших городах практически немедленно случился коллапс из-за отсутствия продовольствия,"," воды и электричества. Сельские поселения охвачены пожарами."," От человечества осталась жалкая горстка выживших»."},
{"«А что с животными? [unicode 8212] спрашивает Мыш. [unicode 8212] Им тоже грозит опасность?»[line break]","«На самом деле, [unicode 8212] отвечает Изабель, [unicode 8212] мы думаем, что первоначальным источником заразы стали собаки. Незадолго до того, как мы утратили связь с"," Пастеровским институтом в Хошимине, им удалось выделить мутировавшую форму вируса бешенства, который, по-видимому, и стал причиной пандемии».[line break]","«Бешенство! [unicode 8212] восклицает Лаки. [unicode 8212] Ужаснее бешенства ничего нет!»[line break]","«Не было до недавнего времени», [unicode 8212] поправляет его Мозголомтик."},
{"«Зомбешенство так быстро распространяется, [unicode 8212] волнуется Лаки, [unicode 8212] как ты думаешь, моя семья выжила?»[line break]","«Я не думаю, я знаю, что да, [unicode 8212] успокаивает его исследовательница. [unicode 8212] Драммонды работают в этом комплексе, а семьи всех работников живут здесь же на его закрытой территории. На самом деле, мы сейчас недалеко от них».[line break]","«Ура!» [unicode 8212] радуется пес."}, 
{"«Изабель, [unicode 8212] интересуется Мыш, [unicode 8212] если лекарство сработает, то что будет с нами?»[line break]","«В каком смысле?»[line break]","«Мы останемся отдельными личностями с собственными мыслями или каким-то образом станем единым разумом?»[line break]","«Не могу сказать. До сих пор у каждого из нас была своя жизнь. У тебя свои воспоминания, у меня свои. Но в будущем мы всё будем"," видеть с одной и той же точки зрения. У нас общее тело, и вполне возможно, что и разум в конце концов станет общим. Сейчас я не могу строить никаких"," прогнозов на этот счет»."}, 
{"«Я никогда не хотел быть никем, кроме как мышью. То, что ты говоришь, ужасно [unicode 8212] что моя личность, мой разум растворится или вообще перестанет существовать».[line break]","«У этого ведь есть и хорошая сторона, [unicode 8212] возражает Лаки. [unicode 8212] Загляни в мои мысли [unicode 8212] вот как бывает, когда гонишься за белкой. А это восхитительное чувство, когда тебя чешут за ушами…»[line break]","«Да, неплохо».[line break]«А вот, [unicode 8212] добавляет Изабель, [unicode 8212] вид Земли из космоса. Этого еще ни одна мышь не видела!»[line break]","«Да, впечатляет. Думаю, у меня, со своей стороны, тоже есть воспоминания, которыми не стыдно поделиться. Это приятное"," тепло, когда спишь, прижавшись к другим мышам, эта радость, когда тыришь крошки вокруг кормушки Лаки…»[line break]","«Эй!» [unicode 8212] рявкает пес."}, 
{"«Когда тело Жюльена вошло в шлюз, я обратила внимание, как тяжело ему идти [unicode 8212] оно просто еле волочило ноги», [unicode 8212] замечает Изабель.[line break]","«Точно. Я знаю, как ходить, [unicode 8212] отвечает Мозголомтик, [unicode 8212] но мне это дается до отвращения тяжело».[line break]","«Да еще мыши всякие путаются, [unicode 8212] жалуется Лаки. [unicode 8212] Он постоянно шевелит ногами, и при этом, мне кажется, сам не понимает, что делает».[line break]","«Это я-то? [unicode 8212] возмущается Мыш.  Да ты сам так и норовишь опуститься на четвереньки!»[line break]","«Ладно, джентльмены, [unicode 8212] подводит итог женщина-ученый, [unicode 8212] как вы думаете, мне удастся убедить вас доверить управление кому-нибудь одному?»[line break]","«Конечно, [unicode 8212] соглашается Мозголомтик, [unicode 8212] тебе и штурвал в руки»."}, 
{"«Спасибо, [unicode 8212] говорит Изабель. [unicode 8212] А теперь мне надо сконцентрироваться, чтобы изготовить лекарство, которое нас вылечит».[line break]","«Правильно [unicode 8212] парни, хорош болтать, не мешайте ей думать», [unicode 8212] призывает Мозголомтик.[line break]","«Ладно», [unicode 8212] отвечают пес с мышью и замолкают."}
}

Section Cured Dialogue

CuredDialogue is a list of lists of text that varies. 
	
CuredDialogue is {
{"«Вроде всё, [unicode 8212] говорит исследовательница, [unicode 8212] теперь пора устроить перекличку. Лаки?»[line break]«Здесь».[line break]«Мышиный Герцог?»[line break]«Присутствует».[line break]","«Мозголомтик?»[line break]«На месте».[line break]«Отлично, [unicode 8212] подводит итог Изабель, [unicode 8212] похоже, мы все пережили лечение без потерь»."},
{"«Ну что, будем выбираться отсюда?» [unicode 8212] предлагает пес.[line break]«Да», [unicode 8212] говорит Изабель.[line break]","«Но внешний шлюз по-прежнему заблокирован, и никто не сможет открыть его, кроме полковника Грелье из комнаты управления», [unicode 8212] замечает Мозголомтик.[line break]","«Да, нам придется убедить его отпереть шлюз», [unicode 8212] соглашается женщина-ученый. "},
{"«Мне как-то удивительно, что ты помнишь полковника Грелье. Мне казалось, что ты не в состоянии запоминать имена».[line break]","«Полковника-то? – восклицает Мозголомтик. [unicode 8212] Как же я могу забыть твоего начальника? На прошлой неделе он свалился в бассейн на праздновании своего дня рождения. Думаю, мы все слегка перебрали в тот вечер».[line break]","«Перебрали? [unicode 8212] переспрашивает Мыш. [unicode 8212] Дай-ка я гляну в твоих мыслях... Перебрали, говоришь? Выглядит забавно».[line break]«Мыш, подожди секундочку, [unicode 8212] просит Изабель, [unicode 8212] Жюльен, ты только что высказал сложную мысль. Как ты думаешь, память к тебе возвращается?»","[line break]«Хм. Откуда ж мне знать?»"},
{"«Жюльен, [unicode 8212] говорит исследовательница, [unicode 8212] что ты подарил мне на наше первое Рождество?»[line break]«Перчатки?»[line break]«И они были… »[line break]","«Слишком велики тебе! Да, я вообще-то купил их брату, но когда ты вручила мне подарок, а у меня ничего для тебя не было… Ты до сих пор из-за них расстраиваешься?»[line break]","«Да нет, что ты. Я просто проверяла твою память»."},
{"«Испытай меня еще раз!»[line break]«Давай. Как ты называешь меня, когда мы наедине?»[line break]«Изабель?»[line break]«Нет, подумай еще! Когда, кроме нас, никого нет…»[line break]","«Я бы не хотел говорить это при Лаки и Мыше».[line break]«Да ладно тебе, [unicode 8212] подбадривает его пес. [unicode 8212] У нас сейчас всё равно один мозг на всех, так что никаких секретов быть не может».[line break]","«Ну хорошо, [unicode 8212] отвечает Жюльен, всё еще колеблясь, [unicode 8212] я называю тебя моим зайчиком».[line break]","«Зайчиком? [unicode 8212] удивляется Мыш. [unicode 8212] Она была зайцем? Вот теперь я окончательно запутался»."},
{"«Отлично, Жюльен, похоже, ты на пути к восстановлению своей памяти», [unicode 8212] говорит женщина.[line break]","«Ты правда так думаешь? Даже несмотря на то, что, как ты говорила, я [unicode 8212] всего лишь маленький кусочек мозга? А может, это вовсе и не мои воспоминания, а я просто выуживаю их из твоих мыслей?»","[line break]«Я бы сказала, что маленький кусочек мозга вряд ли способен сформулировать такую сложную гипотезу. ","Мне кажется, твой мозг снова в деле в полном объеме»."},
{"«Но, если я правильно тебя понял, [unicode 8212] говорит Лаки, [unicode 8212] ты говорила, что вирус полностью стирает мозги у зомби, не оставляя ничего».[line break]","«Да, я это говорила, [unicode 8212] признает Изабель, [unicode 8212] но мы никогда не имели дела с подобным случаем. ","По-моему, настало время пересмотреть наши представления о происходящем. Похоже, что мозг не разрушается [unicode 8212] вирус лишь подавляет высшие мыслительные процессы. ","Нейронные связи остаются целы. На самом деле, иначе и быть не может: без использования этих связей мы бы просто не могли существовать»."},
{"«Но это же замечательно! [unicode 8212] заявляет Жюльен. [unicode 8212] Это значит, что мы сможем вылечить всех зомби!»[line break]","«Господи, Жюльен, ты прав. Мы не потеряли их, [unicode 8212] отвечает исследовательница. [unicode 8212] С тех пор, как всё это началось, у нас впервые появился шанс вернуть мир в нормальное состояние и покончить с этим кошмаром».[line break]","«Это и заболевших собак касается?» [unicode 8212] уточняет Лаки.[line break]","«Конечно, и собак, и всех других пораженных вирусом животных», [unicode 8212] подтверждает Изабель."},
{"«И что теперь?» [unicode 8212] спрашивает Мыш.[line break]","«Жюльен, [unicode 8212] взволнованно говорит Изабель, [unicode 8212] нам необходимо поговорить с полковником и убедить его, что ты исцелен и что у нас есть теперь способ бороться с вирусом».","[line break]«Хорошо, я постараюсь», [unicode 8212] соглашается Жюльен.","[line break]«Вперед, друзья!» восклицает Мыш."}
}.

Chapter 17 - The Void

The void is a room.

The small gray creature is an edible thing. It is in the void. The printed name of the small gray creature is "маленькое серое существо".

The bloody corpse of Docteur Rambaud is a thing in the void. The printed name of the bloody corpse of Docteur Rambaud is "окровавленный труп доктора Рамбо".

The intercom is a buttoned thing in the void. The intercom can be live. The intercom is not live. The printed name of the intercom is "переговорное устройство".

Instead of pushing the intercom:[only present at consciousness 4]
	if the intercom is not live:
		say "На переговорном устройстве загорается маленький красный светодиод, показывающий, что линия связи с комнатой управления включена.";
		now the intercom is live;
	otherwise:
		say "Ты уже включил переговорное устройство [unicode 8212] об этом говорит горящий красный светодиод."

The panneau électrique is an openable closed container in the void. The printed name of the panneau électrique is "электрощит".

The disjoncteurs are in the panneau électrique. The indefinite article of the disjoncteurs is "несколько". The disjoncteurs are broken. The printed name of the disjoncteurs is "[if the disjoncteurs are broken]сброшенные[otherwise]включенные[end if] автоматические предохранители".  

After opening the panneau électrique:
	say "Открыв электрощит, ты видишь несколько сброшенные автоматические предохранители."

The microfluidic synthesis unit is an openable closed female container in the void. The printed name of the microfluidic synthesis unit is "микроструйную установку синтеза". The microfluidic synthesis unit is broken.

After opening the microfluidic synthesis unit:
	say "Открыв сервисную панель, ты сразу видишь причину проблемы: кусок припоя замкнул выводы одного из сервоприводов."

Chapter 18 - End Game

To terminate the game:
	remove all elements called "vorple-link";
	say "[VictoryText]";
	infos;
	credits;
	[to prevent players bypassing CSS from continuing past this point]
	now the knownCommands of the player is 0.
	
To say VictoryText:
	say "[paragraph break]        *** ТЫ ПОБЕДИЛ ***[roman type][paragraph break]Ты спас мир от вируса Зомби777.[paragraph break]".
	
To infos:
	say "[bold type]>об игре[roman type][line break]Эта игра изначально была написана на Конкурс Интерактивной Литературы на Французском-2018. Английский перевод игры участвовал в конкурсе IFcomp 2018 года. Русский перевод игры принял участие в КРИЛ-2018. Игра написана на Inform 7. Исходный код доступен на ";
	place a link to web site "https://github.com/dhakajack/fds-ru" reading "Гитхабе";
	say " и может использоваться в соответствии с условиями лицензии MIT. Об ошибках в игре сообщайте, пожалуйста, через баг-трекер на Гитхабе.[paragraph break]".
	
To credits:
	say "[bold type]>благодарности[roman type]";
	open HTML tag "ul";
	open HTML tag "li";
	say "Организаторам всех трех вышеупомянутых конкурсов.";
	close HTML tag;
	open HTML tag "li";
	say "Грэхему Нельсону (Graham Nelson) за создание платформы Inform.";
	close HTML tag;
	open HTML tag "li";
	say "Создателям дополнительных библиотек, использовавшихся в этом произведении (в том числе в его предыдущих версиях): Эрику Форжо (Éric Forgeot), Эмили Шорт (Emily Short), Эрику Темплу (Erik Temple), Юхане Лейнонен (Juhana Leinonen).";
	close HTML tag;
	open HTML tag "li";
	say "Бену Коллинзу-Суссману (Ben Collins-Sussman), нарисовавшему обложку к игре.";
	close HTML tag;
	open HTML tag "li";
	say "Всем, кто помогал вычитать текст и тестировать игру: Эрику Форжо (Éric Forgeot), Стефану Флодеру (Stéphane Flauder), Денизе Жобан (Denise Jobin), Брайану Раштону (Brian Rushton)";
	say " и Хьюго Лабранду (Hugo Labrande) (исходная французская версия);  Ларе Уэлч, Бену Коллинзу-Суссману (Ben Collins-Sussman), Андреву Щулзу (Andrew Schultz),";
	say " Валентину Коптельцеву и Давиду Уейту (David White) (английская версия); и Антону Ласточкину (русская версия).";
	close HTML tag;
	open HTML tag "li";
	say "Кораксу (Corax) и Михайлу Гервату (Michael Gerwat) за предложения относительно того, как сделать игру более дружелюбной для слабовидящих.";
	close HTML tag;
	close HTML tag;
	say "[bold type]КОНЕЦ."
	