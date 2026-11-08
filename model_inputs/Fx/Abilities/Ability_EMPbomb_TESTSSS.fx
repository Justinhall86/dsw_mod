{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"enabled": false,
			"editorOnly": true,
			"x": 1.59326,
			"y": 0.05298,
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
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 1000,
			"scaleY": 1000,
			"scaleZ": 1000,
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
			"z": 0.5,
			"scaleX": 0.7,
			"scaleY": 0.7,
			"scaleZ": 0.7,
			"children": [
				{
					"type": "object",
					"name": "TestTextureScroll",
					"scaleX": 1.3333333333333333,
					"scaleY": 1.3333333333333333,
					"scaleZ": 1.3333333333333333,
					"children": [
						{
							"type": "object",
							"name": "Electricity",
							"z": 0.22499999999999964,
							"scaleX": 1.6999999999999997,
							"scaleY": 1.6999999999999997,
							"scaleZ": 1.6999999999999997,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_ElecRound",
									"enabled": false,
									"props": {
										"emitRate": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 1,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											90,
											90,
											360
										],
										"emitType": "InfinityRandom",
										"emitRateMin": 3,
										"emitRateChangeDelay": 0.05,
										"instScale": 2,
										"emitRateMax": 7,
										"lifeTimeRand": 0.05
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Swirl",
											"source": "Fx/Event/Swirl.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 4.5,
											"rotationX": 25.4,
											"rotationZ": -94.4,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 30
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_04.png",
														"speed": 20,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
															"value": 1,
															"mode": 2
														}
													]
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
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 0.1,
														"scaleY": 2,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													}
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
											"type": "curve",
											"name": "emitRateMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_ElecRound",
									"props": {
										"emitRate": 10,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.5,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											90,
											90,
											360
										],
										"emitRateMin": 3,
										"emitRateChangeDelay": 0.05,
										"instScale": 2,
										"emitRateMax": 7,
										"lifeTimeRand": 0.05,
										"useRandomColor": true,
										"randomColor1": [
											0.9764705882352941,
											0.34901960784313724,
											0.34901960784313724,
											1
										],
										"randomColor2": [
											0.5098039215686274,
											0.8470588235294118,
											0.9882352941176471,
											1
										]
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Swirl",
											"source": "Fx/Event/Swirl.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 4.5,
											"rotationX": 25.4,
											"rotationZ": -94.4,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 30
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_06.png",
														"speed": 20,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
															"value": 1,
															"mode": 2
														}
													]
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
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 0.25,
														"scaleY": 8,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													}
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
											"type": "curve",
											"name": "emitRateMax",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Elec2",
									"enabled": false,
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.5,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"emitType": "InfinityRandom",
										"emitRateMin": 1,
										"emitRateChangeDelay": 0.1,
										"lifeTimeRand": 0.05,
										"warmUpTime": -0.6,
										"seedGroup": 1,
										"instRotation": [
											90,
											0,
											90
										],
										"instScale": 1.5
									},
									"z": 0.25,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Overlord_Electricity_02",
											"source": "Fx/Meshes_Common/ElectricityCarthag.fbx",
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
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3267006990762992e-16,
																		"dt": -0.325
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.345
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0.2,
															0.2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 0,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
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
											"type": "curve",
											"name": "emitRateMax",
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.0564487560231535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"loop": true,
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0564487560231535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
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
							"name": "Floor",
							"z": 0.22499999999999964,
							"children": [
								{
									"type": "object",
									"name": "ElecFloor",
									"children": [
										{
											"type": "model",
											"name": "DiskFlatStraight01_MoreVrtx",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 100,
											"scaleY": 100,
											"scaleZ": 100,
											"rotationZ": 29.999999999999993,
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
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.33,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 4,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/causticTexture_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-0.25
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.22,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	-0.5
																]
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -11261006
																			},
																			{
																				"position": 0.67578125,
																				"color": -11796492
																			}
																		],
																		"resolution": 64,
																		"isVertical": false,
																		"interpolation": "Linear",
																		"colorMode": 0
																	}
																}
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "DiskFlatStraight01_MoreVrtx",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 120,
											"scaleY": 120,
											"scaleZ": 120,
											"rotationZ": 45.00000000000001,
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
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															}
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
																"uvScaleX": 4,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/causticTexture_02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-0.25
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.22,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 4,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	-0.5
																]
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "hrt.shader.GradientMap",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -11261006
																			},
																			{
																				"position": 0.67578125,
																				"color": -11796492
																			}
																		],
																		"resolution": 64,
																		"isVertical": false,
																		"interpolation": "Linear",
																		"colorMode": 0
																	}
																}
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
												"alpha": 0.6
											}
										}
									]
								},
								{
									"type": "object",
									"name": "SandFloor",
									"children": [
										{
											"type": "model",
											"name": "DiskFlatStraight01_MoreVrtx",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 150,
											"scaleY": 150,
											"scaleZ": 150,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															}
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
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0,
																	-0.5
																]
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.9686274509803922,
																	0.8549019607843137,
																	0.7764705882352941
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 0.7,
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
									"type": "object",
									"name": "group",
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"scaleX": 29.999999999999982,
											"scaleY": 29.99999999999999,
											"scaleZ": 29.999999999999996,
											"rotationY": -26.537896852379916,
											"rotationZ": -128.330162166092,
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"enabled": false,
													"rotationX": 90,
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
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 1
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
																"texture": "Fx/Alphas/T_circle2.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.44313725490196076,
																	0.8117647058823529,
																	1
																]
															}
														},
														{
															"type": "curve",
															"name": "scale",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.125,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.25,
																	"value": 0.5,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 4,
																"power": 0.8
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": 90,
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
																	"culling": "Back",
																	"colorMask": 255,
																	"emissive": 1
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
																"texture": "Fx/Alphas/T_circle2.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.44313725490196076,
																	0.8117647058823529,
																	1
																]
															}
														},
														{
															"type": "curve",
															"name": "scale",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.125,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.25,
																	"value": 0.5,
																	"mode": 2
																}
															]
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 4,
																"power": 0.8
															}
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 31.42857142857146,
											"scaleY": 31.42857142857146,
											"scaleZ": 31.42857142857146,
											"albedoMap": "Fx/Gradients/circGrad01.png",
											"emissive": 0.2,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"enabled": false,
													"props": {
														"USE_ALPHA": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -11261006
																	},
																	{
																		"position": 1,
																		"color": -8734765
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"enabled": false,
													"props": {
														"alpha": 0.5
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.125,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 0.5,
															"mode": 2
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
															0.5568627450980392,
															0.9333333333333333,
															1
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 70.71428571428578,
											"scaleY": 70.71428571428578,
											"scaleZ": 70.71428571428578,
											"albedoMap": "Fx/Gradients/circGrad01.png",
											"emissive": 0.2,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"props": {
														"USE_ALPHA": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -11261006
																	},
																	{
																		"position": 1,
																		"color": -8734765
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.6
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.125,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 0.5,
															"mode": 2
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
															0.44313725490196076,
															0.8117647058823529,
															1
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "coolshockwave_a save",
									"enabled": false,
									"props": {
										"instScale_rand": 0,
										"maxCount": 50,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9098039215686274,
											0.615686274509804,
											1,
											0.8509803921568627
										],
										"emitRate": 10,
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
										"emitType": "Burst",
										"burstDelay": 0.3,
										"useRandomColor": true,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"warmUpTime": 1.1,
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instScale": 60,
										"lifeTime": 3,
										"speedFactor": 0.5
									},
									"z": 0.2,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
									"children": [
										{
											"type": "model",
											"name": "disk",
											"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
											"scaleX": 2.5,
											"scaleY": 2.5,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
															"blend": "Alpha",
															"shadows": false,
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None",
															"depthWrite": "On",
															"drawOrder": "100",
															"emissive": 2.2
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
														"intensity": 0.06
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8043636363636364,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5969588995728569,
																		"dt": -0.2623791435549754
																	},
																	"nextHandle": {
																		"dv": -0.5969588995728569,
																		"dt": 0.2623791435549754
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.08425454545454536,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -0.08425454545454536,
																		"dt": 0.2350000000000001
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 0.1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
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
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
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
															"name": "width",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5350976805491343,
																	"value": 0.9422222222222223,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03695353771889259
																	},
																	"nextHandle": {
																		"dv": -6.922428196740585e-16,
																		"dt": 0.24478506621704163
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": -0.8474237452673484,
																		"dt": 0.3135467857489186
																	}
																},
																{
																	"time": 2.0100000000000002,
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5609260576910832,
														"dt": -0.42893757473558736
													},
													"nextHandle": {
														"dv": 0.10885961743662093,
														"dt": 0.055
													}
												},
												{
													"time": 1,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -0.025293869065672436,
														"dt": -0.4
													},
													"nextHandle": {
														"dv": 0.025293869065672436,
														"dt": 0.4
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": -1.2849689113717753,
														"dt": -0.1579914406956294
													},
													"nextHandle": {
														"dv": 0.8168178569859157,
														"dt": 0.10234836610612127
													}
												},
												{
													"time": 1,
													"value": 1.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.22305240909264112,
														"dt": -0.7024756799240661
													},
													"nextHandle": {
														"dv": 0.22305240909264112,
														"dt": 0.7024756799240661
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "disk",
									"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
									"scaleX": 150,
									"scaleY": 150,
									"scaleZ": 0.6,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"culling": "None",
													"depthWrite": "On",
													"drawOrder": "100",
													"emissive": 2.2
												}
											},
											"diffuseMap": "Fx/noise/causticTexture_03-2.png"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/perlin1_normal.png",
												"intensity": 0.008
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.8043636363636364,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5969588995728569,
																"dt": -0.2623791435549754
															},
															"nextHandle": {
																"dv": -0.5969588995728569,
																"dt": 0.2623791435549754
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.08425454545454536,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.08425454545454536,
																"dt": 0.2350000000000001
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 1,
												"scaleY": 0.1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -1
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
												"progress": 0.7,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
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
													"name": "width",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5350976805491343,
															"value": 0.9422222222222223,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03695353771889259
															},
															"nextHandle": {
																"dv": -6.922428196740585e-16,
																"dt": 0.24478506621704163
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.5,
																"dt": -0.18500000000000005
															},
															"nextHandle": {
																"dv": -0.8474237452673484,
																"dt": 0.3135467857489186
															}
														},
														{
															"time": 2.0100000000000002,
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
							"type": "model",
							"name": "DiskFlatStraight01_MoreVrtx",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"z": -2.1083333333333334,
							"scaleX": 1.3333333333333333,
							"scaleY": 1.3333333333333333,
							"scaleZ": 1.3333333333333333,
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											}
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
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_02.png",
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1.5,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "DiskFlatStraight01_MoreVrtx",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"enabled": false,
							"z": -2.1083333333333334,
							"scaleX": 1.3333333333333333,
							"scaleY": 1.3333333333333333,
							"scaleZ": 1.3333333333333333,
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_02.png",
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 1.5,
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
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
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
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.5
												]
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
												"envBlend": 0.7,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9686274509803922,
													0.8549019607843137,
													0.7764705882352941
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
												"envBlend": 0.7,
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
					"type": "object",
					"name": "Electricity",
					"z": 1,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "emitter",
							"name": "emitter_ElecRound",
							"props": {
								"emitRate": 10,
								"frameCount": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
								"instScale_rand": 0.5,
								"enableSort": false,
								"animationSpeed": 0.7,
								"lifeTime": 0.15,
								"burstDelay": 2.2,
								"instRotation_rand": [
									90,
									90,
									360
								],
								"emitRateMin": 3,
								"emitRateChangeDelay": 0.05,
								"instScale": 2.25,
								"emitRateMax": 7,
								"lifeTimeRand": 0.05,
								"useRandomColor": true,
								"randomColor1": [
									0.9764705882352941,
									0.34901960784313724,
									0.34901960784313724,
									1
								],
								"randomColor2": [
									0.5098039215686274,
									0.8470588235294118,
									0.9882352941176471,
									1
								]
							},
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.010000000000000002,
							"children": [
								{
									"type": "model",
									"name": "Swirl",
									"source": "Fx/Event/Swirl.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 4.5,
									"rotationX": 25.4,
									"rotationZ": -94.4,
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
													"enableStencil": false,
													"parallax": 0,
													"emissive": 30
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_06.png",
												"speed": 20,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5,
													"value": 1,
													"mode": 2
												}
											]
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
												"width": 0.45,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													3
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.25,
												"scaleY": 8,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											}
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
									"type": "curve",
									"name": "emitRate",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8114307761116304,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.99136718991951,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 3.1787373685575373,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 3.188737368557537,
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
					"name": "Orb",
					"scaleX": 0.4,
					"scaleY": 0.4,
					"scaleZ": 0.4,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
							"rotationY": -26.537896852379916,
							"rotationZ": -128.330162166092,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"enabled": false,
									"rotationX": 90,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 1
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
												"texture": "Fx/Alphas/T_circle2.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.44313725490196076,
													0.8117647058823529,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.125,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 0.5,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 4,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": 90,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 1
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
												"texture": "Fx/Alphas/T_circle2.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.44313725490196076,
													0.8117647058823529,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.125,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 0.5,
													"mode": 2
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 4,
												"power": 0.8
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"scaleX": 31.42857142857146,
							"scaleY": 31.42857142857146,
							"scaleZ": 31.42857142857146,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"emissive": 0.2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"enabled": false,
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -11261006
													},
													{
														"position": 1,
														"color": -8734765
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 0.5
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.125,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 0.5,
											"mode": 2
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
											0.5490196078431373,
											0,
											0.9725490196078431
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 200,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"emissive": 0.2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -11261006
													},
													{
														"position": 1,
														"color": -8734765
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 0.6
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.125,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 0.5,
											"mode": 2
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
											0.44313725490196076,
											0.8117647058823529,
											1
										]
									}
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
									"keyMode": 1,
									"keys": [
										{
											"time": 1.4100520841118702,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.4100520841118702,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.4100520841118702,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.4100520841118702,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.4100520841118702,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 1.9100520841118702,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.9100520841118702,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.9100520841118702,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.9100520841118702,
											"value": 1,
											"mode": 1
										},
										{
											"time": 1.9100520841118702,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5166666666666666,
												"dt": -0.07982904118832179
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 0.8006906358195711
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 1,
							"keys": [
								{
									"time": 2.390566074757442,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5166666666666666,
										"dt": -0.07982904118832179
									},
									"nextHandle": {
										"dv": -0.016666666666666607,
										"dt": 0.8006906358195711
									}
								},
								{
									"time": 3.482944355824427,
									"value": 0,
									"mode": 0
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Sphere",
					"source": "Fx/Meshes_Common/Sphere.fbx",
					"enabled": false,
					"z": 2.19624,
					"scaleX": 10,
					"scaleY": 10,
					"scaleZ": 10,
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
									"emissive": 5
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.33,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/T_ElecNoise01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.5,
									0.25
								]
							}
						},
						{
							"type": "shader",
							"name": "GradientMap",
							"source": "hrt.shader.GradientMap",
							"props": {
								"USE_ALPHA": true,
								"gradient": {
									"type": "gradient",
									"data": {
										"stops": [
											{
												"position": 0,
												"color": -11261006
											},
											{
												"position": 0.67578125,
												"color": -11796492
											}
										],
										"resolution": 64,
										"isVertical": false,
										"interpolation": "Linear",
										"colorMode": 0
									}
								}
							}
						},
						{
							"type": "shader",
							"name": "UVDistortion",
							"source": "shaders/UVDistortion.hx",
							"enabled": false,
							"props": {
								"noiseTexture": "Fx/noise/causticTexture.png",
								"directionalNoise": false,
								"intensity": 0.15,
								"scrollSpeed": [
									0,
									0.2
								],
								"scale": [
									0.5,
									0.5
								]
							}
						}
					]
				}
			]
		}
	]
}