{
	"type": "fx",
	"cullingRadius": 3,
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
					"type": "object",
					"name": "TestsScan",
					"x": -12.85,
					"z": 7.81,
					"children": [
						{
							"type": "object",
							"name": "Anim3",
							"y": 24.572499999999998,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "object",
									"name": "Ornithopter",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "model",
											"name": "Vehicule_Ornithopter",
											"source": "Vehicle/Atreide/Ornithopter/Vehicle_Ornithopter.fbx",
											"animation": "Anim/Ornithopter/Anim_Ornithopter_Idle.fbx"
										},
										{
											"type": "object",
											"name": "SCAN",
											"x": 0.46,
											"y": 0.01,
											"z": -0.01,
											"children": [
												{
													"type": "emitter",
													"name": "Flare",
													"props": {
														"emitRate": 6,
														"maxCount": 6,
														"alignMode": "Screen",
														"instScale": 2.5,
														"lifeTime": 0.3,
														"lifeTimeRand": 0.2,
														"instStretch_rand": [
															0.2,
															0.2,
															0.2
														],
														"instRotation_rand": [
															10,
															10,
															10
														],
														"instScale_rand": 0.2,
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
													"x": 0.0050000000000001155,
													"y": 0.01499999999999968,
													"z": -0.020000000000000018,
													"scaleX": 0.009999999999999997,
													"scaleY": 0.009999999999999997,
													"scaleZ": 0.01,
													"rotationZ": 153.3,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 0.5,
															"scaleY": 0.5,
															"scaleZ": 0.5,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"emissive": 0.5
																		}
																	},
																	"diffuseMap": "Fx/Alphas/Flare03.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.6745098039215687,
																		1
																	]
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
																					"prevHandle": {
																						"dv": -1.307242267623488,
																						"dt": -0.2236067977499791
																					},
																					"nextHandle": {
																						"dv": 0.6666666666666666,
																						"dt": 0.11403486728668219
																					}
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.6,
																						"dt": -0.04210711479186968
																					},
																					"nextHandle": {
																						"dv": -0.6,
																						"dt": 0.04210711479186968
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
													"name": "Scan",
													"rotationY": -26.80001342992714,
													"children": [
														{
															"type": "model",
															"name": "CylinderSpotlightBase",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																			"emissive": 1.2
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
																		"texture": "Fx/Gradients/Gradient_Spotlight.png",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.32,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.6901960784313725,
																			0.5137254901960784,
																			0.27450980392156865
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0.14
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.38,
																		"saturation": 1,
																		"width": 0.77,
																		"uvScaleX": 3,
																		"uvScaleY": 3,
																		"texture": "Fx/Alphas/T_Scan_test.png",
																		"uvShift": [
																			1,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-1.2
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.52,
																		"saturation": 1,
																		"width": 0.51,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9602776523679497,
																	"value": 0.0447746212121212,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.991110609471799,
																	"value": 0.043821969696969686,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "rotation.x",
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
																		"dt": 0.19428162574768085
																	}
																},
																{
																	"time": 1,
																	"value": 0.06819444444444442,
																	"prevHandle": {
																		"dv": 2.945820582227334e-18,
																		"dt": -0.31625898884873627
																	},
																	"nextHandle": {
																		"dv": -0.00008566337719297101,
																		"dt": 0.3924924349784866
																	}
																},
																{
																	"time": 1.6857142857142857,
																	"value": 0.02231734006734005,
																	"mode": 2
																},
																{
																	"time": 2.057142857142857,
																	"value": -0.008717171717171726,
																	"mode": 2
																},
																{
																	"time": 2.4285714285714284,
																	"value": -0.0464983164983165,
																	"mode": 2
																},
																{
																	"time": 3.011403486728668,
																	"value": -0.08023148148148147,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.2469475245475762
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.136969861984254
																	}
																},
																{
																	"time": 3.8285714285714287,
																	"value": -0.022210437710437715,
																	"prevHandle": {
																		"dv": -0.013246464992585234,
																		"dt": -0.14692248337352484
																	},
																	"nextHandle": {
																		"dv": 0.02833585858585858,
																		"dt": 0.3142857142857145
																	}
																},
																{
																	"time": 5.018801214694982,
																	"value": 0.06541666666666664,
																	"prevHandle": {
																		"dv": 6.1895907671395486e-18,
																		"dt": -0.6645054112300866
																	},
																	"nextHandle": {
																		"dv": 0.00032525313527953514,
																		"dt": 0.6385952568054201
																	}
																},
																{
																	"time": 6.683710277080543,
																	"value": -0.07980573449683236,
																	"prevHandle": {
																		"dv": -0.0027469686255873842,
																		"dt": -0.7403805441798604
																	},
																	"nextHandle": {
																		"dv": 0.0017346833881578955,
																		"dt": 0.4675429558753974
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01717679207785088,
																		"dt": -0.7119049263000417
																	},
																	"nextHandle": {
																		"dv": 0.01141601048925232,
																		"dt": 0.4652897554578961
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 1.0071428571428571,
																	"value": 1.192558038884943,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleX": 0.6,
															"scaleY": 0.6,
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
																			"emissive": 1.5
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
																		"alpha": 2.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 2,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Scan_testHorizontal.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
																			-0.8
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
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
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.42,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
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
													"type": "advancedDecal",
													"name": "Decal",
													"enabled": false,
													"x": 1.5,
													"y": 0.04,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/T-InnerGradient_02.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
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
																"saturation": 0,
																"width": 0.3,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Scan_test.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8700000000000001
															},
															"nextHandle": {
																"dv": -2.70783014478137e-16,
																"dt": 0.33166666666666667
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "Decal",
													"x": 1.7,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/FloorScan_Round_03.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 6,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
													"children": [
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.64,
																"saturation": 0,
																"width": 0.3,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Test/TXT_FX_Scan.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.5,
																	1.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0.24,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
							"name": "Anim2",
							"y": 7.9825,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "object",
									"name": "Ornithopter",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "model",
											"name": "Vehicule_Ornithopter",
											"source": "Vehicle/Atreide/Ornithopter/Vehicle_Ornithopter.fbx",
											"animation": "Anim/Ornithopter/Anim_Ornithopter_Idle.fbx"
										},
										{
											"type": "object",
											"name": "SCAN",
											"x": 0.46,
											"y": 0.01,
											"z": -0.01,
											"children": [
												{
													"type": "emitter",
													"name": "Flare",
													"props": {
														"emitRate": 6,
														"maxCount": 6,
														"alignMode": "Screen",
														"instScale": 2.5,
														"lifeTime": 0.3,
														"lifeTimeRand": 0.2,
														"instStretch_rand": [
															0.2,
															0.2,
															0.2
														],
														"instRotation_rand": [
															10,
															10,
															10
														],
														"instScale_rand": 0.2,
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
													"x": 0.0050000000000001155,
													"y": 0.01499999999999968,
													"z": -0.020000000000000018,
													"scaleX": 0.009999999999999997,
													"scaleY": 0.009999999999999997,
													"scaleZ": 0.01,
													"rotationZ": 153.3,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 0.5,
															"scaleY": 0.5,
															"scaleZ": 0.5,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"emissive": 0.5
																		}
																	},
																	"diffuseMap": "Fx/Alphas/Flare03.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.6745098039215687,
																		1
																	]
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
																					"prevHandle": {
																						"dv": -1.307242267623488,
																						"dt": -0.2236067977499791
																					},
																					"nextHandle": {
																						"dv": 0.6666666666666666,
																						"dt": 0.11403486728668219
																					}
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.6,
																						"dt": -0.04210711479186968
																					},
																					"nextHandle": {
																						"dv": -0.6,
																						"dt": 0.04210711479186968
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
													"name": "Scan",
													"rotationY": -26.80001342992714,
													"children": [
														{
															"type": "model",
															"name": "CylinderSpotlightBase",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																			"emissive": 1.2
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
																		"texture": "Fx/Gradients/Gradient_Spotlight.png",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.32,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.6901960784313725,
																			0.5137254901960784,
																			0.27450980392156865
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0.14
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.38,
																		"saturation": 1,
																		"width": 0.77,
																		"uvScaleX": 3,
																		"uvScaleY": 3,
																		"texture": "Fx/Alphas/T_Scan_test.png",
																		"uvShift": [
																			1,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.9
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.62,
																		"saturation": 1,
																		"width": 0.51,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9602776523679497,
																	"value": 0.0447746212121212,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.991110609471799,
																	"value": 0.043821969696969686,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "rotation.x",
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
																		"dt": 0.19428162574768085
																	}
																},
																{
																	"time": 1,
																	"value": 0.06819444444444442,
																	"prevHandle": {
																		"dv": 2.945820582227334e-18,
																		"dt": -0.31625898884873627
																	},
																	"nextHandle": {
																		"dv": -0.00008566337719297101,
																		"dt": 0.3924924349784866
																	}
																},
																{
																	"time": 1.6857142857142857,
																	"value": 0.02231734006734005,
																	"mode": 2
																},
																{
																	"time": 2.057142857142857,
																	"value": -0.008717171717171726,
																	"mode": 2
																},
																{
																	"time": 2.4285714285714284,
																	"value": -0.0464983164983165,
																	"mode": 2
																},
																{
																	"time": 3.011403486728668,
																	"value": -0.08023148148148147,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.2469475245475762
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.136969861984254
																	}
																},
																{
																	"time": 3.8285714285714287,
																	"value": -0.022210437710437715,
																	"prevHandle": {
																		"dv": -0.013246464992585234,
																		"dt": -0.14692248337352484
																	},
																	"nextHandle": {
																		"dv": 0.02833585858585858,
																		"dt": 0.3142857142857145
																	}
																},
																{
																	"time": 5.018801214694982,
																	"value": 0.06541666666666664,
																	"prevHandle": {
																		"dv": 6.1895907671395486e-18,
																		"dt": -0.6645054112300866
																	},
																	"nextHandle": {
																		"dv": 0.00032525313527953514,
																		"dt": 0.6385952568054201
																	}
																},
																{
																	"time": 6.683710277080543,
																	"value": -0.07980573449683236,
																	"prevHandle": {
																		"dv": -0.0027469686255873842,
																		"dt": -0.7403805441798604
																	},
																	"nextHandle": {
																		"dv": 0.0017346833881578955,
																		"dt": 0.4675429558753974
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01717679207785088,
																		"dt": -0.7119049263000417
																	},
																	"nextHandle": {
																		"dv": 0.01141601048925232,
																		"dt": 0.4652897554578961
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 1.0071428571428571,
																	"value": 1.192558038884943,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleX": 0.6,
															"scaleY": 0.6,
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
																			"emissive": 1.5
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
																		"alpha": 2.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 2,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Scan_testHorizontal.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
																			-0.8
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
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
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.42,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
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
													"type": "advancedDecal",
													"name": "Decal",
													"enabled": false,
													"x": 1.5,
													"y": 0.04,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/T-InnerGradient_02.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
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
																"saturation": 0,
																"width": 0.3,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Scan_test.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8700000000000001
															},
															"nextHandle": {
																"dv": -2.70783014478137e-16,
																"dt": 0.33166666666666667
															}
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "Decal",
													"x": 1.7,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/FloorScan_Round_03.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 6,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
													"children": [
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.64,
																"saturation": 0,
																"width": 0.3,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Test/TXT_FX_Scan.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	1.5,
																	1.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0.24,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
							"name": "Anim4",
							"y": -24.2375,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "object",
									"name": "Ornithopter",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "model",
											"name": "Vehicule_Ornithopter",
											"source": "Vehicle/Atreide/Ornithopter/Vehicle_Ornithopter.fbx",
											"animation": "Anim/Ornithopter/Anim_Ornithopter_Idle.fbx"
										},
										{
											"type": "object",
											"name": "SCAN",
											"x": 0.46,
											"y": 0.01,
											"z": -0.01,
											"children": [
												{
													"type": "emitter",
													"name": "Flare",
													"props": {
														"emitRate": 6,
														"maxCount": 6,
														"alignMode": "Screen",
														"instScale": 2.5,
														"lifeTime": 0.3,
														"lifeTimeRand": 0.2,
														"instStretch_rand": [
															0.2,
															0.2,
															0.2
														],
														"instRotation_rand": [
															10,
															10,
															10
														],
														"instScale_rand": 0.2,
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
													"x": 0.0050000000000001155,
													"y": 0.01499999999999968,
													"z": -0.020000000000000018,
													"scaleX": 0.009999999999999997,
													"scaleY": 0.009999999999999997,
													"scaleZ": 0.01,
													"rotationZ": 153.3,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 0.5,
															"scaleY": 0.5,
															"scaleZ": 0.5,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"emissive": 0.5
																		}
																	},
																	"diffuseMap": "Fx/Alphas/Flare03.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.6745098039215687,
																		1
																	]
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
																					"prevHandle": {
																						"dv": -1.307242267623488,
																						"dt": -0.2236067977499791
																					},
																					"nextHandle": {
																						"dv": 0.6666666666666666,
																						"dt": 0.11403486728668219
																					}
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.6,
																						"dt": -0.04210711479186968
																					},
																					"nextHandle": {
																						"dv": -0.6,
																						"dt": 0.04210711479186968
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
													"name": "Scan",
													"scaleZ": 0.9999999999999999,
													"rotationY": -26.80001342992714,
													"children": [
														{
															"type": "model",
															"name": "CylinderSpotlightBase",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																			"emissive": 1.2
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
																		"texture": "Fx/Gradients/Gradient_Spotlight.png",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.32,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9602776523679497,
																	"value": 0.0447746212121212,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.991110609471799,
																	"value": 0.043821969696969686,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "rotation.x",
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
																		"dt": 0.19428162574768085
																	}
																},
																{
																	"time": 1,
																	"value": 0.06819444444444442,
																	"prevHandle": {
																		"dv": 2.945820582227334e-18,
																		"dt": -0.31625898884873627
																	},
																	"nextHandle": {
																		"dv": -0.00008566337719297101,
																		"dt": 0.3924924349784866
																	}
																},
																{
																	"time": 1.6857142857142857,
																	"value": 0.02231734006734005,
																	"mode": 2
																},
																{
																	"time": 2.057142857142857,
																	"value": -0.008717171717171726,
																	"mode": 2
																},
																{
																	"time": 2.4285714285714284,
																	"value": -0.0464983164983165,
																	"mode": 2
																},
																{
																	"time": 3.011403486728668,
																	"value": -0.08023148148148147,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.2469475245475762
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.136969861984254
																	}
																},
																{
																	"time": 3.8285714285714287,
																	"value": -0.022210437710437715,
																	"prevHandle": {
																		"dv": -0.013246464992585234,
																		"dt": -0.14692248337352484
																	},
																	"nextHandle": {
																		"dv": 0.02833585858585858,
																		"dt": 0.3142857142857145
																	}
																},
																{
																	"time": 5.018801214694982,
																	"value": 0.06541666666666664,
																	"prevHandle": {
																		"dv": 6.1895907671395486e-18,
																		"dt": -0.6645054112300866
																	},
																	"nextHandle": {
																		"dv": 0.00032525313527953514,
																		"dt": 0.6385952568054201
																	}
																},
																{
																	"time": 6.683710277080543,
																	"value": -0.07980573449683236,
																	"prevHandle": {
																		"dv": -0.0027469686255873842,
																		"dt": -0.7403805441798604
																	},
																	"nextHandle": {
																		"dv": 0.0017346833881578955,
																		"dt": 0.4675429558753974
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01717679207785088,
																		"dt": -0.7119049263000417
																	},
																	"nextHandle": {
																		"dv": 0.01141601048925232,
																		"dt": 0.4652897554578961
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 1.0071428571428571,
																	"value": 1.192558038884943,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "model",
															"name": "CylinderRay",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay.fbx",
															"scaleX": 1.2,
															"scaleY": 1.2,
															"scaleZ": 1.4,
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
																		"useSourceUVs": true,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 37.12,
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
																		"progress": 0.42,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 4,
																		"uvScaleY": 1.5,
																		"texture": "Fx/Alphas/T_Scan_test.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.8
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.5,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleY": 0.8,
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
																			"emissive": 2.5
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
																		"alpha": 2.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 2,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Scan_testHorizontal.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
																			-0.8
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
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
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.42,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
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
													"type": "advancedDecal",
													"name": "Decal",
													"x": 1.5,
													"y": 0.04,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/T-InnerGradient_02.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 2,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
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
																"saturation": 0,
																"width": 0.28,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Scan_test.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8700000000000001
															},
															"nextHandle": {
																"dv": -2.70783014478137e-16,
																"dt": 0.33166666666666667
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
							"name": "Anim3",
							"y": -8.3175,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "object",
									"name": "Ornithopter",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"children": [
										{
											"type": "model",
											"name": "Vehicule_Ornithopter",
											"source": "Vehicle/Atreide/Ornithopter/Vehicle_Ornithopter.fbx",
											"animation": "Anim/Ornithopter/Anim_Ornithopter_Idle.fbx"
										},
										{
											"type": "object",
											"name": "SCAN",
											"x": 0.46,
											"y": 0.01,
											"z": -0.01,
											"children": [
												{
													"type": "emitter",
													"name": "Flare",
													"props": {
														"emitRate": 6,
														"maxCount": 6,
														"alignMode": "Screen",
														"instScale": 2.5,
														"lifeTime": 0.3,
														"lifeTimeRand": 0.2,
														"instStretch_rand": [
															0.2,
															0.2,
															0.2
														],
														"instRotation_rand": [
															10,
															10,
															10
														],
														"instScale_rand": 0.2,
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
													"x": 0.0050000000000001155,
													"y": 0.01499999999999968,
													"z": -0.020000000000000018,
													"scaleX": 0.009999999999999997,
													"scaleY": 0.009999999999999997,
													"scaleZ": 0.01,
													"rotationZ": 153.3,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 0.5,
															"scaleY": 0.5,
															"scaleZ": 0.5,
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
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"emissive": 0.5
																		}
																	},
																	"diffuseMap": "Fx/Alphas/Flare03.png",
																	"color": [
																		1,
																		0.8470588235294118,
																		0.6745098039215687,
																		1
																	]
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
																					"prevHandle": {
																						"dv": -1.307242267623488,
																						"dt": -0.2236067977499791
																					},
																					"nextHandle": {
																						"dv": 0.6666666666666666,
																						"dt": 0.11403486728668219
																					}
																				},
																				{
																					"time": 0.5,
																					"value": 1,
																					"mode": 2
																				},
																				{
																					"time": 1,
																					"value": 0,
																					"prevHandle": {
																						"dv": 0.6,
																						"dt": -0.04210711479186968
																					},
																					"nextHandle": {
																						"dv": -0.6,
																						"dt": 0.04210711479186968
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
													"name": "Scan",
													"scaleZ": 0.9999999999999999,
													"rotationY": -26.80001342992714,
													"children": [
														{
															"type": "model",
															"name": "CylinderSpotlightBase",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large.fbx",
															"scaleX": 0.9,
															"scaleY": 0.8,
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
																		"texture": "Fx/Gradients/Gradient_Spotlight.png",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.32,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "model",
															"name": "CylinderRayLarge",
															"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
															"scaleY": 0.8,
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
																			"emissive": 2.5
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
																		"alpha": 2.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/vGrad_inv.jpg",
																		"onDecal": false
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "ColorMap",
																	"source": "shaders/ColorMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"colorA": [
																			0.5490196078431373,
																			0.47058823529411764,
																			0.984313725490196
																		],
																		"pointA": 0,
																		"colorB": [
																			1,
																			0.8470588235294118,
																			0.6745098039215687
																		],
																		"pointB": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 75,
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 2,
																		"uvScaleY": 1,
																		"texture": "Fx/Alphas/T_Scan_testHorizontal.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
																			-0.8
																		],
																		"uvScaleSpeed": [
																			0,
																			0
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
																		"progress": 0.45,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/noise/Dissolve_lines.jpg.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0.15,
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
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.42,
																		"saturation": 1,
																		"width": 0.7,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/Cyl13u_A.png",
																		"uvShift": [
																			0,
																			0
																		],
																		"uvShiftSpeed": [
																			0,
																			-0.7
																		],
																		"uvScaleSpeed": [
																			0,
																			0
																		]
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "NightEmissive",
																	"source": "shaders/NightEmissive.hx",
																	"props": {
																		"amount": 0.4,
																		"ATTENUATE": true,
																		"emissiveMap": null
																	},
																	"isInstance": true
																}
															]
														},
														{
															"type": "curve",
															"name": "rotation.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9602776523679497,
																	"value": 0.0447746212121212,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.991110609471799,
																	"value": 0.043821969696969686,
																	"mode": 2
																},
																{
																	"time": 6,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "rotation.x",
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
																		"dt": 0.19428162574768085
																	}
																},
																{
																	"time": 1,
																	"value": 0.06819444444444442,
																	"prevHandle": {
																		"dv": 2.945820582227334e-18,
																		"dt": -0.31625898884873627
																	},
																	"nextHandle": {
																		"dv": -0.00008566337719297101,
																		"dt": 0.3924924349784866
																	}
																},
																{
																	"time": 1.6857142857142857,
																	"value": 0.02231734006734005,
																	"mode": 2
																},
																{
																	"time": 2.057142857142857,
																	"value": -0.008717171717171726,
																	"mode": 2
																},
																{
																	"time": 2.4285714285714284,
																	"value": -0.0464983164983165,
																	"mode": 2
																},
																{
																	"time": 3.011403486728668,
																	"value": -0.08023148148148147,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.2469475245475762
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.136969861984254
																	}
																},
																{
																	"time": 3.8285714285714287,
																	"value": -0.022210437710437715,
																	"prevHandle": {
																		"dv": -0.013246464992585234,
																		"dt": -0.14692248337352484
																	},
																	"nextHandle": {
																		"dv": 0.02833585858585858,
																		"dt": 0.3142857142857145
																	}
																},
																{
																	"time": 5.018801214694982,
																	"value": 0.06541666666666664,
																	"prevHandle": {
																		"dv": 6.1895907671395486e-18,
																		"dt": -0.6645054112300866
																	},
																	"nextHandle": {
																		"dv": 0.00032525313527953514,
																		"dt": 0.6385952568054201
																	}
																},
																{
																	"time": 6.683710277080543,
																	"value": -0.07980573449683236,
																	"prevHandle": {
																		"dv": -0.0027469686255873842,
																		"dt": -0.7403805441798604
																	},
																	"nextHandle": {
																		"dv": 0.0017346833881578955,
																		"dt": 0.4675429558753974
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.01717679207785088,
																		"dt": -0.7119049263000417
																	},
																	"nextHandle": {
																		"dv": 0.01141601048925232,
																		"dt": 0.4652897554578961
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 1.0071428571428571,
																	"value": 1.192558038884943,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "Decal",
													"x": 1.5,
													"y": 0.04,
													"z": -1.91,
													"scaleX": 3.5,
													"scaleY": 2.7,
													"scaleZ": 5,
													"albedoMap": "Fx/Alphas/T-InnerGradient_02.png",
													"fadePower": 3,
													"fadeEnd": 0.8,
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"blendMode": 2,
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
																"saturation": 0,
																"width": 0.3,
																"uvScaleX": 1.5,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Scan_test.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.5,
																	0.5
																],
																"uvScaleSpeed": [
																	0,
																	0
																]
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.6901960784313725,
																	0.5137254901960784,
																	0.27450980392156865
																],
																"pointA": 0,
																"colorB": [
																	1,
																	0.8470588235294118,
																	0.6745098039215687
																],
																"pointB": 0.81
															},
															"isInstance": true
														},
														{
															"type": "curve",
															"name": "scale.y",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": 4.6277203438504006e-17,
																		"dt": -0.6225880791197598
																	},
																	"nextHandle": {
																		"dv": -0.0016601562500000444,
																		"dt": 0.6398623108863838
																	}
																},
																{
																	"time": 0.9814125765860094,
																	"value": 1.3514030521277225,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.06529740767045444,
																		"dt": -0.45000000000000007
																	},
																	"nextHandle": {
																		"dv": 0.048973055752840944,
																		"dt": 0.4571428571428571
																	}
																},
																{
																	"time": 2,
																	"value": 1.5,
																	"prevHandle": {
																		"dv": -0.0056999411137919126,
																		"dt": -0.5147936865349114
																	},
																	"nextHandle": {
																		"dv": 0.004166666666666652,
																		"dt": 0.37319229364395357
																	}
																}
															],
															"loop": true
														},
														{
															"type": "curve",
															"name": "position.y",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.0824403418228046,
																	"value": 1.3360595918555545,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3030832957103853
																	},
																	"nextHandle": {
																		"dv": -7.033260358524549e-17,
																		"dt": 0.375245985165239
																	}
																},
																{
																	"time": 2.929805191867058,
																	"value": -1.5297141001759065,
																	"prevHandle": {
																		"dv": 1.0100116960932891e-16,
																		"dt": -0.33226197418058856
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7216268945485362
																	}
																},
																{
																	"time": 5.022523186057813,
																	"value": 1.2645806780773343,
																	"prevHandle": {
																		"dv": 2.456534785594936e-16,
																		"dt": -0.8081224214156756
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.6061665914207701
																	}
																},
																{
																	"time": 6.682265043519447,
																	"value": -1.6730112682914573,
																	"prevHandle": {
																		"dv": 0.08611114343955781,
																		"dt": -0.6938321848895521
																	},
																	"nextHandle": {
																		"dv": -0.035824292028887594,
																		"dt": 0.28865075781941485
																	}
																},
																{
																	"time": 8,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
														},
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 0.2
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.5,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "color.a",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8700000000000001
															},
															"nextHandle": {
																"dv": -2.70783014478137e-16,
																"dt": 0.33166666666666667
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