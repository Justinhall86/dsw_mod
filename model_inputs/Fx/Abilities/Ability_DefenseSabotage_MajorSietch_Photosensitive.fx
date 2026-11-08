{
	"type": "fx",
	"cullingRadius": 45,
	"markers": [
		{
			"t": 0
		}
	],
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"locked": true,
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
			"name": "FXRoot",
			"rotationZ": 90,
			"children": [
				{
					"type": "reference",
					"name": "Prefab_SietchTabr",
					"source": "Structure/Base/SietchTabr/Prefab_SietchTabr.prefab",
					"enabled": false,
					"editorOnly": true,
					"locked": true,
					"z": -0.1
				},
				{
					"type": "model",
					"name": "MajorSietch_01",
					"source": "Structure/Sietch/MajorSietch/MajorSietch_01/MajorSietch_01.fbx",
					"editorOnly": true,
					"x": 0.02199,
					"y": 0.01227,
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"rotationZ": -180,
					"children": [
						{
							"type": "shader",
							"name": "SandBlend",
							"source": "shaders/SandBlend.hx",
							"props": {
								"colorMask": "Structure/Sietch/MajorSietch/MajorSietch_01/SietchMajor_MASK_Albedo.png"
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Sabotage",
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "object",
							"name": "Electricity",
							"x": -0.02171,
							"y": 1.67975,
							"z": -1.6,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Elec1",
									"props": {
										"emitRate": 1,
										"maxCount": 8,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 1,
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
										"instRotation": [
											90,
											0,
											90
										],
										"instScale": 8,
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
									"y": -4,
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
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
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
											],
											"loop": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Elec2",
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 1,
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
										"instScale": 7,
										"instOffset_rand": [
											0,
											-1,
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
									"y": -5,
									"z": 5,
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
											"name": "emitRate",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0560130294488403,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0660130294488404,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.166605823484578,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.3894939279714689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9104040015519286,
													"value": 3,
													"mode": 2
												},
												{
													"time": 2.006564579229347,
													"value": 3,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 2.3,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMax",
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
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
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
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"enabled": false,
											"keys": [
												{
													"time": 0.09960194232692691,
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
							"type": "model",
							"name": "Shield_Tabr",
							"source": "Fx/Meshes_Common/Shield_MajorSietch.fbx",
							"x": 0.51728,
							"y": 0.31308,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 3.5,
							"rotationZ": -180,
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
											"emissive": 5,
											"textureWrap": true
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
										"amount": 0.65,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.4980392156862745,
											0.788235294117647,
											0.9725490196078431
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
											"time": 0.9872448979591838,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.017857142857143,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.1785714285714286,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6071428571428572,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.618622448979592,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.733418367346939,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.743418367346939,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9400510204081634,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.2646336360648647,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3,
											"value": 0,
											"mode": 2
										}
									],
									"loop": true
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
										"saturation": 0,
										"width": 0.49,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.34,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.62,
										"saturation": 1,
										"width": 0.17,
										"uvScaleX": 4,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.05
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0.25,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": true,
										"bias": 0,
										"scale": 1,
										"power": 1,
										"color": [
											0,
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
										"alpha": 2
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