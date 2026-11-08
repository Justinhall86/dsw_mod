{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"z": 8.63301,
					"scaleX": 200,
					"scaleY": 200.76,
					"scaleZ": 50,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 1.5,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"onDecal": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 5,
								"vScale": 5,
								"uOffset": 0,
								"vOffset": 1,
								"texture": "Fx/noise/Wave_01.jpg"
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "vOffset",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 10,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									1,
									1
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}