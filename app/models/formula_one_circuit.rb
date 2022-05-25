class FormulaOneCircuit < ApplicationRecord

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
          next unless FormulaOneCircuit.where(year: season, code: c['Circuit']['circuitId']).empty?
          race_date = DateTime.parse("#{c['date']} #{c['time']}") - 3.hours
          fp1_date = DateTime.parse("#{c['FirstPractice']['date']} #{c['FirstPractice']['time']}") - 3.hours
          fp2_date = DateTime.parse("#{c['SecondPractice']['date']} #{c['SecondPractice']['time']}") - 3.hours
          fp3_date = DateTime.parse("#{c['ThirdPractice']['date']} #{c['ThirdPractice']['time']}") - 3.hours unless c['ThirdPractice'] == nil
          quali_date = DateTime.parse("#{c['Qualifying']['date']} #{c['Qualifying']['time']}") - 3.hours
          sprint_date = DateTime.parse("#{c['Sprint']['date']} #{c['Sprint']['time']}") - 3.hours unless c['Sprint'] == nil

          circuit = FormulaOneCircuit.new(name: c['Circuit']['circuitName'], country: c['Circuit']['Location']['country'],
                                          code: c['Circuit']['circuitId'], latitude: c['Circuit']['Location']['lat'],
                                          longitude: c['Circuit']['Location']['long'], local: c['Circuit']['Location']['locality'],
                                          round: c['round'], photo_path: "#{season}/#{c['Circuit']['circuitId']}.png", 
                                          race_date: race_date, fp1: fp1_date, fp2: fp2_date, fp3: fp3_date, qualifying: quali_date,
                                          sprint: sprint_date, year: season)

          circuit.save
          count += 1 if circuit.persisted?
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
