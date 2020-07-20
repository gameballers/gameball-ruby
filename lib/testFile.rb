require_relative './gameball'
Gameball::api_key="7c7636658209418c9a82306a421f76a5"
Gameball::api_version="v1.0"
res=Gameball::Request::GetBot::getBot
puts res.body