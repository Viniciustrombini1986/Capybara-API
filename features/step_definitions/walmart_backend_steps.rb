Given(/^Tenho uma API para consultar, inserir, alterar e deletar todos os posts existentes$/) do
	@url= "http://jsonplaceholder.typicode.com/posts"
end

When(/^realize uma "([^"]*)" pelo ID "([^"]*)"$/) do |ação, id|
  if id == "todos os posts existentes"
  	id = ""
  else	
    id = id
  end

  if ação == "consulta"
  	@response = HTTParty.get(@url+"/"+id)
  	puts "HTTParty.get("+@url+"/"+id+")"
  elsif ação == "exclusão"
  	@response = HTTParty.delete(@url+"/"+id)
  	puts "HTTParty.delete("+@url+"/"+id+")"
  elsif ação == "alteração"
     url1 = @url+"/"+id
     puts url1
     json = {'title' => 'Alteração de titulo!!!'}
     puts json
    @response = HTTParty.put(url1, body:json)
  else
  	puts "Ação inválida, o sistema permite apenas consulta, inserção, alteração ou exclusão"
  end
end

When(/^informe os dados "([^"]*)" "([^"]*)", "([^"]*)" e "([^"]*)" do post a ser criado$/) do |userId, id, title, body|
  @response= HTTParty.post(@url,
  { 
    :body => [ { 
      "userId" => userId, 
      "id" => id, 
      "title" => title, 
      "body" => body
      } ].to_json,
    :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  })
end

Then(/^deverá retornar a "([^"]*)" com sucesso ou exibir uma mensagem alertando alguma irregularidade$/) do |ação|
case @response.code
    when 100
      puts 'Response = Continue'
    when 101
      puts 'Response = Switching Protocols'
    when 200
      puts 'Response = OK'
      puts ação + " realizada com sucesso!"
    when 201
      puts 'Response = Created'
      puts ação + " criada com sucesso!"
    when 202
      puts 'Response = Accepted'
    when 203
      puts 'Response = Non-Authoritative Information'
    when 204
      puts 'Response = No Content'
    when 205
      puts 'Response = Reset Content'
    when 206
      puts 'Response = Partial Content'
    when 300
      puts 'Response = Multiple Choices'
    when 301
      puts 'Response = Moved Permanently'
    when 302
      puts 'Response = Found'
    when 303
      puts 'Response = See Other'
    when 304
      puts 'Response = Not Modified'
    when 305
      puts 'Response = Use Proxy'
    when 306
      puts 'Response = Unused'
    when 307
      puts 'Response = Temporary Redirect'
    when 400
      puts 'Response = Bad Request'
      puts ação + " não realizada o ID informado não existe!"
    when 401
      puts 'Response = Unauthorized'
      puts ação + " não autorizada, verique por favor!"
    when 402
      puts 'Response = Payment Required'
    when 403
      puts 'Response = Forbidden'
    when 404
      puts 'Response = Not Found'
      puts ação + " não encontrado"
    when 405
      puts 'Response = Method Not Allowed'
    when 406
      puts 'Response = Not Acceptable'
    when 407
      puts 'Response = Proxy Authentication Required'
    when 408
      puts 'Response = Request Timeout'
    when 409
      puts 'Response = Conflict'
    when 410
      puts 'Response = Gone'
    when 411
      puts 'Response = Length Required'
    when 412
      puts 'Response = Precondition Failed'
    when 413
      puts 'Response = Request Entity Too Large'
    when 414
      puts 'Response = Request-URI Too Long'
    when 415
      puts 'Response = Unsupported Media Type'
    when 416
      puts 'Response = Requested Range Not Satisfiable'
    when 417
      puts 'Response = Expectation Failed'
    when 500
      puts 'Response = Internal Server Error'
    when 501
      puts 'Response = Not Implemented'
    when 502
      puts 'Response = Bad Gateway'
    when 503
      puts 'Response = Service Unavailable'
    when 504
      puts 'Response = Gateway Timeout'
    when 505
      puts 'Response = HTTP Version Not Supported'
    else
      puts 'Response = Unknown Response Code'
    end
    puts @response.body
end