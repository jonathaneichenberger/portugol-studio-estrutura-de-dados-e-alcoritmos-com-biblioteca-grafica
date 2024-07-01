programa
{
	inclua biblioteca Sons --> s
	inclua biblioteca Tipos --> tp
	inclua biblioteca Calendario --> c
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> txt
	inclua biblioteca Teclado --> t

	const inteiro maximo_linhas = 30
	const inteiro maximo_colunas = 10
	
	//Definiçoes de tela e proporção
	inteiro largura_tela = 1500
	inteiro altura_tela = 1000

	//Variaveis das imagens carregadas
	inteiro sweet_flight = 0
	inteiro aviao = 0
	inteiro fundo_menu = 0
	inteiro icone_aviao = 0
	inteiro icone_aviao_grande = 0
	inteiro fundo_logo = 0
	inteiro poltronas_aviao = 0
	inteiro fundo_logo_poltronas = 0


	inteiro som_aviao = 0

	//Outras variaveis
	inteiro opcao = 1
	cadeia hora
	cadeia minuto
	cadeia segundo
	cadeia hora_atual
	cadeia aviao_numero[4]
	inteiro assentos_disponiveis[4]
	inteiro transparencia = 0
	logico sair = falso
	inteiro largura_poltrona = 25
	inteiro altura_poltrona = 20
	inteiro linhas = 0
	inteiro colunas = 0
	inteiro temp_linhas = 0
	inteiro temp_colunas = 0
	inteiro aux = 0
	inteiro poltronas_disponiveis[maximo_linhas][maximo_colunas]
	
	funcao inicio()
	{	
		carregar_sons()

		inicializar_matriz_poltronas()
		
		se(opcao == -1)
		{
			s.definir_volume(50)
			s.definir_posicao_atual_musica(som_aviao, 3000)
		}
		
		inicializar()
		
		faca
		{
			escolha(opcao)
			{
				caso -1:
				{
					tela_inicial()
					g.renderizar()
					pare
				}
				caso 0:
				{
					menu()
					g.renderizar()
					pare
				}
				caso 1:
				{
					cadastrar_poltronas()
					g.renderizar()	
					pare
				}
				caso 2:
				{

					pare
				}
				caso 3:
				{

					pare
				}
				caso 4:
				{

					pare
				}
				caso 5:
				{
					tela_final()
					g.renderizar()
					pare
				}
			}
			
		}enquanto(sair ==  falso)
	}

	funcao tela_inicial()
	{
	
		se(transparencia < 255)
		{
			
			g.definir_opacidade(255 - transparencia)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_elipse(500, 250, 500, 500, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(525, 275, 450, 450, verdadeiro)
			g.desenhar_retangulo(0, 400, 1200, 200, verdadeiro, verdadeiro)
			g.desenhar_imagem(650, 400, icone_aviao_grande)
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(100.0)
			g.desenhar_texto(190, 450, " SWEET")
			g.desenhar_texto(920, 450, "FLIGHT")
			
			g.definir_opacidade(0 + transparencia)
			g.desenhar_imagem(0, 0, fundo_menu)
			u.aguarde(15)
			transparencia++
		}
		se(transparencia == 255)
		{
			
			transparencia = 0
			opcao = 0
		}
	}
	
	funcao menu()
	{
		inteiro temp_click

		g.definir_opacidade(255)
		g.desenhar_imagem(0, 0, fundo_menu)

		se(transparencia < 256)
		{
			
			g.definir_opacidade(transparencia)
			g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x18548E , 0xFAF5F8)
			g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)
	
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, falso)
	
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 77, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
				
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 217, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 357, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 497, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 637, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)
			}
	
			//Desenhar logo
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
			
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_imagem(120, 25, fundo_logo)
			g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, fundo_menu)
			g.desenhar_imagem(180, 85, icone_aviao)
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(0, 105, " SWEET")
			g.desenhar_texto(286, 105, "FLIGHT")
	
			//definindo plano de fundo e opacidade para os elemntos anteriores sobreporem a imagem
			se(transparencia <= 80)
			{
				g.definir_opacidade(transparencia)
				g.desenhar_imagem(0, 0, fundo_menu)
			}
			senao
			{
				g.definir_opacidade(80)
				g.desenhar_imagem(0, 0, fundo_menu)
			}
			
			horario()
			
			g.definir_fonte_texto("arial")
			
			g.definir_opacidade(transparencia)
		
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.largura_texto("CADASTRAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("CADASTRAR POLTRONAS")) / 2), 120, "CADASTRAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("REALIZAR RESERVAS")) / 2), 260, "REALIZAR RESERVAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("VISUALIZAR POLTRONAS")) / 2), 400, "VISUALIZAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("CONSULTAR PASSAGEIRO")) / 2), 540, "CONSULTAR PASSAGEIRO")
			g.desenhar_texto(500 + ((650 - g.largura_texto("SAIR DO PROGRAMA")) / 2), 680, "SAIR DO PROGRAMA")
			//+ ((650 - g.largura_texto("SAIR DO PROGRAMA")) / 2)
			se(transparencia < 255)
			{
				transparencia++
			}
		}
		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
			{
				opcao = 1
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
			{
				opcao = 2
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
			{
				opcao = 3
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
			{
				opcao = 4
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
			{
				transparencia = 0
				opcao = 5
				
			}

		}
			
	}

	funcao cadastrar_poltronas()
	{
		inteiro temp_click = 0
		inteiro temp_tecla = 0
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)
		
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)

		g.desenhar_retangulo(1020, 15, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1020, 105, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1020, 195, 450, 80, verdadeiro, verdadeiro)
		
		g.definir_opacidade(255)
		
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(1045, 35, "Cadastrar Poltronas")

		
		g.desenhar_retangulo(1020, 15, 450, 80, verdadeiro, falso)
		g.desenhar_retangulo(1020, 105, 450, 80, verdadeiro, falso)
		g.desenhar_retangulo(1020, 195, 450, 80, verdadeiro, falso)
		
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x3D3316 , 0x9C916F)
		g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)

		g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, falso)
		
		g.desenhar_retangulo(1060, 115, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1035, 140, 60, 10, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1060, 205, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1035, 230, 60, 10, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1135, 140, 60, 10, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1135, 230, 60, 10, verdadeiro, verdadeiro)
		
		g.desenhar_retangulo(1110, 115, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1110, 205, 10, 60, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, falso)
		g.desenhar_texto(1115, 300, "CONFIRMAR")

		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(1020, 400, 450, 580, verdadeiro, verdadeiro)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(1020, 400, 450, 580, verdadeiro, falso)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, falso)

		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x00ED00)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFF1E00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		
			
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)
		
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "RESERVADA")
		g.desenhar_texto(100 , 610, "INDISPONÍVEL")
		
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")
		

		g.definir_cor(g.COR_VERMELHO)
		se(m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
		{
			g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, falso)	
		}
		se(m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
		{
			g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
		{
			g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
		{
			g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e m.posicao_y() >= 280 e m.posicao_y() <= 360)
		{
			se(temp_linhas < linhas ou temp_colunas < colunas ou temp_linhas == 0 ou temp_colunas == 0 ou (temp_linhas == linhas e temp_colunas == colunas))
			{
				
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)
				
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(30.0)
				
				g.desenhar_texto(1020 + ((450 - g.largura_texto("ADICIONE POLTRONAS"))/ 2), 286, "ADICIONE POLTRONAS")
				g.desenhar_texto(1020 + ((450 - g.largura_texto("PARA CONFIRMAR"))/ 2), 324, "PARA CONFIRMAR")
				g.largura_texto("ADICIONE POLTRONAS PARA CONFIRMAR")
			}
			senao
			{
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(40.0)
				g.definir_cor(0x1D8C00)
				g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1115, 300, "CONFIRMAR")
			}
				
		}

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
			{	
				se(temp_linhas < 30 e temp_linhas >= linhas)
				{
					temp_linhas++
				}	
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
			{
				se(temp_linhas > 0 e temp_linhas > linhas)
				{
					temp_linhas--
				}
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
			{
				se(temp_colunas < 10 e temp_colunas >= colunas)
				{
					temp_colunas++
				}	
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
			{
				se(temp_colunas > 0 e temp_colunas > colunas)
				{
					temp_colunas--
				}	
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e m.posicao_y() >= 280 e m.posicao_y() <= 360)
			{
				se(temp_linhas >= linhas e temp_colunas >= colunas e temp_linhas > 0 e temp_colunas > 0)
				{
					linhas = temp_linhas
					colunas = temp_colunas
				}
			}
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(1080, 410, "Poltronas Disponíveis")
		g.desenhar_texto(1040, 450, "A -")
		g.desenhar_texto(1040, 490, "B -")
		g.desenhar_texto(1040, 530, "C -")
		g.desenhar_texto(1040, 570, "D -")
		g.desenhar_texto(1040, 610, "E -")
		g.desenhar_texto(1040, 650, "F -")
		g.desenhar_texto(1040, 690, "G -")
		g.desenhar_texto(1040, 730, "H -")
		g.desenhar_texto(1040, 770, "I -")
		g.desenhar_texto(1040, 810, "J -")
		g.desenhar_texto(1040, 880, "TOTAL = " + tp.inteiro_para_cadeia(linhas * colunas, 10) + " Poltronas")
		
		g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
		
		se(colunas >= 0 e linhas >= 0)
		{
			
			se(colunas >= 1)
			{	g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 447, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 450, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{	
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 447, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 450, "Poltronas indisponíves")	
			}
			
			se(colunas >= 2)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 487, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 490, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 487, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
	
				g.desenhar_texto(1090, 490, "Poltronas indisponíves")	
			}
			
			se(colunas >= 3)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 527, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 530, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 527, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 530, "Poltronas indisponíves")	
			}
			
			se(colunas >= 4)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 567, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 570, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 567, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 570, "Poltronas indisponíves")	
			}
			
			se(colunas >= 5)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 607, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 610, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 607, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 610, "Poltronas indisponíves")	
			}
			
			se(colunas >= 6)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 647, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 650, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")		
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 647, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 650, "Poltronas indisponíves")	
			}
			
			se(colunas >= 7)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 687, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 690, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 687, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 690, "Poltronas indisponíves")	
			}
			
			se(colunas >= 8)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 727, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 730, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 727, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 730, "Poltronas indisponíves")	
			}
			
			se(colunas >= 9)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 767, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 770, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 767, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 770, "Poltronas indisponíves")	
			}
			
			se(colunas == 10)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 807, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 810, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 807, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 810, "Poltronas indisponíves")	
			}
				
		}

		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(1210, 125, tp.inteiro_para_cadeia(temp_linhas, 10) + " LINHAS")
		g.desenhar_texto(1210, 215, tp.inteiro_para_cadeia(temp_colunas, 10) + " COLUNAS")
	
		
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
			para(inteiro n = 0; n < maximo_colunas; n++)
			{
				
				se(i >= linhas ou n >= colunas)
				{
					g.definir_cor(0xFF1E00)
					se(n < 3)
					{
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)	
						
					}
					se(n < 7 e n >= 3)
					{
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
						
					}
					se(n >= 7)
					{
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
						
					}
					
					se(poltronas_disponiveis[i][n] == 0)
					{
						g.definir_cor(0x00ED00)
						se(n < 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)	
							
						}
						se(n < 7 e n >= 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
						se(n >= 7)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
					}
				}
			}
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(14.0)
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
			se( i < 9)
			{
				g.desenhar_texto(((g.largura_janela()-500)/ 2) + 5, 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.inteiro_para_cadeia(i, 10))) / 2), "0"+ tp.inteiro_para_cadeia(i+1, 10))
			}
			senao
			{
				g.desenhar_texto(((g.largura_janela()-500)/ 2) + 5, 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.inteiro_para_cadeia(i, 10))) / 2), tp.inteiro_para_cadeia(i+1, 10))
			}
			
			para(inteiro n = 0; n < maximo_colunas; n++)
			{
				
				se(n < 3)
				{
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)	
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
				}
				se(n < 7 e n >= 3)
				{
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
				}
				se(n >= 7)
				{
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
				}
			}
		}
		
		g.definir_opacidade(50)
		g.desenhar_imagem(0, 0, poltronas_aviao)
		g.definir_opacidade(255)

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
				opcao = 0
			}
		}
	}

	funcao tela_final()
	{
	
		se(transparencia <= 255)
		{

			g.definir_opacidade(0 + transparencia)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_elipse(500, 250, 500, 500, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(525, 275, 450, 450, verdadeiro)
			g.desenhar_retangulo(0, 400, 1200, 200, verdadeiro, verdadeiro)
			g.desenhar_imagem(650, 400, icone_aviao_grande)
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(100.0)
			g.desenhar_texto(190, 450, " SWEET")
			g.desenhar_texto(920, 450, "FLIGHT")

			
			g.definir_tamanho_texto(25.0)
			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.desenhar_texto(750 - (g.largura_texto("AGRADECEMOS A PREFERENCIA") / 2), 930, "AGRADECEMOS A PREFERENCIA")
			g.desenhar_texto(750 - (g.largura_texto("VOLTE SEMPRE") / 2), 960, "VOLTE SEMPRE")
			
			g.definir_opacidade(255 - transparencia)
			g.desenhar_imagem(0, 0, fundo_menu)
			u.aguarde(5)
			transparencia++
			
		}
		se(transparencia == 255)
		{
			u.aguarde(5000)
			sair = verdadeiro
		}

	}

	funcao horario()
	{
		
		se(c.hora_atual(falso) < 10)
		{
			hora = "0" + tp.inteiro_para_cadeia(c.hora_atual(falso), 10)
		}
		senao
		{
			hora = tp.inteiro_para_cadeia(c.hora_atual(falso), 10)	
		}
		se(c.minuto_atual() < 10)
		{
			minuto = "0" + tp.inteiro_para_cadeia(c.minuto_atual(), 10)
		}
		senao
		{
			minuto = tp.inteiro_para_cadeia(c.minuto_atual(), 10)
		}
		se(c.segundo_atual() < 10)
		{
			segundo =  "0" + tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		senao
		{
			segundo = tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		
		hora_atual = hora + ":" + minuto + ":" + segundo

		g.definir_cor(g.COR_PRETO)
		g.definir_opacidade(255)
		g.definir_fonte_texto("alarm clock")
		g.definir_estilo_texto(falso, falso, falso)
		g.definir_tamanho_texto(30.0)
		
		g.desenhar_texto(1190 - g.largura_texto(hora_atual), 10 , hora_atual)

	}

	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_tela, altura_tela)
		g.definir_titulo_janela("COMPANHIA AÉREA SWEET FLIGHT -- RESERVAS DE PASSAGENS")
		
		carregar_imagens()
		carregar_fontes()
		
	}

	funcao carregar_imagens()
	{
		//A variavel temp_img vai receber temporariamente o valor do espaço de memória para carregar as imagens
		inteiro temp_img = 0

		temp_img = g.carregar_imagem("./imagens/fundo_menu.jpg")
		fundo_menu = g.redimensionar_imagem(temp_img, 1500, 1000, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao.png")
		icone_aviao = g.redimensionar_imagem(temp_img, 80, 80, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao_grande.png")
		icone_aviao_grande = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/fundo_logo.png")
		fundo_logo = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/poltronas_aviao.jpg")
		poltronas_aviao = g.redimensionar_imagem(temp_img, 1500, 1000, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/fundo_logo_poltronas.png")
		fundo_logo_poltronas = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)
	}

	funcao carregar_fontes()
	{
		g.carregar_fonte("./fontes/alarm_clock.ttf")
	}

	funcao carregar_sons()
	{
		
		som_aviao = s.carregar_som("./sons/som_aviao.mp3")
		
	}

	funcao inicializar_matriz_poltronas()
	{
		para(inteiro i = 0; i < maximo_linhas; i++)
			{
				para(inteiro n = 0; n < maximo_colunas; n++)
				{
					poltronas_disponiveis[i][n] = -1
				
				}
			}
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 18702; 
 * @DOBRAMENTO-CODIGO = [112, 144, 754];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */