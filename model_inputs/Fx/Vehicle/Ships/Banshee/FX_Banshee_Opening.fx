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
							"animation": "Anim/Banshee/Anim_Banshee_Opening.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Piston",
					"x": 1.33923,
					"z": 1.52386,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"rotationY": 99.2,
					"children": [
						{
							"type": "object",
							"name": "Left",
							"x": 0.16567,
							"y": 0.85407,
							"z": 0.16622,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 0.6,
							"rotationX": -90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
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
										"instScale": 18,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 0,
										"warmUpTime": -0.3,
										"emitType": "Burst"
									},
									"y": -2.7755575615628914e-17,
									"z": 0.06645499999999993,
									"scaleX": 0.10000000000000002,
									"scaleY": 0.1,
									"scaleZ": 0.10000000000000002,
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
														"alpha": 0.5,
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.79
																	},
																	"nextHandle": {
																		"dv": 0.012555374315710527,
																		"dt": 0.29756237128234553
																	}
																}
															]
														},
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
														"progress": 0.45,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
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
							"name": "Right",
							"x": 0.16567,
							"y": -0.84746,
							"z": 0.16622,
							"scaleX": 0.6,
							"scaleY": 0.6,
							"scaleZ": 0.6,
							"rotationX": 90,
							"children": [
								{
									"type": "emitter",
									"name": "PistonClosing",
									"props": {
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
										"instScale": 18,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instScale_rand": 0,
										"warmUpTime": -0.3,
										"emitType": "Burst"
									},
									"y": -2.7755575615628914e-17,
									"z": 0.06645499999999993,
									"scaleX": 0.10000000000000002,
									"scaleY": 0.1,
									"scaleZ": 0.10000000000000002,
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
														"alpha": 0.5,
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.29758620964579513
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.29758620964579513
																	}
																}
															]
														},
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.033333333333333326,
																		"dt": -0.79
																	},
																	"nextHandle": {
																		"dv": 0.012555374315710527,
																		"dt": 0.29756237128234553
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
														"progress": 0.45,
														"saturation": 0.5,
														"width": 0.8,
														"uvScaleX": 1.5,
														"uvScaleY": 1.5,
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
					"z": 2.49443,
					"children": [
						{
							"type": "model",
							"name": "Center",
							"source": "Fx/Meshes_Common/Plane.fbx",
							"enabled": false,
							"x": 1.6532,
							"y": -0.1383,
							"scaleX": 2,
							"scaleY": 4,
							"scaleZ": 5,
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.365,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4728504144920903,
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
													"time": 0.5585802469135803,
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
													"mode": 2
												},
												{
													"time": 0.4321604938271605,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6257407407407408,
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
													"time": 0.7284567901234569,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
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
													"mode": 2
												},
												{
													"time": 0.31474179551361914,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4728504144920903,
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
													"time": 0.6046075969741498,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.5372549019607843,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.11462360525873772,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8878855393105763,
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
										"uvScaleY": 3,
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
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.09,
										"uvScaleY": 2.5,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0.5,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.21813253012048184,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.5011445783132528,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
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
											"keys": [
												{
													"time": 0.49261399186439936,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7956555115731344,
													"value": 0,
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
										"range": 16.67,
										"power": 20
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
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.2741358024691358,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.12378600823045267
											}
										},
										{
											"time": 0.6454938271604939,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.1698765432098766
											},
											"nextHandle": {
												"dv": -2.530936718237864e-16,
												"dt": 0.12246913580246917
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Left",
							"source": "Fx/Vehicle/Harvester/HarvestFrontMesh.fbx",
							"x": 1.0725,
							"y": 1.88054,
							"z": -0.95778,
							"scaleX": 1.92,
							"scaleY": 1.69,
							"scaleZ": 1.4,
							"rotationY": 16.8,
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
													"time": 0.6415432098765435,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7493936243686338,
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
													"time": 0.8667283950617284,
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
										"progress": 0.12,
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
														"color": -16777216
													},
													{
														"position": 0.53125,
														"color": -1
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7059473251977327,
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
													"time": 1.008988844906468,
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
													"time": 0.6770987654320989,
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
													"time": 0.8864814814814816,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9259876543209877,
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
							"x": 1.06127,
							"y": -2.26678,
							"z": -1.26065,
							"scaleX": 1.92,
							"scaleY": 1.69,
							"scaleZ": 1.4,
							"rotationX": 0.1,
							"rotationY": 9.7,
							"rotationZ": -90.6,
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
													"time": 0.6415432098765435,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7493936243686338,
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
													"time": 0.8667283950617284,
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
										"progress": 0.12,
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
														"color": -16777216
													},
													{
														"position": 0.53125,
														"color": -1
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7059473251977327,
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
													"time": 1.008988844906468,
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
													"time": 0.6770987654320989,
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
													"time": 0.8864814814814816,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9259876543209877,
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
						}
					]
				}
			]
		}
	]
}