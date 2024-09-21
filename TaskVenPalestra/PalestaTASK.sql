CREATE TABLE Membro(
	idMembro INT PRIMARY KEY IDENTITY (1,1),
	nome VARCHAR (250) NOT NULL,
	cognome VARCHAR (250) NOT NULL,
	dataNascita DATE NOT NULL,
	sesso VARCHAR (20) CHECK (sesso IN ('Maschio','Femmina','Altro')),
	mail VARCHAR (250) NOT NULL UNIQUE,
	dataInizioAbb DATE NOT NULL,
	telefono BIGINT UNIQUE NOT NULL,
	tipoAbb VARCHAR (250) CHECK (tipoAbb IN ('mensile','trimestrale','annuale')),
	prezzoAbb INT CHECK (prezzoAbb IN (50, 150, 400)),
	monitoraggio TEXT ,
);


CREATE TABLE Istruttore (
	idIstruttore INT PRIMARY KEY IDENTITY (1,1),
	codiceIstruttore CHAR (8) NOT NULL UNIQUE ,
	nome VARCHAR (250) NOT NULL,
	cognome VARCHAR (250) NOT NULL,
	specializzazione VARCHAR  (50) CHECK (specializzazione IN ('Yoga','Tapis Rouland', 'Biciclette da Spining','Pesi Liberi')),
	
);


CREATE TABLE Classe ( 
	idClasse INT PRIMARY KEY IDENTITY (1,1),
	nome VARCHAR (250) NOT NULL,
	descrizione TEXT ,
	orario VARCHAR(50) CHECK (orario IN ('9:00-11:00','11:00-13:00','13:00-15:00', '15:00-17:00', '17:00-19:00')),
	gioSettimana VARCHAR (50) CHECK (gioSettimana IN ('Lunedì','Martedì','Mercoledì','Giovedi','Venerdì','Sabato','Domenica')),
	massParti INT CHECK (massParti BETWEEN 0 AND 20),
	lezTipo VARCHAR  (50) CHECK (lezTipo IN ('Yoga','Tapis Rouland', 'Biciclette da Spining','Pesi Liberi')),
	istruttoreRIF INT
	FOREIGN KEY (istruttoreRIF) REFERENCES Istruttore (idIstruttore)

);




CREATE TABLE Attrezzatura (
	idAttrezzatura INT PRIMARY KEY IDENTITY (1,1),
	tipoAttr VARCHAR (50)  CHECK (tipoAttr IN ('Tappetino' ,'Tapis Rouland', 'Biciclette','Pesi')),
	descrizione VARCHAR (250) NOT NULL,
	dataAcqui DATE NOT NULL,
	stato VARCHAR (50) CHECK (stato IN ('In Uso' , 'In Manutenzione', 'Libero')),
	classeRIF INT, 
	FOREIGN KEY (classeRIF) REFERENCES Classe(idClasse),
);

CREATE TABLE Prenotazione (
	idPrenotazione INT PRIMARY KEY IDENTITY (1,1),
	datapreno DATE,
	ora VARCHAR (50) CHECK (ora IN ('9:00-11:00','11:00-13:00','13:00-15:00', '15:00-17:00', '17:00-19:00')),
	isCancellato BIT, 
	membroRIFF INT, 
	classeRIFF INT,
	FOREIGN KEY (membroRIFF) REFERENCES Membro(idMembro),
	FOREIGN KEY (classeRIFF) REFERENCES Classe(idClasse)
	
);




