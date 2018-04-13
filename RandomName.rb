class RandomName
    def initialize
        # tablice do generowania nazw alkoholi

        @names1 = ["Piwo", "Wino", "Smaki", "Wodka", "Woda", "Cieczka", "Usmiech", "Smiech", 
        "Bimber", "Mocny", "Komandos", "Chateau", "Sen", "Winko", "Piwko", "Wodeczka", "Antal", 
        "Barylka", "Baczek", "Beczka", "Belzebub", "Bialy", "Buklaczek", "Czar", "Drink", "Granat", 
        "Gruszka", "Jabluszko", "Kapitan", "Kiler", "Karton", "Lzy", "Mamrot", "Nalewka", "Oddech", 
        "Platon", "Sagan", "Usmiech", "Uciecha", "Zemsta"]

        @names2 = ["marki wino", "lasu", "mocarz", "nieznanego pochodzenia", "babuni", 
        "emerytki", "lesniczego", "chlopskie", "soltysa", "marki wino", " De jabol", "Bazyliszek", 
        "lesny", "kielich", "mis", "moc", "tesciowej", "byk", "PeGeeRu", "domokrazca", "strong", 
        "imperator", "polewa", "bomba", "dziedzica", "krzepkie", "kuszace", "na spirytusie", 
        "sasiedzkie", "kombajnisty", "szatana", "grabarza", "dziadunia", "na dobranoc", "elektryka"]
    end

    def random
        @n1 = rand(0..(@names1.length-1))
        @n2 = rand(0..(@names2.length-1))
        "#{@names1[@n1]}" + " " + "#{@names2[@n2]}"
    end
end