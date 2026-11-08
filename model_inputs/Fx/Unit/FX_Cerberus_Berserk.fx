{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.54,
			"scaleY": 0.54,
			"scaleZ": 0.54,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"x": -1.1102230246251565e-16,
					"y": 5.551115123125783e-17,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"rotationZ": -155.45,
					"children": [
						{
							"type": "model",
							"name": "Female01_AtreideRanger",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -0.00415,
							"y": -0.01523,
							"scaleX": 1.9999999999999996,
							"scaleY": 1.9999999999999996,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_Idle01.fbx"
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "BolInfinty",
					"props": {
						"instRotation": [
							0,
							180,
							0
						],
						"emitRate": 3,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"simulationSpace": "World",
						"instRotation_rand": [
							0,
							0,
							360
						]
					},
					"z": -1.03015,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 10,
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
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png",
										"onDecal": false
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16960016257684296
													}
												},
												{
													"time": 0.5056226185032769,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16960016257684296
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.1647924604989077
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.1647924604989077
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.36470588235294116,
											0.26666666666666666
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
										"progress": 0.49,
										"saturation": 0,
										"width": 0.39,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.4
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
										"progress": 0.4,
										"saturation": 0,
										"width": 0.27,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.3
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
										"range": 1.5,
										"power": 0.2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Aura",
					"enabled": false,
					"z": 1.47633,
					"scaleX": 2,
					"scaleY": 2,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"x": 0.06143,
							"y": 0.08098,
							"z": -0.11034,
							"scaleX": 0.65,
							"scaleY": 0.15,
							"scaleZ": 0.4,
							"rotationY": -19,
							"rotationZ": 24.4,
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
									"z": 0.37765,
									"scaleX": 9,
									"scaleY": 10,
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
													"emissive": 8
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
															-0.08,
															0.5
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
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 1.2
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt2",
							"z": -0.10118,
							"scaleX": 0.65,
							"scaleY": 0.3,
							"scaleZ": 0.275,
							"rotationY": -19,
							"rotationZ": 24.4,
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
									"y": -0.04318,
									"z": 2.78846,
									"scaleX": 4,
									"scaleY": 30,
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
													"emissive": 5
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
														"alpha": 0.6,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.6
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
												"alpha": 0.6,
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
												"range": 1.2,
												"power": 1.2
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt3",
							"z": -0.02089,
							"scaleX": 0.4,
							"scaleY": 0.35,
							"scaleZ": 0.175,
							"rotationY": -18.7,
							"rotationZ": 25.5,
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
									"y": -0.04318,
									"z": 2.78846,
									"scaleX": 5,
									"scaleY": 30,
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
														"alpha": 0.7,
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.6
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
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 1.2
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.39215686274509803,
									0.29411764705882354
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 13,
					"scaleY": 13,
					"scaleZ": 3,
					"albedoMap": "Fx/Gradients/circGrad01.png",
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									0.6196078431372549,
									0.20392156862745098,
									0.15294117647058825
								]
							}
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.30196078431372547,
									0.2392156862745098
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}