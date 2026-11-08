{
	"type": "fx",
	"duration": 23,
	"cullingRadius": 50,
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
			"children": [
				{
					"type": "model",
					"name": "Monument",
					"source": "Vehicle/Ecaz/Monument/Monument.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Monument/Anim_Monument_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"y": 4.16243,
					"children": [
						{
							"type": "object",
							"name": "Electricity",
							"enabled": false,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "object",
									"name": "Elec01",
									"x": -3.75322,
									"y": 8.26342,
									"z": -4.15444,
									"scaleX": 0.6,
									"scaleY": 0.6,
									"scaleZ": 0.6,
									"rotationX": 177.5,
									"rotationY": -9.3,
									"rotationZ": -31.8,
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
												"warmUpTime": -0.5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.6,
													1.2,
													1
												],
												"lifeTime": 0.15,
												"instScale": 4,
												"burstCount": 2,
												"burstDelay": 2.75,
												"emitSurface": true
											},
											"x": 8.93031,
											"y": 11.28278,
											"z": -7.34008,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 59.3,
											"rotationY": -10.9,
											"rotationZ": -110.6,
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
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 0.1,
																"power": 1
															}
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
												"warmUpTime": -0.4,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.6,
													1,
													1
												],
												"lifeTime": 0.15,
												"instScale": 4,
												"burstCount": 2,
												"burstDelay": 2.75,
												"emitSurface": true
											},
											"x": 8.7351,
											"y": 10.16752,
											"z": -3.12977,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -55.3,
											"rotationY": 21.2,
											"rotationZ": -119.7,
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
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 0.1,
																"power": 1
															}
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
									"x": -5.50287,
									"y": -4.64147,
									"z": 0.16399,
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
												"warmUpTime": -5.2,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.4,
												"burstCount": 2,
												"burstDelay": 3
											},
											"x": -0.27799,
											"y": -0.03695,
											"z": -0.17058,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -1.6,
											"rotationY": 17.7,
											"rotationZ": -73.2,
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
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -4.5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1,
													0.7,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.4,
												"burstCount": 2,
												"burstDelay": 3
											},
											"x": -0.22664,
											"y": -0.02589,
											"z": -0.14036,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 40.9,
											"rotationY": -78.8,
											"rotationZ": -114.4,
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
									"enabled": false,
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
										"lifeTime": 0.45,
										"warmUpTime": -12,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.5,
										"instScale_rand": 0.3,
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
										"burstDelay": 1.5,
										"burstCount": 2
									},
									"x": -4.87727,
									"y": -0.44319,
									"z": -0.11093,
									"scaleY": 1.0000000000000002,
									"rotationZ": 143.1,
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
							"name": "TopExplosions",
							"x": 1.67772,
							"y": 0.9172,
							"z": 0.52509,
							"rotationZ": -90,
							"children": [
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -2.90249,
									"y": -1.90086,
									"z": -1.68954,
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"rotationY": -100.5,
									"rotationZ": 22.7,
									"time": 0.68
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -0.32712,
									"y": -0.70225,
									"z": 1.42516,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"rotationX": -32.3,
									"rotationY": -55,
									"rotationZ": 18.5,
									"time": 0.815
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": 1.86608,
									"y": -0.18969,
									"z": -1.55991,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationY": -101.7,
									"rotationZ": -23.8,
									"time": 0.91237
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": 2.96083,
									"y": -0.98652,
									"z": 1.74673,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"rotationY": -71.7,
									"time": 1.05389
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": 4.79822,
									"y": 0.12717,
									"z": -1.55549,
									"scaleX": 0.35,
									"scaleY": 0.35,
									"scaleZ": 0.35,
									"rotationY": -108.6,
									"rotationZ": -19.4,
									"time": 1.18638
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails_Base",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"enabled": false,
									"x": -1.68705,
									"y": 0.49381,
									"z": -0.51685,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.15,
									"rotationX": -13.8,
									"rotationY": -90,
									"time": 1.23154
								}
							]
						},
						{
							"type": "object",
							"name": "SideExplosions",
							"y": -0.21209,
							"z": -0.35771,
							"children": [
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -1.21916,
									"y": 3.41114,
									"z": 2.19737,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"rotationY": -79.9,
									"rotationZ": -65.1,
									"time": 0.54501
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": 0.09885,
									"y": 1.31416,
									"z": -0.47767,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationX": -14.5,
									"rotationY": -90,
									"time": 0.72869
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -0.42988,
									"y": -0.24485,
									"z": 1.29734,
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"rotationX": -35.9,
									"rotationY": -90,
									"time": 0.93344
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -1.06884,
									"y": -1.23719,
									"z": -1.54736,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationX": -26.8,
									"rotationY": -90,
									"time": 1.07497
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles_Photosensitive.fx",
									"x": -2.30473,
									"y": -1.58524,
									"z": 3.14226,
									"scaleX": 0.35,
									"scaleY": 0.35,
									"scaleZ": 0.35,
									"rotationX": -25.4,
									"rotationY": -90,
									"time": 1.12917
								}
							]
						},
						{
							"type": "object",
							"name": "FireDoor",
							"scaleX": 1.11,
							"scaleZ": 1.11,
							"children": [
								{
									"type": "object",
									"name": "1-FireMainDoor",
									"x": -2.27077,
									"y": -2.2664,
									"z": -1.0630263488041469e-19,
									"scaleX": 0.27,
									"scaleY": 0.27,
									"scaleZ": 0.26999999999999996,
									"rotationX": 9.202993869975455e-17,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "ExplosionSize",
											"y": 8.881784197001252e-16,
											"scaleX": 2.2,
											"scaleY": 2.2,
											"scaleZ": 2.2,
											"children": [
												{
													"type": "object",
													"name": "Anticipation",
													"enabled": false,
													"y": 0.16999999999999998,
													"z": 1.6399999999999997,
													"scaleX": 0.9999999999999999,
													"scaleY": 0.9999999999999999,
													"scaleZ": 0.9999999999999999,
													"children": [
														{
															"type": "emitter",
															"name": "LensFlare",
															"props": {
																"alignMode": "Screen",
																"instScale_rand": 0,
																"maxCount": 5,
																"simulationSpace": "World",
																"animationSpeed": 0,
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
																"emitAngle": 0,
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"instScale": 2,
																"emitType": "Burst",
																"burstDelay": 0.12,
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instOffset": [
																	0,
																	1,
																	0
																],
																"lifeTime": 0.04
															},
															"x": 0.00002,
															"y": 0.85202,
															"z": -1.49261,
															"scaleX": 0.09999999999999999,
															"scaleY": 0.09999999999999998,
															"scaleZ": 0.09999999999999998,
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
																					"blend": "Add",
																					"shadows": false,
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 12
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.6941176470588235,
																					0.4156862745098039,
																					0.2588235294117647
																				]
																			},
																			"isInstance": true
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
																				"texture": "Fx/Alphas/T_Flare02.png",
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
																							"time": 0.0049999999999999975,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.03352751080665441,
																								"dt": -0.5098493884736074
																							},
																							"nextHandle": {
																								"dv": -0.032222222222222374,
																								"dt": 0.49000000000000005
																							}
																						},
																						{
																							"time": 1,
																							"value": 0.033333333333333326,
																							"mode": 2
																						}
																					]
																				}
																			]
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.2031330657866298,
																				"dt": -0.011491216884901312
																			},
																			"nextHandle": {
																				"dv": 0.1776762318069669,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.004036962159623458,
																				"dt": -0.8049999999999999
																			},
																			"nextHandle": {
																				"dv": 0.0016825760508064648,
																				"dt": 0.3333076171372348
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "emitter",
															"name": "LensFlare_blue",
															"props": {
																"alignMode": "Screen",
																"instScale_rand": 1,
																"maxCount": 5,
																"simulationSpace": "World",
																"animationSpeed": 0,
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
																"emitAngle": 0,
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"instScale": 3,
																"emitType": "Burst",
																"burstDelay": 0.12,
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instStretch_rand": [
																	1,
																	0.2,
																	0
																],
																"instOffset": [
																	0,
																	1,
																	0
																],
																"lifeTime": 0.08,
																"seedGroup": 2,
																"burstParticleCount": 2,
																"instStretch": [
																	2,
																	1,
																	1
																]
															},
															"x": 0.00002,
															"y": 0.85202,
															"z": -1.49261,
															"scaleX": 0.09999999999999999,
															"scaleY": 0.09999999999999998,
															"scaleZ": 0.09999999999999998,
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
																					"blend": "Add",
																					"shadows": false,
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 8
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.34901960784313724,
																					0.18823529411764706,
																					0.47058823529411764
																				]
																			},
																			"isInstance": true
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
																				"alpha": 0.2,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_Flare04.png",
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
																							"time": 0.0049999999999999975,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.03352751080665441,
																								"dt": -0.5098493884736074
																							},
																							"nextHandle": {
																								"dv": -0.032222222222222374,
																								"dt": 0.49000000000000005
																							}
																						},
																						{
																							"time": 1,
																							"value": 0.033333333333333326,
																							"mode": 2
																						}
																					]
																				}
																			]
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.2031330657866298,
																				"dt": -0.011491216884901312
																			},
																			"nextHandle": {
																				"dv": 0.1776762318069669,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.004036962159623458,
																				"dt": -0.8049999999999999
																			},
																			"nextHandle": {
																				"dv": 0.0016825760508064648,
																				"dt": 0.3333076171372348
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
													"name": "RocketExplosion",
													"scaleX": 0.2,
													"scaleY": 0.2,
													"scaleZ": 0.25,
													"children": [
														{
															"type": "object",
															"name": "DirectionalExplo_mesh",
															"x": 0.5,
															"z": -0.01699,
															"scaleZ": 1.2,
															"rotationY": -3.6,
															"children": [
																{
																	"type": "emitter",
																	"name": "DirectionalFire_Mesh",
																	"enabled": false,
																	"props": {
																		"enableSort": false,
																		"emitSurface": true,
																		"frameCount": 4,
																		"animationSpeed": 0,
																		"instSpeed": [
																			0,
																			0,
																			20
																		],
																		"instStretch": [
																			1.1,
																			1.1,
																			1.8
																		],
																		"lifeTime": 0.5,
																		"lifeTimeRand": 0.1,
																		"warmUpTime": -0.07,
																		"emitType": "Burst",
																		"instStretch_rand": [
																			0.2,
																			0.2,
																			0.55
																		],
																		"instScale": 7,
																		"instScale_rand": 1,
																		"seedGroup": 3,
																		"useRandomColor": true,
																		"randomColor1": [
																			0.8235294117647058,
																			0.7686274509803921,
																			0.7176470588235294,
																			1
																		],
																		"instSpeed_rand": [
																			0,
																			0,
																			5
																		],
																		"maxCount": 1,
																		"randomColor2": [
																			0.9764705882352941,
																			0.9647058823529412,
																			0.9529411764705882,
																			1
																		],
																		"instRotation_rand": [
																			0,
																			0,
																			0
																		],
																		"frameDivisionX": 2,
																		"frameDivisionY": 2,
																		"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2_02.png"
																	},
																	"scaleX": 0.1,
																	"scaleY": 0.1,
																	"scaleZ": 0.1,
																	"children": [
																		{
																			"type": "model",
																			"name": "CylinderCone_StraightUV",
																			"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
																			"scaleX": 0.5,
																			"scaleY": 0.2,
																			"scaleZ": 0.5,
																			"rotationX": 90,
																			"rotationZ": -90,
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
																							"depthTest": "Less",
																							"colorMask": 15,
																							"enableStencil": false,
																							"alphaKill": true,
																							"parallax": 0,
																							"textureWrap": true,
																							"emissive": 18
																						}
																					},
																					"wrapRepeat": true,
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
																					"name": "AlphaMult",
																					"source": "shaders/AlphaMult.hx",
																					"props": {
																						"alpha": 0.75
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
																										"dv": 0.029812589848475162,
																										"dt": -0.03384131820637717
																									},
																									"nextHandle": {
																										"dv": -0.6166666666666667,
																										"dt": 0.7
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
																					"type": "shader",
																					"name": "ColorSet",
																					"source": "shaders/ColorSet.hx",
																					"props": {
																						"amount": 1,
																						"color": [
																							1,
																							0.45098039215686275,
																							0.2901960784313725
																						]
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
																						"progress": 0.5,
																						"saturation": 0,
																						"width": 1,
																						"uvScaleX": 0.6,
																						"uvScaleY": 0.6,
																						"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																									"value": 0.5,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.0910902540606407,
																										"dt": -0.6285227530184213
																									},
																									"nextHandle": {
																										"dv": -0.016666666666666663,
																										"dt": 0.115
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.6166666666666667,
																										"dt": -0.2300000000000001
																									},
																									"nextHandle": {
																										"dv": -0.9111632769276069,
																										"dt": 0.3398392762594855
																									}
																								}
																							]
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instStretch.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.832419311974865,
																						"dt": -0.023411793149293023
																					},
																					"nextHandle": {
																						"dv": 0.5333333333333332,
																						"dt": 0.015
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.885
																					},
																					"nextHandle": {
																						"dv": -1.3607186657192811e-16,
																						"dt": 0.33333333333333326
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instSpeed.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 3.0890297805850073,
																						"dt": -0.11575828486016804
																					},
																					"nextHandle": {
																						"dv": -0.9363636363636363,
																						"dt": 0.03508928571428571
																					}
																				},
																				{
																					"time": 0.6549999999999999,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.009090909090909038,
																						"dt": -0.6245892857142856
																					},
																					"nextHandle": {
																						"dv": 0.008774267419493307,
																						"dt": 0.6028344762228577
																					}
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
																		}
																	]
																},
																{
																	"type": "emitter",
																	"name": "DirectionalSmoke_Mesh",
																	"props": {
																		"enableSort": false,
																		"emitSurface": true,
																		"frameCount": 4,
																		"animationSpeed": 0,
																		"instSpeed": [
																			0,
																			0,
																			20
																		],
																		"instStretch": [
																			1.1,
																			1.1,
																			2.75
																		],
																		"lifeTime": 1.25,
																		"lifeTimeRand": 0.1,
																		"warmUpTime": -0.08,
																		"emitType": "Burst",
																		"instStretch_rand": [
																			0.2,
																			0.2,
																			0.5
																		],
																		"instScale": 5,
																		"instScale_rand": 1,
																		"seedGroup": 3,
																		"useRandomColor": true,
																		"randomColor1": [
																			0.8235294117647058,
																			0.7686274509803921,
																			0.7176470588235294,
																			1
																		],
																		"instSpeed_rand": [
																			0,
																			0,
																			5
																		],
																		"maxCount": 1,
																		"randomColor2": [
																			0.9764705882352941,
																			0.9647058823529412,
																			0.9529411764705882,
																			1
																		],
																		"instRotation_rand": [
																			0,
																			0,
																			0
																		],
																		"frameDivisionX": 2,
																		"frameDivisionY": 2,
																		"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png"
																	},
																	"scaleX": 0.1,
																	"scaleY": 0.1,
																	"scaleZ": 0.1,
																	"children": [
																		{
																			"type": "model",
																			"name": "CylinderCone_StraightUV",
																			"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
																			"scaleX": 0.5,
																			"scaleY": 0.2,
																			"scaleZ": 0.5,
																			"rotationX": 90,
																			"rotationZ": -90,
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
																						"alpha": 0.65
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
																										"dv": 0.00782367857939008,
																										"dt": -0.03520655360725527
																									},
																									"nextHandle": {
																										"dv": -0.15000000000000002,
																										"dt": 0.674375
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
																									"mode": 0,
																									"prevHandle": {
																										"dv": -0.01666666666666672,
																										"dt": -0.15625
																									},
																									"nextHandle": {
																										"dv": 0.03384085855991686,
																										"dt": 0.3197961133912159
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
																							0.2392156862745098,
																							0.2392156862745098,
																							0.2392156862745098
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
																						"range": 0.1,
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
																						"progress": 0.5,
																						"saturation": 0.1,
																						"width": 1,
																						"uvScaleX": 0.7,
																						"uvScaleY": 0.7,
																						"texture": "Fx/noise/causticTexture_03-2-Blured.png",
																						"uvShift": [
																							0,
																							0
																						],
																						"uvShiftSpeed": [
																							0,
																							0.05
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
																									"value": 1,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.17597127610376737,
																										"dt": -0.6268976711196711
																									},
																									"nextHandle": {
																										"dv": -0.1333333333333333,
																										"dt": 0.47500000000000003
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
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
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instStretch.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.832419311974865,
																						"dt": -0.023411793149293023
																					},
																					"nextHandle": {
																						"dv": 0.5333333333333332,
																						"dt": 0.015
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.885
																					},
																					"nextHandle": {
																						"dv": -1.3607186657192811e-16,
																						"dt": 0.33333333333333326
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instSpeed.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 3.0890297805850073,
																						"dt": -0.11575828486016804
																					},
																					"nextHandle": {
																						"dv": -0.9363636363636363,
																						"dt": 0.03508928571428571
																					}
																				},
																				{
																					"time": 0.6549999999999999,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.009090909090909038,
																						"dt": -0.6245892857142856
																					},
																					"nextHandle": {
																						"dv": 0.008774267419493307,
																						"dt": 0.6028344762228577
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
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "1-FireMainDoor_Anticipation",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.45,
										"instScale_rand": 0,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"lifeTime": 0.3,
										"instStretch": [
											1,
											3,
											1
										],
										"warmUpTime": -0.05,
										"instOffset": [
											-1.5,
											0,
											0
										],
										"instRotation": [
											90,
											-90,
											0
										]
									},
									"x": -2.1168,
									"y": -2.24779,
									"z": -0.0071,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/CylinderCone_Simple.fbx",
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
															"drawOrder": "-80",
															"depthWrite": "Off",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 0,
																		"dt": -0.63
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1833333333333333,
																		"dt": -0.5326143844963243
																	},
																	"nextHandle": {
																		"dv": -0.7106176262935818,
																		"dt": 0.31991713222538554
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
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
														"progress": 0.62,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.05
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.942491792923777,
																		"dt": -0.4808822806105675
																	},
																	"nextHandle": {
																		"dv": -1.1,
																		"dt": 0.18019275266053364
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.49096045782441833
																	},
																	"nextHandle": {
																		"dv": -7.865461723911139e-16,
																		"dt": 0.4224127050774995
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.5873478210854435,
																		"dt": -0.08620197733444586
																	},
																	"nextHandle": {
																		"dv": 0.11666666666666664,
																		"dt": 0.002615486322407691
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.03078505856283631,
																		"dt": -0.965
																	},
																	"nextHandle": {
																		"dv": 0.010496026753190169,
																		"dt": 0.33329640953501305
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.7802471753310349,
																		"dt": -0.32539568672798436
																	},
																	"nextHandle": {
																		"dv": 0.3592705056003452,
																		"dt": 0.1497744246303917
																	}
																},
																{
																	"time": 0.9988157293095565,
																	"value": 0.33,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.004945733028259125,
																		"dt": -0.8101962776676997
																	},
																	"nextHandle": {
																		"dv": 0.0023438876594651923,
																		"dt": 0.33300137006567876
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
															0.45098039215686275,
															0.2901960784313725
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
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7258769381228506,
														"dt": -0.02369471367090904
													},
													"nextHandle": {
														"dv": 0.42500000000000004,
														"dt": 0.01381683009026402
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.006249999999999978,
														"dt": -0.8224791275042761
													},
													"nextHandle": {
														"dv": 0.002537304423998331,
														"dt": 0.3334200117761281
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "1-FireMainDoor",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.45,
										"instScale_rand": 0,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"lifeTime": 6,
										"instStretch": [
											1,
											3,
											1
										],
										"warmUpTime": -0.25,
										"instOffset": [
											-1.5,
											0,
											0
										],
										"instRotation": [
											90,
											-90,
											0
										]
									},
									"x": -2.1168,
									"y": -2.24779,
									"z": -0.0071,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/CylinderCone_Simple.fbx",
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
															"drawOrder": "-80",
															"depthWrite": "Off",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 0,
																		"dt": -0.63
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 1.1833333333333333,
																		"dt": -0.5326143844963243
																	},
																	"nextHandle": {
																		"dv": -0.7106176262935818,
																		"dt": 0.31991713222538554
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
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
														"progress": 0.66,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.05
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.942491792923777,
																		"dt": -0.4808822806105675
																	},
																	"nextHandle": {
																		"dv": -1.1,
																		"dt": 0.18019275266053364
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.49096045782441833
																	},
																	"nextHandle": {
																		"dv": -7.865461723911139e-16,
																		"dt": 0.4224127050774995
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.648840347948921,
																		"dt": -0.016645246701604628
																	},
																	"nextHandle": {
																		"dv": 0.6888255777144666,
																		"dt": 0.0018497631910221503
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006489395378284302,
																		"dt": -0.9710203766739863
																	},
																	"nextHandle": {
																		"dv": -0.003474774353306732,
																		"dt": 0.3333322597043977
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.647007584240214,
																		"dt": -1.4767580173568582e-15
																	},
																	"nextHandle": {
																		"dv": 0.12354781622042693,
																		"dt": 0
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006489395378284302,
																		"dt": -0.9710203766739863
																	},
																	"nextHandle": {
																		"dv": -0.003474774353306732,
																		"dt": 0.3333322597043977
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.5873478210854435,
																		"dt": -0.08620197733444586
																	},
																	"nextHandle": {
																		"dv": 0.11666666666666664,
																		"dt": 0.002615486322407691
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.03078505856283631,
																		"dt": -0.965
																	},
																	"nextHandle": {
																		"dv": 0.010496026753190169,
																		"dt": 0.33329640953501305
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
															0.45098039215686275,
															0.2901960784313725
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
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8856956078152938,
														"dt": -0.008741136025810942
													},
													"nextHandle": {
														"dv": 0.3618749999999997,
														"dt": 0.0035714285714285587
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.1332393435959967
													},
													"nextHandle": {
														"dv": -1.2260459771389204e-16,
														"dt": 0.33333778335634656
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "2-FireMainDoor_Anticipation",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.4,
										"instScale_rand": 0,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"lifeTime": 0.3,
										"instStretch": [
											1,
											3,
											1
										],
										"warmUpTime": -0.05,
										"instOffset": [
											-1.5,
											0,
											0
										],
										"instRotation": [
											90,
											-90,
											0
										]
									},
									"x": -1.14048,
									"y": 3.24464,
									"z": -0.00479,
									"scaleX": 0.009999999999999998,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"rotationX": 2.426570649309934e-18,
									"rotationY": 1.2201100546061514e-16,
									"rotationZ": 7.76502607779179e-17,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/CylinderCone_Simple.fbx",
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
															"drawOrder": "-80",
															"depthWrite": "Off",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 0,
																		"dt": -0.63
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
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
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1833333333333333,
																		"dt": -0.5326143844963243
																	},
																	"nextHandle": {
																		"dv": -0.7106176262935818,
																		"dt": 0.31991713222538554
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
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
														"progress": 0.62,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.05
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.942491792923777,
																		"dt": -0.4808822806105675
																	},
																	"nextHandle": {
																		"dv": -1.1,
																		"dt": 0.18019275266053364
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.49096045782441833
																	},
																	"nextHandle": {
																		"dv": -7.865461723911139e-16,
																		"dt": 0.4224127050774995
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.5873478210854435,
																		"dt": -0.08620197733444586
																	},
																	"nextHandle": {
																		"dv": 0.11666666666666664,
																		"dt": 0.002615486322407691
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.03078505856283631,
																		"dt": -0.965
																	},
																	"nextHandle": {
																		"dv": 0.010496026753190169,
																		"dt": 0.33329640953501305
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.7802471753310349,
																		"dt": -0.32539568672798436
																	},
																	"nextHandle": {
																		"dv": 0.3592705056003452,
																		"dt": 0.1497744246303917
																	}
																},
																{
																	"time": 0.9988157293095565,
																	"value": 0.33,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.004945733028259125,
																		"dt": -0.8101962776676997
																	},
																	"nextHandle": {
																		"dv": 0.0023438876594651923,
																		"dt": 0.33300137006567876
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
															0.45098039215686275,
															0.2901960784313725
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
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.7258769381228506,
														"dt": -0.02369471367090904
													},
													"nextHandle": {
														"dv": 0.42500000000000004,
														"dt": 0.01381683009026402
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.006249999999999978,
														"dt": -0.8224791275042761
													},
													"nextHandle": {
														"dv": 0.002537304423998331,
														"dt": 0.3334200117761281
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "2-FireMainDoor",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.4,
										"instScale_rand": 0,
										"seedGroup": 3,
										"useRandomColor": true,
										"randomColor1": [
											0.8235294117647058,
											0.7686274509803921,
											0.7176470588235294,
											1
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"maxCount": 1,
										"randomColor2": [
											0.9764705882352941,
											0.9647058823529412,
											0.9529411764705882,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"lifeTime": 6,
										"instStretch": [
											1,
											3,
											1
										],
										"warmUpTime": -0.25,
										"instOffset": [
											-1.5,
											0,
											0
										],
										"instRotation": [
											90,
											-90,
											0
										]
									},
									"x": -1.14048,
									"y": 3.24464,
									"z": -0.00479,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/CylinderCone_Simple.fbx",
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
															"drawOrder": "-80",
															"depthWrite": "Off",
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 0,
																		"dt": -0.63
																	},
																	"nextHandle": {
																		"dv": -2.7211090888961944e-16,
																		"dt": 0.3332931287768935
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
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
																		"dv": 1.1833333333333333,
																		"dt": -0.5326143844963243
																	},
																	"nextHandle": {
																		"dv": -0.7106176262935818,
																		"dt": 0.31991713222538554
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
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
														"progress": 0.66,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.05
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.942491792923777,
																		"dt": -0.4808822806105675
																	},
																	"nextHandle": {
																		"dv": -1.1,
																		"dt": 0.18019275266053364
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.49096045782441833
																	},
																	"nextHandle": {
																		"dv": -7.865461723911139e-16,
																		"dt": 0.4224127050774995
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.648840347948921,
																		"dt": -0.016645246701604628
																	},
																	"nextHandle": {
																		"dv": 0.6888255777144666,
																		"dt": 0.0018497631910221503
																	}
																},
																{
																	"time": 1,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006489395378284302,
																		"dt": -0.9710203766739863
																	},
																	"nextHandle": {
																		"dv": -0.003474774353306732,
																		"dt": 0.3333322597043977
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.647007584240214,
																		"dt": -1.4767580173568582e-15
																	},
																	"nextHandle": {
																		"dv": 0.12354781622042693,
																		"dt": 0
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.006489395378284302,
																		"dt": -0.9710203766739863
																	},
																	"nextHandle": {
																		"dv": -0.003474774353306732,
																		"dt": 0.3333322597043977
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.5,
															0.05
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -4.5873478210854435,
																		"dt": -0.08620197733444586
																	},
																	"nextHandle": {
																		"dv": 0.11666666666666664,
																		"dt": 0.002615486322407691
																	}
																},
																{
																	"time": 1,
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.03078505856283631,
																		"dt": -0.965
																	},
																	"nextHandle": {
																		"dv": 0.010496026753190169,
																		"dt": 0.33329640953501305
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
															0.45098039215686275,
															0.2901960784313725
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
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8856956078152938,
														"dt": -0.008741136025810942
													},
													"nextHandle": {
														"dv": 0.3618749999999997,
														"dt": 0.0035714285714285587
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -1.1332393435959967
													},
													"nextHandle": {
														"dv": -1.2260459771389204e-16,
														"dt": 0.33333778335634656
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "2-FireMainDoor",
									"x": -1.4413,
									"y": 3.20786,
									"scaleX": 0.27000000000000013,
									"scaleY": 0.27,
									"scaleZ": 0.27,
									"rotationY": -89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "ExplosionSize",
											"y": 8.881784197001252e-16,
											"scaleX": 2.2,
											"scaleY": 2.2,
											"scaleZ": 2.2,
											"children": [
												{
													"type": "object",
													"name": "Anticipation",
													"enabled": false,
													"y": 0.16999999999999998,
													"z": 1.6399999999999997,
													"scaleX": 0.9999999999999999,
													"scaleY": 0.9999999999999999,
													"scaleZ": 0.9999999999999999,
													"children": [
														{
															"type": "emitter",
															"name": "LensFlare",
															"props": {
																"alignMode": "Screen",
																"instScale_rand": 0,
																"maxCount": 5,
																"simulationSpace": "World",
																"animationSpeed": 0,
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
																"emitAngle": 0,
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"instScale": 2,
																"emitType": "Burst",
																"burstDelay": 0.12,
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instOffset": [
																	0,
																	1,
																	0
																],
																"lifeTime": 0.04
															},
															"x": 0.00002,
															"y": 0.85202,
															"z": -1.49261,
															"scaleX": 0.09999999999999999,
															"scaleY": 0.09999999999999998,
															"scaleZ": 0.09999999999999998,
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
																					"blend": "Add",
																					"shadows": false,
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 12
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.6941176470588235,
																					0.4156862745098039,
																					0.2588235294117647
																				]
																			},
																			"isInstance": true
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
																				"texture": "Fx/Alphas/T_Flare02.png",
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
																							"time": 0.0049999999999999975,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.03352751080665441,
																								"dt": -0.5098493884736074
																							},
																							"nextHandle": {
																								"dv": -0.032222222222222374,
																								"dt": 0.49000000000000005
																							}
																						},
																						{
																							"time": 1,
																							"value": 0.033333333333333326,
																							"mode": 2
																						}
																					]
																				}
																			]
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.2031330657866298,
																				"dt": -0.011491216884901312
																			},
																			"nextHandle": {
																				"dv": 0.1776762318069669,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.004036962159623458,
																				"dt": -0.8049999999999999
																			},
																			"nextHandle": {
																				"dv": 0.0016825760508064648,
																				"dt": 0.3333076171372348
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "emitter",
															"name": "LensFlare_blue",
															"props": {
																"alignMode": "Screen",
																"instScale_rand": 1,
																"maxCount": 5,
																"simulationSpace": "World",
																"animationSpeed": 0,
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
																"emitAngle": 0,
																"emitRate": 1,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"instScale": 3,
																"emitType": "Burst",
																"burstDelay": 0.12,
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instStretch_rand": [
																	1,
																	0.2,
																	0
																],
																"instOffset": [
																	0,
																	1,
																	0
																],
																"lifeTime": 0.08,
																"seedGroup": 2,
																"burstParticleCount": 2,
																"instStretch": [
																	2,
																	1,
																	1
																]
															},
															"x": 0.00002,
															"y": 0.85202,
															"z": -1.49261,
															"scaleX": 0.09999999999999999,
															"scaleY": 0.09999999999999998,
															"scaleZ": 0.09999999999999998,
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
																					"blend": "Add",
																					"shadows": false,
																					"culling": "Back",
																					"depthTest": "Less",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": true,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 8
																				}
																			},
																			"wrapRepeat": true,
																			"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.34901960784313724,
																					0.18823529411764706,
																					0.47058823529411764
																				]
																			},
																			"isInstance": true
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
																				"alpha": 0.2,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_Flare04.png",
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
																							"time": 0.0049999999999999975,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.03352751080665441,
																								"dt": -0.5098493884736074
																							},
																							"nextHandle": {
																								"dv": -0.032222222222222374,
																								"dt": 0.49000000000000005
																							}
																						},
																						{
																							"time": 1,
																							"value": 0.033333333333333326,
																							"mode": 2
																						}
																					]
																				}
																			]
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.2031330657866298,
																				"dt": -0.011491216884901312
																			},
																			"nextHandle": {
																				"dv": 0.1776762318069669,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.004036962159623458,
																				"dt": -0.8049999999999999
																			},
																			"nextHandle": {
																				"dv": 0.0016825760508064648,
																				"dt": 0.3333076171372348
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
													"name": "RocketExplosion",
													"scaleX": 0.2,
													"scaleY": 0.2,
													"scaleZ": 0.25,
													"children": [
														{
															"type": "object",
															"name": "DirectionalExplo_mesh",
															"x": 0.5,
															"z": -0.01699,
															"scaleZ": 1.2,
															"rotationY": -3.6,
															"children": [
																{
																	"type": "emitter",
																	"name": "DirectionalFire_Mesh",
																	"enabled": false,
																	"props": {
																		"enableSort": false,
																		"emitSurface": true,
																		"frameCount": 4,
																		"animationSpeed": 0,
																		"instSpeed": [
																			0,
																			0,
																			20
																		],
																		"instStretch": [
																			1.1,
																			1.1,
																			1.8
																		],
																		"lifeTime": 0.5,
																		"lifeTimeRand": 0.1,
																		"warmUpTime": -0.07,
																		"emitType": "Burst",
																		"instStretch_rand": [
																			0.2,
																			0.2,
																			0.55
																		],
																		"instScale": 7,
																		"instScale_rand": 1,
																		"seedGroup": 3,
																		"useRandomColor": true,
																		"randomColor1": [
																			0.8235294117647058,
																			0.7686274509803921,
																			0.7176470588235294,
																			1
																		],
																		"instSpeed_rand": [
																			0,
																			0,
																			5
																		],
																		"maxCount": 1,
																		"randomColor2": [
																			0.9764705882352941,
																			0.9647058823529412,
																			0.9529411764705882,
																			1
																		],
																		"instRotation_rand": [
																			0,
																			0,
																			0
																		],
																		"frameDivisionX": 2,
																		"frameDivisionY": 2,
																		"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2_02.png"
																	},
																	"scaleX": 0.1,
																	"scaleY": 0.1,
																	"scaleZ": 0.1,
																	"children": [
																		{
																			"type": "model",
																			"name": "CylinderCone_StraightUV",
																			"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
																			"scaleX": 0.5,
																			"scaleY": 0.2,
																			"scaleZ": 0.5,
																			"rotationX": 90,
																			"rotationZ": -90,
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
																							"depthTest": "Less",
																							"colorMask": 15,
																							"enableStencil": false,
																							"alphaKill": true,
																							"parallax": 0,
																							"textureWrap": true,
																							"emissive": 18
																						}
																					},
																					"wrapRepeat": true,
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
																					"name": "AlphaMult",
																					"source": "shaders/AlphaMult.hx",
																					"props": {
																						"alpha": 0.75
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
																										"dv": 0.029812589848475162,
																										"dt": -0.03384131820637717
																									},
																									"nextHandle": {
																										"dv": -0.6166666666666667,
																										"dt": 0.7
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
																					"type": "shader",
																					"name": "ColorSet",
																					"source": "shaders/ColorSet.hx",
																					"props": {
																						"amount": 1,
																						"color": [
																							1,
																							0.45098039215686275,
																							0.2901960784313725
																						]
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
																						"progress": 0.5,
																						"saturation": 0,
																						"width": 1,
																						"uvScaleX": 0.6,
																						"uvScaleY": 0.6,
																						"texture": "Fx/noise/T_Noise_Wave_02.png",
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
																									"value": 0.5,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.0910902540606407,
																										"dt": -0.6285227530184213
																									},
																									"nextHandle": {
																										"dv": -0.016666666666666663,
																										"dt": 0.115
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.6166666666666667,
																										"dt": -0.2300000000000001
																									},
																									"nextHandle": {
																										"dv": -0.9111632769276069,
																										"dt": 0.3398392762594855
																									}
																								}
																							]
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instStretch.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.832419311974865,
																						"dt": -0.023411793149293023
																					},
																					"nextHandle": {
																						"dv": 0.5333333333333332,
																						"dt": 0.015
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.885
																					},
																					"nextHandle": {
																						"dv": -1.3607186657192811e-16,
																						"dt": 0.33333333333333326
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instSpeed.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 3.0890297805850073,
																						"dt": -0.11575828486016804
																					},
																					"nextHandle": {
																						"dv": -0.9363636363636363,
																						"dt": 0.03508928571428571
																					}
																				},
																				{
																					"time": 0.6549999999999999,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.009090909090909038,
																						"dt": -0.6245892857142856
																					},
																					"nextHandle": {
																						"dv": 0.008774267419493307,
																						"dt": 0.6028344762228577
																					}
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
																		}
																	]
																},
																{
																	"type": "emitter",
																	"name": "DirectionalSmoke_Mesh",
																	"props": {
																		"enableSort": false,
																		"emitSurface": true,
																		"frameCount": 4,
																		"animationSpeed": 0,
																		"instSpeed": [
																			0,
																			0,
																			20
																		],
																		"instStretch": [
																			1.1,
																			1.1,
																			2.75
																		],
																		"lifeTime": 1.25,
																		"lifeTimeRand": 0.1,
																		"warmUpTime": -0.08,
																		"emitType": "Burst",
																		"instStretch_rand": [
																			0.2,
																			0.2,
																			0.5
																		],
																		"instScale": 5,
																		"instScale_rand": 1,
																		"seedGroup": 3,
																		"useRandomColor": true,
																		"randomColor1": [
																			0.8235294117647058,
																			0.7686274509803921,
																			0.7176470588235294,
																			1
																		],
																		"instSpeed_rand": [
																			0,
																			0,
																			5
																		],
																		"maxCount": 1,
																		"randomColor2": [
																			0.9764705882352941,
																			0.9647058823529412,
																			0.9529411764705882,
																			1
																		],
																		"instRotation_rand": [
																			0,
																			0,
																			0
																		],
																		"frameDivisionX": 2,
																		"frameDivisionY": 2,
																		"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png"
																	},
																	"scaleX": 0.1,
																	"scaleY": 0.1,
																	"scaleZ": 0.1,
																	"children": [
																		{
																			"type": "model",
																			"name": "CylinderCone_StraightUV",
																			"source": "Fx/Meshes_Common/BendedCrossPlane.fbx",
																			"scaleX": 0.5,
																			"scaleY": 0.2,
																			"scaleZ": 0.5,
																			"rotationX": 90,
																			"rotationZ": -90,
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
																						"alpha": 0.65
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
																										"dv": 0.00782367857939008,
																										"dt": -0.03520655360725527
																									},
																									"nextHandle": {
																										"dv": -0.15000000000000002,
																										"dt": 0.674375
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
																									"mode": 0,
																									"prevHandle": {
																										"dv": -0.01666666666666672,
																										"dt": -0.15625
																									},
																									"nextHandle": {
																										"dv": 0.03384085855991686,
																										"dt": 0.3197961133912159
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
																							0.2392156862745098,
																							0.2392156862745098,
																							0.2392156862745098
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
																						"range": 0.1,
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
																						"progress": 0.5,
																						"saturation": 0.1,
																						"width": 1,
																						"uvScaleX": 0.7,
																						"uvScaleY": 0.7,
																						"texture": "Fx/noise/causticTexture_03-2-Blured.png",
																						"uvShift": [
																							0,
																							0
																						],
																						"uvShiftSpeed": [
																							0,
																							0.05
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
																									"value": 1,
																									"mode": 0,
																									"prevHandle": {
																										"dv": 0.17597127610376737,
																										"dt": -0.6268976711196711
																									},
																									"nextHandle": {
																										"dv": -0.1333333333333333,
																										"dt": 0.47500000000000003
																									}
																								},
																								{
																									"time": 1,
																									"value": 0,
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
																						}
																					]
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instStretch.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.832419311974865,
																						"dt": -0.023411793149293023
																					},
																					"nextHandle": {
																						"dv": 0.5333333333333332,
																						"dt": 0.015
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.885
																					},
																					"nextHandle": {
																						"dv": -1.3607186657192811e-16,
																						"dt": 0.33333333333333326
																					}
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "instSpeed.z",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 3.0890297805850073,
																						"dt": -0.11575828486016804
																					},
																					"nextHandle": {
																						"dv": -0.9363636363636363,
																						"dt": 0.03508928571428571
																					}
																				},
																				{
																					"time": 0.6549999999999999,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.009090909090909038,
																						"dt": -0.6245892857142856
																					},
																					"nextHandle": {
																						"dv": 0.008774267419493307,
																						"dt": 0.6028344762228577
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
									"name": "ElectricitySmallLight_01",
									"x": -1.24196,
									"y": -0.1196,
									"z": 0.00829,
									"scaleX": 3.38,
									"scaleY": 4.06,
									"scaleZ": 4.22,
									"rotationX": -91.1,
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
															"time": 0.36222080129049905,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.01476306734260043
															}
														},
														{
															"time": 0.43603613800350116,
															"value": 1.0338888888888889,
															"mode": 2
														},
														{
															"time": 0.5393776094017041,
															"value": 0.2713888888888889,
															"mode": 2
														},
														{
															"time": 0.6279560134573067,
															"value": 1.0338888888888889,
															"mode": 2
														},
														{
															"time": 0.7165344175129092,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3.135930325324609,
															"value": -0.016666666666666607,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.826820438121382
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.005369050903619499
															}
														},
														{
															"time": 3.2131028845879137,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.2616532211678804,
															"value": 0.5763888888888888,
															"mode": 2
														},
														{
															"time": 3.3263107104587055,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3.462809854517114,
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
													"time": 0.07841865152658054,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.08841865152658034,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.558987084873465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.568987084873463,
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
									"x": -2.71567,
									"y": -2.30367,
									"z": -0.00713,
									"scaleX": 1.95,
									"scaleY": 2.35,
									"scaleZ": 2.44,
									"rotationX": -91.1,
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
															"time": 4.435237890825473,
															"value": -0.016666666666666607,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.826820438121382
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.005369050903619499
															}
														},
														{
															"time": 4.512410450088777,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.628112072155968,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.143539866734822,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.216212623914507,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.352711767972916,
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
													"time": 0.07841865152658054,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.08841865152658034,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.558987084873465,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.568987084873463,
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
									"x": -2.94221,
									"y": -2.22255,
									"z": 0.16997,
									"scaleX": 5,
									"scaleY": 6.5,
									"scaleZ": 2.9,
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
															"time": 0.06610811384599682,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.06610811384599682,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.09732286769449552,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.09732286769449552,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.1762814122963684,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.1762814122963684,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.2900441033715021,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2900441033715021,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": -1.83545,
									"y": 3.4039,
									"z": 0.16997,
									"scaleX": 5,
									"scaleY": 6.5,
									"scaleZ": 2.9,
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
															"time": 0.16828291173767107,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.16828291173767107,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.19949766558616977,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.19949766558616977,
															"value": 0.5,
															"mode": 0
														},
														{
															"time": 0.2784562101880427,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.2784562101880427,
															"value": 0.25,
															"mode": 0
														},
														{
															"time": 0.3922189012631764,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3922189012631764,
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
										}
									]
								}
							]
						},
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
									"x": -0.8769,
									"y": -0.07794,
									"z": 1.01075,
									"scaleX": 7.48,
									"scaleY": 7.72,
									"scaleZ": 3.14,
									"rotationX": 90,
									"rotationZ": 70.5,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.2860869210560075,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5580400460560075,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.39234375000000005
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.39234375000000005
															}
														}
													]
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
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.32411161840171243,
															"value": 1,
															"mode": 2
														},
														{
															"time": 14.975230549980196,
															"value": 1,
															"mode": 0
														},
														{
															"time": 18.020686949325302,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 1.42914,
									"y": 0.25067,
									"z": 1.05705,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 4.73,
									"rotationX": -90,
									"rotationZ": 97.7,
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
												"alpha": 0.8
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.1330822380523915,
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
															"time": 1.9886173409093857,
															"value": 1,
															"mode": 2
														},
														{
															"time": 18.09617877968208,
															"value": 1,
															"mode": 0
														},
														{
															"time": 21.063611473284638,
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
							"name": "smoke",
							"children": [
								{
									"type": "emitter",
									"name": "Smoke",
									"props": {
										"instScale_rand": 2,
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
										"emitRate": 8,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 5,
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
										"lifeTime": 6,
										"instSpeed": [
											6,
											0,
											0
										],
										"instSpeed_rand": [
											1.5,
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
											0.15,
											0
										],
										"enableSort": false,
										"instAcceleration": [
											1,
											2.5,
											0
										]
									},
									"x": 4.440892098500626e-16,
									"y": 3.436180000000003,
									"z": -7.771561172376096e-16,
									"scaleX": 0.9999999999999999,
									"scaleZ": 0.9999999999999998,
									"rotationX": -2.981770013872047e-15,
									"rotationY": 2.385416011097638e-15,
									"rotationZ": 8.400000000000006,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 3.5480616649949086,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.8845942505213173,
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
													"time": 11.477061817084733,
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
											"name": "instSpeed.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.4260683760683762,
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
								},
								{
									"type": "emitter",
									"name": "Smoke",
									"props": {
										"instScale_rand": 2,
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
										"emitRate": 8,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 5,
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
											4.5,
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
											0.15,
											0
										],
										"enableSort": false,
										"instAcceleration": [
											1,
											2.5,
											0
										]
									},
									"x": -0.13149,
									"y": 0.38201,
									"z": -0.75772,
									"rotationY": 14.6,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 3.191981376950718,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.113531810463683,
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
													"time": 10.222043938583509,
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
											"name": "instSpeed.x",
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
								},
								{
									"type": "emitter",
									"name": "Smoke",
									"props": {
										"instScale_rand": 2,
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
										"emitRate": 8,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
										"instScale": 5,
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
										"lifeTime": 7,
										"instSpeed": [
											6,
											0,
											0
										],
										"instSpeed_rand": [
											1.5,
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
											0.15,
											0
										],
										"enableSort": false,
										"instAcceleration": [
											1,
											2.5,
											0
										]
									},
									"x": -0.98974,
									"y": -1.5326,
									"z": 1.83434,
									"rotationX": -46.2,
									"rotationY": -18.3,
									"rotationZ": -13.4,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 3.0723438998559263,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.24181673915592,
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
													"time": 10.188288803393204,
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
											"name": "instSpeed.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6455128205128207,
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Monument.root.B_ROOT"
				}
			]
		}
	]
}