{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": -0.28002,
			"y": 0.45299,
			"z": -10.1267,
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
					"name": "group",
					"scaleX": 0.8,
					"scaleY": 0.8,
					"scaleZ": 0.8,
					"children": [
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh.fbx",
							"scaleX": 2,
							"scaleY": 2,
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
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
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"scaleX": 11,
							"scaleY": 11,
							"scaleZ": 11,
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
							"name": "advancedDecal",
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 3,
							"albedoMap": "Fx/Alphas/T_circle5.png",
							"emissive": 0.2,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 2.041077998578922e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3
													}
												},
												{
													"time": 0.4049999999999999,
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
													"time": 0.5,
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
													"time": 1,
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
									"enabled": false,
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
											"time": 0.46499999999999986,
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
									"scaleY": 40,
									"scaleZ": 10,
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
												"alpha": 0.7,
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
															"time": 0.5,
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
															"time": 1,
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
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -1.4870708504579961,
														"dt": -0.02478451417430023
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.7125276907467796e-17,
														"dt": -0.03729026615541411
													},
													"nextHandle": {
														"dv": -1.7125276907467796e-17,
														"dt": 0.03729026615541411
													}
												},
												{
													"time": 1,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0.51875,
														"dt": -0.09500000000000008
													},
													"nextHandle": {
														"dv": -0.517172358994849,
														"dt": 0.09358356972287747
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
	]
}