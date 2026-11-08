{
	"type": "fx",
	"duration": 20,
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Siren",
					"source": "Vehicle/Vernius/Spirit/Spirit.fbx",
					"enabled": false,
					"editorOnly": true,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Siren/Anim_Siren_Death.fbx"
						},
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
					"type": "model",
					"name": "Spirit",
					"source": "Vehicle/Vernius/Spirit/Spirit.fbx",
					"editorOnly": true,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Spirit/Anim_Spirit_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"y": -0.54026,
					"children": [
						{
							"type": "object",
							"name": "Explosions",
							"y": 0.49192,
							"children": [
								{
									"type": "object",
									"name": "DamageDecal",
									"x": -0.2773145454545455,
									"y": 0.5745998701298701,
									"z": -1.2103419480519482,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Decal_Large",
											"x": 0.07358,
											"y": -0.61709,
											"z": 0.92967,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 1.78,
											"rotationX": 89.4,
											"rotationY": -5.6,
											"rotationZ": 4.3,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.1,
											"children": [
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.67,
														"saturation": 1,
														"width": 0.24,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1.5
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
																	"prevHandle": {
																		"dv": -0.02356852808625938,
																		"dt": -0.4998915283640561
																	},
																	"nextHandle": {
																		"dv": 0.01611111111111113,
																		"dt": 0.33834989965171247
																	}
																},
																{
																	"time": 0.32411161840171243,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 6.003642425539476,
																	"value": 1
																},
																{
																	"time": 10.03032049712031,
																	"value": 0
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
									"type": "object",
									"name": "Big Explosion",
									"y": 0.39456,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"children": [
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
											"x": -0.07039,
											"y": -0.2799,
											"z": 0.39952,
											"scaleX": 0.35,
											"scaleY": 0.35,
											"scaleZ": 0.53,
											"rotationX": -90,
											"time": -0.1
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
											"x": 0.07607,
											"y": 1.02088,
											"z": 0.29158,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -100.9,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare_Photosensitive.fx",
											"y": 0.17964,
											"z": 0.51823,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.45,
											"rotationX": 92.6,
											"time": -0.1
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
											"x": 0.37255,
											"y": -0.27925,
											"z": 0.474,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": 86.8,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
											"x": 0.60204,
											"y": 0.61882,
											"z": 0.08865,
											"scaleX": 0.35,
											"scaleY": 0.35,
											"scaleZ": 0.35,
											"rotationX": 78.29999999999998,
											"rotationY": 54.4,
											"rotationZ": 136.6,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
											"x": -0.21642,
											"y": -0.89441,
											"z": 0.25638,
											"scaleX": 0.25,
											"scaleY": 0.25,
											"scaleZ": 0.25,
											"rotationX": 58.9,
											"rotationY": 125.6,
											"rotationZ": -43.4,
											"time": -0.3
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
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 0.10889,
									"y": 0.46668,
									"z": 0.42063,
									"scaleX": 4,
									"scaleY": 5,
									"scaleZ": 4,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
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
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": -0.007230771073849063,
															"value": -0.01666666666666672
														},
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.20727973041634784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2007478104150633,
															"value": 0
														},
														{
															"time": 1.2007478104150633,
															"value": 0
														},
														{
															"time": 1.2007478104150633,
															"value": 0
														},
														{
															"time": 1.2007478104150633,
															"value": 0,
															"prevHandle": {
																"dv": 0.0002777777777778212,
																"dt": -0.7221957109435162
															},
															"nextHandle": {
																"dv": -1.0984786721922104e-16,
																"dt": 0.3333259125897096
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.05791860997849552,
													"value": 0,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": -0.04791860997849551,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4635918376377077,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.480466837637708,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Smoke",
							"x": 0.35364,
							"y": 0.90579,
							"z": 0.72987,
							"children": [
								{
									"type": "emitter",
									"name": "SmokeFallOK",
									"enabled": false,
									"props": {
										"instScale_rand": 0.25,
										"maxCount": 70,
										"simulationSpace": "World",
										"animationSpeed": 0.3,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitRate": 9,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 7.5,
										"burstDelay": 0.05,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.5,
										"alignMode": "Screen",
										"emitAngle": 38.18,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instWorldAcceleration_rand": [
											0,
											0.05,
											0
										],
										"lifeTime": 4,
										"instSpeed": [
											3,
											0,
											0
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"speedFactor": 0.5,
										"instWorldAcceleration": [
											0,
											0.25,
											0
										],
										"enableSort": false,
										"instAcceleration": [
											0.5,
											2,
											0
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.45000000000000007,
									"scaleY": 0.4500000000000001,
									"scaleZ": 0.45,
									"rotationX": 1.500917073668498e-15,
									"rotationY": 28,
									"rotationZ": 89.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
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
															"keys": [
																{
																	"time": -0.0050000000000000044,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.039999999999999994,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.04202981287230849,
																		"dt": -0.031069275200495742
																	},
																	"nextHandle": {
																		"dv": -0.5418521236867002,
																		"dt": 0.40077167056589863
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0009190571474060327,
																		"dt": -0.5970087583397498
																	},
																	"nextHandle": {
																		"dv": -1.0948850713570362e-16,
																		"dt": 0.32012019140680864
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
															0.13725490196078433,
															0.13725490196078433,
															0.13725490196078433
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
														"range": 1,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.73,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.02,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"prevHandle": {
																		"dv": 0.4440584429210647,
																		"dt": -0.6148501517368579
																	},
																	"nextHandle": {
																		"dv": -0.21666666666666667,
																		"dt": 0.3
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"prevHandle": {
																		"dv": -0.009090909090909038,
																		"dt": -0.4642857142857143
																	},
																	"nextHandle": {
																		"dv": 0.008539703073546545,
																		"dt": 0.4361348355418391
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.0520769766684747,
																		"dt": -0.49993897601734766
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6399999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.75,
													"topSpan": 0.8,
													"dirBrighten": true,
													"dirIntensity": 0.8,
													"dirSpan": 0.9,
													"sandBlend": 0.1,
													"envBlend": 0.7
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
													"value": 0.5,
													"prevHandle": {
														"dv": -0.13566781048475682,
														"dt": -0.49860462436246267
													},
													"nextHandle": {
														"dv": 0.05893771097223177,
														"dt": 0.21616417194039292
													}
												},
												{
													"time": 1,
													"value": 0.9,
													"prevHandle": {
														"dv": -0.10219946215442799,
														"dt": -0.79
													},
													"nextHandle": {
														"dv": 0.0338972586912773,
														"dt": 0.267255905650836
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5289260046790784,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6800477203016723,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.88,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.7253062533579464,
													"value": 1,
													"prevHandle": {
														"dv": 0.5550639348517388,
														"dt": -0.39039776535836745
													},
													"nextHandle": {
														"dv": -0.47825183908593966,
														"dt": 0.3326326748097289
													}
												},
												{
													"time": 3.966945035093088,
													"value": 0,
													"prevHandle": {
														"dv": 0.6858828506482362,
														"dt": -1.2194788627559183
													},
													"nextHandle": {
														"dv": -0.6858828506482362,
														"dt": 1.2194788627559183
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.9871071861164984e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8809876543209877
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.01282051282051282,
														"dt": -0.21777777777777785
													},
													"nextHandle": {
														"dv": 0.019664722888838422,
														"dt": 0.3332806368123195
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instAcceleration.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -2.9644666370982153,
														"dt": -0.3062152491313287
													},
													"nextHandle": {
														"dv": 0.7744791666666667,
														"dt": 0.07888888888888891
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.025520833333333326,
														"dt": -0.9566666666666667
													},
													"nextHandle": {
														"dv": 0.00890255983233487,
														"dt": 0.3333312198447246
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Smoke",
									"props": {
										"instScale_rand": 0.25,
										"maxCount": 70,
										"simulationSpace": "World",
										"animationSpeed": 0.3,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9215686274509803,
											0.9215686274509803,
											0.9215686274509803,
											0.8509803921568627
										],
										"emitRate": 9,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 7,
										"burstDelay": 0.05,
										"instStretch_rand": [
											0,
											0,
											0
										],
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.5,
										"alignMode": "Screen",
										"emitAngle": 38.18,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instWorldAcceleration_rand": [
											0,
											0.05,
											0
										],
										"lifeTime": 3.5,
										"instSpeed": [
											6,
											0,
											0
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"speedFactor": 0.5,
										"instWorldAcceleration": [
											0,
											0.25,
											0
										],
										"enableSort": false,
										"instAcceleration": [
											0.5,
											2,
											0
										],
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"scaleX": 0.45000000000000007,
									"scaleY": 0.4500000000000001,
									"scaleZ": 0.45,
									"rotationX": 1.500917073668498e-15,
									"rotationY": 28,
									"rotationZ": 89.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.85
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0050000000000000044,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.039999999999999994,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.04202981287230849,
																		"dt": -0.031069275200495742
																	},
																	"nextHandle": {
																		"dv": -0.5418521236867002,
																		"dt": 0.40077167056589863
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.0009190571474060327,
																		"dt": -0.5970087583397498
																	},
																	"nextHandle": {
																		"dv": -1.0948850713570362e-16,
																		"dt": 0.32012019140680864
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
															0.13725490196078433,
															0.13725490196078433,
															0.13725490196078433
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
														"range": 1,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.73,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.02,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"prevHandle": {
																		"dv": 0.4440584429210647,
																		"dt": -0.6148501517368579
																	},
																	"nextHandle": {
																		"dv": -0.21666666666666667,
																		"dt": 0.3
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"prevHandle": {
																		"dv": -0.009090909090909038,
																		"dt": -0.4642857142857143
																	},
																	"nextHandle": {
																		"dv": 0.008539703073546545,
																		"dt": 0.4361348355418391
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.0520769766684747,
																		"dt": -0.49993897601734766
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6399999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.75,
													"topSpan": 0.8,
													"dirBrighten": true,
													"dirIntensity": 0.8,
													"dirSpan": 0.9,
													"sandBlend": 0.1,
													"envBlend": 0.7
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
													"value": 0.5,
													"prevHandle": {
														"dv": 0.025888999519272402,
														"dt": -0.49980721032635916
													},
													"nextHandle": {
														"dv": -0.007231620978187969,
														"dt": 0.13961205046008218
													}
												},
												{
													"time": 1,
													"value": 0.9,
													"prevHandle": {
														"dv": -0.10219946215442799,
														"dt": -0.79
													},
													"nextHandle": {
														"dv": 0.0338972586912773,
														"dt": 0.267255905650836
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.007478104150625,
													"value": 0
												},
												{
													"time": 1.007478104150625,
													"value": 0
												},
												{
													"time": 1.388080943496417,
													"value": 3
												},
												{
													"time": 1.388080943496417,
													"value": 3
												},
												{
													"time": 1.7127127770560628,
													"value": 3
												},
												{
													"time": 1.7127127770560628,
													"value": 3,
													"prevHandle": {
														"dv": 0.5550639348517388,
														"dt": -0.39039776535836745
													},
													"nextHandle": {
														"dv": -0.47825183908593966,
														"dt": 0.3326326748097289
													}
												},
												{
													"time": 5,
													"value": 0,
													"prevHandle": {
														"dv": 0.6858828506482362,
														"dt": -1.2194788627559183
													},
													"nextHandle": {
														"dv": -0.6858828506482362,
														"dt": 1.2194788627559183
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 1.9871071861164984e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8809876543209877
													}
												},
												{
													"time": 1,
													"value": 0,
													"prevHandle": {
														"dv": -0.01282051282051282,
														"dt": -0.21777777777777785
													},
													"nextHandle": {
														"dv": 0.019664722888838422,
														"dt": 0.3332806368123195
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instAcceleration.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -2.9644666370982153,
														"dt": -0.3062152491313287
													},
													"nextHandle": {
														"dv": 0.7744791666666667,
														"dt": 0.07888888888888891
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.025520833333333326,
														"dt": -0.9566666666666667
													},
													"nextHandle": {
														"dv": 0.00890255983233487,
														"dt": 0.3333312198447246
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Spirit.root.JNT_ROOT"
				}
			]
		}
	]
}