class HomePage < SitePrism::Page
	set_url '/'
end

class BuscaPage < SitePrism::Page
	element :campo_busca, '#suggestion-search'
	element :botao_pesquisar, 'button', text: 'Procurar'
	
	def with (busca)
		self.campo_busca.set busca
		self.botao_pesquisar.click
	end	
end

class LoginSenha < SitePrism::Page
	element :campo_usuario, '#signinField'
	element :campo_senha, '#password'
	element :botao_entrar, '#signinButtonSend'
		
		def with (usuario,senha)
			within_frame('iframeLogin') do
				self.campo_usuario.set usuario
				self.campo_senha.set senha
				self.botao_entrar.click
			end	
		end	
end