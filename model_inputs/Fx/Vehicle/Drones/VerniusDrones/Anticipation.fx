{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal_Green",
					"z": 4,
					"scaleX": 12,
					"scaleY": 12,
					"scaleZ": 8,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 3,
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 2
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.10837271827219012,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1183727182721901,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.18333308967252537,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.2509382163368004,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.35,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.580392156862745,
									0.4549019607843137,
									0.9921568627450981
								]
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
											"time": 0.01917417074169636,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015960427820990455,
												"dt": -0.49990576705532597
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 1.0440525627136237
											}
										},
										{
											"time": 2.0106287461138725,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 2.0222981577731134,
											"value": 0,
											"mode": 2
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0029112230697415985,
												"dt": -0.5004857568709588
											},
											"nextHandle": {
												"dv": 0.007747196738022488,
												"dt": 1.085995752589968
											}
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 1.697311370229642,
											"value": 0,
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
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.03485975677854325,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.10527968055035841,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.19917291224611194,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.3480308554906656,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.13934203771706083,
												"dt": -0.0940868914220308
											},
											"nextHandle": {
												"dv": -0.0005562475711130138,
												"dt": 0.47318471673981344
											}
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -1.0844952187440173,
												"dt": -0.11328053277389372
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 1.697311370229642,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.03485975677854325,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.10527968055035841,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.19917291224611194,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.3480308554906656,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.13934203771706083,
												"dt": -0.0940868914220308
											},
											"nextHandle": {
												"dv": -0.0005562475711130138,
												"dt": 0.47318471673981344
											}
										},
										{
											"time": 0.8755118776817458,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9104249280187479,
											"value": 0.02163275373246143,
											"mode": 2
										},
										{
											"time": 0.9372811205856726,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9802510286927522,
											"value": 0.02494925287235139,
											"mode": 2
										},
										{
											"time": 1.036649033083294,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1118463722706833,
											"value": 0.05479774513136104,
											"mode": 2
										},
										{
											"time": 1.1924149499714574,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.2971541009824636,
											"value": 0.10786173136960042,
											"mode": 2
										},
										{
											"time": 1.396522013480085,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4905186874643217,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 1.600629076988713,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.697311370229642,
											"value": 0,
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
					"name": "advancedDecal_Green",
					"z": 4,
					"scaleX": 12,
					"scaleY": 12,
					"scaleZ": 8,
					"rotationZ": 89.99999999999999,
					"albedoMap": "Fx/Gradients/circGrad05.jpg",
					"fadePower": 3,
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 2
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.10837271827219012,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1183727182721901,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.18333308967252537,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.2509382163368004,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.35,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.580392156862745,
									0.4549019607843137,
									0.9921568627450981
								]
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 0.01917417074169636,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015960427820990455,
												"dt": -0.49990576705532597
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 1.0440525627136237
											}
										},
										{
											"time": 2.0106287461138725,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 2.0222981577731134,
											"value": 0,
											"mode": 2
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0029112230697415985,
												"dt": -0.5004857568709588
											},
											"nextHandle": {
												"dv": 0.007747196738022488,
												"dt": 1.085995752589968
											}
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 1.697311370229642,
											"value": 0,
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
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.03485975677854325,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.10527968055035841,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.19917291224611194,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.3480308554906656,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.13934203771706083,
												"dt": -0.0940868914220308
											},
											"nextHandle": {
												"dv": -0.0005562475711130138,
												"dt": 0.47318471673981344
											}
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -1.0844952187440173,
												"dt": -0.11328053277389372
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 1.697311370229642,
											"value": 0,
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
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.03485975677854325,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.10527968055035841,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.19917291224611194,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 0.3480308554906656,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": 0.13934203771706083,
												"dt": -0.0940868914220308
											},
											"nextHandle": {
												"dv": -0.0005562475711130138,
												"dt": 0.47318471673981344
											}
										},
										{
											"time": 0.8755118776817458,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9104249280187479,
											"value": 0.02163275373246143,
											"mode": 2
										},
										{
											"time": 0.9372811205856726,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9802510286927522,
											"value": 0.02494925287235139,
											"mode": 2
										},
										{
											"time": 1.036649033083294,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1118463722706833,
											"value": 0.05479774513136104,
											"mode": 2
										},
										{
											"time": 1.1924149499714574,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.2971541009824636,
											"value": 0.10786173136960042,
											"mode": 2
										},
										{
											"time": 1.396522013480085,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4905186874643217,
											"value": 0.25,
											"mode": 2
										},
										{
											"time": 1.600629076988713,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.685641958570401,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.697311370229642,
											"value": 0,
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
					"name": "TestElec1",
					"enabled": false,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationZ": 35.2,
					"children": [
						{
							"type": "object",
							"name": "ElecSides",
							"enabled": false,
							"rotationZ": -25.8,
							"children": [
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 1.08295,
									"y": -0.17853,
									"z": 0.55648,
									"scaleX": 0.15,
									"scaleY": 0.15,
									"scaleZ": 0.15,
									"rotationX": 30.2,
									"rotationY": -7.9,
									"rotationZ": 77.7,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.2786333713480462,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4534805233779566,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6649603758589635,
															"value": 0,
															"mode": 2
														}
													]
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 1.1000883139641031,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1704431826131096,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2373661064499697,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.022307641278953332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.034135635713689015
															}
														},
														{
															"time": 1.35282648012354,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8528264801235395,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": -0.84465,
									"y": -0.01063,
									"z": 0.64191,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"rotationX": 31.8,
									"rotationZ": -90,
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
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.1786333713480466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3534805233779559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5649603758589603,
															"value": 0,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 0.76347,
									"y": 0.58052,
									"z": 0.64704,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.08,
									"rotationX": 37.9,
									"rotationY": -5.7,
									"rotationZ": 128.2,
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
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.1786333713480466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3534805233779559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5649603758589603,
															"value": 0,
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
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": -0.24914,
									"y": -1.33502,
									"z": 0.74877,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.15000000000000002,
									"rotationX": 18.1,
									"rotationY": 6.5,
									"rotationZ": -12.8,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.3636333713480457,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.538480523377959,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7499603758589648,
															"value": 0,
															"mode": 2
														}
													]
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
										"range": 1.5,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "object",
							"name": "ElecSides",
							"z": -0.23537,
							"rotationZ": -25.8,
							"children": [
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 1.08295,
									"y": -0.17853,
									"z": 0.55648,
									"scaleX": 0.25,
									"scaleY": 0.2,
									"scaleZ": 0.15,
									"rotationX": 30.2,
									"rotationY": -7.9,
									"rotationZ": 77.7,
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
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.2786333713480462,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4534805233779566,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6649603758589635,
															"value": 0,
															"mode": 2
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 1.3171556095061248,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3625524044386639,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3981650076135268,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.440560963774078,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6666851161520473,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": -0.84465,
									"y": -0.01063,
									"z": 0.64191,
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"rotationX": 31.8,
									"rotationZ": -90,
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
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.1786333713480466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3534805233779559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5649603758589603,
															"value": 0,
															"mode": 2
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 1.2289429836162866,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2743397785488257,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3099523817236887,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3523483378842398,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5784724902622091,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"x": 0.76347,
									"y": 0.58052,
									"z": 0.64704,
									"scaleX": 0.2,
									"scaleY": 0.1,
									"scaleZ": 0.08,
									"rotationX": 37.9,
									"rotationY": -5.7,
									"rotationZ": 128.2,
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
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 1,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 10,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.1786333713480466,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3534805233779559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5649603758589603,
															"value": 0,
															"mode": 2
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 1.2289429836162866,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2743397785488257,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3099523817236887,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3523483378842398,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5784724902622091,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Electricity_single",
									"source": "Fx/Meshes_Common/Electricity_single.fbx",
									"enabled": false,
									"x": -0.24914,
									"y": -1.33502,
									"z": 0.74877,
									"scaleX": 0.35,
									"scaleY": 0.2,
									"scaleZ": 0.15000000000000002,
									"rotationX": 18.1,
									"rotationY": 6.5,
									"rotationZ": -12.8,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.25,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
											}
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"props": {
												"useSourceUVs": true,
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
												"speed": 15,
												"frameDivision": [
													1,
													4
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": true
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6549019607843137,
													0.5764705882352941,
													1
												]
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
													"keys": [
														{
															"time": 1.3636333713480457,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.538480523377959,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7499603758589648,
															"value": 0,
															"mode": 2
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 1.4142786016474624,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4596753965800016,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4952879997548645,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5376839559154156,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.763808108293385,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1.5,
										"power": 0.8
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
					"x": -0.9582,
					"y": 0.1325,
					"z": 3.51655,
					"scaleX": 5.000000000000002,
					"scaleY": 5,
					"scaleZ": 5,
					"rotationX": 4.1952367335099574e-15,
					"rotationY": -40.699965122224995,
					"rotationZ": 94.20536902300479,
					"lockAxis": [
						0,
						0,
						0
					],
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": 2,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationX": 90,
							"rotationY": 90,
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
											"emissive": 3
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"useSourceUVs": true,
										"blendBetweenFrames": false,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
										"speed": 10,
										"frameDivision": [
											2,
											2
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": false
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6313725490196078,
											0.5568627450980392,
											1
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"alignMode": "Screen",
						"emitSurface": true,
						"lifeTime": 0.4,
						"lifeTimeRand": 0.05,
						"maxCount": 10,
						"frameCount": 4,
						"frameDivisionX": 2,
						"frameDivisionY": 2,
						"animationLoop": false,
						"instScale": 3.5,
						"instOffset": [
							0,
							0,
							7
						],
						"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_01.png",
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 1,
						"animationBlendBetweenFrames": false
					},
					"z": 2.5,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
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
											"emissive": 5
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"enabled": false,
									"props": {
										"useSourceUVs": false,
										"blendBetweenFrames": true,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
										"speed": 10,
										"frameDivision": [
											2,
											2
										],
										"totalFrames": 4,
										"startTime": 0,
										"loop": false
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.5686274509803921,
											0.47058823529411764,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/clouds3.png",
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
											"keys": [
												{
													"time": 0.24726183384056316,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3176167024895698,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3845396263264298,
													"value": 1,
													"mode": 0
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.5
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
							"name": "emitRate",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.0077249401461189915,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.20462454287806833,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.21462454287806834,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.8,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.81,
									"value": 2,
									"mode": 2
								},
								{
									"time": 2,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "TeslaCoil",
					"source": "Fx/Meshes_Common/Sphere.fbx",
					"locked": true,
					"z": 2.5,
					"scaleX": 8,
					"scaleY": 8,
					"scaleZ": 8,
					"children": [
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.3333333333333333,
									0.3333333333333333,
									0.3333333333333333
								]
							}
						}
					]
				}
			]
		}
	]
}