{
	"type": "fx",
	"cullingRadius": 200,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"z": 0.44000000000000017,
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
					"type": "object",
					"name": "logo",
					"enabled": false,
					"x": -1.5407439555097887e-33,
					"y": 0.19439333333333336,
					"z": -0.19131166666666666,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "advancedDecal",
							"name": "logo",
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LogoToxicVapors.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
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
						},
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 50,
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Target1.png"
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
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2649999999999999
													},
													"nextHandle": {
														"dv": -2.735044518095755e-16,
														"dt": 0.335
													}
												},
												{
													"time": 1.9999999999999998,
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
										},
										{
											"type": "curve",
											"name": "alpha",
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
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.99,
											"mode": 0,
											"prevHandle": {
												"dv": -0.125,
												"dt": -1.085
											},
											"nextHandle": {
												"dv": 0.0191555190995555,
												"dt": 0.1662699057841416
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4,
											"value": 1,
											"mode": 0
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
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Poison",
					"z": 3.9876066666666667,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "object",
							"name": "PoisonFloor",
							"z": -3.9876066666666667,
							"children": [
								{
									"type": "advancedDecal",
									"name": "FloorVapors",
									"scaleX": 175,
									"scaleY": 175,
									"scaleZ": 52.5,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpiceAlpha.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.75,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.04
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.04,
													0.1
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 3,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.13333333333333333,
													0.34509803921568627,
													0.08627450980392157
												],
												"pointA": 0,
												"colorB": [
													0.24313725490196078,
													0.5058823529411764,
													0.18823529411764706
												],
												"pointB": 0.58
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 150,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors_details",
									"scaleX": 200,
									"scaleY": 200,
									"scaleZ": 60,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1.5,
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
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpiceAlpha.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.25,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 4,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.04,
													0.07
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.14,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3.5,
												"uvScaleY": 3,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.03,
													-0.025
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.21568627450980393,
													0.4627450980392157,
													0.16078431372549018
												],
												"pointA": 0,
												"colorB": [
													0.6196078431372549,
													0.807843137254902,
													0.11372549019607843
												],
												"pointB": 0.58
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 400,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "DotsFloor",
									"scaleX": 200.00000000000006,
									"scaleY": 200.00000000000006,
									"scaleZ": 60,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpiceAlpha.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.6941176470588235,
													0.8745098039215686,
													0.20784313725490194
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.64,
												"saturation": 0,
												"width": 0.15,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.025,
													null
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.26,
												"saturation": 0,
												"width": 0.52,
												"uvScaleX": 15,
												"uvScaleY": 15,
												"texture": "Fx/noise/FlareNoise.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.01,
													null
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							},
							"isInstance": true,
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
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 1,
											"value": 1,
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
	]
}