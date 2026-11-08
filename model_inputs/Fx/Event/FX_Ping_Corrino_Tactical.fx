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
					"name": "BackupDecals",
					"enabled": false,
					"y": 59.23667,
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "logo",
							"scaleX": 0.7999999999999999,
							"scaleY": 0.7999999999999999,
							"scaleZ": 0.7999999999999999,
							"children": [
								{
									"type": "advancedDecal",
									"name": "LogoBackground",
									"y": 6.310887241768095e-30,
									"scaleX": 180,
									"scaleY": 180,
									"scaleZ": 100,
									"albedoMap": "Fx/Alphas/T_circle2.png",
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
													"depthTest": "LessEqual",
													"emissive": 0.25
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.7
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6431372549019607,
													0.6039215686274509,
													0.5411764705882353
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Logo",
									"scaleX": 42,
									"scaleY": 42,
									"scaleZ": 80,
									"albedoMap": "Fx/Alphas/T_Logo_Corrino.png",
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
													"enabled": false,
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
											"time": 1.249000902703301e-16,
											"value": 0.7,
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
											"value": 0.5,
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
											"value": 0.7,
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
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"x": 5.633900472726276e-15,
							"y": 2.842170943040401e-14,
							"scaleX": 2.2499999999999996,
							"scaleY": 2.2499999999999996,
							"scaleZ": 2.2499999999999996,
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
								}
							]
						},
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh02.fbx",
							"z": 0.9999999999999997,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 0.1,
							"rotationZ": 10,
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
										"vScale": 0.89,
										"uOffset": 0,
										"vOffset": -0.52,
										"texture": "Fx/Alphas/T_ArrowPing_3.png"
									},
									"recursiveApply": false,
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
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 1.249000902703301e-16,
											"value": 0.65,
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
											"value": 0.5,
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
											"value": 0.65,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.36,
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
							"type": "object",
							"name": "group"
						}
					]
				},
				{
					"type": "object",
					"name": "Corrino",
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "logo",
							"z": 0.5,
							"children": [
								{
									"type": "polygon",
									"name": "LogoBackground",
									"scaleX": 120,
									"scaleY": 120,
									"scaleZ": 120,
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
											},
											"diffuseMap": "Fx/Alphas/T_circle2.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.5
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.14901960784313725,
													0.4117647058823529,
													0.28627450980392155
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6431372549019607,
													0.6039215686274509,
													0.5411764705882353
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "Logo",
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 40,
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
													"emissive": 1,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Alphas/T_Logo_Corrino.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.75
											}
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
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh02.fbx",
							"z": 0.9999999999999997,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 0.1,
							"rotationZ": 10.000000000000004,
							"lockAnimation": true,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Overlay",
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
										"alpha": 1.1,
										"uScale": 0.75,
										"vScale": 0.89,
										"uOffset": 0,
										"vOffset": -0.52,
										"texture": "Fx/Alphas/T_ArrowPing_3.png"
									},
									"recursiveApply": false,
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
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 1.249000902703301e-16,
											"value": 0.65,
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
											"value": 0.5,
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
											"value": 0.65,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.36,
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
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Floor",
							"z": 0.5,
							"scaleX": 2.2499999999999996,
							"scaleY": 2.2499999999999996,
							"scaleZ": 2.2499999999999996,
							"children": [
								{
									"type": "polygon",
									"name": "SmallCircle",
									"scaleX": 50,
									"scaleY": 50,
									"scaleZ": 50,
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
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Alphas/T-InnerGradient.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
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
									"type": "polygon",
									"name": "BigCircle",
									"scaleX": 37.3,
									"scaleY": 37.3,
									"scaleZ": 37.3,
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
													"depthTest": "LessEqual"
												}
											},
											"diffuseMap": "Fx/Alphas/T-InnerGradient.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"enabled": false,
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				}
			]
		}
	]
}