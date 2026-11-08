{
	"type": "fx",
	"cullingRadius": 0.5,
	"children": [
		{
			"type": "object",
			"name": "VFX",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"scaleX": 0.12,
					"scaleY": 0.12,
					"rotationZ": 45,
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
									"mode": "BeforeTonemapping",
									"blend": "Add",
									"shadows": false,
									"culling": "Back",
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"emissive": 8
								}
							},
							"color": [
								0.5568627450980392,
								0.22352941176470587,
								0.28627450980392155,
								1
							]
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/UI/Conquest/T_ConquestMapLED_Ecaz_512_01.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.04999999999999982,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07117911092016573
											}
										},
										{
											"time": 0.26353733276049707,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.12752924039863028
											},
											"nextHandle": {
												"dv": -2.294019098797892e-16,
												"dt": 0.16666666666666666
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.05327345350407693,
									"value": 0.9716524216524216,
									"mode": 2
								},
								{
									"time": 0.20010632904758782,
									"value": 0.9944444444444439,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}