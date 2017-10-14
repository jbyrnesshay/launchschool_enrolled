require "free_google_translate"
require "whereisthis"
# AIzaSyBdxEobXK_tXS75gq4u9F790wh5HSqcoz4
require 'socket'

ip=Socket.ip_address_list.detect{ |intf| intf.ipv4_private? }
ip.ip_address if ip

string = "i am going to test this"

puts GoogleTranslate.translate from: "en", to: "vi", text: string
# location = GeoLocation.find(ip.ip_address.to_s)
# location = IPGeolocation.query(ip.ip_address.to_s)
# puts location(ip.ip_address)
# puts ip.ip_address
# puts location
location = `whereisthis ip.ip_address`
# test = NiriIpTrack::IpTrack.locate_ip(ip.ip_address.to_s)
# puts GoogleTranslate.translate to: "en", text: loation.country
puts location
