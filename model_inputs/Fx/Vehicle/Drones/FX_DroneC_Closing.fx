{
	"duration": 3,
	"cullingRadius": 3,
	"type": "fx",
	"children": [
		{
			"name": "FXRoot",
			"enabled": false,
			"type": "object",
			"children": [
				{
					"name": "DroneC",
					"source": "Vehicle/Imperial/DroneI/ImperiumDroneCanon.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"type": "model",
					"children": [
						{
							"name": "ImperiumDroneBase",
							"source": "Vehicle/Imperial/DroneI/ImperiumDroneBase.fbx",
							"type": "model"
						},
						{
							"name": "animEvent",
							"animation": "Anim/DroneC/Anim_DroneC_Closing.fbx",
							"type": "animEvent"
						}
					]
				},
				{
					"name": "Floor",
					"enabled": false,
					"editorOnly": true,
					"locked": true,
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 50,
					"kind": 0,
					"args": [
						0
					],
					"type": "polygon",
					"children": [
						{
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
							"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png",
							"type": "material"
						}
					]
				},
				{
					"name": "Piston",
					"x": -1.84708,
					"y": 0.09961,
					"z": 2.09354,
					"type": "object",
					"children": [
						{
							"name": "PistonClosing",
							"enabled": false,
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
								"instScale": 14,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 0,
								"warmUpTime": -0.95,
								"emitType": "Burst"
							},
							"z": 0.06645499999999949,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 3
												}
											},
											"type": "material"
										},
										{
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
												"texture": "Fx/Alphas/T_FlatImpact.png"
											},
											"type": "shader",
											"children": [
												{
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
													],
													"type": "curve"
												},
												{
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.7050000000000001
															},
															"nextHandle": {
																"dv": -2.429586660754108e-16,
																"dt": 0.29758620964579513
															}
														}
													],
													"type": "curve"
												}
											]
										},
										{
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
											"type": "shader"
										},
										{
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
											"type": "shader",
											"children": [
												{
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
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
													],
													"type": "curve"
												}
											]
										}
									]
								},
								{
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
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
									],
									"type": "curve"
								}
							]
						},
						{
							"name": "PistonClosing_Dust",
							"props": {
								"lifeTime": 0.5,
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
								"instScale": 14,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 0,
								"warmUpTime": -0.95,
								"emitType": "Burst"
							},
							"z": -0.06645500000000037,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"type": "material"
										},
										{
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SmokeDonut02.png"
											},
											"type": "shader",
											"children": [
												{
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
													],
													"type": "curve"
												},
												{
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.7050000000000001
															},
															"nextHandle": {
																"dv": -2.429586660754108e-16,
																"dt": 0.29758620964579513
															}
														}
													],
													"type": "curve"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7333333333333333,
													0.6666666666666666,
													0.592156862745098
												]
											},
											"isInstance": true,
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
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
											"type": "shader",
											"children": [
												{
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
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
													],
													"type": "curve"
												}
											]
										}
									]
								},
								{
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
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
									],
									"type": "curve"
								}
							]
						}
					]
				},
				{
					"name": "Canon",
					"x": 0.86659,
					"y": 0.09961,
					"z": 2.23283,
					"rotationZ": 90,
					"type": "object",
					"children": [
						{
							"name": "PistonClosing",
							"enabled": false,
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
								"instScale": 10,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0,
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instStretch": [
									0.8,
									1.5,
									1
								]
							},
							"z": 0.06645499999999949,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 6
												}
											},
											"type": "material"
										},
										{
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
												"texture": "Fx/Alphas/T_FlatImpact.png"
											},
											"type": "shader",
											"children": [
												{
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
													],
													"type": "curve"
												},
												{
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.7050000000000001
															},
															"nextHandle": {
																"dv": -2.429586660754108e-16,
																"dt": 0.29758620964579513
															}
														}
													],
													"type": "curve"
												}
											]
										},
										{
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
											"type": "shader"
										},
										{
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
											"type": "shader",
											"children": [
												{
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
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
													],
													"type": "curve"
												}
											]
										}
									]
								},
								{
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
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
									],
									"type": "curve"
								}
							]
						},
						{
							"name": "PistonClosing_Dust",
							"props": {
								"lifeTime": 0.5,
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
								"instScale": 10,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0,
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instStretch": [
									0.8,
									1.5,
									1
								]
							},
							"z": -0.06645500000000037,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"type": "emitter",
							"children": [
								{
									"name": "polygon",
									"kind": 0,
									"args": [
										0
									],
									"type": "polygon",
									"children": [
										{
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
											},
											"type": "material"
										},
										{
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SmokeDonut02.png"
											},
											"type": "shader",
											"children": [
												{
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
													],
													"type": "curve"
												},
												{
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.7050000000000001
															},
															"nextHandle": {
																"dv": -2.429586660754108e-16,
																"dt": 0.29758620964579513
															}
														}
													],
													"type": "curve"
												}
											]
										},
										{
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7333333333333333,
													0.6666666666666666,
													0.592156862745098
												]
											},
											"isInstance": true,
											"type": "shader"
										},
										{
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
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
											"type": "shader",
											"children": [
												{
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
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
													],
													"type": "curve"
												}
											]
										}
									]
								},
								{
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
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
									],
									"type": "curve"
								}
							]
						}
					]
				}
			]
		}
	]
}