# TalentShowDB
• Average	Female	Salary.	TheVoiceLondon would	like	to	know	the	average
daily	salary	 for	 female	participants.		Write	a	SELECT	query	the	gives	the	
average daily	 salary	 for	 female	 participants.	 	Have	 your	 result	 return	 a	
single	scalar	value (i.e.	in	total	GBP).

• Coaching	Report. For	each	coach, list	the	total	number	of	contenders	they	
are	 coaching.	 	 In	 the	 listing,	 include	 the	 information	 about	 the	 coaches	
without	any contender.

• Coach	Monthly	Attendance	Report. For	each	coach, list	the	total	number	of	
shows	attended in	each	month.		

• Most	Expensive	Contender.		TheVoiceLondon would	like	to	know	which	is	
the	 contender with	 the	 highest total	 daily	 salary (i.e.,	 sum	 of	 the	 daily	
salaries	of	the	participants	forming that	contender).		Write	a	SELECT	query	
that	lists	the	stage name of	the	contender with	the	highest	total	daily	salary.

• March	 Payment	 Report. Create	 an	 itemized	 payment	 report for	 March
corresponding	 to	 the	 shows	 attended	 by each	 coach	 and	 participant	 in	
March. Write	a	SELECT	statement(s) that	retrieves:

• For	each	coach,	show their	name,	the	number	of	shows	attended	in	
March,	their	daily	salary	and	their	total	salary	for	March	(calculated	
as	the	number	of	shows	attended	multiplied	by	their	daily	salary).	

• For each	 participant, show	 their	 name,	 the	 number	 of	 shows	
attended	in	March,	their	daily	salary	and	their	total	salary	for	March.

• The	last	line	of	the	report	should	just	contain	the	total	amount	to	be	
paid	in	March.

• Well	Formed	Groups!		Note	group	contenders should	be	formed	by	more	
than	one	participant	(otherwise	they	are	individual	contenders).	

Since	MySQL	does	not	support	an	assertion	to	check	this	constraint,	write	
a	SELECT	 statement	that	 returns	only	a	 scalar	Boolean	 value	 (i.e.	either	
True	 or	 False).	 	 It	 should	 return	 True	 if	 there	 are	 no	 violations in	 the	
database	 of	 this	 regulation.	 	 If	 there	 is	 a	 violation,	 then	 the	 SELECT	
statement	should	return	False.
There	is	a	 violation	if	 there	is	a	group	 contender	 formed	 by	less	 than	 2	
participants.		
Show that	your	SELECT	statement works	by	creating	a	group	contender
that	violates	this	rule and	then	running	your	SELECT	statement.