--membri
INSERT INTO Membro (nome, cognome, dataNascita, sesso, mail, telefono, tipoAbb, prezzoAbb, monitoraggio, dataInizioAbb)
VALUES
('Luca', 'Rossi', '1990-05-15', 'Maschio', 'luca.rossi@example.com', 3451234567, 'annuale', 400, 'Monitoraggio Peso', '2024-01-10'),
('Giulia', 'Verdi', '1985-08-20', 'Femmina', 'giulia.verdi@example.com', 3452345678, 'mensile', 50, 'Monitoraggio Salute', '2024-02-15'),
('Marco', 'Bianchi', '1993-12-10', 'Maschio', 'marco.bianchi@example.com', 3453456789, 'trimestrale', 150, 'Nessun monitoraggio', '2024-03-05'),
('Elena', 'Neri', '1988-07-25', 'Femmina', 'elena.neri@example.com', 3454567898, 'annuale', 400, 'Monitoraggio Allenamenti', '2023-01-25'),
('Davide', 'Gialli', '1995-03-30', 'Maschio', 'davide.gialli@example.com', 3455678901, 'mensile', 50, 'Monitoraggio Cardiovascolare', '2024-04-01'),
('Sara', 'Blu', '1992-11-11', 'Femmina', 'sara.blu@example.com', 3456789012, 'trimestrale', 150, 'Monitoraggio Peso', '2023-05-20'),
('Matteo', 'Marroni', '1990-09-05', 'Maschio', 'matteo.marroni@example.com', 3457890123, 'annuale', 400, 'Monitoraggio Fitness', '2024-06-15'),
('Anna', 'Viola', '1997-04-12', 'Femmina', 'anna.viola@example.com', 3458901234, 'mensile', 50, 'Monitoraggio Salute', '2024-07-10'),
('Francesco', 'Grigi', '1991-06-19', 'Maschio', 'francesco.grigi@example.com', 3459012345, 'trimestrale', 150, 'Nessun monitoraggio', '2024-08-01'),
('Marta', 'Rosa', '1994-10-07', 'Femmina', 'marta.rosa@example.com', 3450123456, 'annuale', 400, 'Monitoraggio Cardiovascolare', '2023-09-15'),
('Alessio', 'Nero', '1989-02-21', 'Maschio', 'alessio.nero@example.com', 3451234560, 'mensile', 50, 'Monitoraggio Peso', '2024-10-20'),
('Clara', 'Argenti', '1986-05-14', 'Femmina', 'clara.argenti@example.com', 3452345670, 'trimestrale', 150, 'Monitoraggio Fitness', '2024-11-05'),
('Simone', 'Dorati', '1998-03-05', 'Maschio', 'simone.dorati@example.com', 3453456780, 'annuale', 400, 'Monitoraggio Salute', '2024-12-01'),
('Laura', 'Bronzi', '1993-09-17', 'Femmina', 'laura.bronzi@example.com', 3454567890, 'mensile', 50, 'Nessun monitoraggio', '2024-01-15'),
('Federico', 'Platini', '1990-12-22', 'Maschio', 'federico.platini@example.com', 3455678970, 'trimestrale', 150, 'Monitoraggio Allenamenti', '2024-02-05');

--istruttore
INSERT INTO Istruttore (codiceIstruttore, nome, cognome, specializzazione)
VALUES
('IST00001', 'Luca', 'Marinelli', 'Yoga'),
('IST00002', 'Giulia', 'De Santis', 'Pesi Liberi'),
('IST00003', 'Marco', 'Galli', 'Tapis Rouland'),
('IST00004', 'Elena', 'Ferrari', 'Biciclette da Spining'),
('IST00005', 'Davide', 'Colombo', 'Yoga'),
('IST00006', 'Serena', 'Neri', 'Pesi Liberi'),
('IST00007', 'Franco', 'Riva', 'Tapis Rouland'),
('IST00008', 'Silvia', 'Bianchi', 'Biciclette da Spining'),
('IST00009', 'Andrea', 'Giordano', 'Yoga'),
('IST00010', 'Marta', 'Russo', 'Pesi Liberi'),
('IST00011', 'Giuseppe', 'Valli', 'Tapis Rouland'),
('IST00012', 'Luisa', 'Fontana', 'Biciclette da Spining'),
('IST00013', 'Roberto', 'Bertoli', 'Yoga'),
('IST00014', 'Chiara', 'Conti', 'Pesi Liberi'),
('IST00015', 'Stefano', 'Ferrari', 'Tapis Rouland');
-- classe

INSERT INTO Classe (nome, descrizione, orario, gioSettimana, massParti, lezTipo, istruttoreRIF)
VALUES

