def findWorst
    # najgorsza skrzynka w zestawie
    min = $wyniki[0]
    $wyniki.each do |wynik|
        if showVoltage(min) > showVoltage(wynik)
            min = wynik
        end
    end

    # indeks najgorszej skrzynki w zestawie
    temp_wynik = $wyniki.index(min)
end



def findBest
    # najlepsza skrzynka w zestawie
    max = $wyniki[0]
    $wyniki.each do |wynik|
        if showVoltage(max) < showVoltage(wynik)
            max = wynik
        end
    end

    # indeks najlepszej skrzynki w zestawie
    temp_wynik = $wyniki.index(max)
end