{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"x": -0.28002,
			"y": 0.45299,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
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
							"blend": "Alpha",
							"shadows": false,
							"culling": "None",
							"colorMask": 255
						}
					},
					"color": [
						0.2,
						0.2,
						0.2,
						1
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.003,
			"scaleY": 0.003,
			"scaleZ": 0.003,
			"children": [
				{
					"type": "polygon",
					"name": "Floor",
					"editorOnly": true,
					"locked": true,
					"z": 3.333333333333334,
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
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
					"name": "Atreide",
					"scaleX": 0.25,
					"scaleY": 0.25,
					"scaleZ": 0.25,
					"children": [
						{
							"type": "curve",
							"name": "scale",
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
							"y": 2.842170943040401e-14,
							"z": 25,
							"scaleX": 3.999999999999999,
							"scaleY": 3.999999999999999,
							"scaleZ": 4,
							"rotationZ": -150.22764637373305,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "Tail",
									"z": 15,
									"scaleX": 7.5,
									"scaleY": 125,
									"scaleZ": 5,
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
													"mode": "Overlay",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
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
													"keys": [
														{
															"time": 0,
															"value": 0.5,
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
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														}
													],
													"loop": true
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "FlecheLogo",
									"z": 8,
									"scaleX": 18,
									"scaleY": 20,
									"scaleZ": 20,
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
													"mode": "Overlay",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "110"
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
												"texture": "Fx/Alphas/T_Ping08.png"
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
															"value": 0
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
									"keys": [
										{
											"time": 0,
											"value": 25,
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
											"prevHandle": {
												"dv": -0.02140431723695215,
												"dt": -0.21599913817562374
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.33293945312499984
											}
										}
									],
									"loop": true
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"y": 2.842170943040401e-14,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 50,
									"scaleY": 50,
									"scaleZ": 50,
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
													"mode": "Overlay",
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
													"keys": [
														{
															"time": 0.24109175489003276,
															"value": 1,
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
													],
													"loop": true
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
													"time": 0.24109175489003276,
													"value": 0,
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
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.31592592592592583
													},
													"nextHandle": {
														"dv": 0.01764709375778003,
														"dt": 0.16676503601102188
													}
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Bigcircle",
									"y": 2.842170943040401e-14,
									"scaleX": 37.302478004006716,
									"scaleY": 37.302478004006716,
									"scaleZ": 37.302478004006716,
									"albedoMap": "Fx/Alphas/T-InnerGradient.png",
									"fadeStart": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "Overlay",
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
													],
													"loop": true
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
													"time": 0.2411,
													"value": 0.7,
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
											],
											"loop": true
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
									0.8862745098039215,
									0.8274509803921568,
									0.7450980392156863
								]
							}
						}
					]
				}
			]
		}
	]
}