{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 1000,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 500,
			"scaleY": 500,
			"scaleZ": 500,
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
			"scaleX": 0.75,
			"scaleY": 0.75,
			"scaleZ": 0.75,
			"children": [
				{
					"type": "object",
					"name": "Teleport",
					"x": -0.18724666666666662,
					"y": -10.497554999999998,
					"z": 10.593928166666666,
					"children": [
						{
							"type": "object",
							"name": "MESH",
							"x": 0.18724666666666662,
							"y": 10.497554999999998,
							"z": -9.900830166666665,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "object",
									"name": "Fregate",
									"z": 2.772392,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "FolderRelay",
											"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
											"z": -0.5,
											"rotationZ": -90,
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
													}
												}
											]
										},
										{
											"type": "object",
											"name": "MagneticFieldTest",
											"z": 7.45625,
											"scaleX": 0.03,
											"scaleY": 0.03,
											"scaleZ": 0.03,
											"children": [
												{
													"type": "polygon",
													"name": "lighttrou",
													"scaleX": 45,
													"scaleY": 45,
													"scaleZ": 45,
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
																	"emissive": 15,
																	"drawOrder": "120"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.3,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Alphas/T_circle2.png",
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
																"useScale": false,
																"wrap": true,
																"progress": 1,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/circGrad05.jpg",
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
																			"time": 0.33088171333748917,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.33076511478532,
																			"value": 0.5,
																			"prevHandle": {
																				"dv": -0.019215986062000145,
																				"dt": -0.5503945329070634
																			},
																			"nextHandle": {
																				"dv": 0.012597404361133015,
																				"dt": 0.3608215819274848
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 0.5,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	0.98,
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
																			"time": 0.33088171333748917,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.33076511478532,
																			"value": 0.970407296131008,
																			"prevHandle": {
																				"dv": -0.019215986062000145,
																				"dt": -0.5503945329070634
																			},
																			"nextHandle": {
																				"dv": 0.012597404361133015,
																				"dt": 0.3608215819274848
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
															"enabled": false,
															"props": {
																"alpha": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.8563577459547873,
																			"value": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.17417503586800573
																			}
																		},
																		{
																			"time": 1.0158753652993064,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 4.248206073069827,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 4.7939242445116035,
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "TestBobine",
													"scaleX": 20,
													"scaleY": 20,
													"scaleZ": 20,
													"kind": 1,
													"args": [
														24,
														360,
														0,
														4
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
																	"emissive": 15
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
																"progress": 0.36,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl16u_A01.png",
																"uvShift": [
																	0,
																	0.05
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -13754522
																			},
																			{
																				"position": 0.5390625,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -5276929
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
															"props": {
																"noiseTexture": "Fx/noise/Water_03.png",
																"directionalNoise": false,
																"intensity": 0.1,
																"scrollSpeed": [
																	1,
																	0
																],
																"scale": [
																	1,
																	0.25
																]
															}
														},
														{
															"type": "shader",
															"name": "UVDistortion",
															"source": "shaders/UVDistortion.hx",
															"props": {
																"noiseTexture": "Fx/noise/T_ElecNoise01.png",
																"directionalNoise": false,
																"intensity": 0.14,
																"scrollSpeed": [
																	1,
																	0
																],
																"scale": [
																	1,
																	0.25
																]
															}
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 1,
																"power": 0.8
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "TestBobine",
													"scaleX": 19.999999999999996,
													"scaleY": 19.999999999999996,
													"scaleZ": 20,
													"rotationZ": -117.2951722981503,
													"kind": 1,
													"args": [
														24,
														360,
														0,
														4
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
																	"emissive": 16
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
																"progress": 0.34,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl16u_A01.png",
																"uvShift": [
																	0,
																	0.05
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
																	0.33725490196078434,
																	0.27058823529411763,
																	0.984313725490196
																]
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -13754522
																			},
																			{
																				"position": 0.5390625,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -5276929
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
															"props": {
																"noiseTexture": "Fx/Alphas/TS_Dust_01_1024.png",
																"directionalNoise": false,
																"intensity": 0.64,
																"scrollSpeed": [
																	0,
																	0
																],
																"scale": [
																	2,
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
																"range": 1,
																"power": 0.8
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.3840899670436799,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3841,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.04934391505281621,
																		"dt": -1.2198205706604734
																	},
																	"nextHandle": {
																		"dv": -0.020412582286901456,
																		"dt": 0.49840763926806253
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
														"range": 1,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecalLight_NoPhotosensitive",
											"z": 3.75,
											"scaleX": 10,
											"scaleY": 10,
											"scaleZ": 12,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadeStart": 0.5,
											"emissive": 5,
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
															"emissive": 4
														}
													}
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
															"enabled": false,
															"keys": [
																{
																	"time": 0.13303226684437075,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.18965710190413307,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.25224244591755496,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.13303226684437075,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.18965710190413307,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2522,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.33355307826639896,
																	"value": 0.15,
																	"mode": 2
																},
																{
																	"time": 2.2319912857007465,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.022852022494166513,
																		"dt": -1.618245368190491
																	},
																	"nextHandle": {
																		"dv": 0.010198749855793962,
																		"dt": 0.49999890124258484
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
															0.6823529411764706,
															0.4666666666666667,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.85,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.22005902992419057,
													"value": 2,
													"prevHandle": {
														"dv": 5.134628796573855,
														"dt": -0.05303249069610281
													},
													"nextHandle": {
														"dv": -0.6180235535074239,
														"dt": 0.0063056939880301865
													}
												},
												{
													"time": 0.2869615409761999,
													"value": 0.5,
													"prevHandle": {
														"dv": 1.9595362879724305e-17,
														"dt": -0.015493399073507545
													},
													"nextHandle": {
														"dv": -0.0028161802355345378,
														"dt": 0.016350542617711294
													}
												},
												{
													"time": 0.33390570076749204,
													"value": 1,
													"prevHandle": {
														"dv": -0.003072196620583223,
														"dt": -0.018694540934144216
													},
													"nextHandle": {
														"dv": -1.2647555766655998e-15,
														"dt": 0.5
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.17451601836131914,
													"value": 0.75,
													"prevHandle": {
														"dv": 4.120591253522506e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.001201624105667154,
														"dt": 0.027982523594835967
													}
												},
												{
													"time": 0.2414185294133287,
													"value": 0.75,
													"prevHandle": {
														"dv": 1.2768392941925776e-17,
														"dt": -0.015493399073507544
													},
													"nextHandle": {
														"dv": 0.0011463320886477835,
														"dt": 0.05512169936454242
													}
												},
												{
													"time": 0.28836268920462094,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.17451601836131914,
													"value": 0.75,
													"prevHandle": {
														"dv": 4.120591253522506e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.001201624105667154,
														"dt": 0.027982523594835967
													}
												},
												{
													"time": 0.2414185294133287,
													"value": 0.75,
													"prevHandle": {
														"dv": 1.2768392941925776e-17,
														"dt": -0.015493399073507544
													},
													"nextHandle": {
														"dv": 0.0011463320886477835,
														"dt": 0.05512169936454242
													}
												},
												{
													"time": 0.28836268920462094,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.1401457956680953,
													"value": 250,
													"prevHandle": {
														"dv": 219.1235188512015,
														"dt": -0.07933904769187754
													},
													"nextHandle": {
														"dv": -87.59227213137795,
														"dt": 0.03112605367094537
													}
												},
												{
													"time": 0.28779595382853435,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.3096720125184831,
														"dt": -0.19732797625644855
													},
													"nextHandle": {
														"dv": 1.4423076923076792,
														"dt": 0.44823178326686186
													}
												}
											]
										},
										{
											"type": "model",
											"name": "VerniusFregate_LightsPole",
											"source": "Fx/Meshes_Common/VerniusFregate_LightsPole.fbx",
											"z": -4.4,
											"rotationZ": -90,
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
															"colorMask": 255,
															"emissive": 8,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0.98,
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.33076511478532,
																	"value": 0.970407296131008,
																	"prevHandle": {
																		"dv": -0.019215986062000145,
																		"dt": -0.5503945329070634
																	},
																	"nextHandle": {
																		"dv": 0.012597404361133015,
																		"dt": 0.3608215819274848
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 0.38097602695950167,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.711741141744824,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.007095801529173107,
																		"dt": -0.5511986863006971
																	},
																	"nextHandle": {
																		"dv": -0.003624926927766687,
																		"dt": 0.36092073174754147
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
															0.33725490196078434,
															0.27058823529411763,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 4.215074536457805,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.252044177454332,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "VerniusFregate_Lights",
											"source": "Fx/Meshes_Common/VerniusFregate_Lights.fbx",
											"z": -4.55,
											"rotationZ": -90,
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
															"colorMask": 255,
															"emissive": 15,
															"alphaKill": true,
															"drawOrder": "100"
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
																	"time": 0.3840899670436799,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3841,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0.04934391505281621,
																		"dt": -1.2198205706604734
																	},
																	"nextHandle": {
																		"dv": -0.020412582286901456,
																		"dt": 0.49840763926806253
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0,
														"maxAlpha": 1,
														"frequency": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "frequency",
															"keys": [
																{
																	"time": 2.99,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 3,
																	"mode": 2
																},
																{
																	"time": 4,
																	"value": 3,
																	"mode": 2
																},
																{
																	"time": 4.01,
																	"value": 0,
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
														"amount": 0.7,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.27058823529411763,
															0.1764705882352941,
															0.996078431372549
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_flareVERTICAL",
									"props": {
										"lifeTime": 0.2,
										"lifeTimeRand": 0.01,
										"alignMode": "Axis",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.08,
										"instScale": 20,
										"instStretch": [
											20,
											1,
											0.5
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											2,
											0,
											0
										],
										"instScale_rand": 1.5,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -0.1,
										"instRotation": [
											0,
											90,
											90
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
									"z": 23.28018,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.125,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 90,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"emissive": 10
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Flare06_512.png"
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
																	"mode": 2
																},
																{
																	"time": 0.49516908212560384,
																	"value": 1
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "GradientMapLife",
													"source": "hrt.shader.GradientMapLife",
													"props": {
														"destAlpha": true,
														"sourceAlpha": false,
														"colorMult": false,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -100698849
																	},
																	{
																		"position": 1,
																		"color": -9088810
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.4588235294117647,
															0.3137254901960784,
															0.8392156862745098
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.004199086282278133,
														"dt": -0.4999955492057555
													},
													"nextHandle": {
														"dv": 0.008158757136418227,
														"dt": 0.9181344589749397
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.9119633826239109,
														"dt": -0.05526670140938583
													},
													"nextHandle": {
														"dv": 0.988022557178189,
														"dt": 0.059910080095429176
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_SpeedTrail",
									"props": {
										"lifeTime": 0.25,
										"lifeTimeRand": 0.01,
										"alignMode": "Axis",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.08,
										"instScale": 15,
										"instStretch": [
											25,
											1,
											1
										],
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											2,
											0,
											0
										],
										"instScale_rand": 1.5,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -0.05,
										"instRotation": [
											0,
											90,
											90
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
									"z": 67.9533,
									"scaleX": 0.125,
									"scaleY": 0.125,
									"scaleZ": 0.125,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"rotationX": 90,
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
															"emissive": 5
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
														"texture": "Fx/Alphas/DustMask.png"
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
																	"mode": 2
																},
																{
																	"time": 0.49516908212560384,
																	"value": 1
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
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
															0.4588235294117647,
															0.3137254901960784,
															0.8392156862745098
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
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
														"progress": 0.3,
														"saturation": 1,
														"width": 0.49,
														"uvScaleX": 0.25,
														"uvScaleY": 5,
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
												}
											]
										},
										{
											"type": "curve",
											"name": "instSretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 2.0012659838315885e-16,
														"dt": -0.4999969260617023
													},
													"nextHandle": {
														"dv": 0.021899007449874497,
														"dt": 0.31346493179395585
													}
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.7272834222178317,
														"dt": -0.2721299708078786
													},
													"nextHandle": {
														"dv": 0.6099110024766234,
														"dt": 0.23992986506628422
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "curve",
											"name": "position.z",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.1401457956680953,
													"value": 250,
													"prevHandle": {
														"dv": 219.1235188512015,
														"dt": -0.07933904769187754
													},
													"nextHandle": {
														"dv": -87.59227213137795,
														"dt": 0.03112605367094537
													}
												},
												{
													"time": 0.28779595382853435,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.3096720125184831,
														"dt": -0.19732797625644855
													},
													"nextHandle": {
														"dv": 1.4423076923076792,
														"dt": 0.44823178326686186
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
					"type": "object",
					"name": "SpeedTrail",
					"z": 40,
					"children": [
						{
							"type": "model",
							"name": "CylinderStraight",
							"source": "Fx/Meshes_Common/CylinderStraight.fbx",
							"z": -34.19188,
							"scaleX": 7.5,
							"scaleY": 7.5,
							"scaleZ": 30,
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.95,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.25,
										"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl07u_A.png",
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
											0.11372549019607843,
											0.11372549019607843,
											0.11372549019607843
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 4
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0.1401457956680953,
									"value": 250,
									"prevHandle": {
										"dv": 219.1235188512015,
										"dt": -0.07933904769187754
									},
									"nextHandle": {
										"dv": -87.59227213137795,
										"dt": 0.03112605367094537
									}
								},
								{
									"time": 0.28779595382853435,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.3096720125184831,
										"dt": -0.19732797625644855
									},
									"nextHandle": {
										"dv": 1.4423076923076792,
										"dt": 0.44823178326686186
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"prevHandle": {
										"dv": 5.516887892811622e-15,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.18627695068240335
									}
								},
								{
									"time": 0.17607048380315315,
									"value": 1,
									"prevHandle": {
										"dv": -0.4748338081671416,
										"dt": 0.002764402106313568
									},
									"nextHandle": {
										"dv": 0.26444386944798914,
										"dt": 2.552608229987661e-17
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
									"keys": [
										{
											"time": 0.03989908451841658,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1366102033180522,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.28626892652713437,
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
					"type": "curve",
					"name": "scale.y",
					"keys": [
						{
							"time": 0.07078316400352624,
							"value": 0.6,
							"mode": 2
						},
						{
							"time": 0.17598171845270116,
							"value": 1,
							"mode": 2
						}
					]
				}
			]
		}
	]
}