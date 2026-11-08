{
	"type": "fx",
	"duration": 1.5,
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
														"dv": 3.2,
														"dt": 0.23000000000000004
													}
												},
												{
													"time": 1.4999999999999993,
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
													"time": 0.32000000000000023,
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
													"time": 0.5150000000000001,
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
													"time": 0.7673148148148143,
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
											"time": 0.7859259259259255,
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
													"time": 0.6099999999999995,
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
											"time": 0.6699999999999995,
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
															"time": 0.7499999999999998,
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
													"time": 1.4949999999999999,
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
						}
					]
				}
			]
		}
	]
}