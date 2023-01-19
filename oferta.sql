-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Sty 2023, 18:08
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `oferta`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_User` int(3) NOT NULL,
  `Login` text NOT NULL,
  `Haslo` text NOT NULL,
  `typ_konta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID_User`, `Login`, `Haslo`, `typ_konta`) VALUES
(1, 'admin', 'admin', 1),
(31, 'adam', 'adam', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `ID` int(2) NOT NULL,
  `Marka` text NOT NULL,
  `Model` text NOT NULL,
  `Pochodzenie` text NOT NULL,
  `Cena` text NOT NULL,
  `Kolor` text NOT NULL,
  `Napęd` text NOT NULL,
  `Silnik` text NOT NULL,
  `Rocznik` text NOT NULL,
  `RodzajOferty` text NOT NULL,
  `Opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`ID`, `Marka`, `Model`, `Pochodzenie`, `Cena`, `Kolor`, `Napęd`, `Silnik`, `Rocznik`, `RodzajOferty`, `Opis`) VALUES
(1, 'Ford', 'Mondeo MK3 ST220', 'USA', '25000zł', 'Niebieski', 'FWD', '3.0 Benzyna', '2005', 'Kupno', '\'Po co kupować inne samochody?\' powiedział Jeremy Clarkson jeżdząc Mondeo ST220. Jest to auto o subtelnym wygladzie - brak nadmuchanych spoilerów, gigantycznych wydechów i innych \'ozdób\'. Miny zaskoczonych kierowników BMW i MB są bezcenne. Nie spodziewają się iż Ford ich łyknie. Genialny, niezawodny silnik wolnossący wykonany z aluminium z kutym korbowodem i łańcuchem rozrządu. No i to prowadzenie.'),
(2, 'Opel', 'Astra J', 'Niemcy', '15000zł', 'Czarny', 'FWD', '1.6 Diesel', '2015', 'Kupno', 'Opel Astra J to prawdziwy hit sprzedaży na polskim rynku: niejednokrotnie okupowała miejsce trzeciego najlepiej sprzedającego się samochodu w naszym kraju, zaraz po dwóch niekwestionowanych bestsellerach – Skodzie Octavii i Skodzie Fabii. Nietrudno oprzeć się wrażeniu, że wynika to w dużej mierze z przyzwyczajenia Polaków do kompaktowego Opla. Od lat uchodził on bowiem za trwały, porządnie wykonany i solidny mechanicznie samochód z szeroką paletą dostępnych wariantów nadwozia.'),
(3, 'Tesla', 'Model S', 'USA', '290000zł', 'Czarny', 'AWD', 'Elektryczny', '2019', 'Kupno', 'Luksusowy model segmentu E, napędzany silnikiem elektrycznym, produkowany od 2012 roku. To pierwszy seryjnie produkowany elektryczny sedan klasy premium. Prace nad nim trwały co najmniej od połowy ubiegłej dekady – w 2009 roku zaprezentowano prototyp WhiteStar zaprojektowany przez Franza von Holzhausena, na którym opiera się wersja produkcyjna Modelu S. Samochód okazał się pierwszym globalnym sukcesem Tesli, dotychczas sprzedano go w liczbie bliskiej 50 tys. egzemplarzy. Model S był też wielokrotnie nagradzany, m.in. tytułem World Green Car of the Year 2013 i Motor Trend Car of the Year 2013.'),
(4, 'Tesla', 'Model 3', 'USA', '170000zł', 'Czarny', 'AWD', 'Elektryczny', '2018', 'Leasing', 'Gdybym miał opisać Teslę Model 3 jednym słowem, wybrałbym \'szał\'. Nie pamiętam drugiego auta, po które ustawiały się tak długie kolejki. Gdybym miał użyć tylko dwóch słów, padłoby na \'uzasadniony szał\', co zrozumiałem po krótkiej przejażdżce.'),
(5, 'Tesla', 'Model X', 'USA', '2500zł/doba', 'Biały', 'AWD', 'Elektryczny', '2017', 'Wypozyczenie', 'Wygląda jak jeżdżący statek kosmiczny, przyspiesza lepiej od topowych modeli Ferrari i wygodnie mieści 7 dorosłych osób. Poznajcie Teslę Model X – samochód będący wyznacznikiem motoryzacyjnej przyszłości. Innowacyjne, nieszablonowe, rewolucyjne – do samochodów marki Tesla można przytoczyć wiele określeń i doskonale pasują one również do największego modelu – Modelu X. Stylistycznie bardzo przypomina on starszy Model S i niedawno debiutujący Model 3, ale X jest przede wszystkim wielki: pięć metrów długości i dwa szerokości robią wrażenie nie tylko z zewnątrz, ale również po zajęciu miejsca w środku'),
(6, 'Tesla', 'Model Y', 'USA', '1700zł/doba', 'Czerwony', 'AWD', 'Elektryczny', '2020', 'Wypozyczenie', 'Tesla Model Y Performance to wariant z napędem na obie osie i najwolniejszy model Performance w rodzinie. A mimo to oferuje przyspieszenie do 100 km/h trwające zaledwie 3,7 sekundy, czyli lepsze niż całą spalinowa konkurencja w tym segmencie.'),
(7, 'Mercedes', 'AMG GT 63', 'Niemcy', '6500zł/doba', 'Czarny', 'RWD', '4.0 Benzyna', '2020', 'Wypozyczenie', 'Cieszy oczy, uszy i duszę. Do tego emanuje magnetyzmem, mocą i sportowym charakterem. Potrafi być komfortowe i do bólu precyzyjne, gdy przyjdzie wam ochota poszaleć nim na torze. Mercedes-AMG stworzył uroczego potwora, któremu nie sposób się oprzeć.'),
(8, 'Audi', 'A7', 'Niemcy', '340000zł', 'Czerwony', 'AWD', '3.0 Diesel', '2019', 'Leasing', 'Najnowsze Audi A7 łączy nowoczesną technikę flagowej limuzyny A8 z charakterem coupé. To inteligentne auto urzeka stylem oraz przyjemnością prowadzenia. Długa maska, potężna osłona chłodnicy, sięgająca niemal dolnego spoilera, przetłoczenia na masce i wzdłuż boków nadwozia, opadająca linia dachu, tylny spoiler i dolny dyfuzor oraz ledowe reflektory i tylne lampy tworzą intrygującą atletyczną całość.'),
(9, 'BMW', 'M2', 'Niemcy', '180000zł', 'Srebrny', 'RWD', '3.0 Benzyna', '2019', 'Kupno', 'BMW M2 stało się jeszcze dojrzalszą i bardziej bezwzględną maszyną do dostarczania kierowcy przyjemności z jazdy, także na co dzień. Potrafi być w tym wyrachowane i bezlitosne, ale również bardziej wyrozumiałe i pomocne, a przy tym czarujące i uzależniające jak żaden inny kompakt. Poznajcie jednego z najlepszych pełnokrwistych hot hatchy na rynku.'),
(10, 'Ford', 'Mustang', 'USA', '300000zł', 'Niebieski', 'RWD', '5.0 Benzyna', '2018', 'Leasing', 'Mustang w Europie jest bezkonkurencyjny. Garściami czerpie wzorce z pierwowzoru, daje mnóstwo frajdy z jazdy i do tego został świetnie wyceniony. Żaden z producentów nie oferuje 450 koni mechanicznych w podobnej cenie.'),
(11, 'Fiat', 'Panda', 'Włochy', '200zł/doba', 'Błękitny', 'FWD', '1.4 Benzyna', '2008', 'Wypozyczenie', 'Panda to prawdziwy hit sprzedaży. W sumie w ciągu 9 lat produkcji Fiat sprzedał prawie 2,2 miliona egzemplarzy. Auto stanowi łakomy kąsek dla kierowców poszukujących taniego, miejskiego hatchbacka. I nie powinno to dziwić. Ma miłą dla oka karoserię, praktyczne wnętrze i wyjątkowo atrakcyjną cenę.'),
(12, 'Volkswagen', 'Golf V', 'Niemcy', '30000zł', 'Czarny', 'FWD', '2.0 Benzyna', '2008', 'Leasing', 'Golf V GTI zaskakuje wszechstronnością. W popularniejszej wersji 5-drzwiowej ma naprawdę funkcjonalne nadwozie, a do tego jeszcze bagażnik o pojemności od 350 do 1305 l. Silnik umożliwia jazdę na niskich obrotach i zużywa wtedy niewiele paliwa (ok. 9 l /100 km).'),
(13, 'BMW', 'M5 E39', 'Niemcy', '80000zł', 'Srebrny', 'RWD', '4.9 Benzyna', '2003', 'Kupno', 'brum brum'),
(14, 'BMW', 'E46 M3', 'Niemcy', '65000zł', 'Biały', 'RWD', '3.3 Benzyna', '2006', 'Kupno', 'Lorem ipsum'),
(15, 'Aston Martin', 'DB9', 'Anglia', '400000zł', 'Szary', 'RWD', '5.9 Benzyna', '2008', 'Kupno', 'lorem ipsum'),
(16, 'Ferrari', 'F40', 'WÅochy', '900000zÅ', 'Czerwony', 'RWD', '2.9 Benzyna', '1990', 'Kupno', 'lorem ipsum');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL,
  `RodzajOferty` text NOT NULL,
  `Cena_Zamowienia` text NOT NULL,
  `Długosc_Zamowienia` text NOT NULL,
  `ID_Auta` int(30) NOT NULL,
  `Konto` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`ID_Zamowienia`, `RodzajOferty`, `Cena_Zamowienia`, `Długosc_Zamowienia`, `ID_Auta`, `Konto`, `status`) VALUES
(47, 'Kupno', '400000', '0', 15, 'adam', 0),
(48, 'Kupno', '65000', '0', 14, 'adam', 0),
(49, 'Kupno', '80000', '0', 13, 'adam', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_User`),
  ADD UNIQUE KEY `Login` (`Login`) USING HASH;

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`ID_Zamowienia`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_User` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `samochody`
--
ALTER TABLE `samochody`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `ID_Zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
