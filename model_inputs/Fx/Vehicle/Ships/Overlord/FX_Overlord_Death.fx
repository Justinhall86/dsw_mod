{
	"type": "fx",
	"duration": 20,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Death",
					"x": -4.09871,
					"y": -3.04898,
					"children": [
						{
							"type": "object",
							"name": "Explosions",
							"x": 4.376024545454545,
							"y": 2.95147012987013,
							"z": 0.43792194805194806,
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
											"x": -1.22227,
											"y": -0.02547,
											"z": 3.79275,
											"scaleX": 9,
											"scaleY": 9,
											"scaleZ": 2,
											"rotationX": 107.6,
											"rotationY": -0.3,
											"rotationZ": 97.3,
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
																	"mode": 0,
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
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 10.03032049712031,
																	"value": 0,
																	"mode": 0
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
									"name": "SmallExplosions",
									"x": 2.0858254545454544,
									"y": -2.705628701298701,
									"z": 2.9231594805194803,
									"children": [
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": -4.20575,
											"y": 2.50408,
											"z": -1.329,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.45,
											"rotationX": 30.1,
											"rotationY": -93.9,
											"rotationZ": 3.1
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
											"x": -3.79246,
											"y": 2.40666,
											"z": -1.65104,
											"scaleX": 0.49999999999999994,
											"scaleY": 0.49999999999999994,
											"scaleZ": 0.5,
											"rotationX": -32.39999999999999,
											"rotationY": -73.6,
											"rotationZ": 58.399999999999956,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": -0.95549,
											"y": 4.17555,
											"z": -3.43951,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.45,
											"rotationX": -1.6,
											"rotationY": -104.9,
											"rotationZ": -131.8,
											"time": 0.1
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
											"x": -1.30754,
											"y": 4.34497,
											"z": -3.03945,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": 12,
											"rotationY": 136.8,
											"rotationZ": 35.3,
											"time": -0.3
										}
									]
								},
								{
									"type": "object",
									"name": "SideExplosions",
									"children": [
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": 1.4994,
											"y": 1.41763,
											"z": 0.55511,
											"scaleX": 0.6000000000000004,
											"scaleY": 0.6000000000000001,
											"scaleZ": 0.6000000000000003,
											"rotationX": 78.3,
											"rotationY": 54.4,
											"rotationZ": 136.6,
											"time": -0.2
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.60563,
											"y": -0.56805,
											"z": 2.84844,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": -158.3,
											"rotationY": 97.3,
											"rotationZ": -4.5,
											"time": 0.68
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.85446,
											"y": -0.31318,
											"z": 1.21854,
											"scaleX": 0.25,
											"scaleY": 0.25,
											"scaleZ": 0.25,
											"rotationY": -100.1,
											"time": 0.815
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -1.666,
											"y": -0.73994,
											"z": -0.61089,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6,
											"rotationY": -91.8,
											"time": 0.925
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": -2.01258,
											"y": -0.18633,
											"z": -1.85007,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationY": -78.9,
											"time": 0.97
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_ElectricityBig",
							"source": "Fx/Structure/CorrinoBase/FX_ElectricityBig.fx",
							"x": 4.31025,
							"y": 2.82944,
							"z": 0.80851,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"rotationX": -65.8,
							"rotationY": -43.7,
							"rotationZ": -21.3,
							"time": 0.105
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
							"name": "Electricity",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "object",
									"name": "Elec01",
									"x": 12.6051,
									"y": 6.56788,
									"z": 0.80607,
									"scaleX": 2,
									"scaleY": 2,
									"rotationX": 12.5,
									"rotationY": -146.8,
									"rotationZ": 104.5,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.6,
													1.2,
													1
												],
												"lifeTime": 0.15,
												"instScale": 1.2,
												"burstCount": 5,
												"burstDelay": 2.75
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec02",
									"x": 4.28489,
									"y": 8.80292,
									"z": -3.37364,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": 139.7,
									"rotationY": 10.4,
									"rotationZ": 49.3,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.2,
												"burstCount": 7,
												"burstDelay": 3
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec04",
									"x": 7.42996,
									"y": 15.33363,
									"z": 5.83462,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": 28.1,
									"rotationY": 42.1,
									"rotationZ": 178.5,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.45,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.5,
												"burstCount": 4,
												"burstDelay": 0.75
											},
											"x": -1.94014,
											"y": 1.36932,
											"z": -1.18716,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -49.1,
											"rotationY": 75.2,
											"rotationZ": -109.4,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec03",
									"x": 13.03841,
									"y": 10.39443,
									"z": -5.30924,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": -95,
									"rotationY": 116.7,
									"rotationZ": 26.6,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -6,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.45,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.3,
												"burstCount": 3,
												"burstDelay": 0.7
											},
											"x": -0.672,
											"y": 0.60068,
											"z": 0.45647,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -22.1,
											"rotationY": -7.3,
											"rotationZ": -15.5,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											25,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -7,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.6,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											9,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"burstDelay": 6
									},
									"x": 4.85645,
									"y": 7.89949,
									"z": 6.92936,
									"scaleY": 1.0000000000000002,
									"rotationX": 21,
									"rotationY": -167.6,
									"rotationZ": -33.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationZ": 90,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true,
															"emissive": 50
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
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
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
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
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
																	}
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
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
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"children": [
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_01",
									"x": 5.18479,
									"y": 4.93944,
									"z": -0.94679,
									"scaleX": 4,
									"scaleY": 4.8,
									"scaleZ": 5,
									"rotationX": 90,
									"rotationZ": -53,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
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
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 5.995074742364215,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 6.005074742364215,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.319050858544633,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.727671596093,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.737671596093,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.122992469353498,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.4336587499690125,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.443658749969012,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.746858509263689,
															"value": -0.016666666666666663,
															"mode": 2
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
													0.4666666666666667,
													0.8352941176470589,
													1
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_02",
									"x": 5.35808,
									"y": 4.10028,
									"z": 3.59473,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 4,
									"rotationX": 123,
									"rotationY": -11.3,
									"rotationZ": -29.1,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
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
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 4.977909371493633,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.9879093714936324,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.237767837316209,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.807067594000986,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.817067594000986,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.040205544898203,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.4932560083436694,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.503256008343669,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.760398902079469,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.253585782822485,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.263585782822485,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.56182758328687,
															"value": 0,
															"mode": 2
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
													0.4666666666666667,
													0.8352941176470589,
													1
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_03",
									"x": 2.2991,
									"y": 4.22978,
									"z": -1.47933,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2,
									"rotationX": 90,
									"rotationZ": 77.5,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
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
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 4.090853967664785,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.100853967664785,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 4.3290184020996145,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 7.127190415628361,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.1503085506631905,
															"value": 0.9830555555555555,
															"mode": 2
														},
														{
															"time": 7.398527305126198,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.121314145890842,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.131314145890842,
															"value": 1,
															"mode": 2
														},
														{
															"time": 10.381172611713419,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.168383499171252,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.178383499171252,
															"value": 1,
															"mode": 2
														},
														{
															"time": 13.401521450068469,
															"value": 0,
															"mode": 2
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
													0.4666666666666667,
													0.8352941176470589,
													1
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
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 2.17092,
									"y": 2.49359,
									"z": 1.83342,
									"scaleX": 6.75,
									"scaleY": 6.75,
									"scaleZ": 2.81,
									"rotationX": 106.1,
									"rotationY": 3.5,
									"rotationZ": 86.3,
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
															"time": 0.060286413712068665,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.17404910478720237,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5562534919013706,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
											"enabled": false,
											"keys": [
												{
													"time": 0.4880929892510185,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4980929892510185,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": 5.73075,
									"y": 4.60712,
									"z": 0.40374,
									"scaleX": 5.5,
									"scaleY": 8,
									"scaleZ": 2.81,
									"rotationX": 89.6,
									"rotationY": 5.2,
									"rotationZ": 130,
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
															"time": 0.14806308267243473,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.26182577374756844,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9310867171280461,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
											"enabled": false,
											"keys": [
												{
													"time": 0.5758696582113846,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5858696582113846,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo03",
									"x": 2.43506,
									"y": 2.26249,
									"z": 0.42011,
									"scaleX": 5,
									"scaleY": 12,
									"scaleZ": 2.81,
									"rotationX": 90,
									"rotationY": 0.4,
									"rotationZ": 90.9,
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
												"scale": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.1136064412364561,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 1.2273691323115898,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.072183413612801,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
											"enabled": false,
											"keys": [
												{
													"time": 1.5414130167754059,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.551413016775406,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.496652380987647,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.513527380987647,
													"value": 0,
													"mode": 2
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
					"type": "model",
					"name": "Overlord",
					"source": "Vehicle/Harkonnen/Overlord/Overlord.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Overlord/Anim_Overlord_Death.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Overlord.root.B_ROOT.B_Body"
				}
			]
		}
	]
}