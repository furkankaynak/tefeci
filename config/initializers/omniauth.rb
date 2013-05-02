Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "Vm78nUOfQ50I2YV1yjMg", "m49jkHcBrSV2bUJm2nNslHVaxFIrrk4XqfUo7Q6zk4"
  provider :facebook, '427471347349217', '8717d1357a9b0397bd1ab8980f44afbb'
end