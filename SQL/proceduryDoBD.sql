create procedure getEmailCount @mail varchar(50), 
@EmailCOUNT int OUT
as
Select @EmailCOUNT = COUNT(*) from Klienci 
where Email = @mail
go

create procedure getEmail @mail varchar(50)
as
select Email from Klienci where Email = @mail
go


create procedure addUser @imie varchar(30), @naz varchar(30),
@mail varchar(50), @datau varchar(10), @ulica varchar(40),
@miasto varchar(30), @kod varchar(6), @pas varchar(256)
as
INSERT INTO Klienci (Imie, Nazwisko, Email, DataUrodzenia, Ulica, Miasto, KodPocztowy, Haslo) 
VALUES (@imie, @naz, @mail, @datau, @ulica, @miasto, @kod, @pas);
go


create procedure getAllFilms
as
SELECT Seanse.TytulFilmu, Seanse.TypSeansu, Seanse.DataSeansu, Seanse.GodzinaSeansu, 
Seanse.IdSali, SaleKinowe.IloscMiejsc FROM Seanse
LEFT JOIN SaleKinowe ON Seanse.IdSali = SaleKinowe.IdSali
go

create procedure Login @mail varchar(50), @pas varchar(256)
as
select Email, Haslo from Klienci where
Email = @mail and
Haslo = @pas
go

create procedure isSuperuser
as
select Email, Superuser from Klienci where
Superuser = 1
go

create procedure getSale
as
select IdSali, IloscMiejsc from SaleKinowe
go

create procedure Dodaj @tytul varchar(50),
@datas varchar(11), @godz varchar(5),
@sala int, @typ varchar(6) 
as
insert into Seanse(TytulFilmu, DataSeansu, 
GodzinaSeansu, IdSali, TypSeansu) 
values (@tytul, @datas, @godz, @sala, @typ)
go

create procedure getSeanseToDel
as
SELECT IdSeansu, TytulFilmu FROM Seanse
go

create procedure deleteSeans @id int
as
DELETE FROM Seanse WHERE IdSeansu= @id
go

create procedure getSeanse
as
SELECT IdSeansu, TytulFilmu, TypSeansu FROM Seanse
go

create procedure AddReservation @mail varchar(50), 
@typ varchar(10), @seans int
as
declare @bilet varchar(10);
declare @id int;
set @id = (SELECT IdKlienta FROM Klienci WHERE Email= @mail);
insert into Bilety(TypBiletu) values (@typ);
set @bilet = (Select top 1 IdBiletu from Bilety order By IdBiletu
DESC);

insert into Zamowienia(IdBiletu, IdKlienta, IdSeansu)
values(@bilet, @id, @seans);
go

create procedure myReservation @mail varchar(50)
as
SELECT Bilety.IdBiletu, Zamowienia.IdBiletu, Zamowienia.IdKlienta, Zamowienia.IdSeansu, Klienci.IdKlienta, Seanse.IdSeansu, Seanse.TytulFilmu, 
Seanse.TypSeansu , Seanse.DataSeansu, Seanse.GodzinaSeansu, Seanse.IdSali, Klienci.Email
FROM Seanse INNER JOIN (Klienci INNER JOIN (Bilety INNER JOIN Zamowienia ON Bilety.IdBiletu = Zamowienia.IdBiletu) 
ON Klienci.IdKlienta = Zamowienia.IdKlienta) ON Seanse.IdSeansu= Zamowienia.IdSeansu
WHERE (((Klienci.Email)=@mail))
go
