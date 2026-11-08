{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"x": -0.28002,
			"y": 0.45299,
			"z": -0.15,
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
					"type": "curve",
					"name": "scale",
					"enabled": false,
					"keyMode": 0,
					"keys": [
						{
							"time": 0,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0,
								"dt": -0.5
							},
							"nextHandle": {
								"dv": 0,
								"dt": 0.16666666666666666
							}
						},
						{
							"time": 0.5,
							"value": 1,
							"mode": 2
						},
						{
							"time": 1.5,
							"value": 1,
							"mode": 2
						},
						{
							"time": 1.9943687165344897,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0,
								"dt": -0.16478957217816323
							},
							"nextHandle": {
								"dv": 0,
								"dt": 0.16478957217816323
							}
						}
					]
				},
				{
					"type": "object",
					"name": "backup",
					"enabled": false,
					"y": 17.19133,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"scaleX": 11,
							"scaleY": 11,
							"scaleZ": 11,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
													}
												},
												{
													"time": 1.2030374710648148,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0,
											"value": 0.9244057074420672,
											"mode": 2
										},
										{
											"time": 1.207418212890625,
											"value": 1.0890832426668116,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Litcircle",
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
													}
												},
												{
													"time": 1.5073807327835649,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.006063232421875009,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1.8721679687500004,
											"value": 1.6546030312776574,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Cutcircle",
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 7,
							"albedoMap": "Fx/Alphas/T-InnerGradient_02.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
													}
												},
												{
													"time": 1.2030374710648148,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0,
											"value": 0.9244057074420672,
											"mode": 2
										},
										{
											"time": 1.2234362792968752,
											"value": 1.9,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Dot",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 3,
							"albedoMap": "Fx/Alphas/T_circle5.png",
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
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
														"dv": -1.0062331211268096,
														"dt": -0.12724664963982169
													},
													"nextHandle": {
														"dv": 0.6333333333333333,
														"dt": 0.07814453125000002
													}
												},
												{
													"time": 0.3424426269531251,
													"value": 0.95,
													"mode": 0
												},
												{
													"time": 0.9816503906249997,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.32499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.32499999999999996
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.714985851425088,
												"dt": -0.4287464628562722
											},
											"nextHandle": {
												"dv": 0.5,
												"dt": 0.12499999999999999
											}
										},
										{
											"time": 1.0416503906249996,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.185
											},
											"nextHandle": {
												"dv": 0.030019068164349665,
												"dt": 0.1666058283121422
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 100,
									"scaleZ": 5,
									"rotationX": 90,
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png"
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
																"dv": -0.93064415341555,
																"dt": -0.22360679774997907
															},
															"nextHandle": {
																"dv": 0.3666666666666667,
																"dt": 0.08615356445312501
															}
														},
														{
															"time": 0.4866052246093751,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 1.2634814453125003,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
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
												"range": 1,
												"power": 1
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 3.033477783203126,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
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
					"name": "test4",
					"enabled": false,
					"y": 27.72248,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Dot",
							"enabled": false,
							"scaleZ": 1.37,
							"albedoMap": "Fx/Alphas/T_circle5.png",
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.0062331211268096,
														"dt": -0.12724664963982169
													},
													"nextHandle": {
														"dv": 0.6333333333333333,
														"dt": 0.07814453125000002
													}
												},
												{
													"time": 0.3424426269531251,
													"value": 0.95,
													"mode": 0
												},
												{
													"time": 0.9816503906249997,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.32499999999999996
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.32499999999999996
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.714985851425088,
												"dt": -0.4287464628562722
											},
											"nextHandle": {
												"dv": 0.5,
												"dt": 0.12499999999999999
											}
										},
										{
											"time": 1.0416503906249996,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.185
											},
											"nextHandle": {
												"dv": 0.030019068164349665,
												"dt": 0.1666058283121422
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2.5,
									"scaleY": 100,
									"scaleZ": 5,
									"rotationX": 90,
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Spark.png"
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
																"dv": -0.93064415341555,
																"dt": -0.22360679774997907
															},
															"nextHandle": {
																"dv": 0.3666666666666667,
																"dt": 0.08615356445312501
															}
														},
														{
															"time": 0.4866052246093751,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 1.2634814453125003,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
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
												"range": 1,
												"power": 1
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 3.033477783203126,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 3,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 5,
									"scaleY": 60,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.375,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 6.939665195168335e-17,
																"dt": -0.17
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.19499999999999995
															}
														},
														{
															"time": 0.75,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01666666666666669,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": -0.020820059465573977,
																"dt": 0.17488849951082105
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
															"mode": 0,
															"prevHandle": {
																"dv": -0.93064415341555,
																"dt": -0.22360679774997907
															},
															"nextHandle": {
																"dv": 0.3666666666666667,
																"dt": 0.08615356445312501
															}
														},
														{
															"time": 0.4866052246093751,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 1.2634814453125003,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.4686881676498726,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 1.2634814453125003,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.15,
													"value": 3.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 0.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
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
							"name": "group",
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Cutcircle",
									"scaleX": 10.909954243295525,
									"scaleY": 10.909954243295525,
									"scaleZ": 10.909954243295527,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 1.22,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 0.9244057074420672,
													"mode": 2
												},
												{
													"time": 0.61,
													"value": 1.9,
													"mode": 3
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Litcircle",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.10217163085937501,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07860218451400555,
																"dt": -0.9442912584162424
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.20022583007812506
															}
														},
														{
															"time": 0.4065148925781251,
															"value": 0.3999999999999999,
															"mode": 1,
															"prevHandle": {
																"dv": 3.725446948368962e-17,
																"dt": -0.14618367513020838
															},
															"nextHandle": {
																"dv": -0.41666666666666696,
																"dt": 0.25628906249999994
															}
														},
														{
															"time": 1.5073807327835649,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.006063232421875009,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.5919704399125435,
														"dt": -0.4547372377929001
													},
													"nextHandle": {
														"dv": 0.729823150634766,
														"dt": 0.5606323242187501
													}
												},
												{
													"time": 1.8721679687500004,
													"value": 1.6546030312776574,
													"mode": 3
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Bigcircle",
									"scaleX": 11.361570654241413,
									"scaleY": 11.361570654241413,
									"scaleZ": 11.361570654241415,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 1.22,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 0.9244057074420672,
													"mode": 2
												},
												{
													"time": 0.6,
													"value": 1.0890832426668116,
													"mode": 3
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "testTEST",
					"enabled": false,
					"y": -27.59586,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt_floor",
							"enabled": false,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "advancedDecal",
									"name": "targetOK",
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 27.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Circle_4.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0.5,
													"mode": 0
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"scaleX": 57.63136725042478,
							"scaleY": 57.63136725042478,
							"scaleZ": 57.63136725042478,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
													}
												},
												{
													"time": 1.5073807327835649,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1.8721679687500004,
											"value": 1.6546030312776574,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"enabled": false,
							"scaleX": 60,
							"scaleY": 60,
							"scaleZ": 60,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"loop": true,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1,
											"value": 1.6546030312776574,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"z": 4,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 169.0233831537802,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 5,
									"scaleY": 60,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01.png"
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
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.15,
													"value": 3.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 0.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												},
												{
													"time": 1.5,
													"value": 0.00040170254973542763,
													"mode": 0
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 12,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 169.0233831537802,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 11,
									"scaleX": 5,
									"scaleY": 100,
									"scaleZ": 4,
									"rotationX": -90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01_half.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
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
												"range": 22.73,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
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
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.061512878495051486,
												"dt": -0.24912715790495873
											},
											"nextHandle": {
												"dv": 0.061512878495051486,
												"dt": 0.24912715790495873
											}
										},
										{
											"time": 1,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02140431723695215,
												"dt": -0.21599913817562374
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.33293945312499984
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									}
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"z": 4,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 169.0233831537802,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 5,
									"scaleY": 60,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.15,
													"value": 3.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 0.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
												},
												{
													"time": 1.5,
													"value": 0.00040170254973542763,
													"mode": 0
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.25,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 44.17486656773006,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 100,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"texture": "Fx/Alphas/T_MissileHead01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.375,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 6.939665195168335e-17,
																"dt": -0.17
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.19499999999999995
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keys": [
												{
													"time": 0.0011797047187638026,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06938424118696897,
														"dt": -0.49956653654617594
													},
													"nextHandle": {
														"dv": 0.01666666666666669,
														"dt": 0.12000000000000001
													}
												},
												{
													"time": 0.75,
													"value": 2.5,
													"mode": 2
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
												"progress": 0.67,
												"saturation": 1,
												"width": 0.64,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.1,
													-0.1
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.2,
												"maxAlpha": 1,
												"frequency": 0.75
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
												"progress": 0.65,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
													-0.3
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5535714285714286,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.06462585034013606
															}
														},
														{
															"time": 3,
															"value": 0.6,
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
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 1
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7087760262009897,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5067013758461782,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16478957217816323
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16478957217816323
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 1,
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
											"time": 6.968946296515335,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.968946296515335,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.784568485048185,
											"value": 0,
											"mode": 0
										},
										{
											"time": 8.784568485048185,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6134167868351827
											},
											"nextHandle": {
												"dv": -5.203835947078549e-17,
												"dt": 0.16478957217816323
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 80,
							"scaleY": 80,
							"scaleZ": 80,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
							"emissive": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
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
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0.24109175489003276,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.24109175489003276,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.938275785748485,
												"dt": -0.3322758489854544
											},
											"nextHandle": {
												"dv": 0.11666666666666664,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.31592592592592583
											},
											"nextHandle": {
												"dv": 0.01764709375778003,
												"dt": 0.16676503601102188
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
					"name": "test2",
					"enabled": false,
					"y": -54.73404,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt_floor",
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "advancedDecal",
									"name": "targetOK",
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 27.5,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Ping04.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "LittleCircle",
							"scaleX": 47.36638696073434,
							"scaleY": 47.36638696073434,
							"scaleZ": 47.36638696073434,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
													}
												},
												{
													"time": 0.48425869734829696,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 2
										},
										{
											"time": 0.4886394391741071,
											"value": 1.0890832426668116,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"scaleX": 57.63136725042478,
							"scaleY": 57.63136725042478,
							"scaleZ": 57.63136725042478,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
													}
												},
												{
													"time": 1.5073807327835649,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1.8721679687500004,
											"value": 1.6546030312776574,
											"mode": 3
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
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.25,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 44.17486656773006,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 100,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"texture": "Fx/Alphas/T_MissileHead01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.375,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 6.939665195168335e-17,
																"dt": -0.17
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.19499999999999995
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keys": [
												{
													"time": 0.0011797047187638026,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06938424118696897,
														"dt": -0.49956653654617594
													},
													"nextHandle": {
														"dv": 0.01666666666666669,
														"dt": 0.12000000000000001
													}
												},
												{
													"time": 0.75,
													"value": 2.5,
													"mode": 2
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
												"progress": 0.67,
												"saturation": 1,
												"width": 0.64,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.1,
													-0.1
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.2,
												"maxAlpha": 1,
												"frequency": 0.75
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
												"progress": 0.65,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
													-0.3
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5535714285714286,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.06462585034013606
															}
														},
														{
															"time": 3,
															"value": 0.6,
															"mode": 2
														}
													]
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
										"range": 5,
										"power": 0.8
									}
								}
							]
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7087760262009897,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5067013758461782,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16478957217816323
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16478957217816323
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
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 1,
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
											"time": 6.968946296515335,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.968946296515335,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.784568485048185,
											"value": 0,
											"mode": 0
										},
										{
											"time": 8.784568485048185,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6134167868351827
											},
											"nextHandle": {
												"dv": -5.203835947078549e-17,
												"dt": 0.16478957217816323
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
					"name": "testTEST",
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"scaleX": 60,
							"scaleY": 60,
							"scaleZ": 60,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"loop": true,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.2411,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 12,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 169.0233831537802,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 11,
									"scaleX": 5,
									"scaleY": 100,
									"scaleZ": 4,
									"rotationX": -90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01_half.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
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
												"range": 22.73,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
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
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.061512878495051486,
												"dt": -0.24912715790495873
											},
											"nextHandle": {
												"dv": 0.061512878495051486,
												"dt": 0.24912715790495873
											}
										},
										{
											"time": 1,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02140431723695215,
												"dt": -0.21599913817562374
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.33293945312499984
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.25,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.25,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 80,
							"scaleY": 80,
							"scaleZ": 80,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
							"emissive": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.73
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0.24109175489003276,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.477641410275758,
														"dt": -0.23128300334750976
													},
													"nextHandle": {
														"dv": -1.15,
														"dt": 0.18
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
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.24109175489003276,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.938275785748485,
												"dt": -0.3322758489854544
											},
											"nextHandle": {
												"dv": 0.11666666666666664,
												"dt": 0.020000000000000004
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.31592592592592583
											},
											"nextHandle": {
												"dv": 0.01764709375778003,
												"dt": 0.16676503601102188
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
					"name": "testTEST2",
					"enabled": false,
					"y": 32.89123,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"enabled": false,
							"scaleX": 57.63136725042478,
							"scaleY": 57.63136725042478,
							"scaleZ": 57.63136725042478,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
													}
												},
												{
													"time": 1.5073807327835649,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1.8721679687500004,
											"value": 1.6546030312776574,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 12,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationZ": 169.0233831537802,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 11,
									"scaleX": 5,
									"scaleY": 100,
									"scaleZ": 4,
									"rotationX": -90,
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
												"alpha": 1.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead01_half.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.061512878495051486,
														"dt": -0.24912715790495873
													},
													"nextHandle": {
														"dv": 0.061512878495051486,
														"dt": 0.24912715790495873
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02140431723695215,
														"dt": -0.21599913817562374
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.33293945312499984
													}
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
												"range": 22.73,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 0.19,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.75
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
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"z": 8,
									"scaleX": 6,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
															"mode": 0,
															"prevHandle": {
																"dv": 2.7863723874954e-16,
																"dt": -0.24504294424737513
															},
															"nextHandle": {
																"dv": -2.7863723874954e-16,
																"dt": 0.24504294424737513
															}
														},
														{
															"time": 0.24,
															"value": 0.8,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10411743164062504
															},
															"nextHandle": {
																"dv": -3.696549474822162e-17,
																"dt": 0.07252488023842715
															}
														},
														{
															"time": 0.7951525006975444,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016094266381049462,
																"dt": -0.3093588331818292
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.3203613281250002
															}
														},
														{
															"time": 1.5,
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
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.5,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.061512878495051486,
												"dt": -0.24912715790495873
											},
											"nextHandle": {
												"dv": 0.061512878495051486,
												"dt": 0.24912715790495873
											}
										},
										{
											"time": 1,
											"value": 25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02140431723695215,
												"dt": -0.21599913817562374
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.33293945312499984
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									}
								}
							]
						},
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh.fbx",
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 2.5,
							"rotationZ": 5.9,
							"lockAnimation": true,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 0.75,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": -0.45,
										"texture": "Fx/Alphas/T_ArrowWayPoint_2.png"
									},
									"recursiveApply": false,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 1.249000902703301e-16,
													"value": 0.1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.030000000000000002
													},
													"nextHandle": {
														"dv": 0.00221205979209671,
														"dt": 0.09999999999999987
													}
												},
												{
													"time": 0.5,
													"value": 0.7,
													"mode": 1,
													"prevHandle": {
														"dv": -0.008223530747719532,
														"dt": -0.135
													},
													"nextHandle": {
														"dv": -0.008223530747719532,
														"dt": 0.13
													}
												},
												{
													"time": 1,
													"value": 0.1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.006332351939210279,
														"dt": -0.125
													},
													"nextHandle": {
														"dv": 0.006332351939210279,
														"dt": 0.125
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
													"value": 0.0002777777777777102,
													"mode": 2
												},
												{
													"time": 0.07500000000000023,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.0616666666666667
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.08333333333333325
													}
												},
												{
													"time": 0.33499999999999974,
													"value": 0.016666666666666663,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06938424118696897,
														"dt": -0.49956653654617594
													},
													"nextHandle": {
														"dv": 0.01666666666666669,
														"dt": 0.12000000000000001
													}
												},
												{
													"time": 0.5,
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 6.939665195168335e-17,
														"dt": -0.17
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.19499999999999995
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01666666666666669,
														"dt": -0.14
													},
													"nextHandle": {
														"dv": -0.020820059465573977,
														"dt": 0.17488849951082105
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
					"name": "test3",
					"enabled": false,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Bigcircle",
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.10217163085937501,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.07860218451400555,
														"dt": -0.9442912584162424
													},
													"nextHandle": {
														"dv": -0.01666666666666705,
														"dt": 0.20022583007812506
													}
												},
												{
													"time": 0.4065148925781251,
													"value": 0.3999999999999999,
													"mode": 1,
													"prevHandle": {
														"dv": 3.725446948368962e-17,
														"dt": -0.14618367513020838
													},
													"nextHandle": {
														"dv": -0.41666666666666696,
														"dt": 0.25628906249999994
													}
												},
												{
													"time": 1.5073807327835649,
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
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -0.5919704399125435,
												"dt": -0.4547372377929001
											},
											"nextHandle": {
												"dv": 0.729823150634766,
												"dt": 0.5606323242187501
											}
										},
										{
											"time": 1.8721679687500004,
											"value": 1.6546030312776574,
											"mode": 3
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.16666666666666666
									}
								},
								{
									"time": 0.5,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationZ": 44.17486656773006,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 50,
									"scaleY": 100,
									"scaleZ": 6.25,
									"rotationX": 90,
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
												"texture": "Fx/Alphas/T_MissileHead01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.375,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 6.939665195168335e-17,
																"dt": -0.17
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.19499999999999995
															}
														},
														{
															"time": 0.75,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01666666666666669,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": -0.020820059465573977,
																"dt": 0.17488849951082105
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keys": [
												{
													"time": 0.0011797047187638026,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06938424118696897,
														"dt": -0.49956653654617594
													},
													"nextHandle": {
														"dv": 0.01666666666666669,
														"dt": 0.12000000000000001
													}
												},
												{
													"time": 0.75,
													"value": 2.5,
													"mode": 2
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
												"progress": 0.67,
												"saturation": 1,
												"width": 0.64,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.1,
													-0.1
												],
												"uvShiftSpeed": [
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
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": 44.17486656773006,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"enabled": false,
									"z": 30,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": -90,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Ping06.png"
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
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.375,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 6.939665195168335e-17,
																"dt": -0.17
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.19499999999999995
															}
														},
														{
															"time": 0.75,
															"value": 0.15,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01666666666666669,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": -0.020820059465573977,
																"dt": 0.17488849951082105
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keys": [
												{
													"time": 0.0011797047187638026,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.06938424118696897,
														"dt": -0.49956653654617594
													},
													"nextHandle": {
														"dv": 0.01666666666666669,
														"dt": 0.12000000000000001
													}
												},
												{
													"time": 0.75,
													"value": 2.5,
													"mode": 2
												}
											]
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
												"progress": 0.67,
												"saturation": 1,
												"width": 0.64,
												"uvScaleX": 3,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.1,
													-0.1
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "curve",
											"name": "position.z",
											"keys": [
												{
													"time": 0,
													"value": 25,
													"mode": 2
												},
												{
													"time": 0.17729591836734693,
													"value": -35,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7087760262009897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5067013758461782,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16478957217816323
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16478957217816323
													}
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 1.5,
									"lockAnimation": true,
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
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.45,
												"texture": "Fx/Gradients/Cyl08u_A.png"
											},
											"recursiveApply": false,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.06999999999999995,
															"value": -1,
															"mode": 1,
															"prevHandle": {
																"dv": -2.8699100935757227,
																"dt": -0.47723998901751485
															},
															"nextHandle": {
																"dv": 3.405422981828453,
																"dt": 0.18500000000000005
															}
														},
														{
															"time": 0.3999999999999997,
															"value": 2,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0.0002777777777777102,
															"mode": 2
														},
														{
															"time": 0.1850000000000001,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0616666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333325
															}
														},
														{
															"time": 0.33499999999999974,
															"value": 0.016666666666666663,
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
									"name": "targetOK",
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 25,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
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
												"alpha": 1.25,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Ping01.png"
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.32974991491636685,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.2666666666666666,
																"dt": -0.11513665806331674
															},
															"nextHandle": {
																"dv": -2.857738181196454,
																"dt": 0.2608106817072132
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
													"time": 0.06887755102040817,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.11222603914406888,
														"dt": -0.5006616428703979
													},
													"nextHandle": {
														"dv": -0.06586827255222083,
														"dt": 0.17506377551020408
													}
												},
												{
													"time": 0.40274234693877553,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.11128826530612246
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.11128826530612246
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
					"name": "round1",
					"enabled": false,
					"x": 75.80418,
					"y": 11.862372500000001,
					"children": [
						{
							"type": "object",
							"name": "test2",
							"y": 11.359477499999999,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_floor",
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "advancedDecal",
											"name": "targetOK",
											"scaleX": 55,
											"scaleY": 55,
											"scaleZ": 27.5,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
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
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_Ping03.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.4166666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.4689370665258292,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00914089075238272,
																"dt": -0.5009074885978119
															},
															"nextHandle": {
																"dv": -0.008333333333333304,
																"dt": 0.44962891024828444
															}
														},
														{
															"time": 1.2189370665258292,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1.9960676450145491,
															"value": 0.9818648313688905,
															"mode": 0
														}
													]
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.1,
														"maxAlpha": 1,
														"frequency": 3
													},
													"children": [
														{
															"type": "curve",
															"name": "frequency",
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
															"name": "frequency",
															"keys": [
																{
																	"time": 0.74,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.25,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.26,
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
								},
								{
									"type": "advancedDecal",
									"name": "LittleCircle",
									"scaleX": 47.36638696073434,
									"scaleY": 47.36638696073434,
									"scaleZ": 47.36638696073434,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 0.48425869734829696,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 0.4886394391741071,
													"value": 1.0890832426668116,
													"mode": 3
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Bigcircle",
									"scaleX": 57.63136725042478,
									"scaleY": 57.63136725042478,
									"scaleZ": 57.63136725042478,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.10217163085937501,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07860218451400555,
																"dt": -0.9442912584162424
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.20022583007812506
															}
														},
														{
															"time": 0.4065148925781251,
															"value": 0.3999999999999999,
															"mode": 1,
															"prevHandle": {
																"dv": 3.725446948368962e-17,
																"dt": -0.14618367513020838
															},
															"nextHandle": {
																"dv": -0.41666666666666696,
																"dt": 0.25628906249999994
															}
														},
														{
															"time": 1.5073807327835649,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.5919704399125435,
														"dt": -0.4547372377929001
													},
													"nextHandle": {
														"dv": 0.729823150634766,
														"dt": 0.5606323242187501
													}
												},
												{
													"time": 1.8721679687500004,
													"value": 1.6546030312776574,
													"mode": 3
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
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationZ": 44.17486656773006,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 50,
											"scaleY": 100,
											"scaleZ": 6.25,
											"rotationX": 90,
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
														"texture": "Fx/Alphas/T_MissileHead01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.15,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.06938424118696897,
																		"dt": -0.49956653654617594
																	},
																	"nextHandle": {
																		"dv": 0.01666666666666669,
																		"dt": 0.12000000000000001
																	}
																},
																{
																	"time": 0.375,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 6.939665195168335e-17,
																		"dt": -0.17
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.19499999999999995
																	}
																},
																{
																	"time": 0.75,
																	"value": 0.15,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.01666666666666669,
																		"dt": -0.14
																	},
																	"nextHandle": {
																		"dv": -0.020820059465573977,
																		"dt": 0.17488849951082105
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keys": [
														{
															"time": 0.0011797047187638026,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.75,
															"value": 2.5,
															"mode": 2
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
														"progress": 0.67,
														"saturation": 1,
														"width": 0.64,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.1,
															-0.1
														],
														"uvShiftSpeed": [
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7087760262009897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5067013758461782,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16478957217816323
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16478957217816323
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
							"name": "test2",
							"y": -11.862372500000001,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_floor",
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "advancedDecal",
											"name": "targetOK",
											"scaleX": 55,
											"scaleY": 55,
											"scaleZ": 27.5,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_Ping03.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 0.5
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "LittleCircle",
									"scaleX": 47.36638696073434,
									"scaleY": 47.36638696073434,
									"scaleZ": 47.36638696073434,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 0.48425869734829696,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 0.4886394391741071,
													"value": 1.0890832426668116,
													"mode": 3
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Bigcircle",
									"scaleX": 57.63136725042478,
									"scaleY": 57.63136725042478,
									"scaleZ": 57.63136725042478,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"textureWrap": true
												}
											},
											"wrapRepeat": true
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.10217163085937501,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.07860218451400555,
																"dt": -0.9442912584162424
															},
															"nextHandle": {
																"dv": -0.01666666666666705,
																"dt": 0.20022583007812506
															}
														},
														{
															"time": 0.4065148925781251,
															"value": 0.3999999999999999,
															"mode": 1,
															"prevHandle": {
																"dv": 3.725446948368962e-17,
																"dt": -0.14618367513020838
															},
															"nextHandle": {
																"dv": -0.41666666666666696,
																"dt": 0.25628906249999994
															}
														},
														{
															"time": 1.5073807327835649,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -0.5919704399125435,
														"dt": -0.4547372377929001
													},
													"nextHandle": {
														"dv": 0.729823150634766,
														"dt": 0.5606323242187501
													}
												},
												{
													"time": 1.8721679687500004,
													"value": 1.6546030312776574,
													"mode": 3
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
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationZ": 44.17486656773006,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 50,
											"scaleY": 100,
											"scaleZ": 6.25,
											"rotationX": 90,
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
														"texture": "Fx/Alphas/T_MissileHead01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.15,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.06938424118696897,
																		"dt": -0.49956653654617594
																	},
																	"nextHandle": {
																		"dv": 0.01666666666666669,
																		"dt": 0.12000000000000001
																	}
																},
																{
																	"time": 0.375,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 6.939665195168335e-17,
																		"dt": -0.17
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.19499999999999995
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keys": [
														{
															"time": 0.0011797047187638026,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.75,
															"value": 2.5,
															"mode": 2
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
														"progress": 0.67,
														"saturation": 1,
														"width": 0.64,
														"uvScaleX": 3,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_uneaven.png",
														"uvShift": [
															0.1,
															-0.1
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"enabled": false,
													"props": {
														"minAlpha": 0.2,
														"maxAlpha": 1,
														"frequency": 0.75
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
														"progress": 0.65,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.02,
															-0.3
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5535714285714286,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.06462585034013606
																	}
																},
																{
																	"time": 3,
																	"value": 0.6,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7087760262009897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5067013758461782,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16478957217816323
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16478957217816323
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
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
													"time": 6.968946296515335,
													"value": 1,
													"mode": 2
												},
												{
													"time": 6.968946296515335,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.784568485048185,
													"value": 0,
													"mode": 0
												},
												{
													"time": 8.784568485048185,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6134167868351827
													},
													"nextHandle": {
														"dv": -5.203835947078549e-17,
														"dt": 0.16478957217816323
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
							"name": "test1",
							"y": -33.5819125,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"children": [
								{
									"type": "advancedDecal",
									"name": "growingcircle",
									"scaleX": 72,
									"scaleY": 72,
									"scaleZ": 88.56,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.477641410275758,
																"dt": -0.23128300334750976
															},
															"nextHandle": {
																"dv": -1.15,
																"dt": 0.18
															}
														},
														{
															"time": 0.75,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.938275785748485,
														"dt": -0.3322758489854544
													},
													"nextHandle": {
														"dv": 0.11666666666666664,
														"dt": 0.020000000000000004
													}
												},
												{
													"time": 0.75,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.31592592592592583
													},
													"nextHandle": {
														"dv": 0.01764709375778003,
														"dt": 0.16676503601102188
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -1.938275785748485,
														"dt": -0.3322758489854544
													},
													"nextHandle": {
														"dv": 0.11666666666666664,
														"dt": 0.020000000000000004
													}
												},
												{
													"time": 0.75,
													"value": 1.15,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.31592592592592583
													},
													"nextHandle": {
														"dv": 0.01764709375778003,
														"dt": 0.16676503601102188
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 4,
											"scaleY": 50,
											"scaleZ": 6.25,
											"rotationX": 90,
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
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_MissileHead01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.15,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.06938424118696897,
																		"dt": -0.49956653654617594
																	},
																	"nextHandle": {
																		"dv": 0.01666666666666669,
																		"dt": 0.12000000000000001
																	}
																},
																{
																	"time": 0.375,
																	"value": 0.5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 6.939665195168335e-17,
																		"dt": -0.17
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.19499999999999995
																	}
																},
																{
																	"time": 0.75,
																	"value": 0.15,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.01666666666666669,
																		"dt": -0.14
																	},
																	"nextHandle": {
																		"dv": -0.020820059465573977,
																		"dt": 0.17488849951082105
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"loop": true,
													"keys": [
														{
															"time": 0.0011797047187638026,
															"value": 2.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.06938424118696897,
																"dt": -0.49956653654617594
															},
															"nextHandle": {
																"dv": 0.01666666666666669,
																"dt": 0.12000000000000001
															}
														},
														{
															"time": 0.75,
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
									"type": "lookAt",
									"name": "lookAt_floor",
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "advancedDecal",
											"name": "targetOK",
											"scaleX": 55,
											"scaleY": 55,
											"scaleZ": 27.5,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
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
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_Ping04.png"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.75,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.4166666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4166666666666667
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
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00914089075238272,
																"dt": -0.5009074885978119
															},
															"nextHandle": {
																"dv": -0.008333333333333304,
																"dt": 0.44962891024828444
															}
														},
														{
															"time": 0.75,
															"value": 0.6,
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
									"name": "Dot",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.74,
									"albedoMap": "Fx/Alphas/T_circle5.png",
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
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
															"mode": 0,
															"prevHandle": {
																"dv": -1.0062331211268096,
																"dt": -0.12724664963982169
															},
															"nextHandle": {
																"dv": 0.6333333333333333,
																"dt": 0.07814453125000002
															}
														},
														{
															"time": 0.3424426269531251,
															"value": 0.95,
															"mode": 0
														},
														{
															"time": 0.9816503906249997,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.32499999999999996
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.32499999999999996
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
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9943687165344897,
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.714985851425088,
														"dt": -0.4287464628562722
													},
													"nextHandle": {
														"dv": 0.5,
														"dt": 0.12499999999999999
													}
												},
												{
													"time": 1.0416503906249996,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.185
													},
													"nextHandle": {
														"dv": 0.030019068164349665,
														"dt": 0.1666058283121422
													}
												}
											]
										}
									]
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.2420280612244898,
													"value": 1,
													"mode": 2
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
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16666666666666666
											}
										},
										{
											"time": 0.24311831436651618,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.995958201060793,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.995958201060793,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.995958201060793,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.995958201060793,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.291896716865057,
											"value": 0,
											"mode": 0
										},
										{
											"time": 8.291896716865057,
											"value": 0,
											"mode": 0
										},
										{
											"time": 8.291896716865057,
											"value": 0,
											"mode": 0
										},
										{
											"time": 8.291896716865057,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.16478957217816323
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.16478957217816323
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "test4",
							"y": 34.084807500000004,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"z": 3,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 5,
											"scaleY": 60,
											"scaleZ": 6.25,
											"rotationX": 90,
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
														"alpha": 1.75,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_MissileHead01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.7863723874954e-16,
																		"dt": -0.24504294424737513
																	},
																	"nextHandle": {
																		"dv": -2.7863723874954e-16,
																		"dt": 0.24504294424737513
																	}
																},
																{
																	"time": 0.24,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10411743164062504
																	},
																	"nextHandle": {
																		"dv": -3.696549474822162e-17,
																		"dt": 0.07252488023842715
																	}
																},
																{
																	"time": 0.7951525006975444,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016094266381049462,
																		"dt": -0.3093588331818292
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.3203613281250002
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 3,
															"mode": 0,
															"prevHandle": {
																"dv": -0.061512878495051486,
																"dt": -0.24912715790495873
															},
															"nextHandle": {
																"dv": 0.061512878495051486,
																"dt": 0.24912715790495873
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02140431723695215,
																"dt": -0.21599913817562374
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.33293945312499984
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.19,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.75
														],
														"uvShiftSpeed": [
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"z": 8,
											"scaleX": 6,
											"scaleY": 10,
											"scaleZ": 10,
											"rotationX": -90,
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
														"alpha": 1.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Ping06.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.7863723874954e-16,
																		"dt": -0.24504294424737513
																	},
																	"nextHandle": {
																		"dv": -2.7863723874954e-16,
																		"dt": 0.24504294424737513
																	}
																},
																{
																	"time": 0.24,
																	"value": 0.8,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.10411743164062504
																	},
																	"nextHandle": {
																		"dv": -3.696549474822162e-17,
																		"dt": 0.07252488023842715
																	}
																},
																{
																	"time": 0.7951525006975444,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016094266381049462,
																		"dt": -0.3093588331818292
																	},
																	"nextHandle": {
																		"dv": -0.01666666666666672,
																		"dt": 0.3203613281250002
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "position.z",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.15,
															"value": 3.5,
															"mode": 0,
															"prevHandle": {
																"dv": -0.061512878495051486,
																"dt": -0.24912715790495873
															},
															"nextHandle": {
																"dv": 0.061512878495051486,
																"dt": 0.24912715790495873
															}
														},
														{
															"time": 0.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02140431723695215,
																"dt": -0.21599913817562374
															},
															"nextHandle": {
																"dv": 0.033333333333333326,
																"dt": 0.33293945312499984
															}
														},
														{
															"time": 1.5,
															"value": 0.00040170254973542763,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Cutcircle",
											"scaleX": 10.909954243295525,
											"scaleY": 10.909954243295525,
											"scaleZ": 10.909954243295527,
											"albedoMap": "Fx/Alphas/T-InnerGradient.png",
											"fadeStart": 1,
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
															"culling": "Back",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true
														}
													},
													"wrapRepeat": true
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.477641410275758,
																		"dt": -0.23128300334750976
																	},
																	"nextHandle": {
																		"dv": -1.15,
																		"dt": 0.18
																	}
																},
																{
																	"time": 1.22,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0
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
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.9244057074420672,
															"mode": 2
														},
														{
															"time": 0,
															"value": 0.9244057074420672,
															"mode": 2
														},
														{
															"time": 0.61,
															"value": 1.9,
															"mode": 3
														},
														{
															"time": 0.61,
															"value": 1.9,
															"mode": 3
														},
														{
															"time": 1.5,
															"value": 1.9975594292557932,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Bigcircle",
											"scaleX": 11.361570654241413,
											"scaleY": 11.361570654241413,
											"scaleZ": 11.361570654241415,
											"albedoMap": "Fx/Alphas/T-InnerGradient.png",
											"fadeStart": 1,
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
															"culling": "Back",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"textureWrap": true
														}
													},
													"wrapRepeat": true
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.477641410275758,
																		"dt": -0.23128300334750976
																	},
																	"nextHandle": {
																		"dv": -1.15,
																		"dt": 0.18
																	}
																},
																{
																	"time": 1.22,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0
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
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.9244057074420672,
															"mode": 2
														},
														{
															"time": 0,
															"value": 0.9244057074420672,
															"mode": 2
														},
														{
															"time": 0.6,
															"value": 1.0890832426668116,
															"mode": 3
														},
														{
															"time": 0.6,
															"value": 1.0890832426668116,
															"mode": 3
														},
														{
															"time": 1.5,
															"value": 1.0890832426668116,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
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