require "khepri_connector/version"

class Khepri

  def initialize(khepri_url, api_key, instance_id)
    @khepri_url, @api_key,  @instance_id = khepri_url, api_key, instance_id
  end

  #
  # prepare and launch ask task
  #
  def ask(exludes = nil, forced = nil, dimensions = {})
    params_to_add = {}
    if !exludes.nil?
      params_to_add[:exclude] = exludes.join(',')
    end

    if !forced.nil?
      params_to_add[:forced_solutions] = forced.join(',')
    end

    if !dimensions.empty?
      dimensions.each do |key, value|
        params_to_add[key] = value
      end
    end

    launch('ask', params_to_add)

  end

  #
  # prepare and launch success task
  #
  def success(answer)
    if answer["status"] == 'success'
      params_to_add = { :solution => answer["solution"]}
      launch('success', params_to_add)

    end

  end

  #
  # prepare and launch dimensions task
  #
  def dimensions(answer)
    puts answer
    if answer["status"] == 'success' && answer.has_key?('dimensions')
      params_to_add = { :dimensions => answer["dimensions"]}
      launch('dimensions', params_to_add)

    end


  end

  #
  # prepare and launch reset task
  #
  def reset
    launch 'reset'

  end

  #
  # launch task on khepri and get the result
  #
  def launch(api, params_to_add = {})

    url = @khepri_url + '/api/' + api + '.json'
    uri = URI(url)
    params = { :instance => @instance_id, :api_key => @api_key}
    if !params_to_add.empty?
      params.merge!(params_to_add)
    end
    uri.query = URI.encode_www_form(params)
    puts "launching :: " + uri.to_s

    # real call
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess) || !res.body.empty?
      puts "khepri answer :: " + res.body
      JSON.parse(res.body)
    else
      false
    end

  end

end