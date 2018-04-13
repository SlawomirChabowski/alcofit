=begin
    Niniejszy problem plecakowy polega na tym, że użytkownik dostaje skrzynkę
    o pewnych wymiarach. Ma do tej skrzynki zmieścić jak najwyżej procentowany
    alkohol w butelkach o różnych wymiarach tak, by ostatecznie móc spożyć go
    jak najwięcej. Kształt butelek nigdy się nie powtarza.
=end

load 'RandomName.rb'
load 'SetContent.rb'
load 'ShowVoltage.rb'
load 'Finalize.rb'
load 'FindMosts.rb'

#skrzynia, do której będziemy chować butelki ma określone wymiary [cm]
Skrzynia = Struct.new(:dlugosc, :szerokosc)

# każdy trunek znajduje się w butelce o określonych wymiarach [cm]
# i litrażu [l] oraz ma pewną zawartość alkoholu [%]
Alkohol = Struct.new(:dlugosc, :szerokosc, :woltaz, :litraz)

# nadanie wymiarów skrzyni
$skrzynka = Skrzynia.new(20, 30)

# utworzenie tablicy hasza (kolekcji) butelek (identyfikowane nazwami
# produktów zamiast klasycznych identyfikatorów języka Ruby - aby butelki
# były dla człowieka rozróżnialne)
$butelki = Hash.new
$nazwy = Array.new


# wylosowanie tysiąca losowych alkoholi
for i in (1..1000)
    dl = rand(5..10)
    sz = rand(5..10)
    vl = rand(0..980) / 10.0
    lt = rand(1..20) / 10.0

    randomName = RandomName.new
    nz = randomName.random + " - butelka " + i.to_s

    ob = Alkohol.new(dl, sz, vl, lt)

    $butelki.store(nz, ob)
    $nazwy << nz
end
puts ">> Wygenerowano 1000 butelek różnego rodzaju alkoholu."


# utworzenie tablicy dziesięciu losowych (błędnych) rozwiązań problemu
$wyniki = Array.new
puts '-' * 50
10.times do |i|
    $wyniki << ustaw_zawartosc
    # wyliczenie czystego alkoholu
    puts "Zawartość czystego alkoholu w skrzynce #{i+1} wynosi:  " + showVoltage($wyniki[i]).to_s + " l."
end
puts '-' * 50
puts ">> Utworzono tablicę dziesięciu losowych (błędnych) rozwiązań problemu."




120.times do

    szansa = rand(0..100);

    # zastępowanie najgorszych wyników nową losową skrzynią
    if szansa >= 0 && szansa <= 30 then

        # tą skrzynką możemy podmienić najgorszą
        temp_skrzynka = ustaw_zawartosc

        # podmiana
        temp_wynik = findWorst
        if (showVoltage($wyniki[temp_wynik]) < showVoltage(temp_skrzynka))
            $wyniki[temp_wynik] = temp_skrzynka
        end
    
    # zastępowanie najgorszych wyników kombinacją najlepszej skrzyni
    else
        skrzynka_rozmiar = $skrzynka.dlugosc * $skrzynka.szerokosc
        skrzynka_hmcr = Array.new

        # wybieramy wartość o indeksie kolejno: 1, 2, 3... itd z losowej tablicy alkoholi,
        # następnie wrzucamy to do skrzynka_hmcr i jeśli skrzynka będzie bardziej optymalna
        # od reszty, podmieniamy ją
        
        w_max = 0
        $wyniki.each do |i|
            if i.size > w_max
                w_max = i.size
            end
        end
        
        # przeglądanie każdych kolumn
        (0...w_max).each do |i|

            # wylosowanie elementu w kolumnie
            loop do
                w_rand = rand(0...$wyniki.size)
                $curr = $wyniki[w_rand][i]
                break if $curr != nil
            end

            # dodanie elementu z wylosowanej kolumny
            if(skrzynka_rozmiar >= $curr.dlugosc * $curr.szerokosc)
                skrzynka_rozmiar -= $curr.dlugosc * $curr.szerokosc
                skrzynka_hmcr << $curr
            end
        end

        # dodanie nowej losowej butelki, jeśli jest jeszcze na nią miejsce
        loop do
            c_nazwa = $nazwy.sample
            curr_butelka = $butelki[c_nazwa]
            if(curr_butelka.dlugosc * curr_butelka.szerokosc <= skrzynka_rozmiar)
                skrzynka_hmcr << curr_butelka
                skrzynka_rozmiar -= curr_butelka.dlugosc * curr_butelka.szerokosc
            end
            break if skrzynka_rozmiar < 25
        end
            
        # podmiana najgorszego wyniku w tabeli wyników z obecnym
        temp_wynik = findWorst
        if (showVoltage($wyniki[temp_wynik]) < showVoltage(skrzynka_hmcr))
            $wyniki[temp_wynik] = skrzynka_hmcr
        end
    end

end

puts ">> Zakończono algorytm wybierania najlepszych wyników."



ind = 1
puts '=' * 50
$wyniki.each do |wynik|
    puts "Objętość alkoholu w skrzyni nr #{ind}: " + showVoltage(wynik).to_s + " litrów"
    ind += 1
end

puts '-' * 50
najlepsza = findBest + 1
puts "Najbardziej optymalną skrzynią jest skrzynia numer #{najlepsza.to_s}"
puts "Zawartość skrzyni numer #{najlepsza.to_s}:"
puts '-' * 50
finalize($wyniki[findBest])