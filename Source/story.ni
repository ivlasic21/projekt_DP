Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.

Table of User Styles (continued)
style name	color	italic	background color
italic-style	"#0000FF"	true	--
bold-style	"#FF0000"	false	"#FFFF00"
alert-style	"#b50029"	true	--


Figure of Clock is the file "/magicstudio-art.jpg".
Figure of papir is the file "/papir.jpg".
Figure of zelensoba is the file "/zelena.jpg".
Figure of ljubisoba is the file "/ljubi.jpg".
Figure of osobe is the file "/osobe.jpg".
Sound of heart is the file "/Hear.ogg".


	
The Soba of Awakening is a room. It is east of The Town Square."You find yourself in a nearly empty room. The walls are gray and bare. In the middle of the room stands an old wooden table with a single chair. Hanging on the wall is an antique clock, its ticking echoing in your mind—strangely familiar yet distant. A vague memory lingers: the sensation of falling. This is something you will never forget, and the surname 'Krševean' echoes faintly in the distance, though you can't quite remember its significance. West is door and north is door"

A wooden table is in the Soba of Awakening. The description of the wooden table is "The table is old and scratched. The edges are chipped, and the varnish is peeling away."

An antique clock is in the Soba of Awakening. The description of the antique clock is "The clock has thick glass and black hands that seem to defy time itself. Its ticking grows louder the longer you stare at it. You feel drawn to it, as if it knows you."

The Living Room is north of the Soba of Awakening. "A cozy living room with a sofa and a small coffee table. The air smells faintly of lavender."

RoomAccess is a truth state that varies. RoomAccess is false.

Instead of going north from the Soba of Awakening:
	if RoomAccess is false:
		say "You can't go north yet. Something is blocking your way.";
	otherwise:
		continue the action.

The Power of Thinking is a text variable.
When play begins:
	now the Power of Thinking is "".
	
After reading a command:
	if the player's command includes "power of thinking":
		say "Your insight is: [Power of Thinking]";


The clock can be normal or time-jumping. The clock is normal.

Instead of examining the clock:
	if the clock is normal:
		say "The clock ticks, steady and calm, as if it is just a normal antique.";
		display figure of Clock;
	otherwise:
		say "The clock ticks louder, and you feel as if it could carry you to another time.";
		display figure of Clock;

Instead of turning the clock:
	if the clock is normal:
		now the clock is time-jumping;
		say "The clock's ticking grows louder and faster, and you feel a strange pull in your chest.";
	otherwise:
		now the clock is normal;
		say "The clock settles into its normal ticking once again, as if nothing happened.";


The Town Square is a room. It is west of the Soba of Awakening. "You step outside into the bustling town square. The air is filled with the sound of distant chatter and the smell of fresh bread from the bakery. In front of you, there are four people standing: three of them are strangers, and only one of them feels oddly familiar — Krševan."

Krsevan is a person in the Town Square. The description of Krsevan is "Krsevan is a man with a strong build and an unmistakable Croatian accent. He seems a bit short-tempered. When you call out his name, he looks irritated."

Laura is a person. The description of Laura is "A young woman with long, yellow hair, wearing a red dress. She looks friendly but distant, as if she's lost in thought."

Nona is a person. The description of Nona is "A woman of older age, with white hair and wise eyes. She looks calm, but she doesn’t acknowledge you."

Sarmelo is a person. The description of Sarmelo is "A tall man with a rugged look and a quiet demeanor. He doesn’t seem to notice you."

Krsevan's isTalking is a truth state that varies. Krsevan's isTalking is false.

Laura, Nona computer and Sarmelo are in a hidden room.

Instead of asking Krsevan about anything when Krsevan's isTalking is false:
	say "[alert style]Krsevan seems irritated. He doesn’t want to talk right now. He looks like he's in no mood for conversation. He tells you to talk with Laura, Nona, and Sarmelo.[alert style]";
	move Laura to the Town Square;
	move Nona to the Town Square;
	move Sarmelo to the Town Square;

Nona's isTalking is a truth state that varies. Nona's isTalking is false.

Instead of asking Nona about anything when Nona's isTalking is false:
	say "Nona doesn't seem interested in talking right now, she's too focused on finding her lost tickets.";
	increment TalkingProgress;

	
Laura's isTalking is a truth state that varies. Laura's isTalking is false.

Instead of asking Laura about anything when Laura's isTalking is false:
	say "Laura seems lost in thought. She doesn't seem to want to talk right now. Perhaps she’s too focused on her cravings.";
	increment TalkingProgress;


