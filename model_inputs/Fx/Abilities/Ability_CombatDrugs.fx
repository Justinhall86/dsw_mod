{
	"type": "fx",
	"cullingRadius": 125,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Poison",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "FloorVapors",
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 25,
							"rotationZ": 87.51929319675823,
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
										"alpha": 0.4,
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
										"uvScaleX": 0.5,
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
										"uvScaleX": 0.75,
										"uvScaleY": 1,
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "DotsFloor",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.01,
										"rotation": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
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
										"uvScaleX": 10,
										"uvScaleY": 10,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.5,
										"color": [
											0.6196078431372549,
											0.807843137254902,
											0.11372549019607843
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorVapors_details",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 20,
							"rotationZ": 88.35197518248175,
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
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.75,
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
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.0175,
										"rotation": 0
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
										"progress": 0.17,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 0.75,
										"uvScaleY": 0.75,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.25,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 1.5,
										"texture": "Fx/noise/causticTexture_04.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
											0.025
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
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
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
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.75,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 3,
								"emitRate": 2,
								"maxCount": 5,
								"instScale": 8,
								"instScale_rand": 4,
								"useRandomColor": true,
								"randomColor1": [
									0.6,
									0.6,
									0.6,
									1
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1
							},
							"z": 1,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"emissive": 0.75
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
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
												"texture": "Fx/Alphas/T_SphereInvert01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.37324346623743554
															},
															"nextHandle": {
																"dv": 0.029728712364460327,
																"dt": 0.33330480980464305
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 0.88,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
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
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Gradients/circGrad01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													null
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02423737262951664,
																"dt": -0.29927840945800255
															},
															"nextHandle": {
																"dv": 0.02423737262951664,
																"dt": 0.29927840945800255
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
													0.6196078431372549,
													0.807843137254902,
													0.11372549019607843
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.4086259259711857,
												"dt": -0.4901377207616426
											},
											"nextHandle": {
												"dv": 0.8333333333333334,
												"dt": 0.28996207801094903
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
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
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.1,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.64
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
											"time": 1.435,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.614725913694349,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
											}
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
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true,
							"children": [
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
								}
							]
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
					"type": "object",
					"name": "CombatDrug_backup",
					"enabled": false,
					"y": 156.28378,
					"z": 4.07739,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"y": 1.16636,
							"z": 6.709616666666667,
							"scaleX": 100,
							"scaleY": 100,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/TS_Dust_02.png",
							"fadePower": 1.5,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 4,
										"vScale": 4,
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
									"name": "WorldUV",
									"source": "shaders/WorldUV.hx",
									"enabled": false,
									"props": {
										"useNormalMap": false,
										"onDecal": true,
										"scale": 0.02,
										"rotation": 0
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
										"progress": 0.36,
										"saturation": 0,
										"width": 0.33,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.005
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
										"progress": 0.27,
										"saturation": 0,
										"width": 0.45,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.003
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7019607843137254,
											0.058823529411764705,
											0.058823529411764705
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.3686274509803922,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"y": -0.58318,
							"z": -2.632223333333333,
							"scaleX": 80,
							"scaleY": 80,
							"kind": 0,
							"args": [
								10
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
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Alphas/TS_Dust_02.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 3,
										"vScale": 3,
										"uOffset": 0,
										"vOffset": 0.2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0,
										"width": 0.59,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.03,
											0
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
										"progress": 0.28,
										"saturation": 0,
										"width": 0.64,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.005,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7529411764705882,
											0.12941176470588234,
											0.12941176470588234
										]
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 2,
										"texScaleY": 2,
										"tex": "Fx/Alphas/T_Flag_red.png",
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											0.1
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 1
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
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
											"time": 1.6350551758719674,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.4503302867800105,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
											}
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
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "object",
					"name": "CombatDrug",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "object",
							"name": "Floor",
							"children": [
								{
									"type": "model",
									"name": "Spiral",
									"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
									"z": 1,
									"scaleX": 300,
									"scaleY": 300,
									"scaleZ": 92.5,
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
													"depthTest": "LessEqual",
													"enableStencil": false,
													"textureWrap": true
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"normalMap": "Fx/DistortionMaps/water-normal.png"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8156862745098039,
													0.13333333333333333,
													0
												]
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.5,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "FloorVapors_details_add",
									"scaleX": 200,
									"scaleY": 200,
									"scaleZ": 60,
									"rotationZ": 90,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.75,
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
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"props": {
												"useNormalMap": false,
												"onDecal": true,
												"scale": 0.015,
												"rotation": 0
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
												"progress": 0.2,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/causticTexture_04.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.03,
													0.025
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
												"progress": 0.17,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.75,
												"uvScaleY": 0.75,
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
													0.6509803921568628,
													0.07058823529411765,
													0.07058823529411765
												],
												"pointA": 0,
												"colorB": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
												],
												"pointB": 0.38
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
									"emissive": 1.5,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
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
												"alpha": 2,
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
											"props": {
												"amount": 1,
												"color": [
													0.9254901960784314,
													0.18823529411764706,
													0.09803921568627451
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
									"type": "emitter",
									"name": "emitter_Bubbles",
									"props": {
										"lifeTime": 3,
										"emitRate": 10,
										"maxCount": 25,
										"instScale": 8,
										"instScale_rand": 4,
										"useRandomColor": true,
										"randomColor1": [
											0.6,
											0.6,
											0.6,
											1
										],
										"instRotation_rand": [
											0,
											0,
											360
										],
										"lifeTimeRand": 1
									},
									"z": 5,
									"scaleX": 120,
									"scaleY": 120,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"mode": "AfterTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "Back",
															"colorMask": 255,
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_SphereInvert01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.37324346623743554
																	},
																	"nextHandle": {
																		"dv": 0.029728712364460327,
																		"dt": 0.33330480980464305
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.39,
														"saturation": 1,
														"width": 0.88,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/circGrad01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															null
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02423737262951664,
																		"dt": -0.29927840945800255
																	},
																	"nextHandle": {
																		"dv": 0.02423737262951664,
																		"dt": 0.29927840945800255
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
														"amount": 0.75,
														"color": [
															0.9254901960784314,
															0.18823529411764706,
															0.09803921568627451
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.4086259259711857,
														"dt": -0.4901377207616426
													},
													"nextHandle": {
														"dv": 0.8333333333333334,
														"dt": 0.28996207801094903
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
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
										"amount": 0.7,
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
								"alpha": 0.64
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
											"time": 1.435,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.614725913694349,
											"value": 1,
											"mode": 0
										},
										{
											"time": 6,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.46930516719818005
											},
											"nextHandle": {
												"dv": -2.398428290550722e-16,
												"dt": 0.33499999999999996
											}
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
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.75,
								"envColorSet": false
							},
							"isInstance": true,
							"children": [
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
								}
							]
						}
					]
				}
			]
		},
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
			"type": "object",
			"name": "Units",
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				}
			]
		}
	]
}