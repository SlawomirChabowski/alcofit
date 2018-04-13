def finalize (i)

    i.each do |y|
        puts "Butelka nr #{i.index(y) + 1}"
        puts 'Nazwa:    ' + $butelki.key(y).to_s
        puts 'Objętość: ' + y.litraz.to_s + ' l'
        puts 'Alkohol:  ' + y.woltaz.to_s + "%"
        puts ''
    end

end