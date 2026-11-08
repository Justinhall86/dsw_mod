{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
					"name": "FlashDecals",
					"y": 0.47120999999999924,
					"z": 0.08530999999999994,
					"scaleX": 0.25,
					"scaleY": 0.25,
					"scaleZ": 0.25,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
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
													"time": 0.15876255500306186,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.15987725834905303,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2503630947810659,
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
											0,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Green",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"keys": [
												{
													"time": 0.10837271827219012,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.1183727182721901,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.18333308967252537,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2509382163368004,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.35,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6980392156862745,
											0.6666666666666666,
											1
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "flare02",
					"children": [
						{
							"type": "emitter",
							"name": "emitter_FlareBlack",
							"props": {
								"lifeTime": 0.35,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instScale": 1.25,
								"instStretch": [
									15,
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
								"warmUpTime": -0.1
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
													"depthTest": "LessEqual"
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
												"alpha": 1.25,
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
													0,
													0,
													0
												]
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
											"time": 0.006831217655519195,
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
											"time": 1.0068312176555192,
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
											"time": 0.006831217655519195,
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
											"time": 1.0068312176555192,
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
									12,
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
								"warmUpTime": -0.15,
								"emitType": "Burst",
								"instScale": 1.5
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
															"time": 0.006831217655519195,
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
															"time": 0.18783894350739566,
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
											"time": 0.006831217655519195,
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
											"time": 1.0068312176555192,
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
											"time": 0.006831217655519195,
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
											"time": 1.0068312176555192,
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
							"name": "Flarescreen",
							"enabled": false,
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 6,
								"lifeTime": 0.5,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.006831217655519195,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3442681988566912,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1333333333333333,
																"dt": -0.050000000000000044
															},
															"nextHandle": {
																"dv": 0.6141901939981789,
																"dt": 0.029366779035477106
															}
														},
														{
															"time": 1.0110202130168475,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										}
									]
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
														"color": -151464545
													},
													{
														"position": 0.828125,
														"color": -1
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
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "LensFlare_circle",
					"enabled": false,
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 0,
						"maxCount": 5,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9215686274509803,
							0.9215686274509803,
							0.9215686274509803,
							0.8509803921568627
						],
						"emitAngle": 0,
						"emitRate": 1,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale": 2.5,
						"emitType": "Burst",
						"burstDelay": 0.12,
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"instStretch_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -0.1,
						"instRotation": [
							0,
							0,
							60
						],
						"instOffset_rand": [
							0,
							0,
							0
						],
						"lifeTime": 0.5
					},
					"y": 0.47048,
					"z": -0.10079,
					"scaleX": 0.09999999999999999,
					"scaleY": 0.09999999999999999,
					"scaleZ": 0.09999999999999999,
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
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 2
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SphereInvert01.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2619278819653144,
														"dt": -0.3266166282733753
													},
													"nextHandle": {
														"dv": -0.85,
														"dt": 0.22000000000000003
													}
												},
												{
													"time": 1,
													"value": 0.033333333333333326,
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.6941176470588235,
											0.3607843137254902,
											0.2588235294117647
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
											0.6980392156862745,
											0.6666666666666666,
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
										"range": 5,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.8,
										"ATTENUATE": true,
										"emissiveMap": null
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
									"time": 0,
									"value": 1.0666666666666667,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1.1,
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