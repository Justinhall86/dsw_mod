{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
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
			"scaleX": 1.58,
			"scaleY": 1.58,
			"scaleZ": 1.58,
			"children": [
				{
					"type": "model",
					"name": "DroneA",
					"source": "Vehicle/Atreide/DroneA/DroneA.fbx",
					"enabled": false,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneA/Anim_DroneA_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "TEST",
					"scaleX": 1.55,
					"scaleY": 1.55,
					"scaleZ": 1.55,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_mask",
							"locked": true,
							"scaleX": 16.5,
							"scaleY": 16.5,
							"scaleZ": 20,
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
											"stencilValue": 4,
											"stencilReadMask": 4,
											"stencilWriteMask": 4,
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
									"name": "advancedDecal_border",
									"locked": true,
									"scaleX": 16.700000000000003,
									"scaleY": 16.700000000000003,
									"scaleZ": 20.000000000000004,
									"rotationZ": -52.27095572260782,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
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
													"stencilValue": 4,
													"stencilReadMask": 4,
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
									"type": "advancedDecal",
									"name": "advancedDecal_var",
									"locked": true,
									"scaleX": 16.700000000000006,
									"scaleY": 16.700000000000006,
									"scaleZ": 19.87,
									"rotationZ": -142.67482395117338,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
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
													"stencilValue": 4,
													"stencilReadMask": 4,
													"stencilWriteMask": 0,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
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
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 50,
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
												"amount": 0.6,
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
													"enabled": false,
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
									"type": "advancedDecal",
									"name": "advancedDecal_border",
									"enabled": false,
									"locked": true,
									"scaleX": 17.5,
									"scaleY": 17.5,
									"scaleZ": 21,
									"rotationZ": 6.625880244133378,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
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
													"stencilValue": 4,
													"stencilReadMask": 4,
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
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 0.5,
												"MULTIPLY": false,
												"color": [
													0.5490196078431373,
													1,
													0.6862745098039216,
													1
												],
												"mask": "Fx/Alphas/T_UI_Circle_DottedLines_512.png",
												"UVOffset": [
													0,
													0
												]
											}
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
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0.5,
										"maxAlpha": 1,
										"frequency": 0.125
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Floor",
					"z": 0.25,
					"scaleX": 0.49,
					"scaleY": 0.49,
					"scaleZ": 0.49,
					"children": [
						{
							"type": "polygon",
							"name": "partition",
							"z": 0.2,
							"scaleX": 29,
							"scaleY": 27.26,
							"scaleZ": 2.04,
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
											"emissive": 3,
											"stencilFailOp": "Keep",
											"depthFailOp": "Keep",
											"stencilPassOp": "Replace",
											"stencilCompare": "NotEqual",
											"stencilValue": 4,
											"stencilReadMask": 4,
											"stencilWriteMask": 0
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "AlphaKill",
											"source": "shaders/AlphaKill.hx",
											"enabled": false,
											"props": {
												"threshold": 0.05,
												"useRGB": false
											}
										}
									]
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
										"speed": 3,
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
										"progress": 0.82,
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
											0.05,
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
														"color": -7904513
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
										"scaleY": 5,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									}
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
						}
					]
				}
			]
		}
	]
}