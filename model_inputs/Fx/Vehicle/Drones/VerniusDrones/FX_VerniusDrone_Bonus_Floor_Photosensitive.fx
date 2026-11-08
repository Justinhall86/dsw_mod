{
	"type": "fx",
	"cullingRadius": 30,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 150,
			"scaleY": 150,
			"scaleZ": 150,
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
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
			"children": [
				{
					"type": "model",
					"name": "Railgun",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"enabled": false,
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Kraken/Anim_Kraken_Idle.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Floor",
					"z": 0.25,
					"scaleX": 0.12,
					"scaleY": 0.12,
					"scaleZ": 0.12,
					"children": [
						{
							"type": "polygon",
							"name": "partition",
							"z": 0.2,
							"scaleX": 26,
							"scaleY": 26,
							"scaleZ": 1.89,
							"kind": 1,
							"args": [
								48,
								360,
								0,
								4
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"emissive": 1,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "NotEqual",
											"stencilValue": 1,
											"stencilReadMask": 1,
											"stencilWriteMask": 0
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"useSourceUVs": false,
										"blendBetweenFrames": true,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
										"speed": 2,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.75,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 0.25,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -15007601
													},
													{
														"position": 0.5,
														"color": -7377665
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
									"name": "DissolveMap_IN",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.77,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -1
													},
													{
														"position": 0.75390625,
														"color": -16777216
													}
												],
												"resolution": 64,
												"isVertical": true,
												"interpolation": "Constant",
												"colorMode": 0
											}
										},
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 4,
										"scaleY": 3.5,
										"shiftX": 0.16,
										"shiftY": 0.11,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0001767901806794996,
									"value": 0,
									"prevHandle": {
										"dv": -3.100087368767569,
										"dt": -0.14429308231613439
									},
									"nextHandle": {
										"dv": 1,
										"dt": 0.046544843790482515
									}
								},
								{
									"time": 1.0001767901806737,
									"value": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.9017386631089813
									},
									"nextHandle": {
										"dv": -5.262223968825359e-16,
										"dt": 0.33333337795849743
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TEST",
					"scaleX": 0.32,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_mask",
							"locked": true,
							"scaleX": 16.2,
							"scaleY": 16.2,
							"scaleZ": 19.39,
							"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
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
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": true,
											"alphaKill": false,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "Always",
											"stencilValue": 1,
											"stencilReadMask": 1,
											"stencilWriteMask": 1,
											"emissive": 1,
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.002
											}
										},
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"props": {
												"threshold": 0.001,
												"useRGB": false
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "AoE",
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_border_DOTS",
									"locked": true,
									"scaleX": 17.5,
									"scaleY": 17.5,
									"scaleZ": 20.83,
									"rotationZ": -52.27095572260782,
									"albedoMap": "Fx/Alphas/T_UI_Circle_DottedLines_512.png",
									"emissive": 0.5,
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
													"culling": "Front",
													"depthTest": "Greater",
													"colorMask": 15,
													"enableStencil": true,
													"alphaKill": false,
													"stencilFailOp": "Keep",
													"depthFailOp": "Keep",
													"stencilPassOp": "Replace",
													"stencilCompare": "NotEqual",
													"stencilValue": 1,
													"stencilReadMask": 1,
													"stencilWriteMask": 0,
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.25779842717708584,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6745276791165088,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 10,
													"value": 1,
													"mode": 2
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
													0.3568627450980392,
													0.20392156862745098,
													0.615686274509804
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
													0.6862745098039216,
													0.5411764705882353,
													0.8392156862745098
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.050060820827633516,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5510841998220848,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3350000000000002
															},
															"nextHandle": {
																"dv": -1.8417475812501703e-16,
																"dt": 0.22558515433173873
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.75
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