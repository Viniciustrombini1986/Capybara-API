Given(/^que acesse o site do Walmart$/) do
	@home = HomePage.new
	@home.load
end

Given(/^preencha o campo busca com o termo "([^"]*)"$/) do |busca|
	@busca = BuscaPage.new
	@busca.with(busca)
end

Given(/^valide se a busca trouxe resultados$/) do
	has_selector?(".result-items")
	sleep 2
	@item = all('.product-title')[0].text
end

Given(/^clique em um dos resultados e verique que a página do produto está carregada corretamente$/) do
	find(".product-title", match: :first).click
	sleep 2
	expect(page).to have_content(@item)
end

Given(/^clique no botão adicionar no carrinho$/) do
	sleep 2
 	page.find('span[class=btn-label]').click
 	#sleep 2
 	#find("span", text: "Adicionar ao carrinho").click
end

When(/^abra o carrinho e verifique que o produto foi adicionado ao carrinho corretamente$/) do
	#page.find('span[class=cart-icon]').click
 	find("span", text: "Comprar").click
	sleep 2
	expect(page).to have_content(@item)
end

Then(/^avance e realize o login com sucesso$/) do
	#sleep 2
	click_button "btn-finalize-cart"
	sleep 2
	@loginSenha = LoginSenha.new
	@loginSenha.with(ENV['USUARIO'], ENV['SENHA'])
	sleep 2
	expect(page).to have_content('Escolha um endereço para entrega')
	sleep 4
	puts "Teste finalizado!"
end