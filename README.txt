#Para executar o cenário de front end, basta executar o comando abaixo no terminal:

 cucumber USUARIO=seuusuario@email.com SENHA=suasenha --tag @walmart_front

substituir o termo seuusuario@email.com pelo seu e-mail de cadastro no site do Walmart.
substituir o termo suasenha pela senha de login.



#Para executar todos os cenários de backend, basta executar o comando abaixo no terminal:
cucumber --tag @api

#Para executar um cenário de backend por vez, basta executar o comando abaixo no terminal:
cucumber --tag @consulta_posts

cucumber --tag @consulta_id_existente

cucumber --tag @consulta_id_inexistente

cucumber --tag @deletar_post

cucumber --tag @deletar_post_inexistente

cucumber --tag @alterar_post

cucumber --tag @criar_post
