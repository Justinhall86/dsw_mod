{
	"type": "fx",
	"markers": [
		{
			"t": 8.80576
		}
	],
	"cullingRadius": 500,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Pawn_Mainbase_Corrino",
					"source": "UI/ConquestMenu/Assets/Pawn_01.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
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
					"name": "ArrowH",
					"z": 0.015,
					"children": [
						{
							"type": "advancedDecal",
							"name": "ArrowsDuration",
							"z": -0.015,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.1575,
							"rotationZ": -29.999999999999993,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"normalFade": true,
							"normalFadeStart": 0.65,
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
										"texture": "Fx/Alphas/T_CirclePattern07.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.25,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.75,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49929461931578273,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8948814392089844,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 0.75,
											"value": 1.0448814392089845,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 1.5,
											"value": 0.8948814392089844,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorFlareDuration",
							"z": -0.015,
							"scaleX": 0.25366754859021834,
							"scaleY": 0.25366754859021834,
							"scaleZ": 0.05073350971804367,
							"rotationZ": -29.999999999999986,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.25,
							"emissive": 0.2,
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
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.25,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.75,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49929461931578273,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.947440719604492,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 0.75,
											"value": 1.097440719604492,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 1.5,
											"value": 0.947440719604492,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.08235294117647059,
									0.08235294117647059
								]
							}
						},
						{
							"type": "object",
							"name": "Icon",
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt-Swords",
									"z": 0.13,
									"scaleX": 0.010000000000000004,
									"scaleY": 0.010000000000000002,
									"scaleZ": 0.01,
									"rotationX": 4.9704929940842796e-17,
									"rotationY": 1.075899606759095,
									"rotationZ": 41.51716156899059,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 6,
											"scaleY": 5.14,
											"scaleZ": 6,
											"rotationX": -90,
											"rotationZ": -90,
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
															"alphaKill": true,
															"drawOrder": "120",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Alphas/T_LogoAttack.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "scale",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 2.25,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.75,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.49929461931578273,
																	"value": 1,
																	"mode": 2
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
															"value": 0.85,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.85,
															"mode": 2
														}
													]
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.24705882352941178,
															0.24705882352941178
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 2.25,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 2.75,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.49929461931578273,
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