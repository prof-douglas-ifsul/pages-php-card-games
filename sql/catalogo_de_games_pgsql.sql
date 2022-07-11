-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jul-2022 às 04:17
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.3.2

--
-- Database: catalogo_de_games
--

-- --------------------------------------------------------

--
-- Estrutura da tabela games
--

CREATE TABLE games (
  id integer NOT NULL,
  nome varchar(100) NOT NULL,
  link varchar(250) NOT NULL
);

--
-- Extraindo dados da tabela games
--

INSERT INTO games VALUES(1, 'Dota 2', 'https://mrreiha.keybase.pub/codepen/hover-fx/1.jpg');
INSERT INTO games VALUES(2, 'Stick Fight', 'https://mrreiha.keybase.pub/codepen/hover-fx/2.jpg');
INSERT INTO games VALUES(3, 'Minion Masters', 'https://mrreiha.keybase.pub/codepen/hover-fx/3.jpg');
INSERT INTO games VALUES(4, 'KoseBoz!', 'https://mrreiha.keybase.pub/codepen/hover-fx/4.jpg');
INSERT INTO games VALUES(5, 'Game 1', './');
INSERT INTO games VALUES(6, 'Game 2', './');

-- --------------------------------------------------------

--
-- Estrutura da tabela games_novidades
--

CREATE TABLE games_novidades (
  id integer NOT NULL,
  id_game integer NOT NULL,
  data date NOT NULL,
  titulo varchar(100) NOT NULL,
  descricao text NOT NULL,
  link varchar(250) NOT NULL
);

--
-- Extraindo dados da tabela games_novidades
--

INSERT INTO games_novidades VALUES(1, 5, '2022-04-07', 'New Item', 'In today’s update, two heads are better than one, and three heads are better than that, as the all-new Flockheart’s Gamble Arcana item for Ogre Magi makes its grand debut.', 'https://mrreiha.keybase.pub/codepen/hover-fx/news1.jpg');
INSERT INTO games_novidades VALUES(2, 6, '2022-04-07', 'Update', 'Just in time for Lunar New Year and the Rat’s time in the cyclical place of honor, the Treasure of Unbound Majesty is now available.', 'https://mrreiha.keybase.pub/codepen/hover-fx/news2.png');


do $$
declare tabela record;
declare ultimo integer;
begin
FOR tabela IN
        select i.table_name, c.column_name, i.table_name || '_' || c.column_name || '_seq' as seq_name from information_schema.tables i inner join information_schema.columns c on i.table_schema = c.table_schema and i.table_name = c.table_name where c.ordinal_position = 1 and i.table_schema = 'public'
    LOOP
        EXECUTE 'CREATE SEQUENCE IF NOT EXISTS ' || TABELA.seq_name || ';';
        EXECUTE 'alter table ' || TABELA.table_name || ' alter column ' || TABELA.column_name || ' set default nextval(''' || QUOTE_IDENT(TABELA.seq_name) || ''');';
        EXECUTE 'alter sequence ' || QUOTE_IDENT(TABELA.seq_name) || ' owned by ' || TABELA.table_name || '.' || TABELA.column_name || ';';
        EXECUTE format('select COALESCE(max(%I),1) from %I', TABELA.column_name, TABELA.table_name) into ultimo;
        EXECUTE 'select setval(''' || QUOTE_IDENT(TABELA.seq_name) || ''', ' || ultimo || ');';
    END LOOP;
end$$;

--
-- Indexes for dumped tables
--

--
-- Indexes for table games
--
ALTER TABLE games
  ADD PRIMARY KEY (id);

--
-- Indexes for table games_novidades
--
ALTER TABLE games_novidades
  ADD PRIMARY KEY (id);



--
-- Limitadores para a tabela games_novidades
--
ALTER TABLE games_novidades
  ADD CONSTRAINT fk_games FOREIGN KEY (id_game) REFERENCES games (id);