Sarmelo's isTalking is a truth state that varies. Sarmelo's isTalking is false.

Instead of asking Sarmelo about anything when Sarmelo's isTalking is false:
	say "Sarmelo seems too preoccupied to talk. He keeps muttering about needing to find some fruit.";
	increment TalkingProgress;
	
TalkingProgress is a number that varies. TalkingProgress is 1.
NonaRoom is a number that varies. NonaRoom is 0.

Every turn when TalkingProgress is 4:
	say "[bold type]The sound of the clock grows louder and more insistent. You feel its ticking resonating in your mind, as if urging you to act. It is so loud that you need to go back to the room (east) and turn it off";
	play Sound of heart;
	now TalkingProgress is 5.

Every turn:
	if TalkingProgress is greater than 4:
		say "The sound of the clock becomes deafening. You feel an overwhelming urge to return to the Soba of Awakening. (east)[roman type]";



Before going to Soba of Awakening:
	if TalkingProgress is greater than 4:
		now the description of Soba of Awakening is "You stagger back into the room, your head spinning. You feel dizzy, and the air seems to buzz around you. The room has changed. It looks much tidier and cleaner now, as though someone has spent a long time organizing it. The once-bare walls are now spotless, and the table is neatly arranged with a small, mysterious object on it. The clock ticks more softly, almost as if it's calming you. You wonder if everything that just happened was real.";
		[display figure of ljubisoba;]
		move computer to Soba of Awakening;
		now TalkingProgress is 0;
		say "[alert style]The dizziness overwhelms you, and you need a moment to steady yourself.[alert style]";

Instead of examining the wooden table:
	if the computer is in Soba of Awakening:
		say "On the table, you see a small, mysterious computer. Its screen flickers with strange symbols, and you wonder what purpose it serves. Something about it feels out of place, but it might hold the key to understanding what’s happening here.";
	otherwise:
		say "The wooden table is tidy, but nothing of particular interest stands out on it.";
		
FinalTravel is a truth state that varies. FinalTravel is false.

Instead of examining the computer:
	say "The computer's screen flickers erratically, displaying strange symbols, but when you look closer, it's a Ryanair ticket??? You take a better look and try to find something on the computer that will help you understand, and you see the time on the computer is 5.6.2019!!!! Are we a few days in the past???? And you can see that ticket is sent on email to NONAAA?!?!?!?";
	wait for any key;
	say "[line break][italic type]*Thinks*";
	wait for any key;
	say "[line break][italic type]~~Hmmm, this room looks different. It has purple walls, and everything is purple. There are a lot of chocolates on the table and tiger prints?? Is this Nona's room? How is that possible? What is happening??~~[roman type]";
	display figure of ljubisoba;
	Now NonaRoom is 1;
	now the Power of Thinking is "Nona's flight tickets are on email";

	
Every turn:
	if NonaRoom is 1:
		remove computer from play;
		play Sound of heart;
		say "The sound of the clock grows louder and more insistent. You feel its ticking resonating in your mind, as if urging you to act. It is sooooo loud you need to go back to room (east) and turn it of";
		wait for any key;
		now the description of Soba of Awakening is "[line break] You find yourself again in a nearly empty room. The walls are gray and bare. Its ticking echoes in your mind, strangely familiar yet distant.";
		wait for any key;
		say "[line break]You find yourself again in a nearly empty room. The walls are gray and bare. Its ticking echoes in your mind, strangely familiar yet distant.";
		wait for any key;
		Now NonaRoom is 0;
		say "[line break]What is happening room was purple with tiger print all around me.... and the clock was so lound but now it's quiet";
		now Nona's isTalking is true;
		now Laura's isTalking is true;
		now Sarmelo's isTalking is true;
		now Krsevan's isTalking is true;
		say "[line break]I should ask Nona about this mybe she knows something about flight";
		
NonaTalk is a number that varies. NonaTalk is 0.

FinaleCounter is a number that varies. finaleCounter is 0.


Instead of asking Nona about "flight" when Nona's isTalking is true:
	say "[line break]Nona:[alert style] WHAT HOW DO YOU KNOW ABOUT MY FLIGHT?[alert style]";
	wait for any key;
	now NonaTalk is 1;
	say "[line break][italic type]*Thinkss* ~~Maybe I should ask her why she is stressed or mybe I should tell her to chill down~~**thinks*[roman type]";
	
