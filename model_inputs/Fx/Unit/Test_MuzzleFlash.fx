{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
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
			"name": "Backup",
			"children": [
				{
					"type": "object",
					"name": "Rework_TestsCouleur",
					"y": -1.663333333333333,
					"children": [
						{
							"type": "object",
							"name": "test0",
							"y": 1.663333333333333,
							"children": [
								{
									"type": "object",
									"name": "Shoot",
									"rotationZ": 89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "Muzzle",
											"x": 0.38,
											"y": -1.78,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "Distort",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.08,
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 2,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0,
														"alignMode": "Screen",
														"frameDivisionX": 0
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"kind": 1,
															"args": [
																24,
																360,
																0.1,
																4
															],
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "Less"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
																		"intensity": 0.3
																	},
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
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 1,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": 0.5,
																		"shiftSpeedY": 0
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareLeft",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"rotationX": 90,
															"rotationZ": 90,
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
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareRight",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "TESTSMOKE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 1.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut02.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.096883293960627,
																				"dt": -0.006096809899044197
																			},
																			"nextHandle": {
																				"dv": 0.8995551051481742,
																				"dt": 0.0049999999999999975
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.002465968699118859,
																				"dt": -0.25
																			},
																			"nextHandle": {
																				"dv": -0.002465968699118859,
																				"dt": 0.25
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5.5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
													],
													"enabled": false
												},
												{
													"type": "object",
													"name": "TESTCHOCWAVE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 2.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																					"culling": "Back",
																					"depthTest": "LessEqual",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": false,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 1
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 2
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.8901960784313725,
																					0.7058823529411764,
																					0.5333333333333333
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0969964913138766,
																				"dt": -7.796244552137517e-17
																			},
																			"nextHandle": {
																				"dv": 0.9692887305398012,
																				"dt": 0
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.685
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.4
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																					"culling": "Back",
																					"depthTest": "LessEqual",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": false,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 1
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 2
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.8901960784313725,
																					0.7058823529411764,
																					0.5333333333333333
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
										},
										{
											"type": "emitter",
											"name": "FlashFloor",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.08,
												"instScale": 4,
												"emitType": "Burst",
												"burstCount": 2,
												"burstDelay": 0.15,
												"instOffset": [
													0,
													-2,
													0
												]
											},
											"z": 0.2,
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 5,
													"scaleY": 5,
													"scaleZ": 5,
													"rotationZ": -90,
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
																	"mode": "Decal",
																	"blend": "Alpha",
																	"shadows": false,
																	"culling": "None",
																	"colorMask": 255,
																	"emissive": 12
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_circle4.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keys": [
																		{
																			"time": 0.06,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.17757726633812598,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9949999999999999,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.3,
																				"dt": -0.16260656404003448
																			},
																			"nextHandle": {
																				"dv": -1.1657222300046601,
																				"dt": 0.14679495490282315
																			}
																		}
																	]
																}
															],
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1.5,
																"color": [
																	1,
																	0.807843137254902,
																	0.5882352941176471
																]
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"keys": [
														{
															"time": 0.06955284814455483,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0.51416015625,
																"dt": -0.5227610967162865
															},
															"nextHandle": {
																"dv": -0.3383087246561174,
																"dt": 0.3432258746749008
															}
														}
													]
												}
											],
											"enabled": false
										},
										{
											"type": "object",
											"name": "Trail",
											"x": 0.4,
											"y": -1.94,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "projectileVertical",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
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
																			"culling": "None",
																			"colorMask": 255
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "projectileHorizontal",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
															"rotationY": -90,
															"rotationZ": 90,
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
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
									"name": "Chara",
									"children": [
										{
											"type": "model",
											"name": "Female01_AtreideRanger",
											"source": "Character/Atreide/Unit/Ranger/Female01_AtreideRanger.fbx",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"animation": "Anim/Female01/Rifle/Anim_Female01_Rifle_AttackRange.fbx"
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "test1",
							"y": 6.543333333333333,
							"children": [
								{
									"type": "object",
									"name": "Shoot",
									"rotationZ": 89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "Muzzle",
											"x": 0.38,
											"y": -1.78,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "Distort",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.08,
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 2,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0,
														"alignMode": "Screen",
														"frameDivisionX": 0
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"kind": 1,
															"args": [
																24,
																360,
																0.1,
																4
															],
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "Less"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
																		"intensity": 0.3
																	},
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
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 1,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": 0.5,
																		"shiftSpeedY": 0
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareLeft",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"rotationX": 90,
															"rotationZ": 90,
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
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareRight",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "TESTSMOKE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 1.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut02.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.096883293960627,
																				"dt": -0.006096809899044197
																			},
																			"nextHandle": {
																				"dv": 0.8995551051481742,
																				"dt": 0.0049999999999999975
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.002465968699118859,
																				"dt": -0.25
																			},
																			"nextHandle": {
																				"dv": -0.002465968699118859,
																				"dt": 0.25
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5.5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
													],
													"enabled": false
												},
												{
													"type": "object",
													"name": "TESTCHOCWAVE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 2.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
																			},
																			"isInstance": true
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
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.8901960784313725,
																					0.7058823529411764,
																					0.5333333333333333
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0969964913138766,
																				"dt": -7.796244552137517e-17
																			},
																			"nextHandle": {
																				"dv": 0.9692887305398012,
																				"dt": 0
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.685
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.4
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
																			},
																			"isInstance": true
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
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.8901960784313725,
																					0.7058823529411764,
																					0.5333333333333333
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
										},
										{
											"type": "object",
											"name": "Trail",
											"x": 0.4,
											"y": -1.94,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "projectileVertical",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
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
																			"culling": "None",
																			"colorMask": 255
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "projectileHorizontal",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
															"rotationY": -90,
															"rotationZ": 90,
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.8901960784313725,
																			0.7058823529411764,
																			0.5333333333333333
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
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
									"name": "Chara",
									"children": [
										{
											"type": "model",
											"name": "Female01_AtreideRanger",
											"source": "Character/Atreide/Unit/Ranger/Female01_AtreideRanger.fbx",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"animation": "Anim/Female01/Rifle/Anim_Female01_Rifle_AttackRange.fbx"
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "test3",
							"y": -8.206666666666667,
							"children": [
								{
									"type": "object",
									"name": "Chara",
									"children": [
										{
											"type": "model",
											"name": "Female01_AtreideRanger",
											"source": "Character/Atreide/Unit/Ranger/Female01_AtreideRanger.fbx",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"children": [
												{
													"type": "animEvent",
													"name": "animEvent",
													"animation": "Anim/Female01/Rifle/Anim_Female01_Rifle_AttackRange.fbx"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Shoot",
									"rotationZ": 89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "Muzzle",
											"x": 0.38,
											"y": -1.78,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "Distort",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.08,
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 2,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0,
														"alignMode": "Screen",
														"frameDivisionX": 0
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"kind": 1,
															"args": [
																24,
																360,
																0.1,
																4
															],
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "Less"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
																		"intensity": 0.3
																	},
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
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 1,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": 0.5,
																		"shiftSpeedY": 0
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareLeft",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"rotationX": 90,
															"rotationZ": 90,
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4823529411764706,
																			0.6745098039215687,
																			0.6666666666666666
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "FlareRight",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.1,
														"instStretch": [
															8,
															1,
															6
														],
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 0.6,
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15,
														"instScale_rand": 0.2,
														"frameDivisionX": 0,
														"instStretch_rand": [
															0,
															0,
															0
														]
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationX": -20,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_HalfFlare.png"
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.43333333333333335,
																					"mode": 2
																				},
																				{
																					"time": 0.72,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.022847819119101713,
																						"dt": -0.2399021007505667
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 0.17499999999999993
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.7,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4823529411764706,
																			0.6745098039215687,
																			0.6666666666666666
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
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
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
																						"dv": 0.008012845220869657,
																						"dt": -0.500001541782246
																					},
																					"nextHandle": {
																						"dv": -0.016666666666666607,
																						"dt": 1.04
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
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
																		"dv": -1.0666666666666667,
																		"dt": -0.385
																	},
																	"nextHandle": {
																		"dv": 0.7102594787798678,
																		"dt": 0.25635928062210855
																	}
																}
															]
														}
													]
												},
												{
													"type": "object",
													"name": "TESTSMOKE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 1.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut02.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.096883293960627,
																				"dt": -0.006096809899044197
																			},
																			"nextHandle": {
																				"dv": 0.8995551051481742,
																				"dt": 0.0049999999999999975
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.002465968699118859,
																				"dt": -0.25
																			},
																			"nextHandle": {
																				"dv": -0.002465968699118859,
																				"dt": 0.25
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5.5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_SmokeDonut.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 3
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.7137254901960784,
																					0.6,
																					0.5058823529411764
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
																				"progress": 1,
																				"saturation": 0,
																				"width": 1,
																				"uvScaleX": 0.5,
																				"uvScaleY": 1,
																				"texture": "Fx/noise/perlin4.jpg",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 0.85,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.1116321015082125,
																								"dt": -0.3076091494743911
																							},
																							"nextHandle": {
																								"dv": -1,
																								"dt": 0.2774350174349862
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 2
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
													],
													"enabled": false
												},
												{
													"type": "object",
													"name": "TESTCHOCWAVE",
													"children": [
														{
															"type": "emitter",
															"name": "SmokeGun",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"lifeTimeRand": 0.2,
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 2.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 2.2,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7843137254901961,
																	0.7254901960784313,
																	0.6980392156862745,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																					"culling": "Back",
																					"depthTest": "LessEqual",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": false,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 0.2
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 2
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.4823529411764706,
																					0.6745098039215687,
																					0.6666666666666666
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.28277436002838635,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0969964913138766,
																				"dt": -7.796244552137517e-17
																			},
																			"nextHandle": {
																				"dv": 0.9692887305398012,
																				"dt": 0
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.685
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
														},
														{
															"type": "emitter",
															"name": "SmokeGun2",
															"props": {
																"instScale_rand": 0.5,
																"simulationSpace": "World",
																"animationSpeed": 0,
																"randomColor1": [
																	0.9803921568627451,
																	0.9254901960784314,
																	0.8980392156862745,
																	1
																],
																"enableSort": false,
																"instRotation_rand": [
																	0,
																	0,
																	360
																],
																"emitShape": "Cylinder",
																"emitSurface": true,
																"emitOrientation": "Speed",
																"instScale": 3.5,
																"emitAngle": 1,
																"alignMode": "Screen",
																"lifeTime": 5,
																"emitRad1": 0.64,
																"emitRad2": 0.89,
																"randomColor2": [
																	0.7490196078431373,
																	0.6705882352941176,
																	0.6313725490196078,
																	1
																],
																"instSpeed_rand": [
																	0,
																	0,
																	0
																],
																"instAcceleration_rand": [
																	0,
																	0,
																	0
																],
																"emitRate": 1,
																"speedFactor": 2.6,
																"maxCount": 2,
																"frameDivisionX": 0,
																"frameDivisionY": 0,
																"emitType": "Burst",
																"instWorldSpeed_rand": [
																	0,
																	0,
																	0
																],
																"burstDelay": 0.5,
																"seedGroup": 1,
																"warmUpTime": -0.4
															},
															"scaleX": 0.5,
															"scaleY": 0.5,
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
																					"culling": "Back",
																					"depthTest": "LessEqual",
																					"colorMask": 15,
																					"enableStencil": false,
																					"alphaKill": false,
																					"parallax": 0,
																					"textureWrap": true,
																					"emissive": 0.2
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
																				"wrap": true,
																				"invert": false,
																				"replace": false,
																				"alpha": 1,
																				"uScale": 1,
																				"vScale": 1,
																				"uOffset": 0,
																				"vOffset": 0,
																				"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																			},
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "AlphaMult",
																			"source": "shaders/AlphaMult.hx",
																			"props": {
																				"alpha": 2
																			},
																			"children": [
																				{
																					"type": "curve",
																					"name": "alpha",
																					"keyMode": 0,
																					"keys": [
																						{
																							"time": 0,
																							"value": 0.2833333333333333,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -1.6477951347620967,
																								"dt": -9.080851668466424e-17
																							},
																							"nextHandle": {
																								"dv": 0.8666666666666666,
																								"dt": 0
																							}
																						},
																						{
																							"time": 0.45,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0,
																								"dt": -0.29000000000000004
																							},
																							"nextHandle": {
																								"dv": -2.9391523179536476e-16,
																								"dt": 0.36
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": -0.01694444444444443,
																								"dt": -0.27
																							},
																							"nextHandle": {
																								"dv": 0.013434004892663146,
																								"dt": 0.21406315992899264
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "ColorSet",
																			"source": "shaders/ColorSet.hx",
																			"props": {
																				"amount": 1,
																				"color": [
																					0.4823529411764706,
																					0.6745098039215687,
																					0.6666666666666666
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
																				"progress": 1,
																				"saturation": 1,
																				"width": 0.75,
																				"uvScaleX": 0.25,
																				"uvScaleY": 0.5,
																				"texture": "Fx/noise/clouds.png",
																				"uvShift": [
																					0,
																					0
																				],
																				"uvShiftSpeed": [
																					0.07,
																					-0.05
																				],
																				"uvScaleSpeed": [
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
																							"time": 0,
																							"value": 1,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 1.3812100166859118,
																								"dt": -0.10446126176616134
																							},
																							"nextHandle": {
																								"dv": -0.9916666666666667,
																								"dt": 0.075
																							}
																						},
																						{
																							"time": 1,
																							"value": 0,
																							"mode": 0,
																							"prevHandle": {
																								"dv": 0.01416666666666666,
																								"dt": -0.565
																							},
																							"nextHandle": {
																								"dv": -0.008357588183094984,
																								"dt": 0.33332028165520877
																							}
																						}
																					]
																				}
																			],
																			"isInstance": true
																		},
																		{
																			"type": "shader",
																			"name": "DepthBlend",
																			"source": "shaders/DepthBlend.hx",
																			"props": {
																				"REVERSE": false,
																				"range": 1.7,
																				"power": 1
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
																			"value": 0.07599276417989542,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.0967067405187236,
																				"dt": -0.009753923835968315
																			},
																			"nextHandle": {
																				"dv": 1.1243749274261694,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 1.0582053444602273,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.815
																			},
																			"nextHandle": {
																				"dv": -1.582726646250665e-16,
																				"dt": 0.2500018203703057
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
										},
										{
											"type": "object",
											"name": "Trail",
											"x": 0.4,
											"y": -1.94,
											"z": 3.03,
											"children": [
												{
													"type": "emitter",
													"name": "projectileVertical",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
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
																			"culling": "None",
																			"colorMask": 255
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4823529411764706,
																			0.6745098039215687,
																			0.6666666666666666
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "projectileHorizontal",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"instStretch": [
															1,
															125,
															1
														],
														"lifeTime": 0.2,
														"instStretch_rand": [
															0,
															50,
															0
														],
														"emitType": "Burst",
														"burstCount": 2,
														"burstDelay": 0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "PlanePivBot_NoVrtx",
															"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
															"scaleX": 0.08,
															"scaleY": 0.25,
															"scaleZ": 0.08,
															"rotationY": -90,
															"rotationZ": 90,
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
																		"texture": "Fx/Gradients/T_Square03.jpg"
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
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 0.2,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			2,
																			0
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 0.9,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.035745189424735785,
																						"dt": -0.4999893526669539
																					},
																					"nextHandle": {
																						"dv": -0.050000000000000044,
																						"dt": 0.7000199507390062
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 2
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4823529411764706,
																			0.6745098039215687,
																			0.6666666666666666
																		]
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
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
					"type": "object",
					"name": "Shoot",
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "object",
							"name": "Muzzle",
							"x": -0.03,
							"y": -1.13,
							"z": 3.26,
							"children": [
								{
									"type": "emitter",
									"name": "emitterVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"lifeTime": 0.08,
										"instStretch": [
											1,
											2.5,
											1
										],
										"frameCount": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"spriteSheet": "Fx/Alphas/T_Muzzle_1x4.png",
										"instScale": 0.6,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.15,
										"instScale_rand": 0.2
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"scaleY": 1.5,
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
															"culling": "None",
															"colorMask": 255
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
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.72,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022847819119101713,
																		"dt": -0.2399021007505667
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.17499999999999993
																	}
																},
																{
																	"time": 1,
																	"value": 0.45,
																	"mode": 2
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6745098039215687,
															0.5882352941176471,
															0.5098039215686274
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
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-1
														],
														"uvScaleSpeed": [
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
																	"time": 0.1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.011686216313597977,
																		"dt": -0.4999950291832266
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.7128017409270266
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													],
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitterHorizontal",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"lifeTime": 0.08,
										"instStretch": [
											1,
											2.5,
											1
										],
										"frameCount": 4,
										"frameDivisionY": 4,
										"animationSpeed": 0,
										"spriteSheet": "Fx/Alphas/T_Muzzle_1x4.png",
										"instScale": 0.6,
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.15,
										"instScale_rand": 0.2
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"scaleY": 1.5,
											"rotationY": -90,
											"rotationZ": 90,
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
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
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
																	"time": 0.72,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022847819119101713,
																		"dt": -0.2399021007505667
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.17499999999999993
																	}
																},
																{
																	"time": 1,
																	"value": 0.45,
																	"mode": 2
																}
															]
														}
													],
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6745098039215687,
															0.5882352941176471,
															0.5098039215686274
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
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-1
														],
														"uvScaleSpeed": [
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
																	"time": 0.1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.011686216313597977,
																		"dt": -0.4999950291832266
																	},
																	"nextHandle": {
																		"dv": -0.016666666666666607,
																		"dt": 0.7128017409270266
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													],
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
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
							"name": "FlashFloor",
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"lifeTime": 0.08,
								"instScale": 4,
								"emitType": "Burst",
								"burstCount": 2,
								"burstDelay": 0.15,
								"instOffset": [
									0,
									-2,
									0
								]
							},
							"z": 0.2,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationZ": -90,
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
													"mode": "Decal",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 12
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle4.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.06,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.17757726633812598,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.3,
																"dt": -0.16260656404003448
															},
															"nextHandle": {
																"dv": -1.1657222300046601,
																"dt": 0.14679495490282315
															}
														}
													]
												}
											],
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1.5,
												"color": [
													1,
													0.807843137254902,
													0.5882352941176471
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0.06955284814455483,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0.51416015625,
												"dt": -0.5227610967162865
											},
											"nextHandle": {
												"dv": -0.3383087246561174,
												"dt": 0.3432258746749008
											}
										}
									]
								}
							],
							"enabled": false
						},
						{
							"type": "object",
							"name": "Trail",
							"y": -3.08,
							"z": 3.21,
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											1,
											125,
											1
										],
										"lifeTime": 0.2,
										"instStretch_rand": [
											0,
											50,
											0
										],
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.15
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"scaleX": 0.08,
											"scaleY": 0.08,
											"scaleZ": 0.08,
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
															"culling": "None",
															"colorMask": 255
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
															0.6745098039215687,
															0.5882352941176471,
															0.5098039215686274
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
														"texture": "Fx/Gradients/T_Square03.jpg"
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
														"saturation": 1,
														"width": 0.7,
														"uvScaleX": 2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/cloudsNoiseGradient.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
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
																	"time": 0,
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.035745189424735785,
																		"dt": -0.4999893526669539
																	},
																	"nextHandle": {
																		"dv": -0.050000000000000044,
																		"dt": 0.7000199507390062
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													],
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "projectileHorizontal",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											1,
											125,
											1
										],
										"lifeTime": 0.2,
										"instStretch_rand": [
											0,
											50,
											0
										],
										"emitType": "Burst",
										"burstCount": 2,
										"burstDelay": 0.15
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
											"scaleX": 0.08,
											"scaleY": 0.08,
											"scaleZ": 0.08,
											"rotationY": -90,
											"rotationZ": 90,
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
															0.6745098039215687,
															0.5882352941176471,
															0.5098039215686274
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
														"texture": "Fx/Gradients/T_Square03.jpg"
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
																	"value": 0.7,
																	"mode": 2
																},
																{
																	"time": 0.05611463135091105,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0008441418445193357,
																		"dt": -0.04379641459812012
																	},
																	"nextHandle": {
																		"dv": -0.0064102564102563875,
																		"dt": 0.3325818394700338
																	}
																},
																{
																	"time": 0.9949999999999999,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3999999999999999
																	},
																	"nextHandle": {
																		"dv": -1.9866492519501503e-16,
																		"dt": 0.2433333333333333
																	}
																}
															]
														}
													],
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
														"saturation": 1,
														"width": 0.7,
														"uvScaleX": 2,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/cloudsNoiseGradient.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															2,
															0
														],
														"uvScaleSpeed": [
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
																	"time": 0,
																	"value": 0.9,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.035745189424735785,
																		"dt": -0.4999893526669539
																	},
																	"nextHandle": {
																		"dv": -0.050000000000000044,
																		"dt": 0.7000199507390062
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													],
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
													}
												}
											]
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
									0.6745098039215687,
									0.5882352941176471,
									0.5098039215686274
								]
							},
							"isInstance": true
						}
					]
				}
			],
			"enabled": false
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "test2",
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"children": [
								{
									"type": "model",
									"name": "Female01_AtreideRanger",
									"source": "Character/Atreide/Unit/Ranger/Female01_AtreideRanger.fbx",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Female01/Rifle/Anim_Female01_Rifle_AttackRange.fbx"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Shoot",
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "Muzzle",
									"x": 0.4,
									"y": -1.78,
									"z": 3.03,
									"children": [
										{
											"type": "emitter",
											"name": "FlareLeft",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"instStretch": [
													8,
													1,
													6
												],
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 0.6,
												"emitType": "Burst",
												"burstCount": 2,
												"burstDelay": 0.15,
												"instScale_rand": 0.2,
												"frameDivisionX": 0,
												"instStretch_rand": [
													0,
													0,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -20,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
													"rotationX": 90,
													"rotationZ": 90,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_HalfFlare.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5607843137254902,
																	0.7490196078431373,
																	0.7411764705882353
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
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
																				"dv": 0.008012845220869657,
																				"dt": -0.500001541782246
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 1.04
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
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
																"dv": -1.0666666666666667,
																"dt": -0.385
															},
															"nextHandle": {
																"dv": 0.7102594787798678,
																"dt": 0.25635928062210855
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlareRight",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.1,
												"instStretch": [
													8,
													1,
													6
												],
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 0.6,
												"emitType": "Burst",
												"burstCount": 2,
												"burstDelay": 0.15,
												"instScale_rand": 0.2,
												"frameDivisionX": 0,
												"instStretch_rand": [
													0,
													0,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -20,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_HalfFlare.png"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5607843137254902,
																	0.7490196078431373,
																	0.7411764705882353
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
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
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
																				"dv": 0.008012845220869657,
																				"dt": -0.500001541782246
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 1.04
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
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
																"dv": -1.0666666666666667,
																"dt": -0.385
															},
															"nextHandle": {
																"dv": 0.7102594787798678,
																"dt": 0.25635928062210855
															}
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "TESTCHOCWAVE",
											"children": [
												{
													"type": "emitter",
													"name": "SmokeGun",
													"props": {
														"instScale_rand": 0.5,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															0.9803921568627451,
															0.9254901960784314,
															0.8980392156862745,
															1
														],
														"enableSort": false,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"lifeTimeRand": 0.2,
														"emitShape": "Cylinder",
														"emitSurface": true,
														"emitOrientation": "Speed",
														"instScale": 2.5,
														"emitAngle": 1,
														"alignMode": "Screen",
														"lifeTime": 2.2,
														"emitRad1": 0.64,
														"emitRad2": 0.89,
														"randomColor2": [
															0.7843137254901961,
															0.7254901960784313,
															0.6980392156862745,
															1
														],
														"instSpeed_rand": [
															0,
															0,
															0
														],
														"instAcceleration_rand": [
															0,
															0,
															0
														],
														"emitRate": 1,
														"speedFactor": 2.6,
														"maxCount": 2,
														"frameDivisionX": 0,
														"frameDivisionY": 0,
														"emitType": "Burst",
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"burstDelay": 0.5
													},
													"scaleX": 0.5,
													"scaleY": 0.5,
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
																			"culling": "Back",
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 0.5
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 2
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.2833333333333333,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -1.6477951347620967,
																						"dt": -9.080851668466424e-17
																					},
																					"nextHandle": {
																						"dv": 0.8666666666666666,
																						"dt": 0
																					}
																				},
																				{
																					"time": 0.45,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.29000000000000004
																					},
																					"nextHandle": {
																						"dv": -2.9391523179536476e-16,
																						"dt": 0.36
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.01694444444444443,
																						"dt": -0.27
																					},
																					"nextHandle": {
																						"dv": 0.013434004892663146,
																						"dt": 0.21406315992899264
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.5607843137254902,
																			0.7490196078431373,
																			0.7411764705882353
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.75,
																		"uvScaleX": 0.25,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/clouds.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.07,
																			-0.05
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.3812100166859118,
																						"dt": -0.10446126176616134
																					},
																					"nextHandle": {
																						"dv": -0.9916666666666667,
																						"dt": 0.075
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.01416666666666666,
																						"dt": -0.565
																					},
																					"nextHandle": {
																						"dv": -0.008357588183094984,
																						"dt": 0.33332028165520877
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1.7,
																		"power": 1
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
																	"value": 0.28277436002838635,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.0969964913138766,
																		"dt": -7.796244552137517e-17
																	},
																	"nextHandle": {
																		"dv": 0.9692887305398012,
																		"dt": 0
																	}
																},
																{
																	"time": 1,
																	"value": 1.0582053444602273,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.685
																	},
																	"nextHandle": {
																		"dv": -1.582726646250665e-16,
																		"dt": 0.2500018203703057
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
												},
												{
													"type": "emitter",
													"name": "SmokeGun2",
													"props": {
														"instScale_rand": 0.5,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															0.9803921568627451,
															0.9254901960784314,
															0.8980392156862745,
															1
														],
														"enableSort": false,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"emitShape": "Cylinder",
														"emitSurface": true,
														"emitOrientation": "Speed",
														"instScale": 3.5,
														"emitAngle": 1,
														"alignMode": "Screen",
														"lifeTime": 5,
														"emitRad1": 0.64,
														"emitRad2": 0.89,
														"randomColor2": [
															0.7490196078431373,
															0.6705882352941176,
															0.6313725490196078,
															1
														],
														"instSpeed_rand": [
															0,
															0,
															0
														],
														"instAcceleration_rand": [
															0,
															0,
															0
														],
														"emitRate": 1,
														"speedFactor": 2.6,
														"maxCount": 2,
														"frameDivisionX": 0,
														"frameDivisionY": 0,
														"emitType": "Burst",
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"burstDelay": 0.5,
														"seedGroup": 1,
														"warmUpTime": -0.4
													},
													"scaleX": 0.5,
													"scaleY": 0.5,
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
																			"culling": "Back",
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 0.5
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
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_ChocWave_Blurred.png"
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "AlphaMult",
																	"source": "shaders/AlphaMult.hx",
																	"props": {
																		"alpha": 2
																	},
																	"children": [
																		{
																			"type": "curve",
																			"name": "alpha",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.2833333333333333,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -1.6477951347620967,
																						"dt": -9.080851668466424e-17
																					},
																					"nextHandle": {
																						"dv": 0.8666666666666666,
																						"dt": 0
																					}
																				},
																				{
																					"time": 0.45,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0,
																						"dt": -0.29000000000000004
																					},
																					"nextHandle": {
																						"dv": -2.9391523179536476e-16,
																						"dt": 0.36
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.01694444444444443,
																						"dt": -0.27
																					},
																					"nextHandle": {
																						"dv": 0.013434004892663146,
																						"dt": 0.21406315992899264
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.5607843137254902,
																			0.7490196078431373,
																			0.7411764705882353
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
																		"progress": 1,
																		"saturation": 1,
																		"width": 0.75,
																		"uvScaleX": 0.25,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/clouds.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.07,
																			-0.05
																		],
																		"uvScaleSpeed": [
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
																					"time": 0,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.3812100166859118,
																						"dt": -0.10446126176616134
																					},
																					"nextHandle": {
																						"dv": -0.9916666666666667,
																						"dt": 0.075
																					}
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.01416666666666666,
																						"dt": -0.565
																					},
																					"nextHandle": {
																						"dv": -0.008357588183094984,
																						"dt": 0.33332028165520877
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 1.7,
																		"power": 1
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
																	"value": 0.07599276417989542,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.0967067405187236,
																		"dt": -0.009753923835968315
																	},
																	"nextHandle": {
																		"dv": 1.1243749274261694,
																		"dt": 0.009999999999999995
																	}
																},
																{
																	"time": 1,
																	"value": 1.0582053444602273,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.815
																	},
																	"nextHandle": {
																		"dv": -1.582726646250665e-16,
																		"dt": 0.2500018203703057
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
										},
										{
											"type": "object",
											"name": "Distort",
											"children": [
												{
													"type": "emitter",
													"name": "Distort",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.13,
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 2.2,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instScale_rand": 0,
														"alignMode": "Screen",
														"frameDivisionX": 0
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationZ": 3.531125038440127e-30,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"kind": 1,
															"args": [
																24,
																360,
																0.1,
																4
															],
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "Less"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
																		"intensity": 0.05
																	},
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
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 1,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": 0.5,
																		"shiftSpeedY": 0
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.865
																	},
																	"nextHandle": {
																		"dv": 0.012845000567937064,
																		"dt": 0.33332776473798326
																	}
																}
															]
														}
													]
												},
												{
													"type": "emitter",
													"name": "Distort2",
													"props": {
														"emitRate": 1,
														"maxCount": 1,
														"lifeTime": 0.25,
														"frameDivisionY": 0,
														"animationSpeed": 0,
														"instScale": 2.2,
														"emitType": "Burst",
														"burstDelay": 0.15,
														"instScale_rand": 0,
														"alignMode": "Screen",
														"frameDivisionX": 0,
														"warmUpTime": -0.15
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"rotationZ": 1.7655625192200634e-30,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"kind": 1,
															"args": [
																24,
																360,
																0.1,
																4
															],
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"culling": "None",
																			"colorMask": 255,
																			"depthTest": "Less"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
																		"intensity": 0.05
																	},
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
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	],
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 1,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": 0.5,
																		"shiftSpeedY": 0
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
																	"value": 0.07599276417989542,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8702218832340981,
																		"dt": -0.2040920984908945
																	},
																	"nextHandle": {
																		"dv": 0.9167317415949764,
																		"dt": 0.21500000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 1.0582053444602273,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.575
																	},
																	"nextHandle": {
																		"dv": -2.0047870852508426e-16,
																		"dt": 0.2500018203703057
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
									"name": "Trail",
									"x": 0.4,
									"y": -1.94,
									"z": 3.03,
									"children": [
										{
											"type": "emitter",
											"name": "projectileVertical",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"instStretch": [
													1,
													125,
													1
												],
												"lifeTime": 0.13,
												"instStretch_rand": [
													0,
													50,
													0
												],
												"emitType": "Burst",
												"burstCount": 2,
												"burstDelay": 0.18
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
													"scaleX": 0.08,
													"scaleY": 0.23,
													"scaleZ": 0.08,
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
																	"culling": "None",
																	"colorMask": 255
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
																"texture": "Fx/Gradients/T_Square03.jpg"
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
																"saturation": 1,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 0.2,
																"texture": "Fx/noise/Dissolve_lines.jpg.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	2,
																	0
																],
																"uvScaleSpeed": [
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
																			"time": 0,
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.035745189424735785,
																				"dt": -0.4999893526669539
																			},
																			"nextHandle": {
																				"dv": -0.050000000000000044,
																				"dt": 0.7000199507390062
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5607843137254902,
																	0.7490196078431373,
																	0.7411764705882353
																]
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.865
															},
															"nextHandle": {
																"dv": 0.012845000567937064,
																"dt": 0.33332776473798326
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "projectileHorizontal",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"instStretch": [
													1,
													125,
													1
												],
												"lifeTime": 0.13,
												"instStretch_rand": [
													0,
													50,
													0
												],
												"emitType": "Burst",
												"burstCount": 2,
												"burstDelay": 0.18
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
													"scaleX": 0.08,
													"scaleY": 0.23,
													"scaleZ": 0.08,
													"rotationY": -90,
													"rotationZ": 90,
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
																"texture": "Fx/Gradients/T_Square03.jpg"
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
																"saturation": 1,
																"width": 0.7,
																"uvScaleX": 1,
																"uvScaleY": 0.2,
																"texture": "Fx/noise/Dissolve_lines.jpg.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	2,
																	0
																],
																"uvScaleSpeed": [
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
																			"time": 0,
																			"value": 0.9,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.035745189424735785,
																				"dt": -0.4999893526669539
																			},
																			"nextHandle": {
																				"dv": -0.050000000000000044,
																				"dt": 0.7000199507390062
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 2
																		}
																	]
																}
															],
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.5607843137254902,
																	0.7490196078431373,
																	0.7411764705882353
																]
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.865
															},
															"nextHandle": {
																"dv": 0.012845000567937064,
																"dt": 0.33332776473798326
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
}