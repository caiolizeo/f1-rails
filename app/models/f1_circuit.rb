class F1Circuit < ApplicationRecord

  def self.update
    puts ' '
    puts '======================================'
    puts '=== ATUALIZANDO LISTA DE CIRCUITOS ==='
    puts '======================================'
    puts ' '

    resp = Faraday.get('http://ergast.com/api/f1/current.json')
    count = 0
    if resp.status == 200

      begin
        resp_body = JSON.parse(resp.body)
        circuits = resp_body['MRData']['RaceTable']['Races']
        season = resp_body['MRData']['RaceTable']['season']

        circuits.each do |c|

          next unless F1Circuit.where(year: season, code: c['Circuit']['circuitId']).empty?
          new_circuit = F1Circuit.new
          new_circuit.name = c['Circuit']['circuitName']
          new_circuit.code = c['Circuit']['circuitId']
          new_circuit.country = c['Circuit']['Location']['country']
          new_circuit.latitude = c['Circuit']['Location']['lat']
          new_circuit.longitude = c['Circuit']['Location']['long']
          new_circuit.local = c['Circuit']['Location']['locality']
          new_circuit.round = c['round']
          new_circuit.fp1 = DateTime.parse("#{c['FirstPractice']['date']} #{c['FirstPractice']['time']}") - 3.hours
          new_circuit.fp2 = DateTime.parse("#{c['SecondPractice']['date']} #{c['SecondPractice']['time']}") - 3.hours
          new_circuit.fp3 = DateTime.parse("#{c['ThirdPractice']['date']} #{c['ThirdPractice']['time']}") - 3.hours unless c['ThirdPractice'] == nil
          new_circuit.qualifying = DateTime.parse("#{c['Qualifying']['date']} #{c['Qualifying']['time']}") - 3.hours
          new_circuit.sprint = DateTime.parse("#{c['Sprint']['date']} #{c['Sprint']['time']}") - 3.hours unless c['Sprint'] == nil
          new_circuit.race = DateTime.parse("#{c['date']} #{c['time']}") - 3.hours
          new_circuit.year = season
          new_circuit.photo_path = "#{season}/#{c['Circuit']['circuitId']}.png"

          new_circuit.save
          count+=1
        end

      rescue
        puts ' '
        puts '======================================================='
        puts '=== HOUVE UM ERRO AO ATUALIZAR A LISTA DE CIRCUITOS ==='
        puts '======================================================='
        puts ' '
      end
      puts ' '
      puts '================================='
      puts "=== CIRCUITOS ATUALIZADOS: #{count} ==="
      puts '================================='
      puts ' '
    end
  end
  
end