Understand "chill down" as chilling down.

Chilling down is an action applying to nothing.
	
After reading a command:
	if the player's command includes "chill down":
		say "Nona: [alert style]LEAVE ME ALONEEE!!!![alert style]";
	increase NonaTalk by 1;
	
After reading a command:
	if the player's command includes "Why are you stressed":
		say "[line break]Nona: I lost my ticket to Finland and I don't know what to do.";
		wait for any key;
		say "[italic type]*Thinkss*[roman type]";
		


After reading a command:
	if the player's command includes "your ticket is on email":
		say "Nona: WHAT DO YOU KNO... Wait they are on my email... Well *rolls her eyes* that is a relief.";
		wait for any key;
		say "[line break]Nona: Wait what are you doing here in Varazdin?";
		wait for any key;
		say "[line break] Player: Well... mmmm.... I am here to visit someone?!";
		wait for any key;
		say "[line break] Nona: Oooo who??";
		wait for any key;
		say "[line break] Player: Aren't you curious?";
		wait for any key;
		say "[Line break][italic type]Player **thinks*~~Okay, so I know that I am in Varaždin, and now what... Nona is way too curious, and I don't know whether I should trust her. The best thing is to ignore her from now on, and she’s probably ready for the pension fund.~~[roman type]";
		wait for any key;
		increase FinaleCounter by 1;
		now NonaTalk is 100;
		say "[line break] [italic type]Player **thinks**~~I should go to room and sleep to clear my mind. What happened today? Why was the clock so loud, and where was I in that purple room? Did I go crazy?~~[roman type]";
		
After reading a command:
	if the player's command includes "Sleep":
		if player is in the Soba of Awakening:
			say "Player fell asleep";
			say "[line break] ";
			say "The sound of the clock grows louder and more insistent. You feel its ticking resonating in your mind, as if urging you to act. It wakes you up.";
			play Sound of heart;
			wait for any key;
			say "[Line break] Player: [alert style]WHATTTT??? [Line break] What is happening... Why is everything so noisy? [alert style][line break](new place unlocked: living room) [Line break] Player: I should go and check what is happening in living room (north).";  
			now RoomAccess is true;
			
			
FutureTravel is a truth state that varies. FutureTravel is false.

			
After going to the Living Room:
	say "Player: Why is Laura, Nona, Sarmelo and Krsevan here and what are they doing??? ";
	display figure of osobe;
	wait for any key;
	say "[line break] It looks like they are playing some game... is that... catan and Krsevan is winning... no wayyy... ";
	wait for any key;
	say "[line break] Player: I want to join and show you how to play catan. "; 
	wait for any key;
	say "[line break]After a few minutes of playing, I see Sarmelo with a banana, and Laura’s favorite drink is Pepsi and milk?? Is that [alert style]PILK??? [alert style]Disgusting, maybe she’s craving PILK. [line break] Wait, what time is it? Where am I? Why is everyone so friendly right now? This is weird. I should ask what time it is.";
	now the Power of Thinking is "Laura loves PILK?!?! Ewww and is Sarmelo's favourite fruit banana?";
	move Laura to the Living Room;
	move Nona to the Living Room;
	move Sarmelo to the Living Room;
	move Krsevan to the Living Room;
	now FutureTravel is true;
	


Instead of asking Sarmelo about "time" while FutureTravel is true :
	say "Sarmelo: Same as yesterday at this time.";
	
Instead of asking Nona about "time":
	say "Nona: I don't know, am I late for something???.";
	
Instead of asking Krsevan about "time" when FinalTravel is false:
	say "Krsevan: You again with krsevan will you stop!!.";
	
Instead of asking Laura about "time":
	say "Laura: It's 21:20 1.7.2019.";
	wait for any key;
	say "[Line break] Player: What am I in the FUTURE??? This is some weird dream... oh, at least I’ll show them how to play Catan.";
	wait for any key;
	say "[Line break] After playing and almost winning, you stand up and feel a strange sensation of falling, after which you wake up.";
	now RoomAccess is false;
	move player to the Soba of Awakening;
	wait for any key;
	say "[Line break] You are awake now you should probably look at you wierd power of thinking and see if something will help you with Laura, Krsevan or Sarmelo and ask what is happening";
	now Laura's isTalking is true;
	move Laura to the Town Square;
	move Nona to the Town Square;
	move Sarmelo to the Town Square;
	move Krsevan to the Town Square;
	
