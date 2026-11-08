{
	"type": "fx",
	"duration": 23,
	"cullingRadius": 30,
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
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 1.55707,
							"z": 3.80532,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"time": -0.4,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 7.5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base_Noflare",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": 1.42387,
							"y": 0.14025,
							"z": 2.98161,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.5,
							"rotationZ": -45
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
									"x": 3.67668,
									"y": 3.65669,
									"z": -2.72286,
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
												"warmUpTime": -4.9,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.6,
													1.2,
													1
												],
												"lifeTime": 0.15,
												"instScale": 3,
												"burstCount": 2,
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
									"x": -0.42225,
									"y": 2.76118,
									"z": -2.92461,
									"rotationX": -30.7,
									"rotationY": -57.7,
									"rotationZ": -71.9,
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
											"x": 0.13894,
											"y": 0.0928,
											"z": -0.1822,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 15.4,
											"rotationY": 8.9,
											"rotationZ": -7.4,
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
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"y": -0.22148,
									"z": 2.84354,
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"rotationY": -90,
									"time": 0.68
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"y": -0.58587,
									"z": 1.86957,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"rotationY": -90,
									"time": 0.815
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"y": -0.16018,
									"z": 0.83209,
									"scaleX": 0.35,
									"scaleY": 0.35,
									"scaleZ": 0.35,
									"rotationY": -90,
									"time": 0.925
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": 0.02531,
									"y": -0.81746,
									"z": -0.59616,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"rotationY": -90,
									"time": 0.97
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": 0.02531,
									"y": 0.07146,
									"z": -1.16101,
									"scaleX": 0.35,
									"scaleY": 0.35,
									"scaleZ": 0.35,
									"rotationY": -90,
									"time": 1
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails_Base",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": 0.22182,
									"y": -0.28058,
									"z": 2.11452,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.18,
									"rotationY": -90,
									"time": 1.00234
								},
								{
									"type": "subFX",
									"name": "FX_Directional_Explosion_trails_Base",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
									"x": 0.22182,
									"y": -0.73051,
									"z": 0.25324,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.25,
									"rotationY": -90,
									"time": 1.00234
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
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": -1.82333,
									"y": -0.22148,
									"z": 2.84354,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"rotationY": -90,
									"time": 0.68
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": -2.07216,
									"y": -0.22148,
									"z": 1.86957,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationY": -90,
									"time": 0.815
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": -2.24997,
									"y": -0.22148,
									"z": 0.83209,
									"scaleX": 0.3,
									"scaleY": 0.3,
									"scaleZ": 0.3,
									"rotationY": -90,
									"time": 0.925
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": -2.23028,
									"y": -0.22148,
									"z": -0.44046,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationY": -90,
									"time": 0.97
								},
								{
									"type": "subFX",
									"name": "01 - FX_Directional_Explosion_High",
									"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
									"x": -2.43926,
									"y": -0.22148,
									"z": -1.61508,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"rotationY": -90,
									"time": 1
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
									"type": "emitter",
									"name": "1-FireMainDoor_Anticipation",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.8,
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
										"lifeTime": 0.3,
										"instStretch": [
											1,
											1,
											6
										],
										"warmUpTime": -0.05,
										"instOffset": [
											0,
											0,
											1.5
										]
									},
									"x": 1.27183,
									"y": 0.07578,
									"z": 3.08241,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/Cronos_Explo_01.fbx",
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
															"emissive": 32
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
														"amount": 0.725,
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
										"instScale": 0.8,
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
											1,
											3
										],
										"warmUpTime": -0.25,
										"instOffset": [
											0,
											0,
											1.5
										]
									},
									"x": 1.27183,
									"y": 0.07578,
									"z": 3.08241,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/Cronos_Explo_01.fbx",
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
															"emissive": 32
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
														"amount": 0.725,
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
										"instScale": 0.25,
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
											2.5,
											0.9
										],
										"warmUpTime": -0.05,
										"instOffset": [
											0,
											0,
											-0.5
										],
										"instRotation": [
											90,
											0,
											90
										]
									},
									"x": -1.09023,
									"y": 0.18591,
									"z": -1.06549,
									"scaleX": 0.010000000000000002,
									"scaleY": 0.009999999999999998,
									"scaleZ": 0.009999999999999998,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/BendedPlane.fbx",
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
															"emissive": 32
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
														"alpha": 0.1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square02.jpg"
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
														"uvScaleX": 0.5,
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
														"amount": 0.725,
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
									"name": "2-FireMainDoor",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 4,
										"animationSpeed": 0,
										"emitType": "Burst",
										"instScale": 0.25,
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
										"warmUpTime": -0.25,
										"instOffset": [
											0,
											0,
											-0.5
										],
										"instStretch": [
											1,
											1.75,
											0.9
										],
										"instRotation": [
											90,
											0,
											90
										]
									},
									"x": -1.03262,
									"y": 0.26981,
									"z": -0.71764,
									"scaleX": 0.010000000000000002,
									"scaleY": 0.009999999999999997,
									"scaleZ": 0.009999999999999997,
									"children": [
										{
											"type": "model",
											"name": "Cronos_Explo_01",
											"source": "Fx/Meshes_Common/BendedPlane.fbx",
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
															"emissive": 32
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
														"texture": "Fx/Gradients/T_Square02.jpg"
													}
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.66,
														"saturation": 0.25,
														"width": 1,
														"uvScaleX": 0.5,
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
														"amount": 0.725,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
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
									"x": 1.50092,
									"y": 1.35287,
									"z": -1.46151,
									"scaleX": 4,
									"scaleY": 4.8,
									"scaleZ": 5,
									"rotationX": -83.2,
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
															"time": 4.974670965699966,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 4.984670965699966,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.298647081880384,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.71515912189712,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.72515912189712,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.110479995157618,
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
													"time": 4.3449451135381025,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.354945113538102,
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
									"name": "ElectricitySmallLight_02",
									"x": 0.05335,
									"y": 1.53792,
									"z": -1.47004,
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 2.67,
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
															"time": 5.153462709414365,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.163462709414365,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.413321175236941,
															"value": 0,
															"mode": 2
														},
														{
															"time": 8.229053459759221,
															"value": 0,
															"mode": 2
														},
														{
															"time": 8.23905345975922,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8.462191410656438,
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
									"x": -0.98311,
									"y": -0.37785,
									"z": 2.66907,
									"scaleX": 3.5,
									"scaleY": 7,
									"scaleZ": 0.75,
									"rotationX": 90,
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
									"x": 1.30759,
									"y": 0.23424,
									"z": 2.66907,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 0.86,
									"rotationX": 90,
									"rotationY": 180,
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Chronos.root.B_ROOT.B_Body"
				}
			]
		}
	]
}