# funkcja na ustalanie zawartości skrzyni
def ustaw_zawartosc
    
    # tymczasowa tablica z zawartością skrzynki, domyślnie pusta
    #t_skrzynia = Array.new($skrzynka.dlugosc, Array.new($skrzynka.szerokosc, 0))
    t_skrzynia = Array.new
    
    # tymczasowa lista nazw alkoholi
    t_alkohole = Array.new

    $nazwy.each do |i|
        t_alkohole << i
    end
    # wymieszanie listy
    t_alkohole.shuffle!

    # objętość skrzyni
    t_skrzynia_obj = $skrzynka.dlugosc * $skrzynka.szerokosc

    # próbowanie wciśnięcia każdej butelki do skrzynki
    t_alkohole.each do |alk|

        # sprawdzenie, czy jest wolne miejsce w skrzyni
        # pobranie wymiarów butelki
        t_butelka = $butelki.fetch(alk)
        t_dlugosc = t_butelka.dlugosc
        t_szerokosc = t_butelka.szerokosc

        if (t_dlugosc * t_szerokosc <= t_skrzynia_obj)
            t_skrzynia_obj -= t_dlugosc * t_szerokosc
            t_skrzynia << t_butelka
        end

        if t_skrzynia_obj < 25
            return t_skrzynia
        end
    end

    # zwrócenie skrzynki z alkoholami
    t_skrzynia
end