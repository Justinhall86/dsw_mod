{
	"type": "fx",
	"duration": 3.5,
	"cullingRadius": 3,
	"blendFactor": 1,
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
					"refMatLib": ""
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": -1.15,
			"scaleX": 1.06,
			"scaleY": 1.06,
			"scaleZ": 1.06,
			"rotationZ": 180,
			"children": [
				{
					"type": "subFX",
					"name": "VerniusFregate_TeleportArrival",
					"source": "Fx/Vehicle/Ships/Vernius/FX_VerniusFrigate_TeleportArrival.fx",
					"time": 0.225
				},
				{
					"type": "object",
					"name": "Anticipation",
					"z": 56.875,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -56.875,
							"scaleX": 300,
							"scaleY": 300,
							"scaleZ": 20,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"renderMode": "BeforeTonemapping",
							"children": [
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.1959820794076995,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.32924989340493516,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 0.36844630928647504,
													"value": 0.1,
													"mode": 2
												},
												{
													"time": 0.46251770740217085,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.9366737838779197,
													"value": 0,
													"mode": 2
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
													"time": 0.11117308397964921,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2425594559555985,
													"value": 0.12222910258648079,
													"mode": 0,
													"prevHandle": {
														"dv": -0.13572256193550614,
														"dt": -0.05882219096984883
													},
													"nextHandle": {
														"dv": 0.1333321538423176,
														"dt": 0.05712240029228685
													}
												},
												{
													"time": 0.41928109424159343,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.9366737838779197,
													"value": 0,
													"mode": 2
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
													"time": 0.11117308397964921,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2425594559555985,
													"value": 0.12222910258648079,
													"mode": 0,
													"prevHandle": {
														"dv": -0.13572256193550614,
														"dt": -0.05882219096984883
													},
													"nextHandle": {
														"dv": 0.1333321538423176,
														"dt": 0.05712240029228685
													}
												},
												{
													"time": 0.41928109424159343,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.9366737838779197,
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
							"name": "emitter_flareVERTICAL",
							"props": {
								"lifeTime": 0.1,
								"alignMode": "Axis",
								"alignLockAxis": "Z",
								"emitType": "Burst",
								"burstDelay": 0.15,
								"instScale": 25,
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
								]
							},
							"z": 68.125,
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
													"emissive": 15
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.49516908212560384,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.23027259684361548,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
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
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.7087914683036053,
												"dt": -0.3863616036602915
											},
											"nextHandle": {
												"dv": 0.40533303164394807,
												"dt": 0.22070899192578208
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.010395383228392285,
												"dt": -0.5109986136922551
											},
											"nextHandle": {
												"dv": -0.00942505454810496,
												"dt": 0.4093557452432171
											}
										}
									]
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
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.7087914683036053,
												"dt": -0.3863616036602915
											},
											"nextHandle": {
												"dv": 0.40533303164394807,
												"dt": 0.22070899192578208
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.010395383228392285,
												"dt": -0.5109986136922551
											},
											"nextHandle": {
												"dv": -0.00942505454810496,
												"dt": 0.4093557452432171
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
					"enabled": false,
					"props": {
						"amount": 1,
						"color": [
							1,
							0,
							0
						]
					}
				}
			]
		},
		{
			"type": "subFX",
			"name": "FX_VerniusFrigate_Teleport_A",
			"source": "Fx/Vehicle/Ships/Vernius/FX_VerniusFrigate_Teleport_A.fx",
			"enabled": false
		}
	]
}