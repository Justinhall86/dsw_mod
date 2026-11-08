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
					"name": "testTEST",
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 1,
										"sandColorSet": true,
										"envBlend": 0.7,
										"envColorSet": true
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
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 5.5,
							"scaleY": 5.5,
							"scaleZ": 5.5,
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
									"scaleX": 20,
									"scaleY": 80,
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
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.6,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.02,
													-0.2
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.596078431372549,
													0.5372549019607843,
													0.6235294117647059
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 22,
										"power": 0.8
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.8,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									}
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.15294117647058825,
											0.12549019607843137,
											0.10196078431372549
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