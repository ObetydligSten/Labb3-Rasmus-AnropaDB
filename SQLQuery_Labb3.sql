---Hämtar all personal, ändra Lärare till den roll du vill hitta personal på---
select * from tblPersonal where Befattning = 'Lärare'

---Hämtar all personal---
select * from tblPersonal

---Visar alla betyg satta senaste månaden, ändra datumet till det datum du vill se ifrån---
select * from tblBetyg where Betygsdatum > '2023-12-24'


create view vWKursBetygSnittMaxMin
as
select tblKurs.KursNamn as Kurs, 
	avg(Betyg) as BetygSnitt, 
	max(Betyg) as HögstaBetyg, 
	min(Betyg) as LägstaBetyg
from tblBetyg
Join tblKurs on tblBetyg.KursID = tblKurs.KursID
Group by tblKurs.KursNamn


---Kör denna för att få upp betyg, 
---snitt betyg samt högsta och lägsta betyg för varje kurs---
select * from vWKursBetygSnittMaxMin



---Fyll i följande och kör för att lägga till ny elev---
insert into tblStudent values (
	/*FirstName*/ '',
	/*LastName*/ '',
	/*Personnr*/ 0,
	/*Klass*/ ''
	);


