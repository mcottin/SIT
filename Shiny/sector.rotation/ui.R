

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(


	headerPanel(""),


	# Sidebar with a slider input for number of observations
	sidebarPanel( 
		strong("ALGORITMO DE ROTACION  DE  SECTORES"),
		br(),br(),
		p("Simbolos de Yahoo"),br(),
		tags$label("separados por coma o una nueva linea:"),
		tags$textarea(id = "symbols", rows=10, cols=10, "XLY,XLP,XLE,XLF\nXLV,XLI,XLB,XLK\nXLU"),
		#createNonReactiveTextInputCustom("symbols", "Yahoo Ticker(s) separated by comma or new line:", "textarea", "Update", enableEnter=F, opts=list(rows=10, cols=10, "XLY,XLP,XLE,XLF\nXLV,XLI,XLB,XLK\nXLU")),


		br(),
		selectInput("momLen", strong("Período Momentum"), choices =  1:12,selected=6),
		numericInput("topn", "# Fondos a Invertir", 2),
		numericInput("keepn", "Mantener mientras ranking no baje de", 6),				
		br(),
		submitButton("Ejecutar"),
		htmlOutput("Status")
	),


 
	# Show a plot of the generated distribution
	mainPanel(
		tabsetPanel(
			tabPanel("Principal", 
				plotOutput("strategyPlot"),
				br(),
				tableOutput("sidebysideTable"),
				h4("Resultados Anuales"),
				tableOutput("annualTable"),
				h4("Mapa de Allocations"),
				plotOutput("transitionPlot"),
				h4("Ultimos 20 Trades"),
				tableOutput("tradesTable"),				
				downloadButton("downloadReport", "Descarga Reporte"),
				downloadButton("downloadData", "Descarga Data"),
				br(),
				br()	
			),			
        
			tabPanel("Descripción",
				p('Esta aplicación ejecuta un BackTest a una estrategia de allocation de ETF utilizando ',
				a("Shiny", href="http://www.rstudio.com/shiny/", target="_blank"), 				
				'. Basado en',
				a('Multi-Asset Backtest : Rotational Trading Strategies', href="http://systematicinvestor.wordpress.com/2011/12/06/multi-asset-backtest-rotational-trading-strategies/", target="_blank"),
				p('La estrategia de rotacion de sectores selecciona los mejores N fondos (ej 2 fondos) basado en Momentum (ej. mejor retorno de últimos 6 meses)
				y ajusta la permanencia solo si estos fondos caen en su ranking de momentum bajo un cierto nivel.
				Se basa también en',		
				a('ETF Sector Strategy', href="http://www.etfscreen.com/sectorstrategy.php", target="_blank"),
				'publicado por', a('ETF Screen', href="http://www.etfscreen.com", target="_blank")),				


				br(),


				strong('Autor'), p('Mauricio Cottin, ', a('Systemix Capital', href="http://systemixcapital.cl", target="_blank")),


				br(),


				strong('Code'), p('Codigo original para esta estrategia en',
				a('GitHub', href='https://github.com/mcottin/SIT/Shiny/sector.rotation')),


				br()


			
			)    
		)
	)
))