Instead of asking Laura about "what is happening"  when Laura's isTalking is true:
	say "Laura: I don't know.. what do you mean?? you ok?? ";
	wait for any key;
	say "[line break]Choose answer: ";
	say "[Line break] 1) No no I am ok just little bit tired";
	say "[Line break] 2) I don't know what is happening I am lost... I have some wierd dreams and something is wrong, sometimes I feel like I am falling... and that falling is always with me!!! ";

After reading a command:
	if the player's command includes "1":
		say "Laura: Oh, okay, good. I don't have time for you right now. I just have this weird craving and I don't know for what. Any idea?? (you should just say drink you know she loves).";



After reading a command:
	if the player's command includes "2":
		say "Laura: OKKKKEEYYY, you weirdo, go home and take your problems with you. I'm not a psychologist. Pfffff";

After reading a command:
	if the player's command includes "PILK":
		increase FinaleCounter by 1;
		say "Laura: OMG, yes, that's exactly what I need! Thank you so much. Now I can buy what I need. Do you want something, like fruit or something...?";
		wait for any key;
		say "[line break][italic type] Player: *Thinks**~~Hmmmm fruit maybe Sarmelo would like to have fruit.... BANANA ~~ [line break][roman type]Yes buy me banana.[roman type]";
		wait for any key;
		say "[line break] Laura; Ok see you tomorrow";
		say "[Line break] [line break]";
		wait for any key;
		say "[Line break] Player: I should think about everything...";
		wait for any key;
		say "[Line break] After trying to piece everything together player head starts to heart and he can hear something???";
		wait for any key;
		say "The sound of the clock grows louder and more insistent. You feel its ticking resonating in your mind, as if urging you to act. You need to run and see that clock";
		now FinalTravel is true;		
		
A hidden paper is a thing. It is nowhere. The description of the hidden paper is "Oh this is Krsevan test... *looks closely* ... OMG his name is not Krsevan it is Luka".

A hidden banana is a thing. It is nowhere. The description of the hidden banana is "This banana has massage on it: 'Sarmelo is crazy for bananas soo I will gift him one'".
			
FutureTravel2 is a number that varies. FutureTravel2 is 20.


Every turn:
	if the player is in Soba of Awakening and FinalTravel is true:
		say "[line break]Player: What is happening with this clock? I NEED TO SMASH IT, I CANNOT WITH THIS SOUND!";
		say "[line break]Weird noises: smash.... smash.... smash........";
		now the hidden paper is in the Soba of Awakening;
		now the hidden banana is in the Soba of Awakening;
		move Krsevan to the Soba of Awakening;
		now FinalTravel is false;
		now futuretravel2 is 1;

Instead of examining the hidden paper:
	now the hidden paper is in the Soba of Awakening;
	display figure of Papir;
	continue the action.

Instead of examining the hidden banana:
	now the hidden banana is in the Soba of Awakening;
	continue the action.		
	


Instead of asking Krsevan about "what is happening":
	say "[Line break]Krsevan: WHY ARE YOU CALLING ME BY MY LAST NAME?!?!?! YOU OK!!";
	say "[Line break]Krsevan runs out of room and slams the door";
	wait for any key;
	say "[Line break] [italic type]*Thinks*~~Huh, what's up with him??? Anyway, let's explore the room. Maybe I will understand what is happening. (look)~~[roman type]";
	
After reading a command:
	if the player's command includes "smash" and FutureTravel2 is 1:
		play Sound of heart;
		say " [Line break]Player starts to feel wierd and everything is green....";
		wait for any key;
		say "[line break]Player; Why is everything soo green what is this turquoise green colour...";
		wait for any key;
		say "[Line break] Player: Are walls green ???? What in the h....";
		display figure of zelensoba;
		say "[line break] You hear footesteps someone is coming in room...";
		wait for any key;
		say "[Line break] Krsevan enters the room.";
		say "[Line break] Krsevan: What are you doing here? This is my room!";
		wait for any key;
		say "[Line break] Player: But... everything's green!";
		wait for any key;
		say "[Line break] Krsevan: It's my style, deal with it.";
		wait for any key;
		say "[Line break] Player: It's... too much green.";
		say "[Line break] Krsevan: Get used to it.";
		wait for any key;
		say "[Line break][italic type]Player **thinks*~~I shouled probably ask Krsevan what is happening??~~[roman type] (ask krsevan about what is happening).";
		now the description of Soba of Awakening is "Everything is just green. The room is green, probably because this is Krševan's room.";
		now FutureTravel2 is 0;
		
