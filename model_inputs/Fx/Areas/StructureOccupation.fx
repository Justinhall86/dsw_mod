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
					"bodyTexture": "Fx/Areas/vgrad_alpha.png",
					"borderTexture": "Fx/Areas/vgrad_alpha.png",
					"border": 0.68,
					"radius": 8,
					"baseColor": 1006632959,
					"iconRadius": 0.57,
					"renderMode": "AfterTonemapping"
				},
				{
					"type": "areaDisplay",
					"name": "full",
					"rotationZ": 45,
					"bodyTexture": "Fx/Areas/Zone_Occupation.png",
					"bodyTiling": 2,
					"borderTexture": "Fx/Areas/Zone_Occupation.png",
					"borderTiling": 14,
					"border": 5.08,
					"radius": 40,
					"borderColor": -1409286145,
					"bodyColor": 16777215,
					"iconRadius": 0.46,
					"renderMode": "AfterTonemapping"
				}
			]
		}
	]
}