{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"enabled": false,
			"editorOnly": true,
			"x": 3.12448,
			"y": -8.68385,
			"z": 1.30829,
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
			"children": [
				{
					"type": "object",
					"name": "AttackDistance",
					"children": [
						{
							"type": "object",
							"name": "Common",
							"y": 0.1,
							"scaleX": 0.9999999999999999,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "model",
									"name": "Wraith_CylinderCones",
									"source": "Fx/Meshes_Common/Wraith_CylinderCones.fbx",
									"y": -0.94097,
									"scaleZ": 1.5,
									"rotationX": -90,
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
													"emissive": 2
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
												"texture": "Fx/Alphas/T_ValveAnticipation.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4139744343128946,
															"value": 0.8,
															"mode": 2
														},
														{
															"time": 0.4239744343128946,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5141632373113858,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5241632373113858,
															"value": 1,
															"mode": 2
														},
														{
															"time": 3,
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
													1,
													0.8784313725490196,
													0.32941176470588235
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
												"progress": 1,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.23093278463648836,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4600000000000003,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.05166666666666677
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333336
															}
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06666666666666667,
																"dt": -1.01
															},
															"nextHandle": {
																"dv": 0.00808337514477028,
																"dt": 0.12246313344327209
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
									"name": "Wraith_CylinderCones",
									"source": "Fx/Meshes_Common/Wraith_CylinderCones.fbx",
									"y": -0.94097,
									"scaleZ": 3,
									"rotationX": -90,
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
												"texture": "Fx/Alphas/T_ValveAnticipation_Grad.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.5284640827956448,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5284640827956448,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5384640827956448,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5384640827956448,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6374258454842581,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6374258454842581,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6374258454842581,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12249999999999994,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.25000000000000067,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.34000000000000086,
															"value": 0,
															"mode": 2
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
												"saturation": 1,
												"width": 0.68,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													5
												]
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
													"keys": [
														{
															"time": 0.5384640827956448,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.805000000000002,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.0800000000000027,
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
													1,
													0.8784313725490196,
													0.32941176470588235
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"editorOnly": true,
							"x": -0.03103,
							"y": -7.5,
							"z": 0.11921,
							"scaleX": 4000.000000000001,
							"scaleY": 4000.0000000000005,
							"rotationX": -90,
							"color": -14869219,
							"kind": 0,
							"args": [
								0
							]
						},
						{
							"type": "object",
							"name": "Anticipation",
							"y": 0.79973,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": 90,
							"rotationY": 30,
							"children": [
								{
									"type": "light",
									"name": "light_0",
									"z": 0.86632,
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
									"rotationZ": 12.7,
									"color": 12310016,
									"power": 2,
									"range": 15,
									"size": 4,
									"zNear": 0.02,
									"children": [
										{
											"type": "curve",
											"name": "power",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2,
													"value": 1.5,
													"mode": 2
												},
												{
													"time": 0.4,
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
							"name": "Valve",
							"y": 0.24194,
							"z": -3.67961,
							"children": [
								{
									"type": "object",
									"name": "Cylinder_1",
									"x": -3.37549,
									"z": 0.29517,
									"rotationY": -95.2,
									"children": [
										{
											"type": "object",
											"name": "Anticipation",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"warmUpTime": -0.1
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
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
																	"enabled": false,
																	"props": {
																		"scale": 2
																	},
																	"isInstance": true
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
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.46078431372549017,
																					"mode": 2
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
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
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67,
																	"sandBlend": 0.2,
																	"envBlend": 0.3
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
																					"time": 0,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.01666666666666672,
																						"dt": -0.8400000000000001
																					},
																					"nextHandle": {
																						"dv": 0.0062168210843131805,
																						"dt": 0.3133277826493882
																					}
																				}
																			]
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
															"type": "curve",
															"name": "instSpeed.z",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -3.1935734224323675,
																		"dt": -0.12282974701662937
																	},
																	"nextHandle": {
																		"dv": 1.96,
																		"dt": 0.075
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
											"name": "PoisonSmoke",
											"props": {
												"lifeTime": 4,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"simulationSpace": "World",
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0.08,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"lifeTimeRand": 1,
												"instSpeed": [
													0.01,
													0,
													1
												],
												"instSpeed_rand": [
													0.005,
													0.015,
													0.2
												],
												"instAcceleration": [
													0.2,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0.1,
													0.2
												],
												"enableSort": false,
												"speedFactor": 2,
												"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
												"instScale": 2.3,
												"seedGroup": 2,
												"tag": null,
												"instWorldSpeed": [
													-0.5,
													0,
													-3.5
												],
												"instWorldSpeed_rand": [
													0,
													0,
													-0.5
												],
												"emitRate": 6,
												"warmUpTime": 0.5
											},
											"y": -1.56837,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 180,
											"rotationY": 80.9,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"texture": "Fx/Alphas/TS_Dust_04.png"
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
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																	1,
																	1
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.2033971051919433e-16,
																				"dt": -0.5397630827254113
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.7749999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.7,
																				"dt": -0.14500000000000002
																			},
																			"nextHandle": {
																				"dv": -0.9143298895582741,
																				"dt": 0.18939690569421394
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.021504928795595086,
																				"dt": -0.4999895944975692
																			},
																			"nextHandle": {
																				"dv": -0.033333333333333326,
																				"dt": 0.7749999999999999
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
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																"range": 2,
																"power": 0.8
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
															"value": -0.026997755331088613,
															"mode": 0,
															"prevHandle": {
																"dv": -3.804478157639296,
																"dt": -0.1254911758516944
															},
															"nextHandle": {
																"dv": 0.8159708193041526,
																"dt": 0.026899705581763078
															}
														},
														{
															"time": 0.04804712461674793,
															"value": 0.8593153759820427,
															"mode": 0
														},
														{
															"time": 0.7252142857142857,
															"value": 0.15589225589225586,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.24173809523809522
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.24173809523809522
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.8583185031426556e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.14172795189504372
															}
														},
														{
															"time": 0.16999999999999998,
															"value": 1.0066758116140837,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.056666666666666664
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22999999999999998
															}
														},
														{
															"time": 0.8443367346938775,
															"value": 0.24709315375982055,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09289936401047516,
																"dt": -0.23928571428571432
															},
															"nextHandle": {
																"dv": 0.1080057274948862,
																"dt": 0.28240124663407146
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1.0333333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.851303742790108,
																"dt": -0.48341891108438234
															},
															"nextHandle": {
																"dv": -0.4666666666666668,
																"dt": 0.265
															}
														},
														{
															"time": 0.9884999999999998,
															"value": 0.1696969696969698,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3266666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3266666666666666
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.02097044130818415,
																"dt": 0.185
															}
														},
														{
															"time": 1,
															"value": 5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.11653217370911939,
																"dt": -0.63
															},
															"nextHandle": {
																"dv": 0.0569079520089358,
																"dt": 0.3076576075472631
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": -0.0039506172839506165,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7824074074074079,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7999999999999998,
															"value": 1.0025132275132276,
															"mode": 2
														},
														{
															"time": 1.2609876543209877,
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
									"type": "object",
									"name": "Cylinder_2",
									"x": 3.36881,
									"z": 0.2699,
									"rotationY": -90.9,
									"children": [
										{
											"type": "object",
											"name": "Anticipation",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"warmUpTime": -0.1
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
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
																	"enabled": false,
																	"props": {
																		"scale": 2
																	},
																	"isInstance": true
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
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.46078431372549017,
																					"mode": 2
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
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
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67,
																	"sandBlend": 0.2,
																	"envBlend": 0.3
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 1
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
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
																				}
																			]
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
															"type": "curve",
															"name": "instSpeed.z",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -3.1935734224323675,
																		"dt": -0.12282974701662937
																	},
																	"nextHandle": {
																		"dv": 1.96,
																		"dt": 0.075
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
											"name": "PoisonSmoke",
											"props": {
												"lifeTime": 4,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"simulationSpace": "World",
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0.08,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"lifeTimeRand": 1,
												"instSpeed": [
													0.01,
													0,
													1
												],
												"instSpeed_rand": [
													0.005,
													0.015,
													0.2
												],
												"instAcceleration": [
													0.2,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0.1,
													0.2
												],
												"enableSort": false,
												"speedFactor": 2,
												"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
												"instScale": 2.3,
												"seedGroup": 2,
												"tag": null,
												"instWorldSpeed": [
													-0.5,
													0,
													-3.5
												],
												"instWorldSpeed_rand": [
													0,
													0,
													-0.5
												],
												"emitRate": 6,
												"warmUpTime": 0.5
											},
											"y": -1.56837,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 180,
											"rotationY": 80.9,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"texture": "Fx/Alphas/TS_Dust_04.png"
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
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																	1,
																	1
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.2033971051919433e-16,
																				"dt": -0.5397630827254113
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.7749999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.7,
																				"dt": -0.14500000000000002
																			},
																			"nextHandle": {
																				"dv": -0.9143298895582741,
																				"dt": 0.18939690569421394
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.021504928795595086,
																				"dt": -0.4999895944975692
																			},
																			"nextHandle": {
																				"dv": -0.033333333333333326,
																				"dt": 0.7749999999999999
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
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																"range": 2,
																"power": 0.8
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
															"value": -0.026997755331088613,
															"mode": 0,
															"prevHandle": {
																"dv": -3.804478157639296,
																"dt": -0.1254911758516944
															},
															"nextHandle": {
																"dv": 0.8159708193041526,
																"dt": 0.026899705581763078
															}
														},
														{
															"time": 0.04804712461674793,
															"value": 0.8593153759820427,
															"mode": 0
														},
														{
															"time": 0.7252142857142857,
															"value": 0.15589225589225586,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.24173809523809522
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.24173809523809522
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.8583185031426556e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.14172795189504372
															}
														},
														{
															"time": 0.16999999999999998,
															"value": 1.0066758116140837,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.056666666666666664
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22999999999999998
															}
														},
														{
															"time": 0.8443367346938775,
															"value": 0.24709315375982055,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09289936401047516,
																"dt": -0.23928571428571432
															},
															"nextHandle": {
																"dv": 0.1080057274948862,
																"dt": 0.28240124663407146
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1.0333333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.851303742790108,
																"dt": -0.48341891108438234
															},
															"nextHandle": {
																"dv": -0.4666666666666668,
																"dt": 0.265
															}
														},
														{
															"time": 0.9884999999999998,
															"value": 0.1696969696969698,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3266666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3266666666666666
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.02097044130818415,
																"dt": 0.185
															}
														},
														{
															"time": 1,
															"value": 5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.11653217370911939,
																"dt": -0.63
															},
															"nextHandle": {
																"dv": 0.0569079520089358,
																"dt": 0.3076576075472631
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": -0.0039506172839506165,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7824074074074079,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7999999999999998,
															"value": 1.0025132275132276,
															"mode": 2
														},
														{
															"time": 1.2609876543209877,
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
									"type": "object",
									"name": "Cylinder_3",
									"x": -3.31065,
									"y": 0.24772,
									"z": 7.10397,
									"rotationY": 13.5,
									"children": [
										{
											"type": "object",
											"name": "Anticipation",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"warmUpTime": -0.1
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
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
																	"enabled": false,
																	"props": {
																		"scale": 2
																	},
																	"isInstance": true
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
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.46078431372549017,
																					"mode": 2
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
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
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67,
																	"sandBlend": 0.2,
																	"envBlend": 0.3
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 1
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
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
																				}
																			]
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
															"type": "curve",
															"name": "instSpeed.z",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -3.1935734224323675,
																		"dt": -0.12282974701662937
																	},
																	"nextHandle": {
																		"dv": 1.96,
																		"dt": 0.075
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
											"name": "PoisonSmoke",
											"props": {
												"lifeTime": 4,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"simulationSpace": "World",
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0.08,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"lifeTimeRand": 1,
												"instSpeed": [
													0.01,
													0,
													1
												],
												"instSpeed_rand": [
													0.005,
													0.015,
													0.2
												],
												"instAcceleration": [
													0.2,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0.1,
													0.2
												],
												"enableSort": false,
												"speedFactor": 2,
												"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
												"instScale": 2.3,
												"seedGroup": 2,
												"tag": null,
												"instWorldSpeed": [
													-0.5,
													0,
													-3.5
												],
												"instWorldSpeed_rand": [
													0,
													0,
													-0.5
												],
												"emitRate": 6,
												"warmUpTime": 0.5
											},
											"y": -1.56837,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": 180,
											"rotationY": 80.9,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"texture": "Fx/Alphas/TS_Dust_04.png"
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
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																	1,
																	1
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.2033971051919433e-16,
																				"dt": -0.5397630827254113
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.7749999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.7,
																				"dt": -0.14500000000000002
																			},
																			"nextHandle": {
																				"dv": -0.9143298895582741,
																				"dt": 0.18939690569421394
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.021504928795595086,
																				"dt": -0.4999895944975692
																			},
																			"nextHandle": {
																				"dv": -0.033333333333333326,
																				"dt": 0.7749999999999999
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
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																"range": 2,
																"power": 0.8
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
															"value": -0.026997755331088613,
															"mode": 0,
															"prevHandle": {
																"dv": -3.804478157639296,
																"dt": -0.1254911758516944
															},
															"nextHandle": {
																"dv": 0.8159708193041526,
																"dt": 0.026899705581763078
															}
														},
														{
															"time": 0.04804712461674793,
															"value": 0.8593153759820427,
															"mode": 0
														},
														{
															"time": 0.7252142857142857,
															"value": 0.15589225589225586,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.24173809523809522
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.24173809523809522
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.8583185031426556e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.14172795189504372
															}
														},
														{
															"time": 0.16999999999999998,
															"value": 1.0066758116140837,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.056666666666666664
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22999999999999998
															}
														},
														{
															"time": 0.8443367346938775,
															"value": 0.24709315375982055,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09289936401047516,
																"dt": -0.23928571428571432
															},
															"nextHandle": {
																"dv": 0.1080057274948862,
																"dt": 0.28240124663407146
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1.0333333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.851303742790108,
																"dt": -0.48341891108438234
															},
															"nextHandle": {
																"dv": -0.4666666666666668,
																"dt": 0.265
															}
														},
														{
															"time": 0.9884999999999998,
															"value": 0.1696969696969698,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3266666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3266666666666666
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.02097044130818415,
																"dt": 0.185
															}
														},
														{
															"time": 1,
															"value": 5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.11653217370911939,
																"dt": -0.63
															},
															"nextHandle": {
																"dv": 0.0569079520089358,
																"dt": 0.3076576075472631
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": -0.0039506172839506165,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7824074074074079,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7999999999999998,
															"value": 1.0025132275132276,
															"mode": 2
														},
														{
															"time": 1.2609876543209877,
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
									"type": "object",
									"name": "Cylinder_4",
									"x": 3.35589,
									"y": 0.24772,
									"z": 7.12179,
									"rotationY": -176.1,
									"children": [
										{
											"type": "object",
											"name": "Anticipation",
											"y": -1.5,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"children": [
												{
													"type": "emitter",
													"name": "Smoke_Anticipation",
													"props": {
														"alignMode": "Screen",
														"instScale_rand": 0.25,
														"maxCount": 50,
														"instRotation_rand": [
															0,
															0,
															180
														],
														"instStretch_rand": [
															0.1,
															0.1,
															0.1
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"animationSpeed": 0,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"emitAngle": 0,
														"instSpeed": [
															1.5,
															1.5,
															3
														],
														"instSpeed_rand": [
															-3,
															-3,
															0.5
														],
														"enableSort": false,
														"seedGroup": 2,
														"tag": null,
														"burstDelay": 0.4,
														"simulationSpace": "World",
														"lifeTime": 5,
														"lifeTimeRand": 0.2,
														"emitType": "Burst",
														"burstParticleCount": 8,
														"instScale": 1.75,
														"speedFactor": 1.25,
														"warmUpTime": -0.1
													},
													"scaleX": 0.5,
													"scaleY": 0.49999999999999983,
													"scaleZ": 0.4999999999999999,
													"rotationX": 89.99999999999999,
													"rotationY": -10.400000000000002,
													"rotationZ": 5.052623868479036e-17,
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
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
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
																	"enabled": false,
																	"props": {
																		"scale": 2
																	},
																	"isInstance": true
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
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "color.h",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8573547202779161,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 1.4058268495515969,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.s",
																			"keys": [
																				{
																					"time": 0,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.31063829787234043,
																					"mode": 2
																				}
																			]
																		},
																		{
																			"type": "curve",
																			"name": "color.l",
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.6647058823529411,
																					"mode": 2
																				},
																				{
																					"time": 0.265,
																					"value": 0.46078431372549017,
																					"mode": 2
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
																		"progress": 0.26,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/Wave_02.jpg.png",
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
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.1614372094585777,
																						"dt": -0.537585907497062
																					},
																					"nextHandle": {
																						"dv": -0.16666666666666674,
																						"dt": 0.5549999999999999
																					}
																				},
																				{
																					"time": 0.8423412877569597,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.35,
																						"dt": -0.2776587122430403
																					},
																					"nextHandle": {
																						"dv": -0.38337468689060245,
																						"dt": 0.30183149952022004
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
																						"dv": 0.44516906872488615,
																						"dt": -0.4813254700769495
																					},
																					"nextHandle": {
																						"dv": -0.30000000000000004,
																						"dt": 0.325048007965088
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.36666666666666664,
																						"dt": -0.2694946861267089
																					},
																					"nextHandle": {
																						"dv": -0.36666666666666664,
																						"dt": 0.2694946861267089
																					}
																				}
																			]
																		}
																	]
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"enabled": false,
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67
																},
																{
																	"type": "fakeLight",
																	"name": "FakeLight",
																	"props": {
																		"tag": "WIP"
																	},
																	"normalMap": "Fx/DistortionMaps/SphereClean.png",
																	"topBrighten": true,
																	"topIntensity": 0.3,
																	"topSpan": 0.4,
																	"dirIntensity": 0.45,
																	"dirSpan": 0.67,
																	"sandBlend": 0.2,
																	"envBlend": 0.3
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 1
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
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 0.0313895804049744,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.6699999999999999
																					},
																					"nextHandle": {
																						"dv": -2.5581510915522486e-16,
																						"dt": 0.3133333333333333
																					}
																				}
																			]
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
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
															"type": "curve",
															"name": "instSpeed.z",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.5486560128154876,
																		"dt": -0.2818717822267342
																	},
																	"nextHandle": {
																		"dv": -1.05,
																		"dt": 0.18900795442362628
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.026997755331088613,
																		"dt": -0.7749999999999999
																	},
																	"nextHandle": {
																		"dv": 0.012705940615832523,
																		"dt": 0.3333055879251503
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
																		"dv": 1.5993130932810984,
																		"dt": -0.2609824351224878
																	},
																	"nextHandle": {
																		"dv": -1.1166666666666667,
																		"dt": 0.1801190655347374
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.6821031566874849
																	},
																	"nextHandle": {
																		"dv": 0.008169502204984929,
																		"dt": 0.333315689963399
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "instSpeed.y",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016666666666666663,
																		"dt": -0.6732142677985959
																	},
																	"nextHandle": {
																		"dv": -0.008277702817786541,
																		"dt": 0.33331550012954636
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
																	"value": 0.1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -3.1935734224323675,
																		"dt": -0.12282974701662937
																	},
																	"nextHandle": {
																		"dv": 1.96,
																		"dt": 0.075
																	}
																},
																{
																	"time": 1,
																	"value": 2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7221031566874848
																	},
																	"nextHandle": {
																		"dv": -5.087740091982619e-16,
																		"dt": 0.30773741188524595
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"enabled": false,
															"keys": [
																{
																	"time": 0.2912301766458485,
																	"value": 1.8,
																	"mode": 2
																},
																{
																	"time": 0.3490079544236263,
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
											"name": "PoisonSmoke",
											"props": {
												"lifeTime": 4,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"simulationSpace": "World",
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0.08,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 0,
												"lifeTimeRand": 1,
												"instSpeed": [
													0.01,
													0,
													1
												],
												"instSpeed_rand": [
													0.005,
													0.015,
													0.2
												],
												"instAcceleration": [
													0.2,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0.1,
													0.2
												],
												"enableSort": false,
												"speedFactor": 2,
												"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
												"instScale": 2.3,
												"seedGroup": 2,
												"tag": null,
												"instWorldSpeed": [
													-0.5,
													0,
													-3.5
												],
												"instWorldSpeed_rand": [
													0,
													0,
													-0.5
												],
												"emitRate": 6,
												"warmUpTime": 0.5
											},
											"y": -1.56837,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -180,
											"rotationY": 61.3,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"texture": "Fx/Alphas/TS_Dust_04.png"
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
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																	1,
																	1
																]
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.35000000000000003,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.35,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.2033971051919433e-16,
																				"dt": -0.5397630827254113
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.7749999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.7,
																				"dt": -0.14500000000000002
																			},
																			"nextHandle": {
																				"dv": -0.9143298895582741,
																				"dt": 0.18939690569421394
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.021504928795595086,
																				"dt": -0.4999895944975692
																			},
																			"nextHandle": {
																				"dv": -0.033333333333333326,
																				"dt": 0.7749999999999999
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
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 1
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.06,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.016666666666666663,
																				"dt": -0.6128395061728396
																			},
																			"nextHandle": {
																				"dv": -0.00852804832550275,
																				"dt": 0.31332681255181
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
																"range": 2,
																"power": 0.8
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
															"value": -0.026997755331088613,
															"mode": 0,
															"prevHandle": {
																"dv": -3.804478157639296,
																"dt": -0.1254911758516944
															},
															"nextHandle": {
																"dv": 0.8159708193041526,
																"dt": 0.026899705581763078
															}
														},
														{
															"time": 0.04804712461674793,
															"value": 0.8593153759820427,
															"mode": 0
														},
														{
															"time": 0.7252142857142857,
															"value": 0.15589225589225586,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.24173809523809522
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.24173809523809522
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.8583185031426556e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.14172795189504372
															}
														},
														{
															"time": 0.16999999999999998,
															"value": 1.0066758116140837,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.056666666666666664
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22999999999999998
															}
														},
														{
															"time": 0.8443367346938775,
															"value": 0.24709315375982055,
															"mode": 0,
															"prevHandle": {
																"dv": -0.09289936401047516,
																"dt": -0.23928571428571432
															},
															"nextHandle": {
																"dv": 0.1080057274948862,
																"dt": 0.28240124663407146
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1.0333333333333334,
															"mode": 0,
															"prevHandle": {
																"dv": 0.851303742790108,
																"dt": -0.48341891108438234
															},
															"nextHandle": {
																"dv": -0.4666666666666668,
																"dt": 0.265
															}
														},
														{
															"time": 0.9884999999999998,
															"value": 0.1696969696969698,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3266666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3266666666666666
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.02097044130818415,
																"dt": 0.185
															}
														},
														{
															"time": 1,
															"value": 5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.11653217370911939,
																"dt": -0.63
															},
															"nextHandle": {
																"dv": 0.0569079520089358,
																"dt": 0.3076576075472631
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": -0.0039506172839506165,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7824074074074079,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7999999999999998,
															"value": 1.0025132275132276,
															"mode": 2
														},
														{
															"time": 1.2609876543209877,
															"value": 1,
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
							"name": "MoreDamage",
							"children": [
								{
									"type": "object",
									"name": "Lights",
									"y": 1.46,
									"children": [
										{
											"type": "model",
											"name": "Wraith_Light02",
											"source": "Fx/Meshes_Common/Wraith_Light02.fbx",
											"y": 3.50546,
											"rotationX": 90,
											"rotationY": -21,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.4392156862745098,
															0.11372549019607843,
															0.15294117647058825
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7333333333333333,
															0.8392156862745098,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 0.7,
														"frequency": 0.25
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 0.7,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "model",
											"name": "Wraith_Light03",
											"source": "Fx/Meshes_Common/Wraith_Light03.fbx",
											"y": -0.2471,
											"rotationX": 90,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7333333333333333,
															0.8392156862745098,
															0
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
															0.5686274509803921,
															0.32941176470588235,
															0.792156862745098
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 0.7,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "model",
											"name": "Wraith_Light",
											"source": "Fx/Meshes_Common/Wraith_Light.fbx",
											"y": 0.06056,
											"scaleX": 1.06,
											"scaleY": 1.06,
											"scaleZ": 1.06,
											"rotationX": 90,
											"rotationY": -30,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.5686274509803921,
															0.32941176470588235,
															0.792156862745098
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7333333333333333,
															0.8392156862745098,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 0.7,
														"frequency": 0.25
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 0.7,
														"frequency": 2
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											15,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2,
											1,
											1
										],
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
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.4,
										"maxCount": 10,
										"emitType": "Burst",
										"burstCount": 3,
										"warmUpTime": -0.2,
										"burstDelay": 4
									},
									"x": 1.22418,
									"y": 0.7515,
									"z": 0.14591,
									"rotationX": -5.9,
									"rotationY": -3.4,
									"rotationZ": 60.2,
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 7.032384972302246,
													"value": -0.03333333333333333,
													"mode": 2
												},
												{
													"time": 7.042384972302246,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.204840759960939,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.214840759960939,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											10,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2,
											1,
											1
										],
										"instScale_rand": 0.15,
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
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.3,
										"maxCount": 10,
										"emitType": "Burst",
										"burstCount": 3,
										"warmUpTime": -4,
										"burstDelay": 2
									},
									"x": 2.56954,
									"y": 0.48392,
									"z": -3.61855,
									"rotationX": -5,
									"rotationY": 4.6,
									"rotationZ": 132.6,
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 7.032384972302246,
													"value": -0.03333333333333333,
													"mode": 2
												},
												{
													"time": 7.042384972302246,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.204840759960939,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.214840759960939,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SparklesInfinity",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											15,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2.5,
											1,
											1
										],
										"instScale_rand": 0.15,
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
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.5,
										"maxCount": 10,
										"burstCount": 2,
										"warmUpTime": -0.2
									},
									"x": -1.31486,
									"y": 0.75523,
									"z": -0.79745,
									"rotationX": -4.6,
									"rotationY": 5,
									"rotationZ": 137.7,
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
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.44831909179687623,
															"value": -0.06666666666666667,
															"mode": 2
														},
														{
															"time": 0.47234619140625134,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
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
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keys": [
												{
													"time": 1.4418539526751322,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4658810522845074,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.003333333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.003333333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Smoke_Burst",
									"props": {
										"lifeTime": 0.75,
										"alignMode": "Screen",
										"instScale_rand": 0.5,
										"maxCount": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"emitAngle": 24.55,
										"instSpeed": [
											7,
											0,
											0
										],
										"instSpeed_rand": [
											4,
											0,
											0
										],
										"enableSort": false,
										"instScale": 2.25,
										"seedGroup": 2,
										"tag": null,
										"emitType": "Burst",
										"burstParticleCount": 5,
										"lifeTimeRand": 0.25,
										"emitShape": "Cone",
										"burstCount": 3,
										"burstDelay": 1.6,
										"warmUpTime": -0.25
									},
									"x": 0.13768,
									"y": -0.78292,
									"z": -1.98091,
									"rotationY": 133.5,
									"rotationZ": 83,
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
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0.8573547202779161,
																	"mode": 2
																},
																{
																	"time": 0.9049999999999999,
																	"value": 1.4058268495515969,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9049999999999999,
																	"value": 0.31063829787234043,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keys": [
																{
																	"time": 0,
																	"value": 0.6647058823529411,
																	"mode": 2
																},
																{
																	"time": 0.9049999999999999,
																	"value": 0.46078431372549017,
																	"mode": 2
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
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/Wave_02.jpg.png",
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.1614372094585777,
																		"dt": -0.537585907497062
																	},
																	"nextHandle": {
																		"dv": -0.16666666666666674,
																		"dt": 0.5549999999999999
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.8333333333333333,
																		"dt": -0.30000000000000004
																	},
																	"nextHandle": {
																		"dv": -0.7113159996271997,
																		"dt": 0.25607375986579195
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44516906872488615,
																		"dt": -0.4813254700769495
																	},
																	"nextHandle": {
																		"dv": -0.30000000000000004,
																		"dt": 0.325048007965088
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.36666666666666664,
																		"dt": -0.2694946861267089
																	},
																	"nextHandle": {
																		"dv": -0.36666666666666664,
																		"dt": 0.2694946861267089
																	}
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.4,
													"dirIntensity": 0.45,
													"dirSpan": 0.67,
													"sandBlend": 0.2,
													"envBlend": 0.3
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.0313895804049744,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.6699999999999999
																	},
																	"nextHandle": {
																		"dv": -2.5581510915522486e-16,
																		"dt": 0.3133333333333333
																	}
																}
															]
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
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
											"type": "curve",
											"name": "instSpeed.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.026997755331088613,
														"dt": -0.7749999999999999
													},
													"nextHandle": {
														"dv": 0.012705940615832523,
														"dt": 0.3333055879251503
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
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": -1.7929952953638137,
														"dt": -0.40087293189028356
													},
													"nextHandle": {
														"dv": 1.2300000000000002,
														"dt": 0.275
													}
												},
												{
													"time": 1,
													"value": 2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.71
													},
													"nextHandle": {
														"dv": -4.522676762219434e-16,
														"dt": 0.3077538196705844
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "SmokeContinuous",
									"x": -1.0229,
									"y": 0.98875,
									"z": -0.94067,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Continuous",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 24.55,
												"instSpeed": [
													7.5,
													0,
													0
												],
												"instSpeed_rand": [
													5,
													0,
													0
												],
												"enableSort": false,
												"instScale": 2.75,
												"seedGroup": 2,
												"tag": null,
												"burstParticleCount": 5,
												"lifeTimeRand": 0.5,
												"emitShape": "Cone",
												"burstCount": 2,
												"burstDelay": 1.75
											},
											"x": 2.220446049250313e-16,
											"scaleX": 0.9999999999999994,
											"scaleY": 0.9999999999999996,
											"rotationX": 31.5,
											"rotationY": 9.100000000000009,
											"rotationZ": 146.09999999999997,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 2
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
																		}
																	]
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7929952953638137,
																"dt": -0.40087293189028356
															},
															"nextHandle": {
																"dv": 1.2300000000000002,
																"dt": 0.275
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.71
															},
															"nextHandle": {
																"dv": -4.522676762219434e-16,
																"dt": 0.3077538196705844
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.44831909179687623,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47234619140625134,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "Smoke_Continuous",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 24.55,
												"instSpeed": [
													7.5,
													0,
													0
												],
												"instSpeed_rand": [
													5,
													0,
													0
												],
												"enableSort": false,
												"instScale": 2.75,
												"seedGroup": 2,
												"tag": null,
												"burstParticleCount": 5,
												"lifeTimeRand": 0.5,
												"emitShape": "Cone",
												"burstCount": 2,
												"burstDelay": 1.75
											},
											"x": 2.9436,
											"y": -0.15385,
											"z": 1.0332,
											"scaleX": 0.9999999999999994,
											"scaleY": 0.9999999999999996,
											"rotationX": -4.7,
											"rotationY": -1.1,
											"rotationZ": 63.2,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 2
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
																		}
																	]
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7929952953638137,
																"dt": -0.40087293189028356
															},
															"nextHandle": {
																"dv": 1.2300000000000002,
																"dt": 0.275
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.71
															},
															"nextHandle": {
																"dv": -4.522676762219434e-16,
																"dt": 0.3077538196705844
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.44831909179687623,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47234619140625134,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
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
									"name": "SmokeBurst",
									"x": 1.20719,
									"y": 0.72779,
									"z": 0.70664,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Continuous",
											"props": {
												"lifeTime": 1.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 24.55,
												"instSpeed": [
													7.5,
													0,
													0
												],
												"instSpeed_rand": [
													5,
													0,
													0
												],
												"enableSort": false,
												"instScale": 2.75,
												"seedGroup": 2,
												"tag": null,
												"burstParticleCount": 5,
												"lifeTimeRand": 0.5,
												"emitShape": "Cone",
												"burstCount": 2,
												"burstDelay": 1.75
											},
											"rotationX": -3.7000000000000006,
											"rotationY": 1.7000000000000002,
											"rotationZ": 57.500000000000014,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 1.4058268495515969,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.s",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.46078431372549017,
																			"mode": 2
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
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.3,
															"topSpan": 0.4,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 2
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
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.6699999999999999
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
																		}
																	]
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
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
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
															"value": 0.2,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7929952953638137,
																"dt": -0.40087293189028356
															},
															"nextHandle": {
																"dv": 1.2300000000000002,
																"dt": 0.275
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.71
															},
															"nextHandle": {
																"dv": -4.522676762219434e-16,
																"dt": 0.3077538196705844
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"loop": true,
													"keys": [
														{
															"time": 0.04166870117187457,
															"value": -0.06666666666666667,
															"mode": 2
														},
														{
															"time": 0.05166870117187457,
															"value": 5,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": -4.3150182211902575,
																"dt": 0.0682800292968752
															}
														},
														{
															"time": 0.15708333333333369,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0020715332031296,
															"value": 0,
															"mode": 1
														},
														{
															"time": 2.0120715332031294,
															"value": 5,
															"mode": 1
														},
														{
															"time": 2.090416666666671,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.302036437988282,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.312036437988282,
															"value": 5,
															"mode": 2
														},
														{
															"time": 5.413537197113039,
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
						}
					]
				},
				{
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"z": 6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_AttackRange.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"editorOnly": true,
					"object": "FXAnimation.FXRoot.AttackDistance",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body.B_BigCircle"
				}
			]
		}
	]
}