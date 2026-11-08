{
	"type": "fx",
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Lights",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"z": 0.16403999999999996,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationX": -8.229620662223676e-16,
							"rotationY": -14.94115005494647,
							"rotationZ": 45.76599697930221,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "circle",
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.4,
									"rotationY": 90,
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
													"emissive": 3
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
												"texture": "Fx/Alphas/T_circle2.png"
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.08,
													"value": 1.323505719144871,
													"mode": 2
												},
												{
													"time": 0.22500000000000003,
													"value": 0.9417534722222223,
													"mode": 2
												},
												{
													"time": 0.42,
													"value": 1.3172036358115378,
													"mode": 2
												},
												{
													"time": 0.5599999999999999,
													"value": 0.9711631944444445,
													"mode": 2
												},
												{
													"time": 0.6849999999999999,
													"value": 1.3172036358115378,
													"mode": 2
												},
												{
													"time": 0.84,
													"value": 0.9438541666666668,
													"mode": 2
												},
												{
													"time": 0.9199999999999999,
													"value": 1.3550161358115378,
													"mode": 2
												},
												{
													"time": 1.125,
													"value": 0.9480555555555557,
													"mode": 2
												},
												{
													"time": 1.3,
													"value": 1.3298078024782043,
													"mode": 2
												},
												{
													"time": 1.53,
													"value": 0.9564583333333334,
													"mode": 2
												},
												{
													"time": 1.7,
													"value": 1.3151029413670932,
													"mode": 2
												},
												{
													"time": 1.865,
													"value": 0.9270486111111111,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
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
													0.4549019607843137,
													0.3176470588235294,
													0.9686274509803922
												]
											}
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
																"color": -13754522
															},
															{
																"position": 0.65625,
																"color": -12444212
															},
															{
																"position": 1,
																"color": -9154057
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
							"type": "model",
							"name": "CrossPlanes-flare",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.011799999999999998,
							"y": -0.0025099999999999983,
							"z": -0.15637,
							"scaleX": 0.65,
							"scaleY": 0.65,
							"scaleZ": 0.35,
							"rotationX": -1.1199556842968921e-19,
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
											"depthTest": "LessEqual",
											"parallax": 0,
											"emissive": 15
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_Flare07_glow.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.12013549804687576,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.12013549804687576,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.2162438964843758,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2162438964843758,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3043432617187508,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3043432617187508,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4004516601562508,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4004516601562508,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4649999999999999,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4649999999999999,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4649999999999999,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.08,
													"value": 1.323505719144871,
													"mode": 2
												},
												{
													"time": 0.22500000000000003,
													"value": 0.34728581392308433,
													"mode": 2
												},
												{
													"time": 0.42,
													"value": 1.3172036358115378,
													"mode": 2
												},
												{
													"time": 0.5599999999999999,
													"value": 0.37669553614530665,
													"mode": 2
												},
												{
													"time": 0.6849999999999999,
													"value": 1.3172036358115378,
													"mode": 2
												},
												{
													"time": 0.84,
													"value": 0.3493865083675288,
													"mode": 2
												},
												{
													"time": 0.9199999999999999,
													"value": 1.3550161358115378,
													"mode": 2
												},
												{
													"time": 1.125,
													"value": 0.3535878972564177,
													"mode": 2
												},
												{
													"time": 1.3,
													"value": 1.3298078024782043,
													"mode": 2
												},
												{
													"time": 1.53,
													"value": 0.36199067503419546,
													"mode": 2
												},
												{
													"time": 1.7,
													"value": 1.3151029413670932,
													"mode": 2
												},
												{
													"time": 1.865,
													"value": 0.33258095281197314,
													"mode": 2
												},
												{
													"time": 2,
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0,
											0.40784313725490196,
											1
										]
									}
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
														"color": -13754522
													},
													{
														"position": 0.65625,
														"color": -12444212
													},
													{
														"position": 0.9921875,
														"color": -9154057
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
											0.4549019607843137,
											0.3176470588235294,
											0.9686274509803922
										]
									}
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
								"power": 0.8
							}
						}
					]
				}
			]
		}
	]
}