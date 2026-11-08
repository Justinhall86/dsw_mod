{
	"type": "fx",
	"cullingRadius": 200,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "NukeSilo",
					"source": "Structure/Buildings/NukeSilo/NukeSilo.fbx",
					"editorOnly": true,
					"scaleX": 10,
					"scaleY": 10,
					"scaleZ": 10,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Structure/Buildings/NukeSilo/Anim_NukeSilo_Opening.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "TopLights",
					"y": 0.34108,
					"rotationX": -90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"y": 0.62888,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 5,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.15,
										"maxAlpha": 1,
										"frequency": 0.35
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": 0.54498,
							"y": -0.31363,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": -120,
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 5,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.15,
										"maxAlpha": 1,
										"frequency": 0.35
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": -0.54771,
							"y": -0.3162,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": 120,
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 5,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8627450980392157,
											0.30980392156862746,
											0.00784313725490196
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.15,
										"maxAlpha": 1,
										"frequency": 0.35
									},
									"children": [
										{
											"type": "curve",
											"name": "frequency",
											"enabled": false,
											"keys": [
												{
													"time": 2.99,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 3,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02110576683273151,
												"dt": -0.49995994713014763
											},
											"nextHandle": {
												"dv": -0.02110576683273151,
												"dt": 0.49995994713014763
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.7334825383614402,
												"dt": -0.27881377551020414
											},
											"nextHandle": {
												"dv": 0.6846954662938333,
												"dt": 0.2626023887741453
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.TopLights",
					"target": "FXAnimation.FXRoot.NukeSilo.root.B_ROOT.B_HighPillars"
				}
			]
		},
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": -0.5,
			"scaleX": 1000,
			"scaleY": 1000,
			"scaleZ": 1000,
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