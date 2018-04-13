def showVoltage (t_skrzynia)

    woltaz = 0

    t_skrzynia.each do |i|
        woltaz += (i.woltaz * i.litraz) / 100
    end

    woltaz.round(2)

end