('Yoga Mattutino', 'Yoga per un risveglio energico', '9:00-11:00', 'Lunedì', 12, 'Yoga', 1),
('Yoga per la Flessibilità', 'Lezione di yoga per aumentare la flessibilità', '13:00-15:00', 'Mercoledì', 14, 'Yoga', 1),
('Yoga Antistress', 'Yoga rilassante per combattere lo stress', '9:00-11:00', 'Venerdì', 16, 'Yoga', 5),
('Yoga del Risveglio', 'Yoga per risvegliare corpo e mente', '9:00-11:00', 'Martedì', 9, 'Yoga', 9),
('Yoga Dolce', 'Yoga per principianti e rilassamento', '9:00-11:00', 'Sabato', 10, 'Yoga', 13),
('Yoga Dinamico', 'Lezione energica di yoga avanzato', '17:00-19:00', 'Mercoledì', 15, 'Yoga', 1),
('Powerlifting Base', 'Introduzione al powerlifting', '13:00-15:00', 'Martedì', 10, 'Pesi Liberi', 2),
('Pesi Liberi Completi', 'Allenamento completo con pesi liberi', '13:00-15:00', 'Giovedi', 18, 'Pesi Liberi', 2),
('Pesi Liberi Avanzato', 'Allenamento avanzato con pesi liberi', '13:00-15:00', 'Sabato', 18, 'Pesi Liberi', 6),
('Forza e Resistenza', 'Lezione di pesi per forza e resistenza', '13:00-15:00', 'Domenica', 20, 'Pesi Liberi', 6),
('Allenamento con Pesi', 'Sessione di pesi liberi per tonificare', '15:00-17:00', 'Martedì', 10, 'Pesi Liberi', 10),
('Pesi Liberi Funzionali', 'Allenamento con pesi per migliorare la funzione muscolare', '13:00-15:00', 'Venerdì', 14, 'Pesi Liberi', 14),
('Cardio Avanzato', 'Sessione avanzata di cardio con tapis roulant', '15:00-17:00', 'Mercoledì', 14, 'Tapis Rouland', 3),
('Tapis Rouland Base', 'Allenamento cardio leggero per principianti', '15:00-17:00', 'Domenica', 12, 'Tapis Rouland', 7),
('Tapis Rouland Sprint', 'Sessione sprint con tapis roulant', '15:00-17:00', 'Giovedi', 10, 'Tapis Rouland', 11),
('Cardio Resistenza', 'Lezione di tapis roulant per aumentare la resistenza', '15:00-17:00', 'Lunedì', 15, 'Tapis Rouland', 3),
('Interval Training Cardio', 'Allenamento a intervalli su tapis roulant', '9:00-11:00', 'Martedì', 10, 'Tapis Rouland', 7),
('Cardio Mix', 'Sessione mista di tapis roulant e stretching', '15:00-17:00', 'Giovedi', 10, 'Tapis Rouland', 11),
('Spinning Adrenalina', 'Lezione di spinning con musica energica', '17:00-19:00', 'Giovedi', 20, 'Biciclette da Spining', 4),
('Spinning per Principianti', 'Lezione base di spinning', '17:00-19:00', 'Lunedì', 16, 'Biciclette da Spining', 4),
('Spinning Intermedio', 'Lezione intermedia di spinning', '17:00-19:00', 'Venerdì', 14, 'Biciclette da Spining', 8),
('Spinning Dinamico', 'Lezione intensa di spinning', '17:00-19:00', 'Martedì', 18, 'Biciclette da Spining', 8),
('Spinning Resistenza', 'Allenamento di spinning per la resistenza', '17:00-19:00', 'Lunedì', 15, 'Biciclette da Spining', 12),
('Spinning Avanzato', 'Sessione avanzata di spinning', '17:00-19:00', 'Sabato', 20, 'Biciclette da Spining', 15);

--prenotazione

