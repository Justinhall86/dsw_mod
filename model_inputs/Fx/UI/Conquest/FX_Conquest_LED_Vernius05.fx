{
	"cullingRadius": 0.5,
	"type": "fx",
	"children": [
		{
			"name": "VFX",
			"type": "object",
			"children": [
				{
					"name": "polygon",
					"kind": 0,
					"args": [
						0
					],
					"type": "polygon",
					"children": [
						{
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.4,
								"saturation": 1,
								"width": 0.95,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Water_03.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0.05
								]
							},
							"type": "shader"
						},
						{
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
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"color": [
								0.49019607843137253,
								0.3529411764705882,
								1,
								1
							],
							"type": "material"
						},
						{
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
								"texture": "Fx/UI/Conquest/T_ConquestMapLED_Vernius_02.png"
							},
							"type": "shader",
							"children": [
								{
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.04999999999999982,
											"value": 0,
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
											"prevHandle": {
												"dv": 0,
												"dt": -0.12752924039863028
											},
											"nextHandle": {
												"dv": -2.294019098797892e-16,
												"dt": 0.16666666666666666
											}
										}
									],
									"type": "curve"
								}
							]
						},
						{
							"name": "scale",
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.18710387114153518,
									"value": 0.9946844835153889,
									"mode": 2
								},
								{
									"time": 0.2990856679757939,
									"value": 1.0005742179488784,
									"mode": 2
								}
							],
							"loop": true,
							"type": "curve"
						}
					]
				}
			]
		}
	]
}