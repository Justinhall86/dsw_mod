{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "BackupFresnel",
			"enabled": false,
			"x": 0.8705856249999999,
			"y": -0.6381031249999999,
			"z": 0.5376974999999999,
			"children": [
				{
					"type": "model",
					"name": "Reference",
					"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
					"x": 2.212704375,
					"y": 1.0887031249999999,
					"z": -0.14110749999999994,
					"scaleX": 2.9999999999999987,
					"scaleY": 2.9999999999999987,
					"scaleZ": 3,
					"rotationZ": 145,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
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
					"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
					"x": -0.1946256249999999,
					"y": -2.349326875,
					"z": -0.14110749999999994,
					"scaleX": 2.9999999999999987,
					"scaleY": 2.9999999999999987,
					"scaleZ": 3,
					"rotationZ": 145,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
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
					"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
					"x": -0.8705856249999999,
					"y": 0.6381031249999999,
					"z": -0.14110749999999994,
					"scaleX": 2.9999999999999987,
					"scaleY": 2.9999999999999987,
					"scaleZ": 3,
					"rotationZ": 145,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
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
					"type": "object",
					"name": "fire",
					"enabled": false,
					"x": -1.147493125,
					"y": 0.6225206249999999,
					"z": 0.42332250000000005,
					"scaleX": 0.9,
					"scaleY": 0.85,
					"scaleZ": 0.85,
					"children": [
						{
							"type": "constraint",
							"name": "constraint",
							"enabled": false,
							"object": "FXAnimation.lookAt2",
							"target": "FXAnimation.Reference.root"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"enabled": false,
							"object": "FXAnimation.Reference.root",
							"target": "FXAnimation.Reference"
						},
						{
							"type": "lookAt",
							"name": "lookAt2",
							"x": 1.6423027322713177,
							"y": -0.9357531366134682,
							"z": 4.8226700000000005,
							"scaleX": 5.849999999999997,
							"scaleY": 2.699999999999998,
							"scaleZ": 4.949999999999999,
							"rotationY": -4.662759655377847,
							"rotationZ": 167.89506460782363,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"scaleX": 9,
									"scaleY": 8,
									"rotationX": 90,
									"rotationZ": 90,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"enabled": false,
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
													"isInstance": true
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
														"progress": 0.34,
														"saturation": 0,
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.08,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
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
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.2627450980392157,
															0.023529411764705882,
															0.023529411764705882
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.21176470588235294,
															0.023529411764705882,
															0.10588235294117647
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
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
												}
											]
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 1.7407174620094104,
							"y": -0.7858400272114612,
							"z": 5.58071,
							"scaleX": 6.7499999999999964,
							"scaleY": 1.349999999999999,
							"scaleZ": 4.050000000000001,
							"rotationX": 9.963490096444848e-17,
							"rotationY": -3.998858548088747,
							"rotationZ": 168.04133473468357,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"scaleX": 9,
									"scaleY": 8,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.04,
															0.25
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
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.01
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
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7137254901960784,
															0.10196078431372549,
															0.10196078431372549
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
														"range": 2,
														"power": 0.5
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
															0.7137254901960784,
															0.10196078431372549,
															0.10196078431372549
														],
														"pointA": 0.34,
														"colorB": [
															0.16078431372549018,
															0.01568627450980392,
															0.0784313725490196
														],
														"pointB": 0.19
													}
												}
											]
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.4,
			"scaleY": 0.4,
			"scaleZ": 0.4,
			"children": [
				{
					"type": "object",
					"name": "UNITS",
					"enabled": false,
					"x": 0.3824977083333332,
					"y": -0.20750687499999643,
					"z": -0.1411075,
					"children": [
						{
							"type": "model",
							"name": "Reference",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -0.5771233333333331,
							"y": -2.1418200000000027,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
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
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": 1.8302066666666668,
							"y": 1.2962099999999968,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
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
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -1.253083333333333,
							"y": 0.8456099999999971,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
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
					"name": "Decal",
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": 2.44045,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 5.25,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 3,
							"fadeStart": 0.08,
							"emissive": 10,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.43
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
											0.7529411764705882,
											0.36470588235294116,
											0.09019607843137255
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.7,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "fire",
					"z": 5.32792,
					"scaleX": 1.8,
					"scaleY": 1.8,
					"scaleZ": 0.9,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 6.7499999999999964,
							"scaleY": 1.349999999999999,
							"scaleZ": 4.050000000000001,
							"rotationX": 9.963490096444848e-17,
							"rotationY": -3.998858548088747,
							"rotationZ": 168.04133473468357,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"scaleX": 9,
									"scaleY": 8,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 4
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.05,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.04,
															0.1
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
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.005,
															0.005
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
													"enabled": false,
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															1,
															0.6549019607843137,
															0.4823529411764706
														],
														"pointA": 0.3,
														"colorB": [
															0.8980392156862745,
															0.44705882352941173,
															0.39215686274509803
														],
														"pointB": 0.42
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 1.2
													},
													"isInstance": true
												}
											]
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.7
							}
						}
					]
				}
			]
		},
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
		}
	]
}