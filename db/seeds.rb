# encoding: UTF-8

# SETTINGS
setting_list = [
  ["first_load", "boolean", "true"],
]
setting_list.each do |name, type, value|
    Setting.create(name: name, var_type: type, value: value)
end


# GET DB INFO
Make.get_make_info