INSERT INTO Prenotazione (datapreno, ora, isCancellato, membroRIFF, classeRIFF)
VALUES
('2024-09-15', '9:00-11:00', 0, 1, 1),
('2024-09-16', '9:00-11:00', 0, 2, 5),
('2024-09-20', '13:00-15:00', 0, 3, 9),
('2024-09-23', '9:00-11:00', 0, 4, 13),
('2024-09-24', '9:00-11:00', 0, 5, 1),
('2024-09-25', '17:00-19:00', 0, 6, 5),
('2024-09-27', '9:00-11:00', 0, 7, 9),
('2024-09-16', '13:00-15:00', 0, 8, 2),
('2024-09-17', '13:00-15:00', 0, 9, 6),
('2024-09-18', '13:00-15:00', 0, 10, 10),
('2024-09-19', '13:00-15:00', 0, 11, 14),
('2024-09-22', '15:00-17:00', 0, 12, 2),
('2024-09-25', '13:00-15:00', 0, 13, 6),
('2024-09-26', '13:00-15:00', 0, 14, 10),
('2024-09-14', '15:00-17:00', 0, 15, 3),
('2024-09-16', '15:00-17:00', 0, 1, 7),
('2024-09-18', '9:00-11:00', 0, 2, 11),
('2024-09-19', '15:00-17:00', 0, 3, 3),
('2024-09-21', '15:00-17:00', 0, 4, 7),
('2024-09-23', '9:00-11:00', 0, 5, 11),
('2024-09-25', '15:00-17:00', 0, 6, 3),
('2024-09-12', '17:00-19:00', 0, 7, 4),
('2024-09-14', '17:00-19:00', 0, 8, 8),
('2024-09-16', '17:00-19:00', 0, 9, 12),
('2024-09-18', '17:00-19:00', 0, 10, 15),
('2024-09-20', '17:00-19:00', 0, 11, 4),
('2024-09-22', '17:00-19:00', 0, 12, 8),
('2024-09-24', '17:00-19:00', 0, 13, 12),
('2024-09-26', '17:00-19:00', 0, 14, 15)


--Attrezzatura 

INSERT INTO Attrezzatura (tipoAttr, descrizione, dataAcqui, stato, classeRIF)
VALUES

('Tappetino', 'Tappetino antiscivolo per yoga', '2022-03-15', 'In Uso', 1),
('Tappetino', 'Tappetino spesso per yoga intermedio', '2023-06-10', 'Libero', 5),
('Tappetino', 'Tappetino extra-lungo per yoga avanzato', '2021-11-20', 'In Manutenzione', 9),
('Tappetino', 'Tappetino morbido per yoga rilassante', '2023-08-05', 'In Uso', 13),
('Pesi', 'Set di pesi regolabili (5-25 kg)', '2021-09-10', 'In Uso', 2),
('Pesi', 'Bilanciere con dischi (10-50 kg)', '2022-12-30', 'Libero', 6),
('Pesi', 'Manubri fissi (2-15 kg)', '2020-04-17', 'In Manutenzione', 10),
('Pesi', 'Pesi da polso regolabili', '2023-05-12', 'In Uso', 14),
('Tapis Rouland', 'Tapis rouland professionale con inclinazione', '2022-01-05', 'In Uso', 3),
('Tapis Rouland', 'Tapis rouland base per allenamenti leggeri', '2023-02-15', 'Libero', 7),
('Tapis Rouland', 'Tapis rouland avanzato con monitoraggio cardiaco', '2021-07-22', 'In Manutenzione', 11),
('Biciclette', 'Bicicletta da spinning con resistenza regolabile', '2022-09-14', 'In Uso', 4),
('Biciclette', 'Bicicletta da spinning base', '2021-10-08', 'Libero', 8),
('Biciclette', 'Bicicletta da spinning avanzata con monitor digitale', '2023-01-10', 'In Manutenzione', 12),
('Biciclette', 'Bicicletta da spinning con sella regolabile', '2023-03-25', 'In Uso', 15);

--Query base: Recupera tutti i membri registrati nel sistema.

SELECT *FROM Membro;

--Recupera il nome e il cognome di tutti i membri che hanno un abbonamento mensile.

SELECT *
FROM Membro
WHERE tipoAbb = 'mensile';

-- Recupera l’elenco delle classi di yoga offerte dal centro fitness.
SELECT *
	FROM Classe
	WHERE lezTipo ='Biciclette da Spining';
--Recupera il nome e cognome degli istruttori che insegnano Pilates  Per me Yoga.
SELECT nome,cognome
	FROM Istruttore
	WHERE specializzazione = 'Yoga';

--Recupera i dettagli delle classi programmate per il lunedì.
SELECT descrizione
	FROM Classe
	WHERE gioSettimana ='Lunedì';

--Recupera l'elenco dei membri che hanno prenotato una classe di spinning.
--aggiunto un record

