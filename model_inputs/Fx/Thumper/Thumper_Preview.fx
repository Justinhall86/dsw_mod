{
	"type": "fx",
	"cullingRadius": 6,
	"children": [
		{
			"type": "areaDisplay",
			"name": "circle",
			"borderTexture": "Fx/Areas/Zone_Thumper.png",
			"borderTiling": 2,
			"border": 15,
			"radius": 30,
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
		},
		{
			"type": "model",
			"name": "Thumper",
			"source": "Structure/Point_Of_Interest/Thumper/Thumper.fbx",
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2
		}
	]
}