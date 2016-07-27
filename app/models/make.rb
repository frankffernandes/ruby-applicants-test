class Make < ActiveRecord::Base
  def self.get_make_info
    print("\n Loading info... \n\n")
    # search the make
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Make request for Webmotors site
    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      unless Make.exists?(name: make_params["Nome"])
        Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
        Model.get_make_models(make_params["Id"])
      end
    end

    Setting.update_first_load
  end
end
