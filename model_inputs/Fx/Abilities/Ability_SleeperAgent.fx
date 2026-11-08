{
	"type": "fx",
	"cullingRadius": 75,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 250,
			"scaleY": 250,
			"scaleZ": 250,
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
					"type": "subFX",
					"name": "Ability_ArrakisDiplomacy_Region",
					"source": "Fx/Abilities/Ability_ArrakisDiplomacy_Region.fx",
					"enabled": false,
					"y": 148.93489
				},
				{
					"type": "object",
					"name": "SleeperAgent",
					"z": 3.9876066666666667,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sand",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 25,
							"rotationZ": 158.794776438075,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.75,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0.04
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.02,
											0.05
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 150,
											"value": 0,
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
											0.7176470588235294,
											0.5372549019607843,
											0.38431372549019605
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": true,
										"envBlend": 0.7,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "grid",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 45,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "AfterTonemapping",
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 2,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/Alphas/Pattern02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8156862745098039,
											0.13333333333333333,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "object",
							"name": "group",
							"z": -3.9876066666666667,
							"children": [
								{
									"type": "advancedDecal",
									"name": "gridInside2",
									"z": -1.1102230246251565e-16,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 45,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "AfterTonemapping",
									"blendMode": 2,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpiceAlpha.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.64,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 4,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 6,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 8,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/Pattern02_Inside02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "gridInside1",
									"z": -1.1102230246251565e-16,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 45,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"renderMode": "AfterTonemapping",
									"blendMode": 2,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_SpiceAlpha.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.64,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"loop": true,
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
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 2,
															"value": 0.5,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 4,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.6666666666666666
															}
														},
														{
															"time": 8,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.35,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/Alphas/Pattern02_Inside01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.02
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
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
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "SleeperAgent_white",
					"enabled": false,
					"z": 3.9876066666666667,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sand",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 25,
							"rotationZ": 158.794776438075,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.75,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.05,
											0.04
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.45,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1.5,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.02,
											0.05
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.13333333333333333,
											0.34509803921568627,
											0.08627450980392157
										],
										"pointA": 0,
										"colorB": [
											0.24313725490196078,
											0.5058823529411764,
											0.18823529411764706
										],
										"pointB": 0.58
									}
								},
								{
									"type": "shader",
									"name": "ColorMap",
									"source": "shaders/ColorMap.hx",
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"colorA": [
											0.3607843137254902,
											0.050980392156862744,
											0.050980392156862744
										],
										"pointA": 0,
										"colorB": [
											0.6549019607843137,
											0.08235294117647059,
											0.08235294117647059
										],
										"pointB": 0.7
									}
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 150,
											"value": 0,
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
											0.7176470588235294,
											0.5372549019607843,
											0.38431372549019605
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": true,
										"envBlend": 0.7,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "gridInside1",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 45,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "AfterTonemapping",
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"loop": true,
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
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 2,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 8,
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2.5,
										"uvScaleY": 2.5,
										"texture": "Fx/Alphas/Pattern02_Inside01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8156862745098039,
											0.13333333333333333,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "gridInside2",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 45,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "AfterTonemapping",
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 4,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 6,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 8,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2.5,
										"uvScaleY": 2.5,
										"texture": "Fx/Alphas/Pattern02_Inside02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8156862745098039,
											0.13333333333333333,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "grid",
							"z": -3.9876066666666667,
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 45,
							"rotationZ": 89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
										"alpha": 0.8,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.64,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 3,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 2,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
												},
												{
													"time": 4,
													"value": 0.25,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.6666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.6666666666666666
													}
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
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.35,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2.5,
										"uvScaleY": 2.5,
										"texture": "Fx/Alphas/Pattern02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
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