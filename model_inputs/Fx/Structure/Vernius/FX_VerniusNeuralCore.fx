{
	"type": "fx",
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
			"scaleX": 70,
			"scaleY": 70,
			"scaleZ": 70,
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
			"scaleX": 4,
			"scaleY": 4,
			"scaleZ": 4,
			"children": [
				{
					"type": "reference",
					"name": "Prefab_VerniusNeuralCore",
					"source": "Structure/Village/Tiles/Model/Vernius/Prefab_VerniusNeuralCore.prefab",
					"editorOnly": true
				},
				{
					"type": "object",
					"name": "Pivot",
					"enabled": false,
					"z": 3.59982,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"x": 4.91012,
							"scaleX": 10,
							"kind": 0,
							"args": [
								10
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
											"emissive": 10
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
										"blendBetweenFrames": false,
										"startFrame": 0,
										"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
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
											0.5686274509803921,
											0.47058823529411764,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 3,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 0.5,
										"texScaleY": 1,
										"tex": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.16796875,
														"color": -4539718
													},
													{
														"position": 0.3359375,
														"color": -1
													},
													{
														"position": 1,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										},
										"intensity": 5,
										"scrollSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.74,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
										"uvShift": [
											-0.01,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											-0.01,
											0
										],
										"uvShiftSpeed": [
											-1,
											0
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": 4.91012,
							"scaleX": 10,
							"scaleY": 0.5,
							"kind": 0,
							"args": [
								10
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.15,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl03u_A.jpg"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.4235294117647059,
											0.2901960784313725,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 3,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 0.5,
										"texScaleY": 1,
										"tex": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.16796875,
														"color": -4539718
													},
													{
														"position": 0.3359375,
														"color": -1
													},
													{
														"position": 1,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										},
										"intensity": 5,
										"scrollSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.74,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
										"uvShift": [
											-0.01,
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
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Fire.png",
										"directionalNoise": false,
										"intensity": 0.63,
										"scrollSpeed": [
											-1,
											0
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "polygon",
							"x": 4.91012,
							"scaleX": 10,
							"scaleY": 0.15,
							"kind": 0,
							"args": [
								10
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
											"emissive": 6
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl03u_A.jpg"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.4235294117647059,
											0.2901960784313725,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 3,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.05,
										"shiftSpeedY": 0
									}
								},
								{
									"type": "shader",
									"name": "VertexDisplacement",
									"source": "shaders/VertexDisplacement.hx",
									"enabled": false,
									"props": {
										"X": true,
										"Y": true,
										"Z": true,
										"texScaleX": 0.5,
										"texScaleY": 1,
										"tex": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -16777216
													},
													{
														"position": 0.16796875,
														"color": -4539718
													},
													{
														"position": 0.3359375,
														"color": -1
													},
													{
														"position": 1,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										},
										"intensity": 5,
										"scrollSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.74,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
										"uvShift": [
											-0.01,
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
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Fire.png",
										"directionalNoise": false,
										"intensity": 0.63,
										"scrollSpeed": [
											-1,
											0
										],
										"scale": [
											1,
											0.5
										]
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Pivot",
					"z": 3.59982,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"y": -4.98232,
							"rotationY": -62.81906648774097,
							"target": "camera",
							"lockAxis": [
								0,
								1,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 10,
									"scaleY": 0.15,
									"rotationX": 90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										10
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
													"emissive": 6
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl03u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4235294117647059,
													0.2901960784313725,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 3,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.05,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.74,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
												"uvShift": [
													-0.01,
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
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.63,
												"scrollSpeed": [
													-1,
													0
												],
												"scale": [
													1,
													0.5
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 10,
									"scaleY": 0.5,
									"rotationX": 90,
									"rotationZ": -90,
									"kind": 0,
									"args": [
										10
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl03u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4235294117647059,
													0.2901960784313725,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 3,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.05,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.74,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
												"uvShift": [
													-0.01,
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
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.63,
												"scrollSpeed": [
													-1,
													0
												],
												"scale": [
													1,
													0.5
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
										"uvShift": [
											-0.01,
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.46504063760080505,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6678281159994215,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.1635565926219277
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.5
													}
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygonElec",
									"y": 8.881784197001252e-16,
									"z": -8.881784197001252e-16,
									"scaleX": 10,
									"rotationX": 89.99999999999999,
									"rotationY": 7.352732281927438e-15,
									"rotationZ": -89.99999999999999,
									"kind": 0,
									"args": [
										10
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
													"emissive": 10
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
												"blendBetweenFrames": false,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
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
													0.5686274509803921,
													0.47058823529411764,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 3,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": -0.05,
												"shiftSpeedY": 0
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.74,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
												"uvShift": [
													-0.01,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													-0.01,
													0
												],
												"uvShiftSpeed": [
													-1,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad.png",
												"uvShift": [
													-0.01,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4703766769668404,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0113148737571431,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.015828068999619305,
																"dt": -0.2721380076678208
															},
															"nextHandle": {
																"dv": 0.0161672128995334,
																"dt": 0.2063853520171111
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
				},
				{
					"type": "object",
					"name": "NeuralCore",
					"enabled": false,
					"x": 0.09,
					"y": 0.09,
					"z": 3.02475,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "object",
							"name": "PIVOT test",
							"enabled": false,
							"x": -0.40056,
							"y": -0.69269,
							"z": 2.79301,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"rotationZ": 35.6,
							"children": [
								{
									"type": "object",
									"name": "Pivot",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationZ": -72.4,
									"children": [
										{
											"type": "object",
											"name": "group",
											"x": 4.62951,
											"y": -2.12987,
											"rotationZ": 64.7,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"rotationY": -72.78028595801756,
													"target": "camera",
													"lockAxis": [
														0,
														1,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 10,
															"scaleY": 0.15,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 6
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
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 1,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
																	}
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4235294117647059,
																			0.2901960784313725,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
																	}
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"scaleX": 10,
															"scaleY": 0.5,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
																	}
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.4235294117647059,
																			0.2901960784313725,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
																	}
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	-0.01,
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.46504063760080505,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6678281159994215,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.1635565926219277
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygonElec",
															"y": 8.881784197001252e-16,
															"z": -8.881784197001252e-16,
															"scaleX": 10,
															"rotationX": 89.99999999999999,
															"rotationY": 7.352732281927438e-15,
															"rotationZ": -89.99999999999999,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 10
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
																		"blendBetweenFrames": false,
																		"startFrame": 0,
																		"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
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
																			0.5686274509803921,
																			0.47058823529411764,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
																	}
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.33,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 2,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/T_Fire.png",
																		"uvShift": [
																			-0.01,
																			0
																		],
																		"uvShiftSpeed": [
																			-1,
																			0
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "DissolveMap",
																	"source": "shaders/DissolveMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"useScale": false,
																		"wrap": true,
																		"progress": 0.5,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
																		"uvShift": [
																			-0.01,
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
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0.4703766769668404,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.0113148737571431,
																					"value": 1,
																					"mode": 0,
																					"prevHandle": {
																						"dv": -0.015828068999619305,
																						"dt": -0.2721380076678208
																					},
																					"nextHandle": {
																						"dv": 0.0161672128995334,
																						"dt": 0.2063853520171111
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
									]
								}
							]
						},
						{
							"type": "object",
							"name": "AnglesTes",
							"x": -0.37667600000000007,
							"y": -0.6568660000000001,
							"z": -0.0816359999999996,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAtTOP",
									"x": -0.000844999999999943,
									"y": 0.10439350000000014,
									"z": 2.9387149999999984,
									"scaleX": 0.3999999999999998,
									"scaleY": 0.39999999999999986,
									"scaleZ": 0.4,
									"rotationX": 1.7265686822206922e-15,
									"rotationY": -22.918118016649945,
									"rotationZ": 106.3532810860939,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"x": -0.5,
											"y": -3.3306690738754696e-16,
											"z": -7.105427357601002e-15,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationX": -89.99999999999999,
											"rotationY": -1.5687009724754765e-15,
											"rotationZ": -89.99999999999999,
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
															"emissive": 5,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
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
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12844844
																	},
																	{
																		"position": 1,
																		"color": -3689985
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
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.5,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"x": -0.3351192230682116,
											"y": -0.06322503364348797,
											"z": 0.039341874014105827,
											"scaleX": 10,
											"scaleY": 10,
											"scaleZ": 10,
											"rotationY": 90,
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
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12444212
																	},
																	{
																		"position": 0.5234375,
																		"color": -8008705
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
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -18584
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
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.16842082345378787,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03467354713704517,
														"dt": -0.4999305700197999
													},
													"nextHandle": {
														"dv": 0.009002752680527859,
														"dt": 0.2596072020860385
													}
												},
												{
													"time": 0.44348946481084695,
													"value": 0.9732427100774028,
													"mode": 1,
													"prevHandle": {
														"dv": -0.19578934715290008,
														"dt": -0.04207741029837353
													},
													"nextHandle": {
														"dv": 1.4296492847548923,
														"dt": 0.008121495161251935
													}
												},
												{
													"time": 0.7829338370410712,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.00022767763793574147,
														"dt": -0.2565051722404734
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.723751679693135
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "BOTTOMangles",
									"x": -1.0297099999999997,
									"y": 0.011143000000000125,
									"z": -0.8048624999999987,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"x": 3.4783399999999998,
											"y": -4.2433629999999996,
											"z": -0.12155750000000154,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -7.13181103689818e-15,
											"rotationY": -63.51475551917284,
											"rotationZ": -51.714549676227705,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
																	"emissive": 5,
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"texture": "Fx/Alphas/T_circle.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																	"emissive": 3
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
																"texture": "Fx/Alphas/T_circle2.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"name": "scale",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"x": 3.4616,
											"y": 4.144237,
											"z": 0.03873249999999828,
											"scaleX": 0.40000000000000013,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -5.493753210055895e-15,
											"rotationY": -54.623962302284305,
											"rotationZ": -64.05456229873921,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
																	"emissive": 5,
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"texture": "Fx/Alphas/T_circle.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																	"emissive": 3
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
																"texture": "Fx/Alphas/T_circle2.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"name": "scale",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "lookAt",
											"name": "lookAt",
											"x": -3.46997,
											"y": 0.049562999999999885,
											"z": 0.04141249999999985,
											"scaleX": 0.39999999999999997,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -5.3947187975957725e-15,
											"rotationY": -53.87362725061461,
											"rotationZ": -45.27997247203318,
											"target": "camera",
											"lockAxis": [
												0,
												0,
												0
											],
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.5,
													"y": -3.3306690738754696e-16,
													"z": -7.105427357601002e-15,
													"scaleX": 4,
													"scaleY": 4,
													"scaleZ": 4,
													"rotationX": -89.99999999999999,
													"rotationY": -1.5687009724754765e-15,
													"rotationZ": -89.99999999999999,
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
																	"emissive": 5,
																	"drawOrder": "100"
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
															"refMatLib": ""
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
																"texture": "Fx/Alphas/T_circle.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12844844
																			},
																			{
																				"position": 1,
																				"color": -3689985
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
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 2
															}
														}
													]
												},
												{
													"type": "polygon",
													"name": "polygon",
													"x": -0.3351192230682116,
													"y": -0.06322503364348797,
													"z": 0.039341874014105827,
													"scaleX": 10,
													"scaleY": 10,
													"scaleZ": 10,
													"rotationY": 90,
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
																	"emissive": 3
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
																"texture": "Fx/Alphas/T_circle2.png"
															}
														},
														{
															"type": "shader",
															"name": "GradientMap",
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 0.5234375,
																				"color": -8008705
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
															"source": "shaders/GradientMap.hx",
															"props": {
																"USE_ALPHA": true,
																"gradient": {
																	"type": "gradient",
																	"data": {
																		"stops": [
																			{
																				"position": 0,
																				"color": -12444212
																			},
																			{
																				"position": 1,
																				"color": -18584
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
															"name": "scale",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2,
																	"value": 0.5,
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
															"mode": 0,
															"prevHandle": {
																"dv": -0.049813649272402935,
																"dt": -0.4998283554580937
															},
															"nextHandle": {
																"dv": 0.015276566427900429,
																"dt": 0.20033429218980658
															}
														},
														{
															"time": 0.27506864135705916,
															"value": 0.9732427100774028,
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
							"name": "Prism",
							"x": 0.259079,
							"y": 0.44985149999999996,
							"z": -0.9037910000000018,
							"children": [
								{
									"type": "model",
									"name": "V_Prism01_fond",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Alphas/Prism02_glow02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.16842082345378787,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.03467354713704517,
																"dt": -0.4999305700197999
															},
															"nextHandle": {
																"dv": 0.009002752680527859,
																"dt": 0.2596072020860385
															}
														},
														{
															"time": 0.44348946481084695,
															"value": 0.9732427100774028,
															"mode": 1,
															"prevHandle": {
																"dv": -0.19578934715290008,
																"dt": -0.04207741029837353
															},
															"nextHandle": {
																"dv": 1.4296492847548923,
																"dt": 0.008121495161251935
															}
														},
														{
															"time": 0.7829338370410712,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.00022767763793574147,
																"dt": -0.2565051722404734
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.723751679693135
															}
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
													0.4235294117647059,
													0.2901960784313725,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": false,
												"bias": 0.24,
												"scale": 1,
												"power": 1,
												"color": [
													0,
													0,
													0
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
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 6
											}
										}
									]
								},
								{
									"type": "model",
									"name": "V_Prism01_Border",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 6
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Prism03_glow.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4235294117647059,
													0.2901960784313725,
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
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle2.png",
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21017087481060592,
															"value": 0.6228137478132951,
															"mode": 0,
															"prevHandle": {
																"dv": 2.5367451022791095e-17,
																"dt": -0.13790104535590952
															},
															"nextHandle": {
																"dv": 0.0026352221049604774,
																"dt": 0.19448638297902832
															}
														},
														{
															"time": 0.6715106669934173,
															"value": 1,
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
									"name": "V_Prism01_Bordermove",
									"source": "Fx/Meshes_Common/V_Prism01.fbx",
									"rotationZ": 59.99999999999999,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": true,
													"culling": "None",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/Prism02.png"
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
												"progress": 0.27,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.25,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle2.png",
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21017087481060592,
															"value": 0.6228137478132951,
															"mode": 0,
															"prevHandle": {
																"dv": 2.5367451022791095e-17,
																"dt": -0.13790104535590952
															},
															"nextHandle": {
																"dv": 0.0026352221049604774,
																"dt": 0.19448638297902832
															}
														},
														{
															"time": 0.6715106669934173,
															"value": 1,
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
				}
			]
		}
	]
}