INSERT INTO Prenotazione (datapreno, ora, isCancellato, membroRIFF, classeRIFF)
VALUES
('2024-09-15', '9:00-11:00', 0, 3, 19);

SELECT *
	FROM Membro
	JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
	JOIN Classe ON Prenotazione.classeRIFF= Classe.idClasse
	WHERE lezTipo = 'Biciclette da Spining';

--Recupera tutte le attrezzature che sono attualmente fuori servizio.
SELECT *
	FROM Attrezzatura
	WHERE stato = 'In manutenzione';

--Conta il numero di partecipanti per ciascuna classe programmata per il mercoledì.
SELECT COUNT (*)
	FROM Membro
	JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
	JOIN Classe ON Prenotazione.classeRIFF=classe.idClasse
	WHERE gioSettimana ='Mercoledì';

--Recupera l'elenco degli istruttori disponibili per tenere una lezione il sabato.

SELECT *
	FROM Classe 
	JOIN Istruttore ON Classe.istruttoreRIF =Istruttore.idIstruttore

	WHERE  gioSettimana !='Sabato';


--Recupera tutti i membri che hanno un abbonamento attivo dal 2023.

SELECT *
	FROM Membro
	WHERE dataInizioAbb < '2024-01-01'

--Trova il numero massimo di partecipanti per tutte le classi di sollevamento pesi.
SELECT  COUNT (*)
	FROM Membro
	JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
	JOIN Classe ON Prenotazione.classeRIFF=classe.idClasse
	WHERE lezTipo ='Pesi Liberi'; 


--Recupera le prenotazioni effettuate da un membro specifico.
SELECT *
	FROM Prenotazione
	JOIN Membro ON Prenotazione.membroRIFF = Membro.idMembro
	WHERE  nome ='Anna';

--13. Recupera l'elenco degli istruttori che conducono più di 5 classi alla settimana. // no avevo più di 5 perciò ho fatto con 3

SELECT COUNT  (*) as lezioni_settimana , Istruttore.nome
	FROM Classe 
	JOIN  Istruttore ON Classe.istruttoreRIF = Istruttore.idIstruttore
	GROUP BY  Istruttore.nome
	HAVING COUNT (*) >=3

--Recupera le classi che hanno ancora posti disponibili per nuove prenotazioni.
SELECT classeRIFF, COUNT(*) AS numero_ripetizioni
FROM Prenotazione
GROUP BY  Prenotazione.classeRIFF;

SELECT Classe.idClasse, Classe.nome, Classe.massParti - COUNT(Prenotazione.classeRIFF) AS posti_disponibili
FROM Classe 
LEFT JOIN Prenotazione ON Classe.idClasse = Prenotazione.classeRIFF
GROUP BY Classe.idClasse, Classe.nome, Classe.massParti;

--Recupera l'elenco dei membri che hanno annullato una prenotazione negli ultimi 30 giorni.
-- Ho aggiunto un valore perche mi mancava 

INSERT INTO Prenotazione (datapreno, ora, isCancellato, membroRIFF, classeRIFF)
VALUES
	('2024-09-20', '17:00-19:00', 1, 11, 5);

SELECT * 
	FROM Prenotazione
	JOIN Membro ON Prenotazione.membroRIFF=Membro.idMembro
	WHERE isCancellato = 1 AND datapreno < '2024-09-30' ;

--16.	Recupera tutte le attrezzature acquistate prima del 2022
	
SELECT * 
	FROM Attrezzatura
	WHERE dataAcqui <= '2021-12-31';

--17.	Recupera l'elenco dei membri che hanno prenotato una classe in cui l'istruttore è "Mario Rossi".
		

SELECT * 
	FROM Membro
	JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
	JOIN Classe ON Prenotazione.classeRIFF = Classe.idClasse
	JOIN Istruttore ON Classe.istruttoreRIF=Istruttore.idIstruttore
	WHERE Istruttore.nome='Marco' AND Istruttore.cognome ='Galli'

--18.	Calcola il numero totale di prenotazioni per ogni classe per un determinato periodo di tempo.


