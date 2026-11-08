{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Death",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": -0.29302,
							"y": 0.11451,
							"z": -0.01117,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.2,
							"rotationX": 84.7,
							"rotationY": -2,
							"rotationZ": -20.2,
							"time": -0.2
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local_Photosensitive",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local_Photosensitive.fx",
							"x": -0.28665,
							"y": -0.34507,
							"z": -0.07149,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"rotationX": 78.9,
							"rotationY": -5,
							"rotationZ": -24.2,
							"time": -0.4
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local_Photosensitive",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local_Photosensitive.fx",
							"x": -0.28813,
							"y": -0.01383,
							"z": -0.14222,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"rotationX": 93.7,
							"rotationY": -11.6,
							"rotationZ": -108,
							"time": -0.4
						},
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid_Local_Photosensitive",
							"source": "Fx/Explosion/FX_Explosion_Mid_Local_Photosensitive.fx",
							"x": -0.57943,
							"y": -0.27552,
							"z": -0.2275,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.2,
							"time": -0.1
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 1.8,
								"power": 0.8
							}
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
									"x": 0.95435,
									"y": -0.04597,
									"z": 0.16283,
									"scaleX": 0.7,
									"scaleY": 0.7,
									"scaleZ": 0.7,
									"rotationX": -178.4,
									"rotationY": -9.5,
									"rotationZ": -56.4,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
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
												"burstCount": 3,
												"burstDelay": 2.75
											},
											"x": 0.12,
											"y": -0.14,
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
									"x": -0.24457,
									"y": 1.38322,
									"z": -0.90362,
									"rotationX": 18.7,
									"rotationY": 63.8,
									"rotationZ": -154.4,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_01.png",
												"instScale_rand": 0,
												"warmUpTime": -1.5,
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
												"burstCount": 2,
												"burstDelay": 3
											},
											"x": -0.02,
											"y": 0.07,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationZ": -5.7,
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
									"x": 0.37564,
									"y": 0.61142,
									"z": -1.46811,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": -174.3,
									"rotationY": 12.1,
									"rotationZ": -41.3,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -1,
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
											"x": -1.97337,
											"y": 0.27438,
											"z": -2.8243,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 58.7,
											"rotationY": 64.5,
											"rotationZ": -19,
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
									"x": -0.36772,
									"y": 0.89563,
									"z": -1.01225,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 0.4,
									"rotationX": 122.7,
									"rotationY": -42.1,
									"rotationZ": 104.1,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_02.png",
												"instScale_rand": 0,
												"warmUpTime": -1.05,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.8,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.8,
												"burstCount": 2,
												"burstDelay": 2
											},
											"y": 0.10702,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -18.1,
											"rotationY": 69.7,
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
											7,
											0,
											0
										],
										"lifeTime": 0.45,
										"warmUpTime": -8,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.55,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											4,
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
										"burstDelay": 1.5,
										"burstCount": 2
									},
									"x": -0.37105,
									"y": 0.19602,
									"z": 0.20505,
									"scaleY": 1.0000000000000002,
									"rotationX": 57.2,
									"rotationY": -34.8,
									"rotationZ": 122.4,
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
											7,
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
										"instScale": 0.3,
										"instScale_rand": 0.1,
										"instSpeed_rand": [
											4,
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
										"burstDelay": 0.75
									},
									"x": 0.68771,
									"y": 0.3826,
									"z": -0.65425,
									"rotationX": 87.8,
									"rotationY": -7.1,
									"rotationZ": 41.7,
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
											7,
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
										"instScale": 0.3,
										"instScale_rand": 0.1,
										"instSpeed_rand": [
											4,
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
										"burstDelay": 2,
										"burstCount": 3
									},
									"x": -0.22598,
									"y": 0.25662,
									"z": 0.21626,
									"rotationX": -69.9,
									"rotationY": -17.3,
									"rotationZ": 130.2,
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
									"name": "ElectricitySmallLight_02",
									"x": 0.30301,
									"y": -0.08276,
									"z": 0.04797,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 0.5,
									"rotationX": 90,
									"rotationZ": -47.6,
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
															"time": 0.9968917968147988,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0068917968147986,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2567502626373752,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.072482547159655,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.082482547159653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.3056204980568715,
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
									"x": -0.23186,
									"y": 0.32627,
									"z": 0.48592,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 0.8,
									"rotationX": 109.5,
									"rotationZ": 27.5,
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
															"time": 0.9968917968147988,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0068917968147986,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2567502626373752,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.072482547159655,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.082482547159653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.3056204980568715,
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
									"x": -0.1825,
									"y": 0.23143,
									"z": -0.4507,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 0.8,
									"rotationX": 92.1,
									"rotationZ": 27.5,
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
															"time": 1.0690544862696534,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0790544862696532,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3289129520922298,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.072482547159655,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.082482547159653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.3056204980568715,
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
									"enabled": false,
									"x": -1.13283,
									"y": 0.04897,
									"z": 1.2268,
									"scaleX": 5,
									"scaleY": 6.5,
									"rotationX": 90,
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
															"time": 0.04375737680719308,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.04375737680719308,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.07497213065569178,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.07497213065569178,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.15393067525756465,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.15393067525756465,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.26769336633269836,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.26769336633269836,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1510433707598775,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.03361111111111109,
																"dt": -1.2375161720483672
															},
															"nextHandle": {
																"dv": 0.009138021331372042,
																"dt": 0.3333112237249949
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
									"name": "Explo03",
									"enabled": false,
									"x": 1.40083,
									"y": 0.97529,
									"z": 1.28634,
									"scaleX": 6,
									"scaleY": 14.4,
									"scaleZ": 3.37,
									"rotationX": 90,
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
															"time": 1.528972302134668,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.072183413612801,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.328054861478133
															},
															"nextHandle": {
																"dv": 0.004249981969198169,
																"dt": 0.33331441581177956
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
								},
								{
									"type": "advancedDecal",
									"name": "Explo03",
									"enabled": false,
									"x": -2.39009,
									"y": -0.40018,
									"z": 0.30081,
									"scaleX": 2,
									"scaleY": 10,
									"rotationX": 90,
									"rotationY": -0.7,
									"rotationZ": 90,
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
															"time": 1.528972302134668,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.072183413612801,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.328054861478133
															},
															"nextHandle": {
																"dv": 0.004249981969198169,
																"dt": 0.33331441581177956
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
					"type": "object",
					"name": "Death2",
					"enabled": false,
					"y": -0.43158,
					"z": 7.16338,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": -1.13328,
							"y": -0.28667,
							"z": -0.13036,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.15,
							"rotationX": 133.3,
							"rotationY": -2,
							"rotationZ": -20.2,
							"time": -0.2
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
							"x": -0.94681,
							"y": -0.22793,
							"z": 0.09442,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationX": 129.1,
							"rotationY": -5,
							"rotationZ": -24.2,
							"time": -0.4
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Local",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
							"enabled": false,
							"x": -0.88494,
							"y": -0.17019,
							"z": -0.22908,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"rotationX": -66.6,
							"rotationY": -11.8,
							"rotationZ": 119.4,
							"time": -0.4
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
							"x": -1.08246,
							"y": -0.08094,
							"z": -0.09718,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"rotationX": -23.9,
							"rotationY": 25,
							"rotationZ": 104.1,
							"time": -0.4
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 1.8,
								"power": 0.8
							}
						}
					]
				},
				{
					"type": "model",
					"name": "Harpy",
					"source": "Vehicle/Harkonnen/Harpy/Harpy.fbx",
					"editorOnly": true,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Harpy/Anim_Harpy_Death.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Harpy.root.B_ROOT.B_Body"
				}
			]
		}
	]
}