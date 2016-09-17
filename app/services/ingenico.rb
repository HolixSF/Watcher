require 'openssl'
require 'base64'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv'

Dotenv.load


# method = ['POST', 'GET', 'PUT', 'DELETE']

def setRequest (httpHeader, subURI, body = "")
  merchant_id =  ENV['merchant_id']
  api_key = ENV["api_key"]
  secret_key = ENV["secret_key"]
  url = "https://api-sandbox.globalcollect.com"
  meth = httpHeader 
  type = "application/json"
  time = Time.new
  timestamp = time.strftime("%a, %d %b %Y %H:%M:%S %Z")

  uri = "/v1/"+merchant_id+subURI
  endpoint = url+uri
  header = meth+"\n"+type+"\n"+timestamp+"\n"+uri+"\n"
  digest = OpenSSL::Digest.new('sha256')
  decoded_key = Base64.strict_decode64(secret_key)
  hmac = Base64.strict_encode64(OpenSSL::HMAC.digest(digest, secret_key, header))
  url = URI(endpoint)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  if httpHeader == "POST"
    request = Net::HTTP::Post.new(url)
  elsif httpHeader == "DELETE"
    request = Net::HTTP::Delete.new(url)
  elsif httpHeader == "PUT"
    request = Net::HTTP::Put.new(url)
  else
    request = Net::HTTP::Get.new(url)
  end
  
  request["Date"] = timestamp
  request["Content-type"] = type
  request["authorization"] = "GCS v1HMAC:"+api_key+":"+hmac
  request.body = body
 
  response = http.request(request)
  jsonr = JSON.parse(response.read_body)
  #puts jsonr
  return jsonr
  
end

# test connection
response = setRequest('GET', '/services/testconnection')
# jsonr = JSON.parse(response.read_body)
puts response

# create hosted checkout
body = '{
  "hostedCheckoutSpecificInput": {
    "locale": "en_GB", 
    "variant": "testVariant"
  }, 
  "order": {
    "amountOfMoney": {
      "currencyCode": "USD", 
      "amount": 999
    }, 
    "customer": {
      "billingAddress": {
        "countryCode": "US"
      }
    }
  }
}'

#response = setRequest('GET', '/services/testconnection')
# jsonr = JSON.parse(response.read_body)
#puts response
response = setRequest('POST', '/hostedcheckouts', body)
# jsonr = JSON.parse(response.read_body)
purl = response['partialRedirectUrl']
hcid = response['hostedCheckoutId']
puts purl 
puts hcid
body = ''
response = setRequest('GET', '/hostedcheckouts/' + hcid, body)
status = response['status']
while status == 'IN_PROGRESS' do
  response = setRequest('GET', '/hostedcheckouts/' + hcid, body)
  status = response['status']
end
paymentOutput = response['createdPaymentOutput']
paymentId = paymentOutput['payment']['id']
puts paymentId

#check payment status
response = setRequest('GET', '/payments/' + paymentId, body)
paymentStatus = response['status']
puts paymentStatus

# tokenize 
body = '{}'
response = setRequest('POST', '/payments/' + paymentId + '/tokenize', body)
puts response
# capture payment
body = '{
"paymentMethodSpecificInput": 999 #payment product ID
}'
response = setRequest('POST', '/payments/' + paymentId + '/approve', body)
puts response
