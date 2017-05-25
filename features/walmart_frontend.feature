Feature: Walmart busca, login e senha

@walmart_front
Scenario: Acessar os site do Walmart, realizar uma buscar, adicionar no carrinho e realizar login
	Given que acesse o site do Walmart
	And preencha o campo busca com o termo "TV"
	And valide se a busca trouxe resultados
	And clique em um dos resultados e verique que a página do produto está carregada corretamente
	And clique no botão adicionar no carrinho
	When abra o carrinho e verifique que o produto foi adicionado ao carrinho corretamente
	Then avance e realize o login com sucesso