SELECT Classe.idClasse, Classe.nome, COUNT (Prenotazione.idPrenotazione) AS tot_prenotazioni
	FROM Classe 
	JOIN Prenotazione  ON Classe.idClasse = Prenotazione.classeRIFF
	WHERE Prenotazione.datapreno BETWEEN '2024-09-15' AND '2024-09-26'
	GROUP BY Classe.idClasse, Classe.nome;


--19.	Trova tutte le classi associate a un'istruttore specifico e i membri che vi hanno partecipato.

	
SELECT * 
	FROM Membro
	JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
	JOIN Classe ON Prenotazione.classeRIFF = Classe.idClasse
	JOIN Istruttore ON Classe.istruttoreRIF=Istruttore.idIstruttore
	WHERE Istruttore.nome='Luca' AND Istruttore.cognome ='Marinelli'

--20.	Recupera tutte le attrezzature in manutenzione e il nome degli istruttori che le utilizzano nelle loro classi.


SELECT *
	FROM Attrezzatura
	JOIN Classe ON Attrezzatura.classeRIF = Classe.idClasse
	JOIN Istruttore ON Classe.istruttoreRIF=Istruttore.idIstruttore
	WHERE stato = 'In Manutenzione'
	

------------------------------ VIEW

--1.	Crea una view che mostra l'elenco completo dei membri con il loro nome, cognome e tipo di abbonamento.
/*CREATE VIEW  Elenco_completo 
	AS
	SELECT Membro.nome,Membro.cognome, Membro.tipoAbb
	FROM Membro
*/


--2.	Crea una view che elenca tutte le classi disponibili con i rispettivi nomi degli istruttori.

/*CREATE VIEW Corso_disponibili
	AS
    SELECT Classe.idClasse, Classe.nome AS corso_nome, Classe.orario, Classe.gioSettimana, Classe.massParti, Classe.lezTipo, 
           Istruttore.nome AS istruttore_nome, Istruttore.cognome AS istruttore_cognome
    FROM Classe
    JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.idIstruttore;
	*/

--3.	Crea una view che mostra le classi prenotate dai membri insieme al nome della classe e alla data di prenotazione.


/*CREATE VIEW  Membro_classe_Prenotazione
	AS
	SELECT Membro.nome AS MembroNome, Classe.nome AS NomeClasse , Prenotazione.datapreno AS Data_Prenotazione
		FROM Membro
		JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
		JOIN Classe ON Prenotazione.classeRIFF= Classe.idClasse
*/

--4.	Crea una view che elenca tutte le attrezzature attualmente disponibili, con la descrizione e lo stato.


/*CREATE VIEW  Elenco_Attrezzature
AS 
SELECT Attrezzatura.tipoAttr, Attrezzatura.descrizione, Attrezzatura.stato
	FROM Attrezzatura
	*/

--5.	Crea una view che mostra i membri che hanno prenotato una classe di spinning negli ultimi 30 giorni.

/*CREATE VIEW Membri_Prenotato_Spinnig
	AS  
	SELECT Membro.nome AS Nome , Prenotazione.datapreno AS Data_Prenotzaione_Spinnig
		FROM Membro
		JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
		JOIN Classe ON Prenotazione.classeRIFF= Classe.idClasse
	
		WHERE Classe.lezTipo ='Biciclette da Spining' AND Prenotazione.datapreno < '2024-09-30';
		*/

--6.	Crea una view che elenca gli istruttori con il numero totale di classi che conducono.

/*CREATE VIEW Istruttori_Num_Classi
	AS
	 SELECT Istruttore.idIstruttore, Istruttore.nome,Istruttore.cognome ,COUNT (Classe.idClasse) AS Num_Lezione 
		FROM Classe
		JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.idIstruttore
		GROUP BY Istruttore.idIstruttore, Istruttore.nome,Istruttore.cognome 
	*/

-- 7.	Crea una view che mostri il nome delle classi e il numero di partecipanti registrati per ciascuna classe
/*CREATE VIEW	Num_Partecipanti_Classe	
	AS 
	SELECT Classe.idClasse,Classe.nome AS Nome_Lezione, COUNT (Membro.idMembro) AS Tot_Iscritti 
		FROM Membro
			JOIN Prenotazione ON Membro.idMembro = Prenotazione.membroRIFF
			JOIN Classe ON Prenotazione.classeRIFF = Classe.idClasse
			GROUP BY  Classe.idClasse,Classe.nome 
			*/

