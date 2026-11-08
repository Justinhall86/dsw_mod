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
					"scaleX": 0.15,
					"scaleY": 0.3,
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
									"emissive": 1
								}
							},
							"color": [
								0.19215686274509802,
								0.615686274509804,
								0.2588235294117647,
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
								"texture": "Fx/Alphas/T_Flare04.png"
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
											"time": 0.3539220036334791,
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
									"time": 0.053273453504076945,
									"value": 0.9,
									"mode": 2
								},
								{
									"time": 0.20010632904758782,
									"value": 0.95,
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