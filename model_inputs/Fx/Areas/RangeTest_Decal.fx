{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "advancedDecal",
					"name": "Test",
					"z": -1.38845,
					"scaleX": 30,
					"scaleY": 30,
					"scaleZ": 30,
					"rotationZ": 90,
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
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 1,
								"vOffset": 1,
								"texture": "Fx/Alphas/T-InnerGradient.png"
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.25,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.15333333333333335
											}
										},
										{
											"time": 2,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6666666666666666
											}
										},
										{
											"time": 4,
											"value": 0.25,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33499999999999996
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666674
											}
										}
									]
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		}
	]
}