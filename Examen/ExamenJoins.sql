CREATE TABLE Autores (
id_autor INT identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);

select * from Autores

ALTER TABLE Comics
ADD id_autor int,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);
select * from Comics


Insert into Autores (nombre, pais_origen) values
('lolis', 'Mexico'),
('victor', 'Canada'),
('Juana', 'Irlanda'),
('pepe', 'Mexico');

UPDATE 

UPDATE Comics SET id_autor = 300 WHERE titulo = 'Watchmen'
UPDATE Comics SET id_autor = 301 WHERE titulo = 'The Dark Knight Returns'
UPDATE Comics SET id_autor = 303 WHERE titulo = 'Maus'
UPDATE Comics SET id_autor = 302 WHERE titulo = 'V for Vendetta'
UPDATE Comics SET id_autor = 300 WHERE titulo = 'Sandman: Preludes & Nocturnes'
UPDATE Comics SET id_autor = 301 WHERE titulo = 'Batman: Year One'
UPDATE Comics SET id_autor = 302 WHERE titulo = 'Saga: Volume 1'
UPDATE Comics SET id_autor = 303 WHERE titulo = 'Y: The Last Man - Unmanned'
UPDATE Comics SET id_autor = 301 WHERE titulo = 'Spider-Man: Blue'
UPDATE Comics SET id_autor = 303 WHERE titulo = 'Batman: The Killing Joke'

SELECT c.titulo, a.nombre, a.pais_origen
from Comics c
LEFT JOIN Autores a ON c.id_autor = a.id_autor;


SELECT a.nombre, Comic_Compras.cantidad
FROM Comics c
INNER JOIN Comic_Compras ON c.id_comic = Comic_Compras.id_comic
Inner Join Autores a ON c.id_autor = a.id_autor;

