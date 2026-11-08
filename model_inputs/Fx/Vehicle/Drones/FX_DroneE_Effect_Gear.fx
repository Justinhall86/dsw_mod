{
	"type": "fx",
	"cullingRadius": 50,
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
					"name": "DroneE",
					"source": "Vehicle/Ecaz/DroneE/DroneE.fbx",
					"editorOnly": true,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneE/Anim_DroneE_Idle.fbx"
						},
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
					"type": "object",
					"name": "TEST",
					"scaleX": 3.4,
					"scaleY": 3.4,
					"scaleZ": 3.4,
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
											"stencilValue": 128,
											"stencilReadMask": 128,
											"stencilWriteMask": 128,
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
									"scaleX": 16.700000000000006,
									"scaleY": 16.700000000000006,
									"scaleZ": 20.000000000000007,
									"rotationZ": -97.77552722554609,
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
													"stencilValue": 128,
													"stencilReadMask": 128,
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.4114152237559542,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6714414348117468,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.0881706867511685,
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
											"name": "rotation:z",
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
													0.792156862745098,
													0.24705882352941178,
													0.40784313725490196
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
													0.9294117647058824,
													0.5098039215686274,
													0.7372549019607844
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
									"rotationZ": -42.00278036325497,
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
													"stencilValue": 128,
													"stencilReadMask": 128,
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
											"name": "rotation:z",
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
													0.792156862745098,
													0.24705882352941178,
													0.40784313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.3,
												"color": [
													0.9294117647058824,
													0.5098039215686274,
													0.7372549019607844
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
	]
}