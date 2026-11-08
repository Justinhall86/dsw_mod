{
	"type": "fx",
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
					"type": "model",
					"name": "RailgunMESH",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"editorOnly": true,
					"x": 6.948030000000001,
					"z": -0.5,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"enabled": false,
							"animation": "Anim/Siren/Anim_Siren_Run.fbx"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0.30196078431372547,
									0.30196078431372547,
									0.3529411764705882
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "FlashDecals",
					"y": 0.47120999999999924,
					"z": 0.08530999999999994,
					"scaleX": 3.5,
					"scaleY": 2.5,
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
							"name": "advancedDecal_Purple",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "AfterTonemapping",
							"children": [
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
													"time": 1.0490674210599766,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003251919125525249,
														"dt": -0.42266141964660975
													},
													"nextHandle": {
														"dv": -3.9315606214746946e-17,
														"dt": 0.026052550476966443
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
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_white",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 3,
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
													"time": 0.32897992819900146,
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
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
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
				},
				{
					"type": "model",
					"name": "Elec02",
					"source": "Fx/Meshes_Common/Mesh_Wormsign_modified.fbx",
					"enabled": false,
					"z": -2,
					"scaleX": 60,
					"scaleY": 60,
					"scaleZ": 60,
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
											"time": 0.17774574439530205,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.1777457443953023,
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
											"time": 0.16365598430345588,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1636559843034562,
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
											"time": 0.16365598430345588,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1636559843034562,
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
											"time": 0.16365598430345588,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 1.1636559843034562,
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
									"time": 0.16365598430345588,
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
									"time": 1.1636559843034562,
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
							"enabled": false,
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
											"time": 0.40188190292225967,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9515816665959654,
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
									0.5490196078431373,
									0.49019607843137253,
									0.996078431372549
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"enabled": false,
									"keys": [
										{
											"time": 0.40188190292225967,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9515816665959654,
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
					"type": "polygon",
					"name": "partition",
					"scaleX": 28.5,
					"scaleY": 28.5,
					"scaleZ": 2.28,
					"kind": 1,
					"args": [
						48,
						360,
						0,
						4
					],
					"children": [
						{
							"type": "material",
							"name": "material",
							"enabled": false,
							"props": {
								"PBR": {
									"mode": "Decal",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Front",
									"depthTest": "Greater",
									"colorMask": 15,
									"enableStencil": true,
									"stencilFailOp": "Keep",
									"depthFailOp": "Keep",
									"stencilPassOp": "Replace",
									"stencilCompare": "NotEqual",
									"stencilValue": 128,
									"stencilReadMask": 128,
									"stencilWriteMask": 128,
									"alphaKill": false,
									"emissive": 20
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"mainPassName": "beforeTonemappingDecal",
							"children": [
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.05,
										"useRGB": false
									}
								}
							]
						},
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
									"enableStencil": true,
									"alphaKill": false,
									"emissive": 20,
									"stencilFailOp": "Keep",
									"depthFailOp": "Keep",
									"stencilPassOp": "Replace",
									"stencilCompare": "NotEqual",
									"stencilValue": 128,
									"stencilReadMask": 192,
									"stencilWriteMask": 128
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.05,
										"useRGB": false
									}
								}
							]
						},
						{
							"type": "material",
							"name": "material",
							"enabled": false,
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "None",
									"colorMask": 255,
									"emissive": 20
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AnimatedTexture",
							"source": "h3d.shader.AnimatedTexture",
							"props": {
								"useSourceUVs": false,
								"blendBetweenFrames": true,
								"startFrame": 0,
								"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
								"speed": 10,
								"frameDivision": [
									1,
									4
								],
								"totalFrames": 4,
								"startTime": 0,
								"loop": true
							}
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
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
								"progress": 0.85,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.25,
								"texture": "Fx/noise/Water_01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.1,
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
								"progress": 0.82,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 0.25,
								"texture": "Fx/noise/Water_01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.1,
									0
								]
							}
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
												"color": -15007601
											},
											{
												"position": 0.5,
												"color": -5137922
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"enabled": false,
							"props": {
								"scaleX": 4,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							}
						},
						{
							"type": "shader",
							"name": "DissolveMap_IN",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.77,
								"saturation": 0,
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
												"position": 0.75390625,
												"color": -16777216
											}
										],
										"resolution": 64,
										"isVertical": true,
										"interpolation": "Constant",
										"colorMode": 0
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
							}
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 4,
								"scaleY": 5,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.25101971680139323,
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
									"time": 1.2510197168013917,
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
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.2680860632043781,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.087417357262422,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.5626732983290179
											},
											"nextHandle": {
												"dv": 0.014473662997169512,
												"dt": 0.244318310925603
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
											"time": 0.5919141318024249,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.087417357262422,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005932639245273208,
												"dt": -0.40181897438335434
											},
											"nextHandle": {
												"dv": -0.004351509571866821,
												"dt": 0.24445755395368918
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
											"time": 0.5067466308236587,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.087417357262422,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.1935569088129211
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
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
					"name": "Duration",
					"scaleX": 3.2,
					"scaleY": 3.2,
					"scaleZ": 3.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_mask",
							"locked": true,
							"scaleX": 16.5,
							"scaleY": 16.5,
							"scaleZ": 3.4000000000000004,
							"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "Always",
											"stencilValue": 128,
											"stencilReadMask": 128,
											"stencilWriteMask": 128,
											"emissive": 1,
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.01
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_border",
							"locked": true,
							"scaleX": 17,
							"scaleY": 17,
							"scaleZ": 6,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "NotEqual",
											"stencilValue": 128,
											"stencilReadMask": 128,
											"stencilWriteMask": 0,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"time": 0.4114152237559542,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6714414348117468,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0881706867511685,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
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
														"color": -81132914
													},
													{
														"position": 1,
														"color": -7306288
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
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.6666666666666666,
											0.6235294117647059,
											0.8784313725490196,
											1
										],
										"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
										"UVOffset": [
											0,
											0
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Duration",
					"enabled": false,
					"x": 30.00473,
					"scaleX": 3.2,
					"scaleY": 3.2,
					"scaleZ": 3.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_mask",
							"locked": true,
							"scaleX": 16.5,
							"scaleY": 16.5,
							"scaleZ": 3.4000000000000004,
							"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "Always",
											"stencilValue": 128,
											"stencilReadMask": 128,
											"stencilWriteMask": 128,
											"emissive": 1,
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.01
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_border",
							"locked": true,
							"scaleX": 17,
							"scaleY": 17,
							"scaleZ": 6,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Keep",
											"stencilCompare": "NotEqual",
											"stencilValue": 128,
											"stencilReadMask": 128,
											"stencilWriteMask": 128,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"time": 0.4114152237559542,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6714414348117468,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0881706867511685,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.5
									}
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
														"color": -81132914
													},
													{
														"position": 1,
														"color": -7306288
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
									"name": "MaskColorAlpha",
									"source": "hrt.shader.MaskColorAlpha",
									"props": {
										"UVScale": [
											1,
											1
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											0.6666666666666666,
											0.6235294117647059,
											0.8784313725490196,
											1
										],
										"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
										"UVOffset": [
											0,
											0
										]
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