--8.	Crea una view che elenca i membri che hanno un abbonamento attivo insieme alla data di inizio e la data di scadenza.

--9.	Crea una view che mostra l'elenco degli istruttori che conducono classi il lunedì e il venerdì.



/*CREATE VIEW Istruttori_Lun_Ven
	AS 
	SELECT Classe.gioSettimana ,Istruttore.nome, Istruttore.cognome
		FROM Classe
		JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.idIstruttore
		WHERE gioSettimana ='Venerdì' OR gioSettimana = 'Sabato'
		*/


--10.	Crea una view che elenca tutte le attrezzature acquistate nel 2023 insieme al loro stato attuale.

/*CREATE VIEW  Attrezzatute_2023
	AS 
	SELECT *
		FROM Attrezzatura
		WHERE dataAcqui> '2022-12-31' AND dataAcqui < '2024-01-01'
	*/

	

--1.	Scrivi una stored procedure che permette di inserire un nuovo membro nel sistema con tutti i suoi dettagli, come nome, cognome, data di nascita, tipo di abbonamento, ecc.

	
	/*CREATE PROCEDURE InserimentoMembro 
		@nom VARCHAR(250),
		@cogn VARCHAR(250),
		@dataNasc DATE,
		@sesso VARCHAR(250),
		@mail VARCHAR(250),
		@tele BIGINT,
		@tipoAbb VARCHAR(250),
		@prezzoAbb INT,
		@monit TEXT,
		@daInAbb VARCHAR(250)
	AS 
	BEGIN 
	INSERT INTO Membro (nome, cognome, dataNascita, sesso, mail, telefono, tipoAbb, prezzoAbb, monitoraggio, dataInizioAbb)
	VALUES (@nom ,@cogn, @dataNasc ,@sesso ,@mail ,@tele ,@tipoAbb ,@prezzoAbb ,@monit ,@daInAbb);
	END	;
	*/

--2.	Scrivi una stored procedure per aggiornare lo stato di un'attrezzatura (ad esempio, disponibile, in manutenzione, fuori servizio).

/*

CREATE PROCEDURE AggiStatoAttrezzatura
    @idAttrezzatura INT,
    @nuovoStato VARCHAR(50)
	AS
	BEGIN
    
		IF @nuovoStato NOT IN ('In Uso', 'In Manutenzione', 'Libero')
			BEGIN
				PRINT 'Inserire stato tra: In Uso, In Manutenzione, Libero.'
				RETURN
			END

 
		UPDATE Attrezzatura
		SET stato = @nuovoStato
		WHERE idAttrezzatura = @idAttrezzatura;

	END;	
	*/




--3.	Scrivi una stored procedure che consenta a un membro di prenotare una classe specifica.


	
--4
--5.	Scrivi una stored procedure per permettere ai membri di cancellare una prenotazione esistente.
/*
CREATE PROCEDURE CancellaPrenotazione
    @idPrenotazione INT,
    @idMembro INT
AS
BEGIN
    
    IF EXISTS (
		SELECT 1 
		FROM Prenotazione 
		WHERE idPrenotazione = @idPrenotazione AND membroRIFF = @idMembro AND isCancellato = 0
		)

    BEGIN
        UPDATE Prenotazione
        SET isCancellato = 1
        WHERE idPrenotazione = @idPrenotazione;
        PRINT 'Prenotazione cancellata con successo.';
    END
    ELSE
    BEGIN
        PRINT 'Prenotazione non trovata o già cancellata.';
    END
END;
*/
--6.	Scrivi una stored procedure che restituisce il numero di classi condotte da un istruttore specifico./*

/*	CREATE PROCEDURE NumeroClassiCondotte
    @idIstruttore INT
AS
BEGIN
    SELECT Istruttore.nome, Istruttore.cognome, COUNT(Classe.idClasse) AS NumeroClassi
    FROM Classe
    JOIN Istruttore ON Classe.istruttoreRIF = Istruttore.idIstruttore
    WHERE Istruttore.idIstruttore = @idIstruttore
    GROUP BY Istruttore.nome, Istruttore.cognome;
END;
*/