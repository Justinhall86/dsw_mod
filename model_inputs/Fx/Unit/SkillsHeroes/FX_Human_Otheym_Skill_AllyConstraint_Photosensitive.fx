{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
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
			"scaleX": 0.6,
			"scaleY": 0.6,
			"scaleZ": 0.6,
			"children": [
				{
					"type": "object",
					"name": "Otheym",
					"editorOnly": true,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"children": [
						{
							"type": "model",
							"name": "Female01_Infiltrator",
							"source": "Character/Fremen/Unit/Infiltrator/Female01_Infiltrator.fbx",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/DualSwords/Anim_Female01_DualSwords_Idle.fbx",
									"loop": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "ally",
					"children": [
						{
							"type": "object",
							"name": "Passive",
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 1.1,
									"rotationY": -38.3155323490468,
									"rotationZ": 42.31532939996876,
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "Glow",
											"z": 2.220446049250313e-16,
											"scaleX": 1.9999999999999998,
											"scaleY": 2.0000000000000004,
											"scaleZ": 2.0000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": 1.1682520729385802e-17,
											"rotationZ": -89.99999999999999,
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
															"emissive": 1,
															"drawOrder": "100"
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.75,
														"color": [
															0.9882352941176471,
															0.5176470588235293,
															0.2
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 0.5
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "WhiteFlames",
											"y": -0.009999999999999787,
											"z": 0.27735,
											"scaleX": 1.5000000000000002,
											"scaleY": 1.5000000000000004,
											"scaleZ": 1.5000000000000004,
											"rotationX": -89.99999999999999,
											"rotationY": -4.882868236569899e-18,
											"rotationZ": -89.99999999999999,
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
															"emissive": 2,
															"drawOrder": "100"
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
														"texture": "Fx/Alphas/FireMask03.png"
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
														"progress": 0.25,
														"saturation": 0.75,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/FireMask05.png",
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
													"name": "UVDistortion",
													"source": "shaders/UVDistortion.hx",
													"props": {
														"noiseTexture": "Fx/noise/T_Fire.png",
														"directionalNoise": false,
														"intensity": 0.3,
														"scrollSpeed": [
															0,
															1
														],
														"scale": [
															1.25,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
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
															0.6980392156862745,
															0.34901960784313724
														]
													}
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
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.8683242346823141,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.056710907461209936
													}
												},
												{
													"time": 1.132244135375164,
													"value": 1,
													"prevHandle": {
														"dv": 0.40844782039338057,
														"dt": -0.1405444228386507
													},
													"nextHandle": {
														"dv": -0.40844782039338057,
														"dt": 0.1405444228386507
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_WhiteFlames",
									"enabled": false,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 1.5,
									"albedoMap": "Fx/Alphas/T_circle.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.4
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.8694868087836278,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.056710907461209936
															}
														},
														{
															"time": 1.1334067094764777,
															"value": 1,
															"prevHandle": {
																"dv": 0.40844782039338057,
																"dt": -0.1405444228386507
															},
															"nextHandle": {
																"dv": -0.40844782039338057,
																"dt": 0.1405444228386507
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
												"progress": 0.38,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
													1,
													0.6980392156862745,
													0.34901960784313724
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "FlashDecals",
									"enabled": false,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.8447844531844578,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8647829839044451,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9065689358341508,
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
															0,
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_White",
											"y": 0.25,
											"scaleX": 2.5,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationX": 180,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.9048762102821043,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9367238198664162,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1319500103926499,
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
															0.6980392156862745,
															0.34901960784313724
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.9045967308844817,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9766086165682425,
																	"value": 1,
																	"mode": 2
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
														"amount": 0.6,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Particles",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"lifeTimeRand": 0.3,
								"burstParticleCount": 10,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.12,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"lifeTime": 0.9,
								"emitShape": "Cylinder",
								"emitRad2": 0.55,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360,
								"warmUpTime": -0.85,
								"useRandomColor": true,
								"randomColor1": [
									1,
									0.9490196078431372,
									0.8784313725490196,
									1
								],
								"randomColor2": [
									1,
									0.9019607843137255,
									0.7843137254901961,
									1
								],
								"instScale": 0.85,
								"seedGroup": 1,
								"emitOrientation": "Normal",
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
								},
								"instSpeed_rand": [
									0,
									0,
									10
								],
								"instSpeed": [
									0,
									0,
									25
								]
							},
							"scaleX": 1.9,
							"scaleY": 1.9,
							"scaleZ": 0.17,
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
													"emissive": 50
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
											"children": [
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
															"time": 0.065,
															"value": 1,
															"prevHandle": {
																"dv": 0.11089160652646488,
																"dt": -0.015692208470726162
															},
															"nextHandle": {
																"dv": -0.8833333333333333,
																"dt": 0.12500000000000003
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.8384636488340191
															},
															"nextHandle": {
																"dv": 0.006154423696995358,
																"dt": 0.30991955512506614
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
												"envBlend": 0.7,
												"envColorSet": false
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": -0.06666666666666667,
												"dt": -0.56
											},
											"nextHandle": {
												"dv": 0.03967621425974007,
												"dt": 0.3332801997818148
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
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"prevHandle": {
												"dv": 0.013194444444444398,
												"dt": -0.8841852909175679
											},
											"nextHandle": {
												"dv": -0.006407488794313876,
												"dt": 0.33335250704975594
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"keys": [
										{
											"time": 0,
											"value": 4,
											"prevHandle": {
												"dv": 4.093979236902871,
												"dt": -0.014066889347596315
											},
											"nextHandle": {
												"dv": -3.407170046487326,
												"dt": 0.011640960349275753
											}
										},
										{
											"time": 1,
											"value": -0.75,
											"prevHandle": {
												"dv": -0.2822334196776164,
												"dt": -1.1294089163140315
											},
											"nextHandle": {
												"dv": 0.07924705219885098,
												"dt": 0.33328592224694964
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
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
											"prevHandle": {
												"dv": 0.049851314927107426,
												"dt": -0.5043451509891843
											},
											"nextHandle": {
												"dv": -0.03306904715719971,
												"dt": 0.3331829822235662
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.77,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.ally.Passive",
					"target": ".FXRoot.Otheym.Female01_Infiltrator.root.B_ROOTJ.B_Spine01J.B_Spine02J"
				}
			]
		}
	]
}