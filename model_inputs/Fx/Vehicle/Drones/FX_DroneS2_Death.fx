{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 10,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
			"children": [
				{
					"type": "model",
					"name": "DroneS",
					"source": "Vehicle/Smuggler/StockDrone/StockDrone.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneS/Anim_DroneS2_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"x": -4.09871,
					"y": -3.04898,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid",
							"source": "Fx/Explosion/FX_Explosion_Mid.fx",
							"enabled": false,
							"x": 5.49584,
							"y": 3.00078,
							"z": -0.75636,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"time": -0.2
						},
						{
							"type": "object",
							"name": "Explosions",
							"x": 4.376024545454545,
							"y": 2.95147012987013,
							"z": 0.43792194805194806,
							"children": [
								{
									"type": "object",
									"name": "Explos02",
									"x": 2.16683,
									"y": -2.69683,
									"z": 2.92316,
									"rotationZ": 6.2,
									"children": [
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": -4.66078,
											"y": 2.46145,
											"z": -3.54024,
											"scaleX": 0.3,
											"scaleY": 0.3,
											"scaleZ": 0.45,
											"rotationX": 30.1,
											"rotationY": -93.9,
											"rotationZ": 14.7
										},
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
											"x": -4.23633,
											"y": 2.44929,
											"z": -3.86228,
											"scaleX": 0.49999999999999994,
											"scaleY": 0.49999999999999994,
											"scaleZ": 0.5,
											"rotationX": -32.4,
											"rotationY": -73.6,
											"rotationZ": 70,
											"time": -0.4
										},
										{
											"type": "subFX",
											"name": "FX_Directional_Explosion_trails_Base_Noflare",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
											"x": -3.12446,
											"y": 4.17555,
											"z": -3.96451,
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
											"x": -3.47651,
											"y": 4.34497,
											"z": -3.56445,
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
									"name": "Explo01",
									"rotationZ": -3.1,
									"children": [
										{
											"type": "subFX",
											"name": "01 - FX_Directional_Explosion_High",
											"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
											"x": 1.36484,
											"y": 0.49121,
											"z": -0.11281,
											"scaleX": 0.6000000000000004,
											"scaleY": 0.6000000000000001,
											"scaleZ": 0.6000000000000003,
											"rotationX": -93.4,
											"rotationY": 125.6,
											"rotationZ": -43.4,
											"time": -0.2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Electricity",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
										"warmUpTime": -0.3,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											2.5,
											1.2,
											1
										],
										"lifeTime": 0.15,
										"instScale": 2,
										"burstDelay": 2.75
									},
									"x": 5.84738,
									"y": 9.09765,
									"z": 2.71696,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.1,
									"rotationX": -30.9,
									"rotationY": -20.3,
									"rotationZ": -138,
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
								},
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
										"warmUpTime": -0.3,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											2,
											1.2,
											1
										],
										"lifeTime": 0.15,
										"instScale": 1.7,
										"burstDelay": 2.75
									},
									"x": 8.07464,
									"y": 4.70128,
									"z": 4.13972,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.1,
									"rotationX": -96.2,
									"rotationY": 6.3,
									"rotationZ": -73,
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
								},
								{
									"type": "emitter",
									"name": "emitter02",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"warmUpTime": -1.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											2.5,
											1.5,
											1
										],
										"lifeTime": 0.15,
										"instScale": 1.7,
										"burstCount": 2,
										"burstDelay": 0.5
									},
									"x": 12.53163,
									"y": 9.75631,
									"z": 0.72308,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.1,
									"rotationX": 172.1,
									"rotationY": 2.5,
									"rotationZ": -41.8,
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
								},
								{
									"type": "emitter",
									"name": "emitter02",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"warmUpTime": -1.5,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											2.5,
											1.5,
											1
										],
										"lifeTime": 0.15,
										"instScale": 1.7,
										"burstCount": 2,
										"burstDelay": 0.2
									},
									"x": 5.23968,
									"y": 2.46037,
									"z": 2.23543,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.1,
									"rotationX": -100.8,
									"rotationY": -11.8,
									"rotationZ": 46.8,
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
								},
								{
									"type": "emitter",
									"name": "emitter03",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"warmUpTime": -1.6,
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
										"burstDelay": 3
									},
									"x": 9.33884,
									"y": 4.42541,
									"z": 3.89832,
									"scaleX": 0.2,
									"scaleY": 0.19999999999999996,
									"scaleZ": 0.19999999999999993,
									"rotationX": -70.1,
									"rotationY": 2.4,
									"rotationZ": -53.3,
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
											20,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -2,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.7,
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
										"burstCount": 2
									},
									"x": 6.81045,
									"y": 7.46794,
									"z": 2.54643,
									"scaleY": 1.0000000000000002,
									"rotationX": 40,
									"rotationY": -140.6,
									"rotationZ": -65.7,
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
									"name": "ElecBig",
									"x": 3.88831,
									"y": 3.54204,
									"z": 1.19979,
									"scaleX": 11,
									"scaleY": 11,
									"scaleZ": 4.4,
									"rotationY": -9,
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
												"scale": 0.6
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.3002185367318967,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.3102185367318965,
															"value": 1.5,
															"mode": 2
														},
														{
															"time": 0.7348288081857535,
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
											"keys": [
												{
													"time": 0.2998288081857535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.30982880818575353,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8272506831857543,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8372506831857541,
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
									"x": 5.81135,
									"y": 4.75089,
									"z": 0.67721,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 2,
									"rotationX": 22.3,
									"rotationY": 75.1,
									"rotationZ": 53.9,
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
												"scale": 0.4
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.5010916579923617,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 1.5110916579923614,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8250677741727799,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.025271904909699,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.035271904909699,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4205927781701977,
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
											"keys": [
												{
													"time": 1.352336000734208,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.362336000734208,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5342333411440148,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5442333411440146,
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
									"x": 2.68069,
									"y": 1.45,
									"z": 0.67721,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 2,
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
												"scale": 0.4
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.4839573749844703,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 1.4939573749844701,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6994163654482435,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7134283007891207,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.038979677939054,
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
											"keys": [
												{
													"time": 1.261715547076761,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.271715547076761,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2832843925541617,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.2932843925541615,
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
									"x": 4.77457,
									"y": 2.23355,
									"z": 1.59852,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.5,
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
												"scale": 0.4
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 1.5870994558912574,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.6011113912321346,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.926662768382068,
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
											"keys": [
												{
													"time": 1.3243426188322287,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3343426188322287,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.088101876984276,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0981018769842756,
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
									"enabled": false,
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
								}
							]
						},
						{
							"type": "emitter",
							"name": "SandResiduel",
							"props": {
								"lifeTime": 2.5,
								"lifeTimeRand": 0.25,
								"speedFactor": 0.8,
								"warmUpTime": -0.8,
								"emitType": "Burst",
								"burstParticleCount": 4,
								"emitShape": "Cone",
								"emitAngle": 19.09,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale": 15,
								"instSpeed": [
									22,
									0,
									0
								],
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 2.5,
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"instWorldSpeed": [
									0,
									0,
									-3
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.8
								],
								"randomColor1": [
									0.8117647058823529,
									0.8117647058823529,
									0.8117647058823529,
									1
								]
							},
							"x": 5.36728,
							"y": 3.16356,
							"z": -0.22004,
							"scaleY": 4.5,
							"scaleZ": 4.5,
							"rotationY": -90,
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
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
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
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0032931736537387124,
																"dt": -0.39546998527483657
															},
															"nextHandle": {
																"dv": -0.0032931736537387124,
																"dt": 0.39546998527483657
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
													0.9764705882352941,
													0.9607843137254902,
													0.9490196078431372
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
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
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.9173338952643375,
												"dt": -0.34612783862841096
											},
											"nextHandle": {
												"dv": -1.1533247604966166,
												"dt": 0.1375675736137951
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012976087629794963,
												"dt": -0.6555012670999958
											},
											"nextHandle": {
												"dv": -0.012976087629794963,
												"dt": 0.6555012670999958
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
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
												"dv": -1.140345982142858,
												"dt": -0.13896948945309906
											},
											"nextHandle": {
												"dv": 0.7341459191045832,
												"dt": 0.08913588385340426
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
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": -1.562544836391683,
												"dt": -0.057312053992565525
											},
											"nextHandle": {
												"dv": 0.8951335055594681,
												"dt": 0.03233660096897972
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024099204996862578,
												"dt": -0.9873942064019231
											},
											"nextHandle": {
												"dv": 0.0055778337215589505,
												"dt": 0.265963721460112
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Decal_Large",
							"x": 3.64344,
							"y": 2.66624,
							"z": 0.67021,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 5,
							"albedoMap": "Fx/Alphas/Destruction_Decal_Alpha.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.004970714033456,
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
													"time": 1.3290823324351684,
													"value": 1,
													"mode": 2
												},
												{
													"time": 11.030836753096057,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01861245247967639,
														"dt": -4.211416294722059
													},
													"nextHandle": {
														"dv": -0.016666666666666607,
														"dt": 3.7753286941931172
													}
												},
												{
													"time": 15,
													"value": 0,
													"mode": 0
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
											1,
											1
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": true,
										"envBlend": 0.8,
										"envColorSet": false
									}
								}
							]
						}
					]
				}
			]
		}
	]
}