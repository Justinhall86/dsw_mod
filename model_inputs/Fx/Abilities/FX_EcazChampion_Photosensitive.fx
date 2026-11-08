{
	"type": "fx",
	"cullingRadius": 75,
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
					"name": "EcazPride",
					"scaleX": 0.45,
					"scaleY": 0.45,
					"scaleZ": 0.45,
					"children": [
						{
							"type": "object",
							"name": "EcazPride",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
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
													"enabled": false,
													"z": 3.09838,
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
													"scaleZ": 1.5,
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
																	"enabled": false,
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
																	"enabled": false,
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
																	"enabled": false,
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
													"type": "model",
													"name": "Elec02",
													"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
													"z": -1,
													"scaleX": 20,
													"scaleY": 20,
													"scaleZ": 20,
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
													"enabled": false,
													"locked": true,
													"z": 0.5,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 4,
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
													"enabled": false,
													"x": 0.0052,
													"y": 0.00899,
													"z": 0.31621,
													"scaleX": 5,
													"scaleY": 4.5,
													"scaleZ": 5,
													"rotationX": -90,
													"rotationZ": 60,
													"albedoMap": "Fx/Gradients/circGrad05.jpg",
													"fadePower": 3,
													"emissive": 16,
													"renderMode": "BeforeTonemapping",
													"normalFadeStart": 0.48,
													"blendMode": 2,
													"children": [
														{
															"type": "shader",
															"name": "AlphaMult",
															"source": "shaders/AlphaMult.hx",
															"props": {
																"alpha": 6
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
																"progress": 0.32,
																"saturation": 2,
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
										"emitRad2": 0.61,
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
															"emissive": 15
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
						},
						{
							"type": "object",
							"name": "UNITS",
							"editorOnly": true,
							"children": [
								{
									"type": "model",
									"name": "Female01_EcazFencer",
									"source": "Character/Ecaz/Unit/Fencer/Female01_EcazFencer.fbx",
									"x": -1.253083333333333,
									"y": 0.8456099999999971,
									"scaleX": 2.9999999999999987,
									"scaleY": 2.9999999999999987,
									"scaleZ": 3,
									"rotationZ": 145
								},
								{
									"type": "model",
									"name": "Female01_EcazFencer",
									"source": "Character/Ecaz/Unit/Fencer/Female01_EcazFencer.fbx",
									"x": 3.40274,
									"y": 0.19511,
									"scaleX": 2.9999999999999987,
									"scaleY": 2.9999999999999987,
									"scaleZ": 3,
									"rotationZ": 145
								},
								{
									"type": "model",
									"name": "Female01_EcazFencer",
									"source": "Character/Ecaz/Unit/Fencer/Female01_EcazFencer.fbx",
									"x": 0.76301,
									"y": -3.08019,
									"scaleX": 2.9999999999999987,
									"scaleY": 2.9999999999999987,
									"scaleZ": 3,
									"rotationZ": 145
								}
							]
						}
					]
				}
			]
		}
	]
}