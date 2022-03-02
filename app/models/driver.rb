class Driver
  attr_reader(:id, :position, :points, :wins, :number, :code, 
              :first_name, :last_name, :team, :birth, :nationality)

  def initialize(id:, position:, points:, wins:, number:, code:,
                 first_name:, last_name:, team:, birth:, nationality:)
  
    @id = id
    @position = position
    @points = points
    @wins = wins
    @number = number
    @code = code
    @first_name = first_name
    @last_name = last_name
    @team = team
    @birth = birth
    @nationality = nationality
  end
              
  def self.standings
    drivers = []
    resp = Faraday.get('http://ergast.com/api/f1/current/driverStandings.json')

    if resp.status == 200

      begin
        resp_drivers = JSON.parse(resp.body)['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
        
        resp_drivers.each do |d|
          d_birth = Date.parse(d['Driver']['dateOfBirth']).strftime('%d/%m/%Y')
          
          drivers << Driver.new(id: d['Driver']['driverId'], position: d['position'], points: d['points'],
                                wins: d['wins'], number: d['Driver']['permanentNumber'], code: d['Driver']['code'],
                                first_name: d['Driver']['givenName'], last_name: d['Driver']['familyName'],
                                team: d['Constructors'][0]['name'], birth: d_birth, nationality: d['Driver']['nationality'])
        end

        return drivers
      rescue
        return nil
      end
    end

  end


  def self.find(id)
    resp = Faraday.get("http://ergast.com/api/f1/drivers/#{id}.json")
    if resp.status == 200
      # begin
        d = JSON.parse(resp.body)['MRData']['DriverTable']

        d_birth = Date.parse(d['Drivers'][0]['dateOfBirth']).strftime('%d/%m/%Y')

        driver = Driver.new(id: d['driverId'], position: nil, points: nil, wins: nil, 
                            number: d['Drivers'][0]['permanentNumber'], code: d['Drivers'][0]['code'],
                            first_name: d['Drivers'][0]['givenName'], last_name: d['Drivers'][0]['familyName'],
                            team: nil, birth: d_birth, nationality: d['Drivers'][0]['nationality'])
        
        return driver
      # rescue
        
      # end
    end

  end


end