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
											"x": -1.15285,
											"y": -0.01047,
											"z": 2.63563,
											"scaleX": 9,
											"scaleY": 9,
											"scaleZ": 2,
											"rotationX": 90,
											"rotationY": 17.6,
											"rotationZ": 6.4,
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
														"alpha": 1.1
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
											"name": "01 - FX_Directional_Explosion_High_Photosensitive",
											"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
											"x": -3.39917,
											"y": 2.56557,
											"z": -1.85843,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationX": -13,
											"rotationY": -44.9,
											"rotationZ": 34.5,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High_Photosensitive",
											"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
											"x": -2.58861,
											"y": 3.45378,
											"z": -2.18206,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationX": -109.9,
											"rotationY": -29.3,
											"rotationZ": 40.8,
											"time": 0.21624
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High_Photosensitive",
											"source": "Fx/Explosion/FX_Directional_Explosion_High_Photosensitive.fx",
											"x": -1.88721,
											"y": 2.6183,
											"z": -6.42161,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.3,
											"rotationY": 180,
											"time": 0.84959
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_ElectricityBig_Photosensitive",
							"source": "Fx/Structure/CorrinoBase/FX_ElectricityBig_Photosensitive.fx",
							"x": 3.81965,
							"y": 2.51866,
							"z": 1.01572,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"rotationX": -21.7,
							"rotationY": -79.4,
							"rotationZ": -64.9,
							"time": 0.87399
						},
						{
							"type": "subFX",
							"name": "FX_ElectricityBig_Photosensitive",
							"source": "Fx/Structure/CorrinoBase/FX_ElectricityBig_Photosensitive.fx",
							"x": 3.81965,
							"y": 2.51866,
							"z": 1.01572,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"rotationX": -21.7,
							"rotationY": -79.4,
							"rotationZ": -64.9,
							"time": 3.23465
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
									"x": 13.28535,
									"y": 6.83476,
									"z": 0.94064,
									"scaleX": 2,
									"scaleY": 2,
									"rotationX": 180,
									"rotationY": -35.2,
									"rotationZ": -53.4,
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
																	"emissive": 5
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
									"x": 3.91805,
									"y": 8.37643,
									"z": -3.27039,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": 140.8,
									"rotationY": -14.4,
									"rotationZ": 20.3,
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
												"warmUpTime": -1.1,
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
																	"emissive": 5
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
									"x": 12.99222,
									"y": 9.47341,
									"z": -5.60935,
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
												"warmUpTime": -1.05,
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
												"burstCount": 2,
												"burstDelay": 0.25
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
																	"emissive": 5
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
									"x": 12.99222,
									"y": 9.47341,
									"z": -5.60935,
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
												"warmUpTime": -4,
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
												"burstCount": 6,
												"burstDelay": 0.7
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
																	"emissive": 5
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
											15,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -4,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.55,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											6,
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
										"burstCount": 3,
										"burstDelay": 3
									},
									"x": 12.90653,
									"y": 6.32633,
									"z": -0.04099,
									"scaleY": 1.0000000000000002,
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
															"emissive": 5
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
								},
								{
									"type": "emitter",
									"name": "Sparkles02",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											10,
											0,
											0
										],
										"lifeTime": 0.6,
										"warmUpTime": -1.5,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.4,
										"instScale_rand": 0.2,
										"instSpeed_rand": [
											5,
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
										"burstCount": 3,
										"burstDelay": 0.75
									},
									"x": 7.22182,
									"y": 7.47203,
									"z": 2.29426,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": 58.1,
									"rotationY": -5.5,
									"rotationZ": 52.9,
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
															"emissive": 5
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles03",
									"props": {
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											12,
											0,
											0
										],
										"lifeTime": 0.6,
										"warmUpTime": -2,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.4,
										"instScale_rand": 0.2,
										"instSpeed_rand": [
											6,
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
										"burstDelay": 3,
										"burstCount": 2
									},
									"x": 4.54283,
									"y": 5.94529,
									"z": 1.75897,
									"rotationY": -122.7,
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
															"emissive": 5
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "LightDecals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "ElectricityBigLight",
									"x": 4.1656,
									"y": 3.11442,
									"z": 0.8385,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 4.29,
									"rotationX": 90,
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
															"time": 0.8822593688964857,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.8922593688964855,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2062354850769046,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.23352201461792,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.24352201461792,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.6288428878784185,
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
									"name": "ElectricitySmallLight_01",
									"x": 6.38823,
									"y": 3.59588,
									"z": 0.7004,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 2,
									"rotationX": 90,
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
															"time": 0.9810081214768949,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.9910081214768947,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3049842376573135,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.891847031820662,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.9018470318206617,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.28716790508116,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.508933348575859,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.5189333485758585,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.822133107870535,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 9.249537286527561,
															"value": 0,
															"mode": 2
														},
														{
															"time": 9.27265542156239,
															"value": 0.9830555555555555,
															"mode": 2
														},
														{
															"time": 9.596309312049993,
															"value": 0,
															"mode": 2
														},
														{
															"time": 11.944359085602535,
															"value": 0,
															"mode": 2
														},
														{
															"time": 11.954359085602535,
															"value": 1,
															"mode": 2
														},
														{
															"time": 12.347367381194623,
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
									"name": "ElectricitySmallLight_02",
									"x": 6.13062,
									"y": 3.59588,
									"z": -2.35327,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 2,
									"rotationX": 90,
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
															"time": 1.044079257951505,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 1.0540792579515048,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 1.2229235194658399,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3149405987151912,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.324940598715191,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 1.5472893641924026,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.9945285275560067,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.0045285275560065,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 4.200280609130864,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 4.698279027707979,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.721397162742809,
															"value": 0.9830555555555555,
															"mode": 2
														},
														{
															"time": 4.969615917205816,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.38889843877948,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.398898438779479,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.648756904602056,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.094759941101079,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.1047599411010784,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.327897891998296,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.794173793792732,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.804173793792732,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.017175312042243,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.513860511779791,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.523860511779791,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.686179866790779,
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
									"x": 2.29084,
									"y": 3.60361,
									"z": -1.70207,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.25,
									"rotationX": 90,
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
															"time": 1.044079257951505,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 1.0540792579515048,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 1.2229235194658399,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3149405987151912,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.324940598715191,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 1.5472893641924026,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.090853967664785,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.100853967664785,
															"value": 1,
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
															"time": 13.06963474659084,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.07963474659084,
															"value": 1,
															"mode": 2
														},
														{
															"time": 13.302772697488056,
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
									"x": 2.61718,
									"y": 3.32046,
									"z": 1.95939,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 3.15,
									"rotationX": 90,
									"rotationY": 16.5,
									"rotationZ": 8.2,
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
								}
							]
						},
						{
							"type": "emitter",
							"name": "Smoke",
							"enabled": false,
							"props": {
								"instScale_rand": 0.5,
								"maxCount": 65,
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
								"emitRate": 10,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 4,
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
								"emitAngle": 21.82,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0.025,
									0
								],
								"lifeTime": 3,
								"instSpeed": [
									3,
									0,
									0
								],
								"instSpeed_rand": [
									0.75,
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
									0.075,
									0
								],
								"enableSort": false,
								"instAcceleration": [
									0.5,
									0.2,
									0
								]
							},
							"x": 4.20835,
							"y": 3.63111,
							"z": -3.42431,
							"rotationX": 83.2,
							"rotationY": 67.6,
							"rotationZ": 83.7,
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
												"scale": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.7
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.07434815435096212,
																"dt": -0.013591771967285254
															},
															"nextHandle": {
																"dv": -0.4,
																"dt": 0.07096513271331795
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.7934098672866821
															},
															"nextHandle": {
																"dv": 0.013450431843066416,
																"dt": 0.32003621266595966
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
												"range": 0.5,
												"power": 1
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
											"envBlend": 0.5
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
											"mode": 0,
											"prevHandle": {
												"dv": 0.01716493190450957,
												"dt": -0.49913718658749795
											},
											"nextHandle": {
												"dv": -0.00666666666666671,
												"dt": 0.19385927438735967
											}
										},
										{
											"time": 1,
											"value": 0.9,
											"mode": 0,
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
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0.9958271574974061,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.0058271574974063,
											"value": 2,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333336
											},
											"nextHandle": {
												"dv": -0.9333333333333331,
												"dt": 1.528834655284883
											}
										},
										{
											"time": 12.034534623215476,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05333333333333323,
												"dt": -3.5236773991584793
											},
											"nextHandle": {
												"dv": 0.03239105655764724,
												"dt": 2.140043136132158
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instFixedSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 1,
									"keys": [
										{
											"time": 1.5407521177838657,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5507521177838672,
											"value": 2,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333336
											},
											"nextHandle": {
												"dv": -0.9333333333333331,
												"dt": 1.528834655284883
											}
										},
										{
											"time": 8.000801233303688,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05333333333333323,
												"dt": -3.5236773991584793
											},
											"nextHandle": {
												"dv": 0.03239105655764724,
												"dt": 2.140043136132158
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
								"instScale_rand": 0.5,
								"maxCount": 65,
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
								"emitRate": 10,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"instScale": 4,
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
								"emitAngle": 21.82,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instWorldAcceleration_rand": [
									0,
									0.025,
									0
								],
								"lifeTime": 3.5,
								"instSpeed": [
									3.5,
									0,
									0
								],
								"instSpeed_rand": [
									0.75,
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
									0.075,
									0
								],
								"enableSort": false,
								"instAcceleration": [
									0.5,
									0.2,
									0
								]
							},
							"x": 3.10385,
							"y": 2.9001,
							"z": 1.9736,
							"rotationX": 8,
							"rotationY": -159.7,
							"rotationZ": -58.2,
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
												"scale": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.7
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.07434815435096212,
																"dt": -0.013591771967285254
															},
															"nextHandle": {
																"dv": -0.4,
																"dt": 0.07096513271331795
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.7934098672866821
															},
															"nextHandle": {
																"dv": 0.013450431843066416,
																"dt": 0.32003621266595966
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
												"range": 1.2,
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
															"mode": 0,
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
															"mode": 0,
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
															"mode": 0,
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
											"envBlend": 0.5
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
											"mode": 0,
											"prevHandle": {
												"dv": 0.01716493190450957,
												"dt": -0.49913718658749795
											},
											"nextHandle": {
												"dv": -0.00666666666666671,
												"dt": 0.19385927438735967
											}
										},
										{
											"time": 1,
											"value": 0.9,
											"mode": 0,
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
									"keyMode": 1,
									"keys": [
										{
											"time": 1.5407521177838657,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5507521177838672,
											"value": 2,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.003333333333333336
											},
											"nextHandle": {
												"dv": -0.9333333333333331,
												"dt": 1.528834655284883
											}
										},
										{
											"time": 8.000801233303688,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.05333333333333323,
												"dt": -3.5236773991584793
											},
											"nextHandle": {
												"dv": 0.03239105655764724,
												"dt": 2.140043136132158
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instFixedSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
				},
				{
					"type": "model",
					"name": "Kraken",
					"source": "Vehicle/Atreide/Kraken/Kraken.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Death.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Kraken.root.B_ROOT.B_Body"
				}
			]
		}
	]
}