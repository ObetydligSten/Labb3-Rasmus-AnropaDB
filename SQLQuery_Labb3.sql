---H�mtar all personal, �ndra L�rare till den roll du vill hitta personal p�---
select * from tblPersonal where Befattning = 'L�rare'

---H�mtar all personal---
select * from tblPersonal

---Visar alla betyg satta senaste m�naden, �ndra datumet till det datum du vill se ifr�n---
select * from tblBetyg where Betygsdatum > '2023-12-26'


create view vWKursBetygSnittMaxMin
as
select tblKurs.KursNamn as Kurs, 
	avg(Betyg) as BetygSnitt, 
	max(Betyg) as H�gstaBetyg, 
	min(Betyg) as L�gstaBetyg
from tblBetyg
Join tblKurs on tblBetyg.KursID = tblKurs.KursID
Group by tblKurs.KursNamn


---K�r denna f�r att f� upp betyg, 
---snitt betyg samt h�gsta och l�gsta betyg f�r varje kurs---
select * from vWKursBetygSnittMaxMin



---Fyll i f�ljande och k�r f�r att l�gga till ny elev---
insert into tblStudent values (
	/*FirstName*/ '',
	/*LastName*/ '',
	/*Personnr*/ 0,
	/*Klass*/ ''
	);


