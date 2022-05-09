class FormulaOneDriver < ApplicationRecord

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
        season = JSON.parse(resp.body)['MRData']['StandingsTable']['StandingsLists'][0]['season'].to_i

        drivers.each do |driver|
          newDriver = FormulaOneDriver.new

          newDriver.name = "#{driver['Driver']['givenName']} #{driver['Driver']['familyName']}"
          newDriver.code = driver['Driver']['code']
          newDriver.country = driver['Driver']['nationality']
          newDriver.team = driver['Constructors'][0]['name']
          newDriver.number = driver['Driver']['permanentNumber']
          newDriver.year = season
          newDriver.photo_img = "#{driver['Driver']['driverId']}_photo.png"
          newDriver.logo_img = "#{driver['Driver']['driverId']}_logo.png"
          
          newDriver.save if FormulaOneDriver.where("year = '#{newDriver.year}' and code = '#{newDriver.code}'").empty?
          count+=1 if newDriver.persisted?
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
