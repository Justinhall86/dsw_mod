{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "areaDisplay",
					"name": "over",
					"borderTexture": "Fx/Areas/vgrad_alpha_dash.png",
					"borderTiling": 8,
					"border": 0.6,
					"radius": 3.5,
					"sideThickness": 1.69,
					"renderMode": "AfterTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.43
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "areaDisplay",
					"name": "full",
					"borderTexture": "Fx/Areas/vgrad_alpha.png",
					"border": 0.65,
					"radius": 3.5,
					"renderMode": "AfterTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.61
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}