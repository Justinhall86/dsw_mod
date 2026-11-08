{
	"type": "fx",
	"cullingRadius": 500,
	"markers": [
		{
			"t": 8.80576
		}
	],
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Pawn_Mainbase_Corrino",
					"source": "UI/ConquestMenu/Assets/Pawn_01.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
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
					"name": "PawnEffect",
					"z": 0.015,
					"children": [
						{
							"type": "advancedDecal",
							"name": "outsidecircleDuration",
							"z": -0.015,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.1575,
							"rotationZ": -29.999999999999993,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"normalFade": true,
							"normalFadeStart": 0.65,
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
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_CirclePattern07.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49929461931578273,
													"value": 1,
													"mode": 2
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
											"value": 0.8948814392089844,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 0.75,
											"value": 1.0448814392089845,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 1.5,
											"value": 0.8948814392089844,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									],
									"loop": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FloorFlareDuration",
							"z": -0.015,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.05,
							"rotationZ": -29.999999999999993,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.25,
							"emissive": 0.2,
							"renderMode": "BeforeTonemapping",
							"normalFade": true,
							"normalFadeStart": 0.65,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 2.7010342399092275,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.8949768223583816,
													"value": 1,
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.49929461931578273,
													"value": 1,
													"mode": 2
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
											"value": 0.947440719604492,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 0.75,
											"value": 1.097440719604492,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 1.5,
											"value": 0.947440719604492,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
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
									0.37254901960784315,
									0.2901960784313725,
									1
								]
							}
						},
						{
							"type": "object",
							"name": "FlareDuration",
							"z": -0.015,
							"scaleX": 0.05,
							"scaleY": 0.05,
							"scaleZ": 0.05113209628211956,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_FlareLarge",
									"z": 0.4317,
									"scaleX": 0.4,
									"scaleY": 0.25,
									"scaleZ": 0.3,
									"rotationZ": -105.8,
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
											"scaleX": 6,
											"scaleY": 40,
											"scaleZ": 2.05,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0,
															"emissive": 0.25
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.521014362221652,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
																	"mode": 2
																},
																{
																	"time": 0.49929461931578273,
																	"value": 1,
																	"mode": 2
																}
															]
														}
													]
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
														"alpha": 0.65,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 0.2,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -151464545
																	},
																	{
																		"position": 1,
																		"color": -1
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
									"type": "lookAt",
									"name": "lookAt_FlareWhite",
									"z": 0.4317,
									"scaleX": 0.4,
									"scaleY": 0.2,
									"scaleZ": 0.3,
									"rotationZ": -105.8,
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
											"scaleX": 1.5,
											"scaleY": 20,
											"scaleZ": 1.5,
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
															"blend": "Add",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
															"enableStencil": false,
															"parallax": 0,
															"emissive": 4.5
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
														"onDecal": false
													},
													"isInstance": true
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
														"texture": "Fx/Alphas/T_circle5.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5310143622216517,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5410143622216514,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1
																},
																{
																	"time": 3.98998875940962,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
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
																	"mode": 2
																},
																{
																	"time": 0.49929461931578273,
																	"value": 1,
																	"mode": 2
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
														"range": 0.2,
														"power": 2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
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
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.0025199528420294937,
														"dt": -0.0324176081713078
													},
													"nextHandle": {
														"dv": 0.0010161587690337445,
														"dt": 0.013394049228115816
													}
												},
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.04032893849489203,
														"dt": -0.18524618299377818
													},
													"nextHandle": {
														"dv": 0.0920000000000003,
														"dt": 0.42111370979298
													}
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4906620626166027,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": -0.2500565524819132
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": 0
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.013431379857510825
													}
												},
												{
													"time": 1.2408317200623424,
													"value": 1.8000000000000012,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
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
													"value": 0.75,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 0.75,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 1.5,
													"value": 0.75,
													"prevHandle": {
														"dv": 0,
														"dt": -0.25
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.85,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 0.75,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 1.5,
											"value": 0.85,
											"prevHandle": {
												"dv": 0,
												"dt": -0.25
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										}
									],
									"loop": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.4980392156862745,
											0.36470588235294116,
											1
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