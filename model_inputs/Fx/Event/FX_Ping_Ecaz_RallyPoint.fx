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
							"culling": "Back",
							"colorMask": 255
						}
					},
					"color": [
						0.11372549019607843,
						0.11372549019607843,
						0.11372549019607843,
						1
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "object",
					"name": "RallyPoint",
					"scaleX": 0.25,
					"scaleY": 0.25,
					"scaleZ": 0.25,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": -75,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
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
															"time": 2,
															"value": 0.5,
															"prevHandle": {
																"dv": 2.513453954098679e-17,
																"dt": -0.23963346480330486
															},
															"nextHandle": {
																"dv": 0.0010908817197592402,
																"dt": 0.25847381049413265
															}
														},
														{
															"time": 4,
															"value": 1,
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.35,
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
													"enabled": false,
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
									"enabled": false,
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
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "position:z",
									"enabled": false,
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
								},
								{
									"type": "curve",
									"name": "scale:z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
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
											"time": 2,
											"value": 0.75,
											"prevHandle": {
												"dv": -0.006487394163000815,
												"dt": -0.2395137228333068
											},
											"nextHandle": {
												"dv": 0.004921111411482536,
												"dt": 0.25060237818188286
											}
										},
										{
											"time": 4,
											"value": 1,
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
							"name": "3-attack",
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
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
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "Always",
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
												"texture": "Fx/Alphas/T_UI_Round_128.png"
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 18,
									"scaleY": 18,
									"scaleZ": 18,
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
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "Always",
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
												"texture": "Fx/Alphas/T_Circle_4.png"
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.8304023960525573,
																"dt": 0.015875317973037904
															}
														},
														{
															"time": 0.04400047702276105,
															"value": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.015136262526328496
															},
															"nextHandle": {
																"dv": -3.926198388046472e-16,
																"dt": 0.13640849842495262
															}
														},
														{
															"time": 0.5,
															"value": 0,
															"prevHandle": {
																"dv": -0.0005632473820660899,
																"dt": -0.14161618092418216
															},
															"nextHandle": {
																"dv": -1.5901454628259106e-16,
																"dt": 0.06991416290326287
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
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "idle",
									"y": 2.842170943040401e-14,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Circle_4.png",
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
													"textureWrap": true,
													"drawOrder": "100",
													"emissive": 1
												}
											},
											"wrapRepeat": true
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
									0.8862745098039215,
									0.8274509803921568,
									0.7450980392156863
								]
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 1,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.017585623684655997,
										"dt": -0.4999370237417995
									},
									"nextHandle": {
										"dv": -0.30087243748219905,
										"dt": 0.022556734681958467
									}
								},
								{
									"time": 0.04435560210020173,
									"value": 0.3,
									"mode": 2
								},
								{
									"time": 0.4271122948591347,
									"value": 1,
									"prevHandle": {
										"dv": 0.057511827005235494,
										"dt": -0.20356110957601392
									},
									"nextHandle": {
										"dv": -0.06971888582276542,
										"dt": 0.24718616900868967
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
									0.3607843137254902,
									0.5686274509803921
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}