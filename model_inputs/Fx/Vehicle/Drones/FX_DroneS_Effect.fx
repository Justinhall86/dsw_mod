{
	"type": "fx",
	"cullingRadius": 50,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
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
					"type": "model",
					"name": "DroneA",
					"source": "Vehicle/Atreide/DroneA/DroneA.fbx",
					"editorOnly": true,
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
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
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
											"stencilValue": 32,
											"stencilReadMask": 32,
											"stencilWriteMask": 32,
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
									"scaleZ": 19.87,
									"rotationZ": -154.4541911445216,
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
													"stencilValue": 32,
													"stencilReadMask": 32,
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
											"loop": true,
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
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.13333333333333333,
													0.39215686274509803,
													0.5372549019607843
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.5,
												"color": [
													0.592156862745098,
													0.9294117647058824,
													1
												]
											}
										}
									]
								},
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
													"stencilValue": 32,
													"stencilReadMask": 32,
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
											"loop": true,
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
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.13333333333333333,
													0.39215686274509803,
													0.5372549019607843
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
													0.592156862745098,
													0.9294117647058824,
													1
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
															"mode": 0,
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
									"name": "advancedDecal_Glow",
									"enabled": false,
									"locked": true,
									"scaleX": 0.4651162790697675,
									"scaleY": 0.4651162790697675,
									"scaleZ": 0.4651162790697675,
									"albedoMap": "Fx/Alphas/glow (129).png",
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
													"stencilValue": 64,
													"stencilReadMask": 64,
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
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -8240348
															},
															{
																"position": 1,
																"color": -15991
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
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -8248204
															},
															{
																"position": 1,
																"color": -15991
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
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
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
													0.1843137254901961,
													0.49019607843137253,
													0.21568627450980393
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
													0.09411764705882353,
													0.44313725490196076,
													0.24313725490196078
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.058823529411764705,
													0.3686274509803922,
													0.19215686274509802
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.5490196078431373,
													1,
													0.6862745098039216
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
															"mode": 0,
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
				}
			]
		}
	]
}