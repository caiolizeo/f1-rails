class F1Driver < ApplicationRecord

  def self.standings
    return F1Driver.where(year: Date.today.year).order(position: :asc)
  end

  def self.update
    puts ' '
    puts '===================================='
    puts '=== ATUALIZANDO LISTA DE PILOTOS ==='
    puts '===================================='
    puts ' '

    resp = Faraday.get('http://ergast.com/api/f1/current/driverStandings.json')
    count = 0
    if resp.status == 200

      begin

        drivers = JSON.parse(resp.body)['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
        season = JSON.parse(resp.body)['MRData']['StandingsTable']['StandingsLists'][0]['season']

        drivers.each do |driver|
          next unless F1Driver.where(year: season, code: driver['Driver']['code']).empty?
          newDriver = F1Driver.new

          newDriver.first_name = driver['Driver']['givenName']
          newDriver.last_name = driver['Driver']['familyName']
          newDriver.full_name = "#{driver['Driver']['givenName']} #{driver['Driver']['familyName']}"
          newDriver.code = driver['Driver']['code']
          newDriver.country = driver['Driver']['nationality']
          newDriver.team = driver['Constructors'][0]['name']
          newDriver.number = driver['Driver']['permanentNumber']
          newDriver.year = season
          newDriver.photo_img = "#{season}/#{driver['Driver']['driverId']}_photo.png"
          newDriver.logo_img = "#{season}/#{driver['Driver']['driverId']}_logo.png"
          newDriver.position = driver['position']
          newDriver.points = driver['points']
          newDriver.wins = driver['wins']
          
          newDriver.save 
          count+=1
        end
      
      rescue
        puts ' '
        puts '====================================================='
        puts '=== HOUVE UM ERRO AO ATUALIZAR A LISTA DE PILOTOS ==='
        puts '====================================================='
        puts ' '


      end
      puts ' '
      puts '==============================='
      puts "=== PILOTOS ATUALIZADOS: #{count} ==="
      puts '==============================='
      puts ' '
    end
  end

end
