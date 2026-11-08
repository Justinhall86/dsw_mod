{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
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
							"culling": "Back",
							"colorMask": 255
						}
					},
					"color": [
						0,
						0,
						0,
						1
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "TestsBase",
					"enabled": false,
					"x": 78.78189,
					"scaleX": 1.25,
					"scaleY": 1.25,
					"scaleZ": 1.25,
					"children": [
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh.fbx",
							"enabled": false,
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
										"uScale": 0.75,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": -0.26,
										"texture": "Fx/Alphas/T_ArrowWayPoint_2.png"
									},
									"recursiveApply": false,
									"children": [
										{
											"type": "curve",
											"name": "vOffset",
											"enabled": false,
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
													"time": 1,
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
													"time": 2,
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
													"time": 1,
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
													"time": 2,
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
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 0.5,
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
													"time": 1,
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
													"time": 2,
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
													"time": 1,
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
													"time": 2,
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
							"enabled": false,
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
									"enabled": false,
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
						},
						{
							"type": "object",
							"name": "1",
							"y": 17.26047,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
									"albedoMap": "Fx/Alphas/T_Ping04.png",
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
									"rotationZ": -146.11448006511907,
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
											"scaleY": 60,
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
														"alpha": 1,
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
						},
						{
							"type": "object",
							"name": "2",
							"enabled": false,
							"y": -15.02667,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_CirclePattern07.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
								}
							]
						},
						{
							"type": "object",
							"name": "SQUAREWHITE",
							"z": -0.3333333333333333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
							"name": "SQUAREWHITE_noarrow",
							"x": -16.69625,
							"y": -31.72499,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
							"name": "SAQUAREGOLD",
							"x": 17.96524,
							"y": -16.33658,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9882352941176471,
											0.8235294117647058,
											0.5450980392156862
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Test01_Idle",
							"enabled": false,
							"x": 17.96524,
							"y": -31.85772,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SQUAREDARK",
							"x": -1.35422,
							"y": -31.85772,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SQUAREDARK_trai",
							"x": 17.95194,
							"y": 1.27044,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 1.0000000000000002,
									"rotationY": -79.94725484412663,
									"rotationZ": -146.11448006511907,
									"lockAxis": [
										0,
										0,
										0
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.33333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.66667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 96.4,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "lookAt",
									"name": "lookAt",
									"rotationZ": -146.11448006511907,
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
											"scaleY": 60,
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
														"alpha": 1,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.9609375,
														"color": -5534125
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								}
							]
						},
						{
							"type": "object",
							"name": "TRIANGLEDARK_trai",
							"x": 17.95194,
							"y": 18.69602,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 90,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor06.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.66667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 96.4,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "lookAt",
									"name": "lookAt",
									"rotationZ": -146.11448006511907,
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
											"scaleY": 60,
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
														"alpha": 1,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.9609375,
														"color": -5534125
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								}
							]
						},
						{
							"type": "object",
							"name": "TRIANGLE",
							"x": -16.80249,
							"y": -16.21381,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"x": 0.78329,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 90,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor06.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.66667,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 0.88,
									"rotationZ": 157.1,
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
												"alpha": 1,
												"uScale": 0.75,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
												"texture": "Fx/Alphas/T_ArrowWayPoint_1.png"
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "lookAt",
									"name": "lookAt",
									"enabled": false,
									"rotationZ": -146.11448006511907,
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
											"scaleY": 60,
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
														"alpha": 1,
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
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.9609375,
														"color": -5534125
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								}
							]
						},
						{
							"type": "object",
							"name": "CROSSGREY",
							"x": -16.81523,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"enabled": false,
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor05.png",
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": 0.5,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 0.25,
									"rotationZ": 7.1,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.62,
												"texture": "Fx/Alphas/T_ArrowWayPoint_2.png"
											},
											"recursiveApply": false,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
													"enabled": false,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "object",
									"name": "group",
									"enabled": false,
									"z": 0.3333333333333333,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.8,
											"scaleY": 5.4,
											"scaleZ": 3.0000000000000004,
											"rotationZ": -45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.8,
											"scaleY": 5.4,
											"scaleZ": 3.0000000000000004,
											"rotationZ": 45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor05.png",
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
									"type": "object",
									"name": "group",
									"z": 0.3333333333333333,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.5000000000000001,
											"scaleY": 5,
											"scaleZ": 3.0000000000000004,
											"rotationZ": -45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.5000000000000001,
											"scaleY": 5,
											"scaleZ": 3.0000000000000004,
											"rotationZ": 45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											0.7607843137254902,
											0.1803921568627451,
											0.1803921568627451
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
											0.6823529411764706,
											0.6235294117647059,
											0.5333333333333333
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "BORDER",
							"x": -16.81523,
							"y": 12.87,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"enabled": false,
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor05.png",
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": 0.5,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 0.25,
									"rotationZ": 7.1,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.62,
												"texture": "Fx/Alphas/T_ArrowWayPoint_2.png"
											},
											"recursiveApply": false,
											"children": [
												{
													"type": "curve",
													"name": "vOffset",
													"enabled": false,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "object",
									"name": "group",
									"enabled": false,
									"z": 0.3333333333333333,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.8,
											"scaleY": 5.4,
											"scaleZ": 3.0000000000000004,
											"rotationZ": -45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.8,
											"scaleY": 5.4,
											"scaleZ": 3.0000000000000004,
											"rotationZ": 45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"enabled": false,
											"props": {
												"scale": 1
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
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -1
															},
															{
																"position": 0.98046875,
																"color": -16777216
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
													0.9882352941176471,
													0.8235294117647058,
													0.5450980392156862
												]
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
											0.6823529411764706,
											0.6235294117647059,
											0.5333333333333333
										]
									}
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor05_border.png",
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
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"enabled": false,
											"props": {
												"scale": 1
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
													0,
													0,
													0
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
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -1
															},
															{
																"position": 0.98046875,
																"color": -16777216
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"enabled": false,
									"z": 0.3333333333333333,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.5000000000000001,
											"scaleY": 5,
											"scaleZ": 3.0000000000000004,
											"rotationZ": -45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"scaleX": 0.5000000000000001,
											"scaleY": 5,
											"scaleZ": 3.0000000000000004,
											"rotationZ": 45.00000000000001,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
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
											0.7607843137254902,
											0.1803921568627451,
											0.1803921568627451
										]
									}
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -1.7763568394002505e-15,
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 3.48,
									"albedoMap": "Fx/Alphas/T_UI_Round_128.png",
									"emissive": 0.2,
									"renderMode": "AfterTonemapping",
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
													"depthTest": "LessEqual"
												}
											}
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
													0,
													0,
													0
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.01,
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 2.54,
									"albedoMap": "Fx/Alphas/T_UI_Round_128.png",
									"emissive": 10,
									"renderMode": "AfterTonemapping",
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
													"depthTest": "LessEqual",
													"drawOrder": "120"
												}
											}
										},
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9882352941176471,
													0.8235294117647058,
													0.5450980392156862
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "ROUNDWHITE",
							"y": -16.35251,
							"z": -0.33333,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"z": 0.3333333333333333,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor04.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"z": 0.3333333333333333,
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 55.29999999999999,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
												"texture": "Fx/Alphas/T_ArrowWayPoint_1.png"
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
						}
					]
				},
				{
					"type": "object",
					"name": "TestsActions",
					"enabled": false,
					"scaleX": 1.25,
					"scaleY": 1.25,
					"scaleZ": 1.25,
					"children": [
						{
							"type": "object",
							"name": "SQUAREDARK",
							"enabled": false,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_arrows",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Action",
							"x": 20,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50.6,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal",
											"enabled": false,
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"enabled": false,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
																	"time": 0.5623148148148147,
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
																"dv": -1.938275785748485,
																"dt": -0.3322758489854544
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.5809259259259258,
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
													"scaleY": 80,
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.041077998578922e-16,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.175
																			}
																		},
																		{
																			"time": 0.4750000000000003,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.050000000000000044,
																				"dt": -0.3085213128080072
																			},
																			"nextHandle": {
																				"dv": 0.05251273652468931,
																				"dt": 0.32346330318710714
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"time": 0.4500000000000003,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.44999999999999996,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 1.111111111111111,
																		"dt": 2.041077998578922e-17
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
											"props": {
												"amount": 1,
												"color": [
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Action",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50.6,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal",
											"enabled": false,
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"enabled": false,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
																	"time": 0.5623148148148147,
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
																"dv": -1.938275785748485,
																"dt": -0.3322758489854544
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.5809259259259258,
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
													"scaleY": 80,
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.041077998578922e-16,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.175
																			}
																		},
																		{
																			"time": 0.4750000000000003,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.050000000000000044,
																				"dt": -0.3085213128080072
																			},
																			"nextHandle": {
																				"dv": 0.05251273652468931,
																				"dt": 0.32346330318710714
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"time": 0.4500000000000003,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.44999999999999996,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 1.111111111111111,
																		"dt": 2.041077998578922e-17
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
											"props": {
												"amount": 1,
												"color": [
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Action",
							"x": -20,
							"scaleX": 1.85,
							"scaleY": 1.85,
							"scaleZ": 1.85,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "point",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
																"dv": -1.1084577305137246,
																"dt": 0.03915968181888307
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.01574336508026117,
																"dt": -0.12285224515674767
															},
															"nextHandle": {
																"dv": 0.022755149266171615,
																"dt": 0.1846659600782824
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.789797879619691,
																"dt": -0.12986434991048895
															},
															"nextHandle": {
																"dv": 0.3964194965039455,
																"dt": 0.06553389316811102
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal_square",
											"x": 1.7763568394002505e-15,
											"scaleX": 6,
											"scaleY": 6,
											"scaleZ": 6,
											"rotationZ": 90,
											"albedoMap": "Fx/Alphas/T_Ping_Cursor02.png",
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
														"alpha": 1.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.1369503812815343,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9666478917539312,
																		"dt": 0.03455266042842624
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03408959416686058
																	},
																	"nextHandle": {
																		"dv": -5.657839256329852e-16,
																		"dt": 0.12480618813183238
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Selection",
							"y": 25,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50.6,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal",
											"enabled": false,
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"enabled": false,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
																	"time": 0.5623148148148147,
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
																"dv": -1.938275785748485,
																"dt": -0.3322758489854544
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.5809259259259258,
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
											"name": "advancedDecal_square",
											"scaleX": 12,
											"scaleY": 12,
											"scaleZ": 12,
											"albedoMap": "Fx/Alphas/T_CirclePattern08.png",
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
														},
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
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 0.5,
															"mode": 0,
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
													"scaleY": 80,
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.041077998578922e-16,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.175
																			}
																		},
																		{
																			"time": 0.4750000000000003,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.050000000000000044,
																				"dt": -0.3085213128080072
																			},
																			"nextHandle": {
																				"dv": 0.05251273652468931,
																				"dt": 0.32346330318710714
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"time": 0.4500000000000003,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.44999999999999996,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 1.111111111111111,
																		"dt": 2.041077998578922e-17
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
											"props": {
												"amount": 1,
												"color": [
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Selection",
							"x": 20,
							"y": 25,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "Selection",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 53.4,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal_square",
											"scaleX": 13,
											"scaleY": 13,
											"scaleZ": 13,
											"rotationZ": 45,
											"albedoMap": "Fx/Alphas/T_Ping_Cursor04.png",
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
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_square",
											"enabled": false,
											"x": 1.7763568394002505e-15,
											"scaleX": 18,
											"scaleY": 18,
											"scaleZ": 18,
											"rotationZ": 45,
											"albedoMap": "Fx/Alphas/T_Logo_SpikesCircle.png",
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
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Selection",
							"x": -20,
							"y": 25,
							"scaleX": 1.85,
							"scaleY": 1.85,
							"scaleZ": 1.85,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "point",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
																"dv": -1.1084577305137246,
																"dt": 0.03915968181888307
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.01574336508026117,
																"dt": -0.12285224515674767
															},
															"nextHandle": {
																"dv": 0.022755149266171615,
																"dt": 0.1846659600782824
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.789797879619691,
																"dt": -0.12986434991048895
															},
															"nextHandle": {
																"dv": 0.3964194965039455,
																"dt": 0.06553389316811102
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal_square",
											"scaleX": 6,
											"scaleY": 6,
											"scaleZ": 6,
											"rotationZ": -90,
											"albedoMap": "Fx/Alphas/T_CirclePattern08_inv.png",
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
														"alpha": 1.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.1369503812815343,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9666478917539312,
																		"dt": 0.03455266042842624
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03408959416686058
																	},
																	"nextHandle": {
																		"dv": -5.657839256329852e-16,
																		"dt": 0.12480618813183238
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													"type": "curve",
													"name": "rotation.z",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5792335487014237,
															"value": 0.25,
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Attaque",
							"x": 20,
							"y": -25,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"z": -0.6666666666666667,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 52.3,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": -0.26,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
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
															"time": 1,
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
															"time": 2,
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
															"time": 1,
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
															"time": 2,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50.6,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal",
											"enabled": false,
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
											"type": "advancedDecal",
											"name": "advancedDecal",
											"enabled": false,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 5,
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
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
																	"time": 0.5623148148148147,
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
																"dv": -1.938275785748485,
																"dt": -0.3322758489854544
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.020000000000000004
															}
														},
														{
															"time": 0.5809259259259258,
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
													"enabled": false,
													"scaleX": 2.5,
													"scaleY": 80,
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.041077998578922e-16,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.175
																			}
																		},
																		{
																			"time": 0.4750000000000003,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.050000000000000044,
																				"dt": -0.3085213128080072
																			},
																			"nextHandle": {
																				"dv": 0.05251273652468931,
																				"dt": 0.32346330318710714
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
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
																	"time": 0.4500000000000003,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.44999999999999996,
																		"dt": 0
																	},
																	"nextHandle": {
																		"dv": 1.111111111111111,
																		"dt": 2.041077998578922e-17
																	}
																}
															]
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 7,
													"scaleY": 7,
													"scaleZ": 7,
													"rotationX": -90,
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
																	"culling": "None",
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
																"texture": "Fx/Alphas/T_LogoAttack.png"
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
																				"dt": 0.175
																			}
																		},
																		{
																			"time": 0.4750000000000003,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.050000000000000044,
																				"dt": -0.3085213128080072
																			},
																			"nextHandle": {
																				"dv": 0.05251273652468931,
																				"dt": 0.32346330318710714
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
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
																				"dv": 0.018474295508561944,
																				"dt": 0.12025882551810047
																			}
																		},
																		{
																			"time": 0.5778971801324159,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.01702953870984769,
																				"dt": -0.12507920643274045
																			},
																			"nextHandle": {
																				"dv": 0.01702953870984769,
																				"dt": 0.12507920643274045
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
																			"mode": 1,
																			"prevHandle": {
																				"dv": -0.017585623684655997,
																				"dt": -0.4999370237417995
																			},
																			"nextHandle": {
																				"dv": 0.9356674492603813,
																				"dt": 0.12465171405949535
																			}
																		},
																		{
																			"time": 0.20347559206770566,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.06782519735590188
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.12480719602157007
																			}
																		},
																		{
																			"time": 0.5778971801324159,
																			"value": 0,
																			"mode": 0,
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
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"enabled": false,
															"props": {
																"REVERSE": false,
																"range": 1,
																"power": 1
															}
														},
														{
															"type": "curve",
															"name": "position.z",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": -5,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.915407121404594,
																		"dt": -0.021783066804032115
																	},
																	"nextHandle": {
																		"dv": 4.431914136433712,
																		"dt": 0.05006954102920723
																	}
																},
																{
																	"time": 0.4500000000000003,
																	"value": 10,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.47286230774669136,
																		"dt": -0.34707927677329653
																	},
																	"nextHandle": {
																		"dv": 0.47286230774669136,
																		"dt": 0.34707927677329653
																	}
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
														"dv": -1.4870708504579961,
														"dt": -0.02478451417430023
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 0.009999999999999995
													}
												},
												{
													"time": 0.4500000000000003,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.44999999999999996,
														"dt": 0
													},
													"nextHandle": {
														"dv": 1.111111111111111,
														"dt": 2.041077998578922e-17
													}
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Attaque",
							"y": -25,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_square",
											"x": 1.7763568394002505e-15,
											"scaleX": 14,
											"scaleY": 14,
											"scaleZ": 14,
											"albedoMap": "Fx/Alphas/T_Ping_Cursor08.png",
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
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Attaque",
							"x": -20,
							"y": -25,
							"scaleX": 1.85,
							"scaleY": 1.85,
							"scaleZ": 1.85,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"albedoMap": "Fx/Alphas/T_Ping_Cursor03.png",
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "point",
									"scaleX": 1.3,
									"scaleY": 1.3,
									"scaleZ": 3.0000000000000004,
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
												},
												{
													"type": "curve",
													"name": "alpha",
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
																"dv": -1.1084577305137246,
																"dt": 0.03915968181888307
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.01574336508026117,
																"dt": -0.12285224515674767
															},
															"nextHandle": {
																"dv": 0.022755149266171615,
																"dt": 0.1846659600782824
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.789797879619691,
																"dt": -0.12986434991048895
															},
															"nextHandle": {
																"dv": 0.3964194965039455,
																"dt": 0.06553389316811102
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6705882352941176,
											0.5568627450980392,
											0.3254901960784314
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "shaders/GradientMap.hx",
									"props": {
										"USE_ALPHA": false,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 1,
														"color": -5534125
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
									"type": "object",
									"name": "group",
									"children": [
										{
											"type": "model",
											"name": "WayPointMesh",
											"source": "Fx/Meshes_Common/WayPointMesh.fbx",
											"enabled": false,
											"scaleX": 2,
											"scaleY": 2,
											"rotationZ": 50,
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
														"alpha": 1,
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
															"keyMode": 0,
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
											"name": "advancedDecal_square",
											"x": 1.7763568394002505e-15,
											"scaleX": 9,
											"scaleY": 9,
											"scaleZ": 9,
											"rotationZ": 90,
											"albedoMap": "Fx/Alphas/T_LogoAttack_MainBase.png",
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
														"alpha": 1.25
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"enabled": false,
													"props": {
														"alpha": 1.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 1,
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
																		"dv": -0.002472766501621093,
																		"dt": 0.16233011653040905
																	}
																},
																{
																	"time": 0.19816923316699286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5809259259259258,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.20775719329892245
																	},
																	"nextHandle": {
																		"dv": -8.762660910522106e-16,
																		"dt": 0.24723311823581873
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
																	"time": 0.127844843585177,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.03495626737716062,
																		"dt": 0.08407814037583718
																	}
																},
																{
																	"time": 0.32601407675216987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06605641105566429
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12758556425297765
																	}
																},
																{
																	"time": 0.7087707695111028,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.009421106174225091,
																		"dt": -0.21351597003699352
																	},
																	"nextHandle": {
																		"dv": -0.009421106174225091,
																		"dt": 0.21351597003699352
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.7170643009534365,
																		"dt": 0.1602351272185335
																	}
																},
																{
																	"time": 0.36815469142262724,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0037569544707409808,
																		"dt": -0.20266595347561725
																	},
																	"nextHandle": {
																		"dv": -0.0037569544707409808,
																		"dt": 0.20266595347561725
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9356674492603813,
																		"dt": 0.12465171405949535
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.1369503812815343,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.017585623684655997,
																		"dt": -0.4999370237417995
																	},
																	"nextHandle": {
																		"dv": 0.9666478917539312,
																		"dt": 0.03455266042842624
																	}
																},
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03408959416686058
																	},
																	"nextHandle": {
																		"dv": -5.657839256329852e-16,
																		"dt": 0.12480618813183238
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.20347559206770566,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.06782519735590188
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.12480719602157007
																	}
																},
																{
																	"time": 0.5778971801324159,
																	"value": 0,
																	"mode": 0,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 1.1,
															"mode": 0,
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
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.5809259259259258,
															"value": 1,
															"mode": 0,
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
													0.6705882352941176,
													0.5568627450980392,
													0.3254901960784314
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"props": {
												"USE_ALPHA": false,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 1,
																"color": -5534125
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
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
					"name": "tests2",
					"enabled": false,
					"y": -60.19828,
					"children": [
						{
							"type": "object",
							"name": "3-selection",
							"x": -6.723705555555555,
							"y": 7.3342777777777775,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 13,
									"scaleY": 13,
									"scaleZ": 13,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_CirclePattern08.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": -0.017585623684655997,
														"dt": -0.4999370237417995
													},
													"nextHandle": {
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 0.5,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"enabled": false,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
									"albedoMap": "Fx/Alphas/T_CirclePattern08.png",
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
												},
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": -0.017585623684655997,
														"dt": -0.4999370237417995
													},
													"nextHandle": {
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 0.5,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "2-selection",
							"x": -0.5178455555555552,
							"y": 7.3342777777777775,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_CirclePattern08_inv.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": -90,
									"albedoMap": "Fx/Alphas/T_CirclePattern08_inv.png",
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
												"alpha": 1.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.20775719329892245
															},
															"nextHandle": {
																"dv": -8.762660910522106e-16,
																"dt": 0.24723311823581873
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
															"time": 0.127844843585177,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.03495626737716062,
																"dt": 0.08407814037583718
															}
														},
														{
															"time": 0.32601407675216987,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06605641105566429
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12758556425297765
															}
														},
														{
															"time": 0.7087707695111028,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009421106174225091,
																"dt": -0.21351597003699352
															},
															"nextHandle": {
																"dv": -0.009421106174225091,
																"dt": 0.21351597003699352
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.7170643009534365,
																"dt": 0.1602351272185335
															}
														},
														{
															"time": 0.36815469142262724,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0037569544707409808,
																"dt": -0.20266595347561725
															},
															"nextHandle": {
																"dv": -0.0037569544707409808,
																"dt": 0.20266595347561725
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 1
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5792335487014237,
													"value": 0.25,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-selection",
							"x": 5.392704444444445,
							"y": 7.3342777777777775,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 50.6,
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
												"alpha": 1,
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
													"keyMode": 0,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 50.6,
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
												"alpha": 1,
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
													"enabled": false,
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
													"name": "vOffset",
													"keys": [
														{
															"time": 0.06999999999999995,
															"value": -1,
															"mode": 2
														},
														{
															"time": 0.22218383661729063,
															"value": 1.1417063665398361,
															"mode": 2
														},
														{
															"time": 0.3999999999999997,
															"value": -1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.06999999999999995,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.22218383661729063,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3999999999999997,
															"value": 0,
															"mode": 2
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
								}
							]
						},
						{
							"type": "object",
							"name": "2-attack",
							"x": 11.892704444444444,
							"y": -4.669972222222222,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 21,
									"scaleY": 21,
									"scaleZ": 21,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor10.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "5-attack",
							"x": -12.620775555555557,
							"y": -4.6657222222222225,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor11.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor12.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "4-attack",
							"x": -7.101195555555555,
							"y": -4.6657222222222225,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor11.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"enabled": false,
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor12.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "3-attack",
							"x": -1.1072955555555555,
							"y": -4.6657222222222225,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor03.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-attack",
							"x": 5.392704444444445,
							"y": -4.669972222222222,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor08.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-action",
							"x": 5.392704444444445,
							"y": 1.3342777777777777,
							"scaleX": 0.35,
							"scaleY": 0.35,
							"scaleZ": 0.35,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Tests",
					"children": [
						{
							"type": "object",
							"name": "3-selection",
							"x": -7.553863125000003,
							"y": -3.1967325000000013,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 13,
									"scaleY": 13,
									"scaleZ": 13,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_CirclePattern08.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 1,
													"prevHandle": {
														"dv": -0.017585623684655997,
														"dt": -0.4999370237417995
													},
													"nextHandle": {
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 0.5,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.21830566200985507,
													"mode": 1,
													"prevHandle": {
														"dv": -0.017585623684655997,
														"dt": -0.4999370237417995
													},
													"nextHandle": {
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.7183056620098548,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 0.21830566200985507,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "2-selection",
							"x": -1.3480031250000017,
							"y": -3.1967325000000013,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_CirclePattern08_inv.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_square",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": -90,
									"albedoMap": "Fx/Alphas/T_CirclePattern08_inv.png",
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
												"alpha": 1.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 1,
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
																"dv": -0.002472766501621093,
																"dt": 0.16233011653040905
															}
														},
														{
															"time": 0.19816923316699286,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5809259259259258,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.20775719329892245
															},
															"nextHandle": {
																"dv": -8.762660910522106e-16,
																"dt": 0.24723311823581873
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
															"time": 0.127844843585177,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.03495626737716062,
																"dt": 0.08407814037583718
															}
														},
														{
															"time": 0.32601407675216987,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06605641105566429
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12758556425297765
															}
														},
														{
															"time": 0.7087707695111028,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009421106174225091,
																"dt": -0.21351597003699352
															},
															"nextHandle": {
																"dv": -0.009421106174225091,
																"dt": 0.21351597003699352
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.7170643009534365,
																"dt": 0.1602351272185335
															}
														},
														{
															"time": 0.36815469142262724,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0037569544707409808,
																"dt": -0.20266595347561725
															},
															"nextHandle": {
																"dv": -0.0037569544707409808,
																"dt": 0.20266595347561725
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 1
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
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.1369503812815343,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.017585623684655997,
																"dt": -0.4999370237417995
															},
															"nextHandle": {
																"dv": 0.9666478917539312,
																"dt": 0.03455266042842624
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.03408959416686058
															},
															"nextHandle": {
																"dv": -5.657839256329852e-16,
																"dt": 0.12480618813183238
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"keyMode": 1,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5792335487014237,
													"value": 0.25,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-selection",
							"x": 4.562546874999999,
							"y": -3.1967325000000013,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"enabled": false,
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 50.6,
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
												"alpha": 1,
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
													"keyMode": 0,
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
									"type": "model",
									"name": "WayPointMesh",
									"source": "Fx/Meshes_Common/WayPointMesh.fbx",
									"scaleX": 2,
									"scaleY": 2,
									"rotationZ": 50.6,
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
												"alpha": 1,
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
													"enabled": false,
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
													"name": "vOffset",
													"keys": [
														{
															"time": 0.06999999999999995,
															"value": -1,
															"mode": 2
														},
														{
															"time": 0.22218383661729063,
															"value": 1.1417063665398361,
															"mode": 2
														},
														{
															"time": 0.3999999999999997,
															"value": -1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": 0.06999999999999995,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.22218383661729063,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3999999999999997,
															"value": 0,
															"mode": 2
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
								}
							]
						},
						{
							"type": "object",
							"name": "2-attack",
							"x": 11.062546874999999,
							"y": -15.200982500000002,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 21,
									"scaleY": 21,
									"scaleZ": 21,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor10.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "5-attack",
							"x": -13.450933125000002,
							"y": -15.196732500000001,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor11.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor12.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "4-attack",
							"x": -7.931353125000001,
							"y": -15.196732500000001,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor11.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "attackadd",
									"enabled": false,
									"scaleX": 14.7,
									"scaleY": 14.7,
									"scaleZ": 14.7,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor12.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "3-attack",
							"x": -1.937453125000001,
							"y": -15.196732500000001,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor03.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-attack",
							"x": 4.562546874999999,
							"y": -15.200982500000002,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor08.png"
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
																"dv": 0.9356674492603813,
																"dt": 0.12465171405949535
															}
														},
														{
															"time": 0.20347559206770566,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.06782519735590188
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12480719602157007
															}
														},
														{
															"time": 0.5778971801324159,
															"value": 0,
															"mode": 0,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1.1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "1-action",
							"x": 4.562546874999999,
							"y": -9.196732500000001,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "OperationNot",
							"x": 0.572656874999999,
							"y": 17.439127500000005,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"enabled": false,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"x": 0.85338,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
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
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor06.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 6,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
							"type": "object",
							"name": "Operation",
							"x": 4.562546874999999,
							"y": 17.439127500000005,
							"scaleX": 0.35000000000000003,
							"scaleY": 0.35000000000000003,
							"scaleZ": 0.35000000000000003,
							"children": [
								{
									"type": "polygon",
									"name": "Round",
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
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
													"depthTest": "Always"
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
									"type": "polygon",
									"name": "cursorout",
									"x": 0.85338,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
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
													"mode": "AfterTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor06.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "NOt",
							"x": -8.086893125000001,
							"y": 11.980167500000002,
							"scaleX": 0.3500000000000001,
							"scaleY": 0.3500000000000001,
							"scaleZ": 0.3500000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 9,
									"scaleY": 0.4,
									"scaleZ": 10,
									"rotationZ": 19.09,
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
													"depthTest": "Always"
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
												"texture": "Fx/Gradients/z_FillWhite.jpg"
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
								},
								{
									"type": "polygon",
									"name": "cross",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"enabled": false,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
													"depthTest": "Always"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "NOt",
							"x": -3.2764131250000013,
							"y": 11.980167500000002,
							"scaleX": 0.3500000000000001,
							"scaleY": 0.3500000000000001,
							"scaleZ": 0.3500000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cross",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"enabled": false,
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
													"depthTest": "Always"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "NOt",
							"x": 0.7619568749999983,
							"y": 11.980167500000002,
							"scaleX": 0.3500000000000001,
							"scaleY": 0.3500000000000001,
							"scaleZ": 0.3500000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cross",
									"enabled": false,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"enabled": false,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
													"depthTest": "Always"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "NOt",
							"x": 8.375016874999998,
							"y": 11.980167500000002,
							"scaleX": 0.3500000000000001,
							"scaleY": 0.3500000000000001,
							"scaleZ": 0.3500000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "cross",
									"enabled": false,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"enabled": false,
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"enabled": false,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
													"depthTest": "Always"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "NOt",
							"x": 4.562546874999999,
							"y": 11.980167500000002,
							"scaleX": 0.3500000000000001,
							"scaleY": 0.3500000000000001,
							"scaleZ": 0.3500000000000001,
							"children": [
								{
									"type": "polygon",
									"name": "cross",
									"enabled": false,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cross",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 45,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor13.png"
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
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 15,
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
													"depthTest": "Always"
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
												"texture": "Fx/Alphas/T_Ping_Cursor09.png"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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
										}
									]
								},
								{
									"type": "polygon",
									"name": "cursorout",
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 12,
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
													"depthTest": "Always"
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
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
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
														"dv": -0.002472766501621093,
														"dt": 0.16233011653040905
													}
												},
												{
													"time": 0.19816923316699286,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.5809259259259258,
													"value": 1,
													"mode": 0,
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