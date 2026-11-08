{
	"type": "fx",
	"duration": 0.5,
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
			"scaleX": 1.5,
			"scaleY": 1.5,
			"scaleZ": 1.5,
			"children": [
				{
					"type": "object",
					"name": "group",
					"children": [
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
												"alpha": 0.3,
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
															"time": 0.5,
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
													"time": 0.5,
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