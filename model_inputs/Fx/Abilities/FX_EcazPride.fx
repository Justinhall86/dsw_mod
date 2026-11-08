{
	"type": "fx",
	"cullingRadius": 5000,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"rotationZ": 90,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
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
					"name": "EcazPride",
					"z": 0.4,
					"children": [
						{
							"type": "object",
							"name": "Village",
							"enabled": false,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "object",
									"name": "Village",
									"editorOnly": true,
									"locked": true,
									"x": 0.19153000000000198,
									"y": -0.38359785714285977,
									"z": 1,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "object",
											"name": "group",
											"x": 0.096,
											"y": 0.393174,
											"z": -0.8080719999999999,
											"rotationZ": 6.599999999999998,
											"children": [
												{
													"type": "model",
													"name": "Village_Large_01",
													"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
													"x": -0.1421921619706209,
													"y": -0.1848820950609353,
													"scaleX": 1.25,
													"scaleY": 1.25,
													"scaleZ": 1.25,
													"rotationZ": 102.20000000000003,
													"children": [
														{
															"type": "shader",
															"name": "WindCloth",
															"source": "shaders/WindCloth.hx",
															"enabled": false,
															"props": {
																"speed": 2,
																"amount": 3.64,
																"zamount": 1,
																"freq": 9.09
															},
															"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
															"recursiveApply": false,
															"isInstance": true
														}
													]
												},
												{
													"type": "object",
													"name": "Decals",
													"x": -0.6033333333333332,
													"y": 1.2766666666666666,
													"children": [
														{
															"type": "tdecal",
															"name": "tdecal",
															"x": 0.33,
															"y": -1.08,
															"scaleX": 12.93,
															"scaleY": 12.93,
															"scaleZ": 0.44,
															"rotationZ": 93.5,
															"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
															"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Plants",
									"x": -0.014733076923077135,
									"y": 0.02950538461538453,
									"z": -1.053416153846154,
									"children": [
										{
											"type": "model",
											"name": "Bush03",
											"source": "Environment/Asset/Bush/Bush03.fbx",
											"x": 0.20626307692307713,
											"y": -9.236555384615386,
											"z": 0.5573361538461539,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush03",
											"source": "Environment/Asset/Bush/Bush03.fbx",
											"x": 8.583493076923077,
											"y": -0.6404453846153846,
											"z": 0.5573361538461539,
											"scaleY": 1.0000000000000004,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.426570649309933e-20,
											"rotationZ": 30.999999999999993
										},
										{
											"type": "model",
											"name": "Bush03",
											"source": "Environment/Asset/Bush/Bush03.fbx",
											"x": -6.869286923076922,
											"y": 7.610524615384616,
											"z": 0.5573361538461539,
											"scaleX": 0.9999999999999996,
											"scaleY": 1.0000000000000002,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099338e-20,
											"rotationZ": 127.6
										},
										{
											"type": "model",
											"name": "Bush04",
											"source": "Environment/Asset/Bush/Bush04.fbx",
											"x": 7.74717,
											"y": -7.91093,
											"z": -0.08638,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush04",
											"source": "Environment/Asset/Bush/Bush04.fbx",
											"x": -7.67441,
											"y": -0.04608,
											"z": -0.09262,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush05",
											"source": "Environment/Asset/Bush/Bush05.fbx",
											"x": 0.1113530769230771,
											"y": -7.869445384615383,
											"z": 0.24340615384615388,
											"scaleZ": 0.9999999999999996,
											"rotationX": -9.54166404439055e-15,
											"rotationY": 6.3611093629270335e-15,
											"rotationZ": -90
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": 0.20626,
											"y": 6.04461,
											"z": -0.38706,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationZ": -137.1
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": -0.39016,
											"y": 7.22158,
											"z": -0.38706,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationZ": 13.4
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": 1.22734,
											"y": 7.50885,
											"z": -0.38706,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": 6.937053076923077,
											"y": 0.6626246153846155,
											"z": -0.38706384615384604,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": 6.937053076923077,
											"y": 0.6626246153846155,
											"z": -0.38706384615384604,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush07",
											"source": "Environment/Asset/Bush/Bush07.fbx",
											"x": -6.80357,
											"y": -0.70141,
											"z": -0.19366,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.6352941176470588,
													0.20784313725490194
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.0219694481914594,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0011111111111110628,
																"dt": -0.31627922025280153
															},
															"nextHandle": {
																"dv": -8.233570609255697e-18,
																"dt": 0.01582939186979605
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveBurn",
											"source": "hrt.shader.DissolveBurn",
											"props": {
												"noiseScale": [
													1,
													1
												],
												"noiseOffset": [
													0,
													0
												],
												"dissolveWidth": 0.52,
												"alphaThreshold": 1,
												"dissolveAmmount": 1,
												"noise": "Fx/noise/clouds_Dissolve.png",
												"colorBurn": [
													1,
													0,
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "dissolveAmmount",
													"keys": [
														{
															"time": 0.29948194467657974,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
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
									"type": "advancedDecal",
									"name": "advancedDecal_Folliage",
									"locked": true,
									"x": -0.41996,
									"y": -0.40554,
									"z": -2.48186,
									"scaleX": 45,
									"scaleY": 45,
									"scaleZ": 7,
									"rotationZ": -46,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"albedoStrength": 2,
									"fadePower": 1.68,
									"renderMode": "BeforeTonemapping",
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
												"texture": "Fx/Alphas/T_VegetationDecal.png"
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/clouds_Dissolve.png",
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
													"keys": [
														{
															"time": 0.29948194467657974,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.29948194467657974,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
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
																"color": -14668531
															},
															{
																"position": 1,
																"color": -9143745
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 2,
												"color": [
													1,
													0.6352941176470588,
													0.20784313725490194
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9336255656671337,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9336255656671337,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0011111111111110628,
																"dt": -0.31627922025280153
															},
															"nextHandle": {
																"dv": -8.233570609255697e-18,
																"dt": 0.01582939186979605
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
							"name": "SPIRALES",
							"children": [
								{
									"type": "object",
									"name": "Spiralesflaretest3",
									"z": 1.7762949999999997,
									"children": [
										{
											"type": "object",
											"name": "flare",
											"z": 1.48035,
											"scaleX": 0.49999999999999994,
											"scaleY": 0.49999999999999994,
											"scaleZ": 0.49999999999999994,
											"children": [
												{
													"type": "emitter",
													"name": "emitter_FlareBlack",
													"props": {
														"lifeTime": 0.35,
														"alignMode": "Screen",
														"alignLockAxis": "Z",
														"burstDelay": 0.5,
														"instScale": 2,
														"instStretch": [
															30,
															8,
															1
														],
														"instRotation_rand": [
															0,
															0,
															0
														],
														"instStretch_rand": [
															0,
															0,
															0
														],
														"instScale_rand": 0,
														"useRandomColor": true,
														"randomColor1": [
															0.48627450980392156,
															0.48627450980392156,
															0.48627450980392156,
															1
														],
														"emitType": "Burst",
														"warmUpTime": -0.8
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"rotationX": 45,
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
																		"texture": "Fx/Alphas/T_Flare06_512.png"
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
																			0.6352941176470588,
																			0.20784313725490194
																		]
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.2334981930436706,
																		"dt": -0.4276798037244547
																	},
																	"nextHandle": {
																		"dv": -0.7166666666666667,
																		"dt": 0.24848342791614272
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5240317437099238
																	},
																	"nextHandle": {
																		"dv": -3.8880269028916045e-16,
																		"dt": 0.3333333333333333
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.2334981930436706,
																		"dt": -0.4276798037244547
																	},
																	"nextHandle": {
																		"dv": -0.7166666666666667,
																		"dt": 0.24848342791614272
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5240317437099238
																	},
																	"nextHandle": {
																		"dv": -3.8880269028916045e-16,
																		"dt": 0.3333333333333333
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "emitter_Flare",
													"props": {
														"lifeTime": 0.2,
														"alignMode": "Screen",
														"alignLockAxis": "Z",
														"burstDelay": 0.45,
														"instStretch": [
															32,
															4,
															1
														],
														"instRotation_rand": [
															0,
															0,
															0
														],
														"instStretch_rand": [
															0,
															0,
															0
														],
														"instScale_rand": 0,
														"useRandomColor": true,
														"randomColor1": [
															0.48627450980392156,
															0.48627450980392156,
															0.48627450980392156,
															1
														],
														"warmUpTime": -0.85,
														"emitType": "Burst",
														"instScale": 1.75
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"rotationX": 45,
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
																			"emissive": 6,
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
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.06196351517869349,
																						"dt": -0.49990757001492336
																					},
																					"nextHandle": {
																						"dv": -0.01666666666666672,
																						"dt": 0.13446288206139395
																					}
																				},
																				{
																					"time": 0.18100772585187647,
																					"value": 1,
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
															"name": "instScale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.2334981930436706,
																		"dt": -0.4276798037244547
																	},
																	"nextHandle": {
																		"dv": -0.7166666666666667,
																		"dt": 0.24848342791614272
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5240317437099238
																	},
																	"nextHandle": {
																		"dv": -3.8880269028916045e-16,
																		"dt": 0.3333333333333333
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.2334981930436706,
																		"dt": -0.4276798037244547
																	},
																	"nextHandle": {
																		"dv": -0.7166666666666667,
																		"dt": 0.24848342791614272
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5240317437099238
																	},
																	"nextHandle": {
																		"dv": -3.8880269028916045e-16,
																		"dt": 0.3333333333333333
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
														"amount": 0.75,
														"ATTENUATE": true,
														"emissiveMap": null
													}
												}
											]
										},
										{
											"type": "object",
											"name": "Twists",
											"z": -2.4727049999999995,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "model",
													"name": "TwistedCylinder",
													"source": "Fx/Meshes_Common/Spirale.fbx",
													"scaleZ": 0.75,
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
																	"emissive": 1
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
																"progress": 0.24,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl01v_A.png",
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
																"progress": 0.32,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/vGrad.png",
																"uvShift": [
																	0,
																	0.02
																],
																"uvShiftSpeed": [
																	0,
																	0
																]
															}
														},
														{
															"type": "shader",
															"name": "UVTransform",
															"source": "shaders/UVTransform.hx",
															"props": {
																"scaleX": 0.5,
																"scaleY": 0.75,
																"shiftX": 0,
																"shiftY": 1,
																"shiftSpeedX": -1,
																"shiftSpeedY": 0
															},
															"children": [
																{
																	"type": "curve",
																	"name": "shiftY",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.045839677201527707,
																			"value": -0.4948720932006838,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 5.71953178782954e-16,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 5.551115123125783e-17,
																				"dt": 0.5567216291312178
																			}
																		},
																		{
																			"time": 0.9541603227984723,
																			"value": 0.85,
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
																"range": 3,
																"power": 0.8
															}
														}
													]
												},
												{
													"type": "model",
													"name": "TwistedCylinder",
													"source": "Fx/Meshes_Common/Spirale.fbx",
													"scaleX": 0.9999999999999999,
													"scaleY": 0.9999999999999999,
													"scaleZ": 0.75,
													"rotationZ": 161.7,
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
																	"emissive": 0.5
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
																"progress": 0.24,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl01v_A.png",
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
																"progress": 0.32,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/vGrad.png",
																"uvShift": [
																	0,
																	0.02
																],
																"uvShiftSpeed": [
																	0,
																	0
																]
															}
														},
														{
															"type": "shader",
															"name": "UVTransform",
															"source": "shaders/UVTransform.hx",
															"props": {
																"scaleX": 0.5,
																"scaleY": 0.75,
																"shiftX": 0,
																"shiftY": 1,
																"shiftSpeedX": -1,
																"shiftSpeedY": 0
															},
															"children": [
																{
																	"type": "curve",
																	"name": "shiftY",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": -0.045839677201527707,
																			"value": -0.4948720932006838,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.03875677441527164,
																				"dt": -0.4999827835548465
																			},
																			"nextHandle": {
																				"dv": -0.04482906977335599,
																				"dt": 0.5783185888819978
																			}
																		},
																		{
																			"time": 0.9541603227984723,
																			"value": 0.85,
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
																"range": 3,
																"power": 0.8
															}
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
															}
														}
													]
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
														"texture": "Fx/Alphas/T_Wave.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.033072443657691325,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.22075258010862805,
																		"dt": -0.4990071868236272
																	},
																	"nextHandle": {
																		"dv": 0.16666666666666669,
																		"dt": 0.3770236961016922
																	}
																},
																{
																	"time": 0.7232904607729939,
																	"value": 1,
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
															0.996078431372549,
															0.6784313725490196,
															0.3058823529411765
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
														"progress": 0.26,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 0.05,
														"uvScaleY": 1,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0.1
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
											"type": "model",
											"name": "Elec02",
											"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
											"z": -2,
											"scaleX": 30,
											"scaleY": 30,
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
															"colorMask": 255,
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.8707221242167629,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.8707221242167629,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666663,
																		"dt": -0.861211311637784
																	},
																	"nextHandle": {
																		"dv": 0.006451568043787952,
																		"dt": 0.33333114543917053
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
														"progress": 0.2,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 1.25,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0.1,
															0
														],
														"uvShiftSpeed": [
															0.1,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.8566323641249167,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8566323641249167,
																	"value": -0.25,
																	"mode": 0,
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
													},
													"children": [
														{
															"type": "curve",
															"name": "uvShift.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.8566323641249167,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8566323641249167,
																	"value": -0.2,
																	"mode": 0,
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
																		"color": -90062
																	},
																	{
																		"position": 1,
																		"color": -11796593
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
													"name": "DissolveMap_Gradient",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 1,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 3,
														"uvScaleY": 0.5,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
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
															"keys": [
																{
																	"time": 0.8566323641249167,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.8566323641249167,
																	"value": 0.8,
																	"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.8566323641249167,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -3.100087368767569,
																"dt": -0.14429308231613439
															},
															"nextHandle": {
																"dv": 1,
																"dt": 0.046544843790482515
															}
														},
														{
															"time": 1.8566323641249167,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.9017386631089813
															},
															"nextHandle": {
																"dv": -5.262223968825359e-16,
																"dt": 0.33333337795849743
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
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 1.0948582827437208,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.6445580464174254,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"locked": true,
											"z": -1,
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 2.5,
											"rotationZ": -46,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"albedoStrength": 2,
											"fadePower": 3,
											"emissive": 15,
											"renderMode": "BeforeTonemapping",
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
														"alpha": 3,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.8207159534528676,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.933878028198484,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.4136463876384133,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.2732977340136189
																	},
																	"nextHandle": {
																		"dv": 0.033558271848666346,
																		"dt": 0.2748113211928393
																	}
																}
															]
														}
													]
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
																		"color": -4563960
																	},
																	{
																		"position": 0.8671875,
																		"color": -146088
																	},
																	{
																		"position": 1,
																		"color": -275084
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
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Slide",
											"z": -0.8,
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 2.5,
											"rotationZ": -30,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 8,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
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
																	"time": 1.2911867307556404,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3230343403399523,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5019176207378844,
																	"value": 0,
																	"mode": 2
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap-Slide",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.29,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl16u_A.png",
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
															"name": "uvShift.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.2374919464357004,
																	"value": 0.2245,
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
																	"time": 2.511984435366548,
																	"value": 1.189,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8641666666666666,
																		"dt": -0.4726623559831007
																	},
																	"nextHandle": {
																		"dv": 0.9541164671079538,
																		"dt": 0.521373034295613
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
															0.996078431372549,
															0.6784313725490196,
															0.3058823529411765
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.9814804109555237,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.9914804109555235,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Particles",
							"props": {
								"emitType": "Burst",
								"lifeTimeRand": 0.5,
								"burstParticleCount": 8,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instSpeed": [
									0,
									0,
									30
								],
								"instSpeed_rand": [
									0,
									0,
									15
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.15,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"lifeTime": 1.2,
								"emitShape": "Cylinder",
								"emitRad2": 0.45,
								"speedFactor": 0.5,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitAngle": 360,
								"warmUpTime": -0.44,
								"useRandomColor": true,
								"randomColor1": [
									1,
									0.6705882352941176,
									0.28627450980392155,
									1
								],
								"randomColor2": [
									1,
									0.9019607843137255,
									0.7843137254901961,
									1
								],
								"instScale": 0.9,
								"instOrbitSpeed": [
									0,
									0,
									0.2
								],
								"instOrbitSpeed_rand": [
									0,
									0,
									0.1
								]
							},
							"z": -0.14889,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 0.5,
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
															"mode": 0,
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
															"mode": 0,
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
											"mode": 0,
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
											"mode": 0,
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.844272778839864,
												"dt": -0.2607250047269874
											},
											"nextHandle": {
												"dv": -1.2,
												"dt": 0.11
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.835
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
				}
			]
		}
	]
}