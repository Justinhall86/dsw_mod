{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.1,
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"x": -0.29879333333333336,
							"y": 1.38556,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
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
							"type": "object",
							"name": "Chara",
							"x": -1.0817533333333333,
							"y": -0.64968,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
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
							"type": "object",
							"name": "Chara",
							"x": 1.3805466666666666,
							"y": -0.73588,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
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
						"emitRate": 2,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"lifeTime": 3,
						"emitType": "Burst",
						"maxCount": 1,
						"warmUpTime": -0.1
					},
					"z": -0.51961,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 7,
							"scaleY": 7,
							"scaleZ": 6,
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
											"keys": [
												{
													"time": -0.0031778692272519393,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.05,
													"value": 1,
													"mode": 2
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.34509803921568627,
											0.2392156862745098
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.9138575870717927,
														"dt": -0.24282146558931608
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 0.05
													}
												},
												{
													"time": 0.09999999999999999,
													"value": 1.1,
													"mode": 0
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 2
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
						},
						{
							"type": "curve",
							"name": "instStretch.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7385318515164809,
										"dt": -0.0730416116884432
									},
									"nextHandle": {
										"dv": 1.0616666666666668,
										"dt": 0.105
									}
								},
								{
									"time": 0.69,
									"value": 1,
									"mode": 0,
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
						},
						{
							"type": "curve",
							"name": "instStretch.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7385318515164809,
										"dt": -0.0730416116884432
									},
									"nextHandle": {
										"dv": 1.0616666666666668,
										"dt": 0.105
									}
								},
								{
									"time": 0.635,
									"value": 1,
									"mode": 0,
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
					"type": "object",
					"name": "Aura",
					"z": 1.47633,
					"scaleX": 5,
					"scaleY": 5,
					"visible": false,
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
						},
						{
							"type": "curve",
							"name": "scale.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -1.6829443834598456,
										"dt": -0.4315938015647023
									},
									"nextHandle": {
										"dv": 1.0333333333333334,
										"dt": 0.265
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.5,
								"saturation": 0,
								"width": 0.59,
								"useAlpha": false
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1073260768403417,
												"dt": -0.3737225509336153
											},
											"nextHandle": {
												"dv": -0.9333333333333333,
												"dt": 0.315
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
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"props": {
								"progress": 0.5,
								"saturation": 0,
								"width": 1,
								"useAlpha": false
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.018832091162487765,
												"dt": -0.49999202036403045
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 0.885
											}
										},
										{
											"time": 2,
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
					"name": "advancedDecal",
					"enabled": false,
					"scaleX": 15,
					"scaleY": 15,
					"scaleZ": 3,
					"albedoMap": "Fx/Alphas/T_LensFlare_03.png",
					"emissive": 10,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
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
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									1,
									0.39215686274509803,
									0.11764705882352941
								]
							}
						},
						{
							"type": "shader",
							"name": "Dissolve",
							"source": "shaders/Dissolve.hx",
							"enabled": false,
							"props": {
								"progress": 0.09,
								"saturation": 1,
								"width": 1,
								"useAlpha": false
							},
							"children": [
								{
									"type": "curve",
									"name": "progress",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.018832091162487765,
												"dt": -0.49999202036403045
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 0.885
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
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 2.3899830627147685,
										"dt": -0.3485391966459039
									},
									"nextHandle": {
										"dv": -1.2,
										"dt": 0.175
									}
								},
								{
									"time": 0.32,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort_Chockwave",
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 0.5,
						"alignMode": "Screen",
						"instOffset": [
							0,
							0,
							1
						],
						"lifeTime": 2
					},
					"z": 2.45868,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.05,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/DiskFlat.fbx",
							"scaleX": 20,
							"scaleY": 20,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "-100",
											"emissive": 2.2
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/water-normal.png",
										"intensity": 0.015
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.5,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
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
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
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
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0.0402048299726524,
									"mode": 0,
									"prevHandle": {
										"dv": -0.9239350146379692,
										"dt": -0.3456633226416698
									},
									"nextHandle": {
										"dv": 0.12028199966650588,
										"dt": 0.045000000000000005
									}
								},
								{
									"time": 1,
									"value": 1.0158254939343108,
									"mode": 0,
									"prevHandle": {
										"dv": -0.026729333259223442,
										"dt": -0.865
									},
									"nextHandle": {
										"dv": 0.0103433736750329,
										"dt": 0.33472657705803693
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
						"lifeTime": 0.7,
						"emitType": "Burst",
						"alignMode": "Screen",
						"instScale": 20
					},
					"z": 2.18658,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
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
											"emissive": 1
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle.png"
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
											0.5450980392156862,
											0.38431372549019605
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 2
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0.9676859950268468,
										"dt": -0.4784669642077186
									},
									"nextHandle": {
										"dv": -0.9,
										"dt": 0.445
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
				}
			]
		}
	]
}