FutureTravelState is a number variable. FutureTravelState is 5.  		
	
After reading a command:
	if the player's command includes "banana":
		now the Power of Thinking is "[line break]Sarmelo is probably crazy for bananas? And Krševan's name is Luka? Is he angry about that?";
		now FutureTravelState is 0;
		


HiddenBanana is a truth state that varies. HiddenBanana is false.

Every turn:
	if FutureTravelState is 0:
		say "[line break]Player: ~~I feel dizzy... why is this green so overwhelming... damn, the green~~";
		wait for any key;
		now the description of Soba of Awakening is "You find yourself again in a nearly empty room. The walls are gray and bare. Its ticking echoes in your mind, strangely familiar yet distant.";
		say "[Line break]You find yourself again in a nearly empty room. The walls are gray and bare. Its ticking echoes in your mind, strangely familiar yet distant. ";
		wait for any key;
		say "[line break] You should probably go and see Laura ask her about banana??";
		now the hidden paper is nowhere;
		now the hidden banana is nowhere;
		increase FutureTravelState by 1;


			
Instead of asking Laura about "banana":
	say "[Line break]Laura: OOO Yeaa! Take it (Type take hidden banana)";
	now hiddenbanana is true;
	
After reading a command:
	if the hiddenbanana is true:
		say "[Line break]Laura gave you banana! Now you can gift it to someone.";
		wait for any key;
		say "[Line break]Laura: By the way, do you know what's up with Luka? He looks angry... and because of that, he doesn't want to play Catan. :(";
		wait for any key;
		say "[Line break] Choose answer: [line break] 3) Oooo, he is moody but I will see what I can do[Line break] 4) No ";
		now hiddenbanana is false;
	
	


After reading a command:
	if the player's command includes "3":
		say "[line break] Laura: Oh, okay, good. I don't have time for Luka right now, but I’m ready to win at Catan!";
		say "[line break][italic type]Player *thinks* ~Why is everyone ready for Catan now? Does it somehow connect with that one weird dream..~";
		wait for any key;
		say "[line break][italic type]Player *thinks* ~I should apologize to Krsevan... I mean Luka, about his name.~[roman type] (call krsevan by his name)";




After reading a command:
	if the player's command includes "4":
		say "[Line break]Laura: No? Fair, I wouldn't either! See you later...";
		


After reading a command:
	if the player's command includes "Luka":
		say "[line break]Luka: Ohhh soo you are now done with that joke... ok...";
		wait for any key;
		say "[line break]Luka: Now that I am happy we can go and play Catan. I will show you how to win";
		say "[Line break] Player: Yea like you would win anyway";
		wait for any key;
		increase FinaleCounter by 1;
		say "[Line break] [italic type]Player *thinks* Ok so now I just need to ask Sarmelo if he wants to play Catan.[roman type] (ask Sarmelo about catan)"
		

		
Instead of asking Sarmelo about "catan":
	if the player does not carry the banana:
		say "Sarmelo: No, I need something!!!";
	otherwise:
		say "Sarmelo: Thanks for the banana! Now I can think straight!";

Instead of giving the banana to Sarmelo:
	if the player carries the banana:
		say "[line break]Sarmelo takes the banana and starts eating it with great satisfaction.";
		wait for any key;
		say "[line break]Sarmelo: 'Ah, this is the best banana ever! Thank you, you've saved me.'";
		say "[line break]Player should probably now go and rest for second (move to east)";
		now the banana is nowhere;
		increase FinaleCounter by 1;
	otherwise:
		say "[line break]You don't have a banana to give to Sarmelo.";

After reading a command:
	if FinaleCounter is 4:
		say "Now everyone is happy and waiting for me to play catan.";
		say "[line break] Player moves to living room where everyone is playing catan but everything feels similar";
		say "[line break] [italic type]Player thinks ~is this deja vu!?~[roman type]";
		move player to The Living Room;
		move laura to The Living Room;
		move nona to The Living Room;
		move sarmelo to The Living Room;
		move krsevan to The Living Room;
		say "[line break] After playing for 30 min player is going to win... but when all of a sudden the player slipps from SARMEL'S BANANA PEEL AND STARTS TO FALL";
		wait for any key;
		say "[line break] Player hits his head hard on the floor....";
		wait for any key;
		say "[line break] You feel dizzy trie to move (type 'restart' to regain your senses).";
		now FinaleCounter is 5;




