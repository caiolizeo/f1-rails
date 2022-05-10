class Circuit
  attr_reader(:id, :round, :name, :date, :time, :circuit, :local, :country, :lat_long)

  def initialize(id:, round:, name:, date:, time:, circuit:, local:, country:, lat_long:)
    @id = id
    @round = round
    @name = name
    @date = date
    @time = time
    @circuit = circuit
    @local = local
    @country = country
    @lat_long = lat_long
  end


  def self.all
    circuits = []
    resp = Faraday.get('http://ergast.com/api/f1/current.json')
    if resp.status == 200
      begin
        resp_circuits = JSON.parse(resp.body)['MRData']['RaceTable']['Races']

        resp_circuits.each do |c|
          c_date = Date.parse(c['date']).strftime('%d/%m/%Y')

          time = convert_time(c['time'])
          circuits << Circuit.new(id: c['Circuit']['circuitId'], round: c['round'], 
                                  name: c['raceName'], date: c_date, time: time,
                                  circuit: c['Circuit']['circuitName'], local: c['Circuit']['Location']['locality'],
                                  country: c['Circuit']['Location']['country'], lat_long: nil)
        end
        return circuits
        
      rescue
        return nil
      end
    end

  end

  def self.find(id)
    resp = Faraday.get("http://ergast.com/api/f1/circuits/#{id}.json")
    if resp.status == 200
      begin
        c = JSON.parse(resp.body)['MRData']['CircuitTable']
        circuit = Circuit.new(id: c['circuitId'], round: nil, name: c['Circuits'][0]['circuitName'], date: nil,
                              time: nil, circuit: c['Circuits'][0]['circuitName'],
                              local: c['Circuits'][0]['Location']['locality'],
                              country: c['Circuits'][0]['Location']['country'],
                              lat_long: [c['Circuits'][0]['Location']['lat'], c['Circuits'][0]['Location']['long']])
      
        return circuit
      rescue 
        return nil
      end
    end
  end

  def self.next_race
    resp = Faraday.get('http://ergast.com/api/f1/current/next.json')
    c = JSON.parse(resp.body)['MRData']['RaceTable']['Races'][0]
    if resp.status == 200
      c_date = Date.parse(c['date']).strftime('%d/%m/%Y')
      time = convert_time(c['time'])

      circuit = Circuit.new(id: c['Circuit']['circuitId'], round: c['round'], 
        name: c['raceName'], date: c_date, time: time,
        circuit: c['Circuit']['circuitName'], local: c['Circuit']['Location']['locality'],
        country: c['Circuit']['Location']['country'], lat_long: nil)
    end
    return circuit
  end

  private 
  
  def self.convert_time(time)
      time.slice!(-1, 1)
      hours = time.slice!(0, 2)
      new_hours = hours.to_i - 3
      return "#{new_hours}#{time}"
  end
end