class FormulaOneDriver < ApplicationRecord

  def self.standings
    resp = Faraday.get('http://ergast.com/api/f1/current/driverStandings.json')

    if resp.status == 200
      begin
        resp_drivers = JSON.parse(resp.body)['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']

        standings = {}

        resp_drivers.each do |d|
          standings[d['position']] = FormulaOneDriver.find_by(code: d['Driver']['code'])
        end
      rescue
        return standings['error'] = "error"
      end
      return standings
    end
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
          next unless FormulaOneDriver.where(year: season, code: driver['Driver']['code']).empty?
          newDriver = FormulaOneDriver.new

          newDriver.name = driver['Driver']['givenName']
          newDriver.last_name = driver['Driver']['familyName']
          newDriver.full_name = "#{driver['Driver']['givenName']} #{driver['Driver']['familyName']}"
          newDriver.code = driver['Driver']['code']
          newDriver.country = driver['Driver']['nationality']
          newDriver.team = driver['Constructors'][0]['name']
          newDriver.number = driver['Driver']['permanentNumber']
          newDriver.year = season
          newDriver.photo_img = "#{season}/#{driver['Driver']['driverId']}_photo.png"
          newDriver.logo_img = "#{season}/#{driver['Driver']['driverId']}_logo.png"
          
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
