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
					"type": "object",
					"name": "Harkonen",
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
												"texture": "Fx/Alphas/T_Ping06_Harkonnen.png"
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
									"type": "polygon",
									"name": "fond",
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
													"drawOrder": "100",
													"emissive": 1
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
												"texture": "Fx/Alphas/T_Ping06_Background.png"
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7411764705882353,
													0.1411764705882353,
													0.16862745098039217
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "polygon",
									"name": "shadowround",
									"z": 8,
									"scaleX": 40,
									"scaleY": 20,
									"scaleZ": 20,
									"rotationX": 89.99999999999999,
									"rotationY": -6.361109362927037e-15,
									"rotationZ": 90.00000000000004,
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
													"emissive": 1
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
												"texture": "Fx/Alphas/T_circle.png"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7411764705882353,
													0.1411764705882353,
													0.16862745098039217
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 40,
												"power": 0.8
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "shadowlong",
									"z": 8,
									"scaleX": 18,
									"scaleY": 70,
									"scaleZ": 17.5,
									"rotationX": 89.99999999999999,
									"rotationY": -6.361109362927037e-15,
									"rotationZ": 90.00000000000004,
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
													"emissive": 1
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
												"texture": "Fx/Alphas/T_circle.png"
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7411764705882353,
													0.1411764705882353,
													0.16862745098039217
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 60,
												"power": 0.8
											}
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
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"y": 2.842170943040401e-14,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
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
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"enabled": false,
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"enabled": false,
							"props": {
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							}
						}
					]
				}
			]
		}
	]
}