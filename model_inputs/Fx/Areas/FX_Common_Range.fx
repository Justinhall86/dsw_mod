{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"scaleX": 2400.0000000000005,
					"scaleY": 2400,
					"scaleZ": 0.6,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "advancedDecal",
					"name": "outsidecircle",
					"scaleX": 71,
					"scaleY": 71,
					"scaleZ": 88.75,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 3,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 0.5,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/T_UI_Range.png"
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}