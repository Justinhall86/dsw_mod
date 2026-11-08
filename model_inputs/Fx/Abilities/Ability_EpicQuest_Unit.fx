{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
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
			"scaleX": 0.6,
			"scaleY": 0.6,
			"scaleZ": 0.6,
			"children": [
				{
					"type": "object",
					"name": "UNITS",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Reference",
							"source": "Character/Ecaz/Unit/Musketeer/Female01_EcazMusketeer.fbx",
							"x": 1.47975,
							"y": -1.03613,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Male01/Anim_Male01_AttackLaunch.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"alphaKill": false,
											"enableStencil": false,
											"emissive": 10
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.89,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0.1
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
													"name": "width",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4924774870974948,
															"value": 1.0125000000000002,
															"mode": 2
														},
														{
															"time": 2.353017558846624,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.999584194603378,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.2,
												"scale": 4,
												"power": 2,
												"color": [
													0.7019607843137254,
													0.27450980392156865,
													0.27450980392156865
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.73,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.21,
												"scale": 5,
												"power": 1.3,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.27,
												"levelMax": 0.86
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 8
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.5,
												"scale": 2.5,
												"power": 2,
												"color": [
													0.5450980392156862,
													0.09019607843137255,
													0.09019607843137255
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "bias",
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
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.35,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.7,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "power",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.5,
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
							"type": "model",
							"name": "Reference",
							"source": "Character/Ecaz/Unit/Musketeer/Female01_EcazMusketeer.fbx",
							"x": -2.05392,
							"y": -1.10052,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Male01/Anim_Male01_AttackLaunch.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"alphaKill": false,
											"enableStencil": false,
											"emissive": 10
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.89,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0.1
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
													"name": "width",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4924774870974948,
															"value": 1.0125000000000002,
															"mode": 2
														},
														{
															"time": 2.353017558846624,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.999584194603378,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.2,
												"scale": 4,
												"power": 2,
												"color": [
													0.7019607843137254,
													0.27450980392156865,
													0.27450980392156865
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.73,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.21,
												"scale": 5,
												"power": 1.3,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.27,
												"levelMax": 0.86
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 8
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.5,
												"scale": 2.5,
												"power": 2,
												"color": [
													0.5450980392156862,
													0.09019607843137255,
													0.09019607843137255
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "bias",
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
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.35,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.7,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "power",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.5,
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
							"type": "model",
							"name": "Reference",
							"source": "Character/Ecaz/Unit/Musketeer/Female01_EcazMusketeer.fbx",
							"x": 0.06965,
							"y": 2.7138,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Male01/Anim_Male01_AttackLaunch.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"parallax": 0,
											"alphaKill": false,
											"enableStencil": false,
											"emissive": 10
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.89,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													0.1
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
													"name": "width",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4924774870974948,
															"value": 1.0125000000000002,
															"mode": 2
														},
														{
															"time": 2.353017558846624,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.999584194603378,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.2,
												"scale": 4,
												"power": 2,
												"color": [
													0.7019607843137254,
													0.27450980392156865,
													0.27450980392156865
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.3,
												"sandColorSet": false,
												"envBlend": 0.73,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.21,
												"scale": 5,
												"power": 1.3,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "Level",
											"source": "shaders/Level.hx",
											"enabled": false,
											"props": {
												"levelMin": 0.27,
												"levelMax": 0.86
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 8
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0.5,
												"scale": 2.5,
												"power": 2,
												"color": [
													0.5450980392156862,
													0.09019607843137255,
													0.09019607843137255
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "bias",
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
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.35,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														},
														{
															"time": 0.7,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.11666666666666665
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.11666666666666665
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "power",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.5,
															"mode": 2
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
					"name": "EQuestUnit",
					"z": 1,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "object",
							"name": "Swirl",
							"z": 1.6054700000000002,
							"scaleX": 0.7,
							"scaleY": 0.7,
							"scaleZ": 0.7,
							"children": [
								{
									"type": "model",
									"name": "SwirlInsideRed",
									"source": "Fx/Event/Swirl.fbx",
									"scaleX": 9,
									"scaleY": 9,
									"scaleZ": 7.9,
									"rotationZ": 36.19602602839715,
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
													"emissive": 2
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": -0.0007290696225545901,
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
															"time": 0.4425134433882838,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8,
																"dt": -0.13964677395950031
															},
															"nextHandle": {
																"dv": 0.0762138366699221,
																"dt": 0.1751445499379477
															}
														},
														{
															"time": 1.9992709303774454,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													-0.4
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 0.58,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.1
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
												"range": 5,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0.11684001056927995,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
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
													0.7137254901960784,
													0.10196078431372549,
													0.30196078431372547
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "Swirl",
									"source": "Fx/Event/Swirl.fbx",
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 9,
									"rotationZ": -84.40283855114488,
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
													"emissive": 2
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
												"texture": "Fx/Gradients/Cyl01v_A.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": -0.0007290696225545901,
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
															"time": 0.4425134433882838,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8,
																"dt": -0.13964677395950031
															},
															"nextHandle": {
																"dv": 0.0762138366699221,
																"dt": 0.1751445499379477
															}
														},
														{
															"time": 1.9992709303774454,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 0.37,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.1,
													-0.3
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 1,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.05
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
												"range": 5,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0.11684001056927995,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4,
													"value": 1,
													"mode": 2
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
												"envBlend": 0.5,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.27048193667903453,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.321933238091307,
												"dt": -0.06735525205113772
											},
											"nextHandle": {
												"dv": 1.0855997590896094,
												"dt": 0.02148444229488028
											}
										},
										{
											"time": 1.1838636736476547,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.007926619448975658,
												"dt": -0.935892228491727
											},
											"nextHandle": {
												"dv": 0.007926619448975658,
												"dt": 0.935892228491727
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.27048193667903453,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.321933238091307,
												"dt": -0.06735525205113772
											},
											"nextHandle": {
												"dv": 1.0855997590896094,
												"dt": 0.02148444229488028
											}
										},
										{
											"time": 1.1838636736476547,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.007926619448975658,
												"dt": -0.935892228491727
											},
											"nextHandle": {
												"dv": 0.007926619448975658,
												"dt": 0.935892228491727
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SmokePuff",
							"props": {
								"lifeTime": 0.75,
								"lifeTimeRand": 0.25,
								"emitType": "Burst",
								"burstParticleCount": 6,
								"simulationSpace": "World",
								"emitOrientation": "Normal",
								"emitShape": "Cylinder",
								"emitRad1": 0.61,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 14,
								"instSpeed": [
									5,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 5,
								"instAcceleration": [
									-3,
									0,
									0
								],
								"instAcceleration_rand": [
									1,
									0,
									0
								],
								"instWorldAcceleration": [
									0,
									0,
									2
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									1
								],
								"speedFactor": 0.5,
								"emitAngle": 360,
								"warmUpTime": -0.1
							},
							"z": -1.3945299999999998,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.03,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"emissive": 0.1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"color": [
												1,
												0.7764705882352941,
												0.5647058823529412,
												0.27058823529411763
											]
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1.2
											},
											"isInstance": true,
											"children": [
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
															"time": 0.15,
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
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.7,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.9,
															"mode": 0,
															"prevHandle": {
																"dv": 1.250468545740539,
																"dt": -0.330632361246651
															},
															"nextHandle": {
																"dv": -0.9833333333333334,
																"dt": 0.26
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"props": {
												"tag": "WIP"
											},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.25,
											"topSpan": 0.24,
											"dirIntensity": 0.1,
											"dirSpan": 0,
											"sandBlend": 0.7,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 19.7,
												"power": 14.39
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"x": 0.03707,
							"y": 0.00067,
							"z": 1.02075,
							"scaleY": 0.6,
							"rotationX": 1.9025656134737984e-15,
							"rotationY": -33.294569505222576,
							"rotationZ": 148.2701980355909,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "FlareLarge",
									"scaleX": 15,
									"scaleY": 75,
									"scaleZ": 15,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 0.75
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.16122831674626248,
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
															"time": 0.5,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8,
																"dt": -0.13964677395950031
															},
															"nextHandle": {
																"dv": 0.0762138366699221,
																"dt": 0.1751445499379477
															}
														},
														{
															"time": 2,
															"value": 0,
															"mode": 0
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
												"alpha": 0.75,
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
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 10,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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
											"time": 0.27048193667903453,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -3.321933238091307,
												"dt": -0.06735525205113772
											},
											"nextHandle": {
												"dv": 1.0855997590896094,
												"dt": 0.02148444229488028
											}
										},
										{
											"time": 1.1838636736476547,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.007926619448975658,
												"dt": -0.935892228491727
											},
											"nextHandle": {
												"dv": 0.007926619448975658,
												"dt": 0.935892228491727
											}
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"z": 1.77948,
							"scaleX": 9,
							"scaleY": 9,
							"scaleZ": 5,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"fadePower": 3,
							"emissive": 0.75,
							"renderMode": "BeforeTonemapping",
							"children": [
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
													"time": 0.28299791953523845,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3670072688894952,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5622334594157292,
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
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}