{
	"type": "fx",
	"duration": 1.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"enabled": false,
			"children": [
				{
					"type": "model",
					"name": "Banshee",
					"source": "Vehicle/Smuggler/Banshee/Banshee.fbx",
					"editorOnly": true,
					"scaleX": 1.6,
					"scaleY": 1.6,
					"scaleZ": 1.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Banshee/Anim_Banshee_Closing.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "WingsClose",
					"x": 3.48736,
					"y": 0.09961,
					"z": 4.02688,
					"children": [
						{
							"type": "object",
							"name": "left",
							"x": -5.61208,
							"y": 0.30592,
							"z": -2.43855,
							"rotationX": -90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
										"lifeTime": 0.7,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 8,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"instStretch": [
											1.5,
											1.25,
											1
										]
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual"
														}
													}
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
														"texture": "Fx/Alphas/T_SmokeDonut02.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"progress": 0.35,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.05011964684488167,
																		"dt": -0.4999434772776851
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6649999999999999
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
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
												},
												{
													"time": 1,
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
							"name": "left",
							"x": -5.61208,
							"y": -0.38067,
							"z": -2.43855,
							"rotationX": 90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
										"lifeTime": 0.7,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 12,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"instStretch": [
											1.5,
											1.25,
											1
										],
										"instRotation": [
											0,
											0,
											180
										]
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual"
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Alphas/T_ChocWave_04_512.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"texture": "Fx/Alphas/T_SmokeDonut.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"progress": 0.35,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.05011964684488167,
																		"dt": -0.4999434772776851
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6649999999999999
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
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
												},
												{
													"time": 1,
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
					"name": "WingsClose_Backup",
					"enabled": false,
					"x": 3.48736,
					"y": 0.09961,
					"z": 4.02688,
					"children": [
						{
							"type": "object",
							"name": "left",
							"x": -5.61208,
							"y": 0.30592,
							"z": -2.43855,
							"rotationX": -90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
										"lifeTime": 0.35,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 12,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"instStretch": [
											1.5,
											1,
											1
										]
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"emissive": 3
														}
													}
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
														"texture": "Fx/Alphas/T_FlatImpact01.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"progress": 0.35,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.05011964684488167,
																		"dt": -0.4999434772776851
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6649999999999999
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
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
												},
												{
													"time": 1,
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
							"name": "left",
							"x": -5.61208,
							"y": -0.38067,
							"z": -2.43855,
							"rotationX": 90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
										"lifeTime": 0.35,
										"emitRate": 2,
										"useRandomColor": true,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											0.9019607843137255,
											0.9019607843137255,
											0.9019607843137255,
											0.7294117647058823
										],
										"instScale": 12,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"instStretch": [
											1.5,
											1,
											1
										],
										"instRotation": [
											0,
											0,
											180
										]
									},
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.01,
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
															"depthTest": "LessEqual",
															"emissive": 3
														}
													}
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Alphas/T_ChocWave_04_512.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"texture": "Fx/Alphas/T_FlatImpact01.png"
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.0058489084243771305,
																		"dt": -0.06672153635116596
																	},
																	"nextHandle": {
																		"dv": 0.0058489084243771305,
																		"dt": 0.06672153635116596
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
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
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 0.1072413710626145,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.72461889338076e-17,
																		"dt": -0.06674460494105923
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4077586289373854
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.7050000000000001
																	},
																	"nextHandle": {
																		"dv": -2.429586660754108e-16,
																		"dt": 0.29758620964579513
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
														"progress": 0.35,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Water_01.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.05011964684488167,
																		"dt": -0.4999434772776851
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6649999999999999
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
														"dv": -0.9944446984687934,
														"dt": -0.48890120703870477
													},
													"nextHandle": {
														"dv": 0.7,
														"dt": 0.3425225781956737
													}
												},
												{
													"time": 1,
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
					"name": "Wings",
					"enabled": false,
					"x": -4.41999,
					"y": 0.09469,
					"z": 2.83695,
					"children": [
						{
							"type": "model",
							"name": "Left",
							"source": "Fx/Vehicle/Harvester/HarvestFrontMesh.fbx",
							"x": 1.0725,
							"y": 2.05974,
							"z": -0.79314,
							"scaleX": 1.4,
							"scaleY": 1.45,
							"scaleZ": 1.2,
							"rotationY": 22.7,
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
											"depthTest": "LessEqual",
											"emissive": 2
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 0.75,
										"uOffset": -0.14,
										"vOffset": 0.08,
										"texture": "Fx/Alphas/DustMask02_rot.png"
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
													"time": 0.08154320987654384,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.18939362436863416,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.39672839506172863,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.09,
										"uvScaleY": 4,
										"texture": "Fx/noise/Wave_01.jpg",
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
										"progress": 0.5,
										"saturation": 1,
										"width": 0.45,
										"uvScaleX": 1,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl12u_A.png",
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
										"progress": 0.88,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -1
													},
													{
														"position": 0.52734375,
														"color": -16777216
													}
												],
												"resolution": 64,
												"isVertical": false
											}
										},
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
											"name": "width",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.14594732519773312,
													"value": 2,
													"mode": 1,
													"prevHandle": {
														"dv": 5.891587110583394e-16,
														"dt": -0.5000000000000001
													},
													"nextHandle": {
														"dv": -0.01754672527313139,
														"dt": 0.2476946501109093
													}
												},
												{
													"time": 0.6239888449064681,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.1170987654320993,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.1317716115935103,
														"dt": -0.4997560380435394
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.12641975308641973
													}
												},
												{
													"time": 0.5014814814814819,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5409876543209879,
													"value": 2,
													"mode": 2
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
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
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
						},
						{
							"type": "model",
							"name": "Right",
							"source": "Fx/Vehicle/Harvester/HarvestFrontMesh.fbx",
							"x": 1.08273,
							"y": -2.71696,
							"z": -0.86054,
							"scaleX": 1.4,
							"scaleY": 1.45,
							"scaleZ": 1.2,
							"rotationY": 8.4,
							"rotationZ": -89.3,
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
											"emissive": 2
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 0.75,
										"uOffset": -0.14,
										"vOffset": 0.08,
										"texture": "Fx/Alphas/DustMask02_rot.png"
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
													"time": 0.08154320987654384,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.18939362436863416,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.39672839506172863,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.09,
										"uvScaleY": 4,
										"texture": "Fx/noise/Wave_01.jpg",
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
										"progress": 0.5,
										"saturation": 1,
										"width": 0.45,
										"uvScaleX": 1,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/Cyl12u_A.png",
										"uvShift": [
											0,
											0.4
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
										"progress": 0.88,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -1
													},
													{
														"position": 0.52734375,
														"color": -16777216
													}
												],
												"resolution": 64,
												"isVertical": false
											}
										},
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
											"name": "width",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.14594732519773312,
													"value": 2,
													"mode": 1,
													"prevHandle": {
														"dv": 5.891587110583394e-16,
														"dt": -0.5000000000000001
													},
													"nextHandle": {
														"dv": -0.01754672527313139,
														"dt": 0.2476946501109093
													}
												},
												{
													"time": 0.6239888449064681,
													"value": 1,
													"mode": 2
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
													"time": 0.1170987654320993,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.5014814814814819,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06979423868312758
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013168724279835361
													}
												},
												{
													"time": 0.5409876543209879,
													"value": -1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keys": [
												{
													"time": 0.1170987654320993,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.1317716115935103,
														"dt": -0.4997560380435394
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.12641975308641973
													}
												},
												{
													"time": 0.5014814814814819,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5409876543209879,
													"value": 2,
													"mode": 2
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
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 2
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