{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Leto",
					"source": "Character/Atreide/Leader/Leto/Leto.fbx",
					"editorOnly": true,
					"x": -0.08,
					"y": 0.08,
					"rotationZ": 150
				},
				{
					"type": "light",
					"name": "Main_Light_0",
					"editorOnly": true,
					"x": 0.17659,
					"y": 3.74001,
					"z": 1.70564,
					"rotationX": 3,
					"rotationY": 12.8,
					"rotationZ": -93.1,
					"kind": "Spot",
					"color": 16772306,
					"power": 1.74,
					"range": 3.16,
					"zNear": 0.02,
					"angle": 39.43,
					"fallOff": 15.68,
					"shadows": {
						"mode": "Dynamic",
						"size": 2048,
						"radius": 0,
						"quality": 1,
						"bias": 0.001,
						"samplingMode": {
							"kind": "None"
						}
					}
				},
				{
					"type": "object",
					"name": "SandMEsh",
					"enabled": false,
					"x": -0.05878,
					"y": 0.39387,
					"z": 1.17518,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"rotationY": -17.840045638310716,
							"rotationZ": 36.46387872750811,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "SandSwoosh",
									"source": "Fx/UI/SandSwoosh.fbx",
									"enabled": false,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
													"textureWrap": true,
													"emissive": 1
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
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/TS_Dust_02_1024.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.4
												]
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
												"progress": 0.36,
												"saturation": 0.22,
												"width": 1,
												"uvScaleX": 2.5,
												"uvScaleY": 5,
												"texture": "Fx/Alphas/Dust03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 6,
												"texture": "Fx/noise/T_Noise_Dirt_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
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
												"shiftX": 0,
												"shiftY": 0,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.5
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
													0.7176470588235294,
													0.611764705882353,
													0.403921568627451
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": 4287252259
															},
															{
																"position": 0.578125,
																"color": 4290018879
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.5411764705882353,
													0.2784313725490196,
													0.13725490196078433
												],
												"pointA": 1,
												"colorB": [
													0.7058823529411764,
													0.49411764705882355,
													0.24705882352941178
												],
												"pointB": 0
											}
										}
									]
								},
								{
									"type": "model",
									"name": "SandSwoosh",
									"source": "Fx/UI/SandSwoosh.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
													"textureWrap": true
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
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/TS_Dust_02_1024.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.275,
															"value": -0.03333333333333333,
															"mode": 2
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0.5,
												"shiftSpeedX": 0,
												"shiftSpeedY": -0.4
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftSpeedY",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1.0666666666666667,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": -1.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.011904761904760308,
																"dt": -0.681111111111111
															},
															"nextHandle": {
																"dv": -0.011904761904760308,
																"dt": 0.681111111111111
															}
														},
														{
															"time": 3,
															"value": -1.25,
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
													0.7176470588235294,
													0.611764705882353,
													0.403921568627451
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": 4287252259
															},
															{
																"position": 0.578125,
																"color": 4290018879
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.5411764705882353,
													0.2784313725490196,
													0.13725490196078433
												],
												"pointA": 1,
												"colorB": [
													0.7058823529411764,
													0.49411764705882355,
													0.24705882352941178
												],
												"pointB": 0
											}
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
							}
						}
					]
				},
				{
					"type": "object",
					"name": "SandMEsh",
					"enabled": false,
					"x": -0.05878,
					"y": 0.39387,
					"z": 1.17518,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt",
							"rotationY": -17.840045638310716,
							"rotationZ": 36.46387872750811,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "SandSwoosh",
									"source": "Fx/UI/SandSwoosh.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
													"textureWrap": true,
													"emissive": 1
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
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/TS_Dust_02_1024.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.25,
												"uvScaleY": 3,
												"texture": "Fx/Alphas/Dust03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
															"time": 0.43,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.082155997157844e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.245
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0.22,
												"width": 1,
												"uvScaleX": 2.5,
												"uvScaleY": 5,
												"texture": "Fx/Alphas/Dust03.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
															"time": 0.43,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.082155997157844e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.245
															}
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
															"value": 1.9843398999600195,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07018770099514808,
																"dt": -0.5753869969311751
															},
															"nextHandle": {
																"dv": 0.07018770099514808,
																"dt": 0.5753869969311751
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0.12000000000000001,
															"value": 1.9843398999600195,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.45999999999999996
															}
														},
														{
															"time": 1.325,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.65
															},
															"nextHandle": {
																"dv": -9.323297467993942e-16,
																"dt": 0.5754848344552154
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 0
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0.74,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": -1.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03525641025640969,
																"dt": -0.5849999999999999
															},
															"nextHandle": {
																"dv": -0.028604487838585567,
																"dt": 0.4350742600248863
															}
														},
														{
															"time": 3,
															"value": -1.25,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.022454687251498025,
																"dt": -0.4999910361333458
															},
															"nextHandle": {
																"dv": -0.03750000000000009,
																"dt": 0.835
															}
														},
														{
															"time": 1.5,
															"value": -1.25,
															"mode": 0,
															"prevHandle": {
																"dv": -0.03749999999999987,
																"dt": -1.005
															},
															"nextHandle": {
																"dv": 0.016234537011957904,
																"dt": 0.43508559192046387
															}
														},
														{
															"time": 3,
															"value": -1.25,
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
													0.7176470588235294,
													0.611764705882353,
													0.403921568627451
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.5411764705882353,
													0.2784313725490196,
													0.13725490196078433
												],
												"pointA": 1,
												"colorB": [
													0.7058823529411764,
													0.49411764705882355,
													0.24705882352941178
												],
												"pointB": 0
											}
										}
									]
								},
								{
									"type": "model",
									"name": "SandSwoosh",
									"source": "Fx/UI/SandSwoosh.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
													"textureWrap": true
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
												"alpha": 5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01u_A.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.007002739307119792,
																"dt": -0.49999558652831894
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 1.19
															}
														},
														{
															"time": 1.515,
															"value": 0.1,
															"mode": 2
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
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/TS_Dust_02_1024.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"loop": true,
													"keys": [
														{
															"time": 0.105,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.97,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0011111111111110628,
																"dt": -0.845
															},
															"nextHandle": {
																"dv": -4.850962043289239e-16,
																"dt": 0.5750000000000001
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.012389767304249124,
																"dt": -0.4999870612133972
															},
															"nextHandle": {
																"dv": -0.01388888888888884,
																"dt": 0.695
															}
														},
														{
															"time": 1.275,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.425
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.5750000000000001
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
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
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
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
															"value": 1.9843398999600195,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.07018770099514808,
																"dt": -0.5753869969311751
															},
															"nextHandle": {
																"dv": 0.07018770099514808,
																"dt": 0.5753869969311751
															}
														},
														{
															"time": 3,
															"value": 0,
															"mode": 0
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
												"scaleX": 1,
												"scaleY": 1,
												"shiftX": 0,
												"shiftY": 0.74,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "shiftSpeedY",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1.0666666666666667,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftY",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5,
															"value": -1.25,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03525641025640969,
																"dt": -0.5849999999999999
															},
															"nextHandle": {
																"dv": -0.028604487838585567,
																"dt": 0.4350742600248863
															}
														},
														{
															"time": 3,
															"value": -1.25,
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
													0.7176470588235294,
													0.611764705882353,
													0.403921568627451
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": 4287252259
															},
															{
																"position": 0.578125,
																"color": 4290018879
															}
														],
														"resolution": 64
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.5411764705882353,
													0.2784313725490196,
													0.13725490196078433
												],
												"pointA": 1,
												"colorB": [
													0.7058823529411764,
													0.49411764705882355,
													0.24705882352941178
												],
												"pointB": 0
											}
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
							}
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"x": -1.01367,
					"y": 0.49715,
					"z": 1.06105,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "emitter",
							"name": "Dust",
							"enabled": false,
							"props": {
								"lifeTime": 1.3,
								"lifeTimeRand": 0.3,
								"emitShape": "Box",
								"alignMode": "Screen",
								"instScale": 0.015,
								"instScale_rand": 0.006,
								"emitRate": 10,
								"useRandomColor": true,
								"randomColor1": [
									0.5411764705882353,
									0.2784313725490196,
									0.13725490196078433,
									1
								],
								"randomColor2": [
									0.7058823529411764,
									0.49411764705882355,
									0.24705882352941178,
									1
								],
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_DustParticles02.png",
								"maxCount": 500,
								"emitType": "Burst",
								"warmUpTime": -0.4,
								"burstCount": 50,
								"burstDelay": 3.5,
								"burstParticleCount": 100,
								"instSpeed": [
									2.75,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"instOrbitSpeed": [
									0,
									0.5,
									0
								],
								"instOrbitSpeed_rand": [
									0,
									0.1,
									0
								]
							},
							"x": -1.15632,
							"y": -0.04214,
							"z": -0.17782,
							"scaleX": 0.5,
							"scaleY": 0.49999999999999994,
							"scaleZ": 0.5,
							"rotationX": 19.1,
							"rotationZ": -32.4,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
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
													"emissive": 5
												}
											},
											"wrapRepeat": true
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
												"texture": "Fx/Gradients/circGrad3.jpg"
											},
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
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.021141569488091712,
																"dt": -0.3657388291120098
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.2909484863281251
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.40126831054687495
															},
															"nextHandle": {
																"dv": 0.006935225059997804,
																"dt": 0.16663334333000118
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
															"time": 0.3584606933593751,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.13
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.12
															}
														},
														{
															"time": 0.75,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
											"props": {
												"alpha": 1
											},
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
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.2680969238281252,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3383333333333333
											}
										},
										{
											"time": 1,
											"value": 0.4,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 3.927867650985719,
											"mode": 2
										},
										{
											"time": 0.15999999999999998,
											"value": -1.1825838088989262,
											"mode": 2
										},
										{
											"time": 0.48500000000000004,
											"value": 0.6335270404815676,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.x",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": -3.4792725272875824,
											"mode": 2
										},
										{
											"time": 0.19828002929687505,
											"value": 3.392290714105393,
											"mode": 0,
											"prevHandle": {
												"dv": 0.028375495780028077,
												"dt": -0.06270560142443493
											},
											"nextHandle": {
												"dv": -0.08698181318218978,
												"dt": 0.19221679687500004
											}
										},
										{
											"time": 1,
											"value": -1.9135998900081705,
											"mode": 0,
											"prevHandle": {
												"dv": 0.05414549454248352,
												"dt": -0.90583740234375
											},
											"nextHandle": {
												"dv": -0.05414549454248352,
												"dt": 0.90583740234375
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust",
							"enabled": false,
							"props": {
								"lifeTimeRand": 0.75,
								"emitShape": "Box",
								"alignMode": "Screen",
								"instScale": 0.015,
								"instScale_rand": 0.006,
								"emitRate": 10,
								"useRandomColor": true,
								"randomColor1": [
									0.5411764705882353,
									0.2784313725490196,
									0.13725490196078433,
									1
								],
								"randomColor2": [
									0.7058823529411764,
									0.49411764705882355,
									0.24705882352941178,
									1
								],
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_DustParticles02.png",
								"maxCount": 500,
								"emitType": "Burst",
								"warmUpTime": -0.8,
								"burstCount": 50,
								"burstDelay": 3.5,
								"burstParticleCount": 30,
								"instSpeed": [
									2.75,
									0,
									0
								],
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"instOrbitSpeed": [
									0,
									0.5,
									0
								],
								"instOrbitSpeed_rand": [
									0,
									0.1,
									0
								]
							},
							"x": -1.27228,
							"y": -0.04812,
							"z": 0.01622,
							"scaleX": 0.5,
							"scaleY": 0.49999999999999994,
							"scaleZ": 0.5,
							"rotationX": 19.1,
							"rotationZ": -32.4,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
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
													"emissive": 5
												}
											},
											"wrapRepeat": true
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
												"texture": "Fx/Gradients/circGrad3.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
															"time": 0.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.021141569488091712,
																"dt": -0.3657388291120098
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.2909484863281251
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.40126831054687495
															},
															"nextHandle": {
																"dv": 0.006935225059997804,
																"dt": 0.16663334333000118
															}
														}
													]
												},
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
																"dv": 0.07980207779095738,
																"dt": -0.49852724275079074
															},
															"nextHandle": {
																"dv": -0.050000000000000044,
																"dt": 0.3123522949218751
															}
														},
														{
															"time": 0.4244787597656252,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.41646972656250003
															},
															"nextHandle": {
																"dv": 0.023278495328563485,
																"dt": 0.2908436575281997
															}
														},
														{
															"time": 0.8089123535156253,
															"value": 0.016666666666666663,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
											"props": {
												"alpha": 1
											},
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
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16666666666666666
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.2680969238281252,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3383333333333333
											}
										},
										{
											"time": 1,
											"value": 0.4,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 3.927867650985719,
											"mode": 2
										},
										{
											"time": 0.15999999999999998,
											"value": -1.1825838088989262,
											"mode": 2
										},
										{
											"time": 0.48500000000000004,
											"value": 0.6335270404815676,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									}
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.x",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": -3.4792725272875824,
											"mode": 2
										},
										{
											"time": 0.19828002929687505,
											"value": 3.392290714105393,
											"mode": 0,
											"prevHandle": {
												"dv": 0.028375495780028077,
												"dt": -0.06270560142443493
											},
											"nextHandle": {
												"dv": -0.08698181318218978,
												"dt": 0.19221679687500004
											}
										},
										{
											"time": 1,
											"value": -1.9135998900081705,
											"mode": 0,
											"prevHandle": {
												"dv": 0.05414549454248352,
												"dt": -0.90583740234375
											},
											"nextHandle": {
												"dv": -0.05414549454248352,
												"dt": 0.90583740234375
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SandMEsh",
							"enabled": false,
							"x": 1.2433899999999998,
							"y": 0.0025900000000000367,
							"z": 0.13949499999999992,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -17.840045638310716,
									"rotationZ": 36.46387872750811,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1.5,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.18,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 5,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.1666666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"alphaKill": false,
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44706363959092527,
																		"dt": -0.43935220941158515
																	},
																	"nextHandle": {
																		"dv": -1.035,
																		"dt": 1.015201416015625
																	}
																},
																{
																	"time": 1.515,
																	"value": 0.1,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.7669213867187501,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.8092248535156257,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0011111111111110628,
																		"dt": -0.845
																	},
																	"nextHandle": {
																		"dv": -4.850962043289239e-16,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012389767304249124,
																		"dt": -0.4999870612133972
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.695
																	}
																},
																{
																	"time": 1.275,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.425
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.9843398999600195,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07018770099514808,
																		"dt": -0.5753869969311751
																	},
																	"nextHandle": {
																		"dv": 0.07018770099514808,
																		"dt": 0.5753869969311751
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftSpeedY",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.0666666666666667,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03525641025640969,
																		"dt": -0.5849999999999999
																	},
																	"nextHandle": {
																		"dv": -0.028604487838585567,
																		"dt": 0.4350742600248863
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
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
															0.7019607843137254,
															0.6509803921568628,
															0.5490196078431373
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": 4287252259
																	},
																	{
																		"position": 0.578125,
																		"color": 4290018879
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4392156862745098,
															0.21568627450980393,
															0.09803921568627451
														],
														"pointA": 0,
														"colorB": [
															0.44313725490196076,
															0.34509803921568627,
															0.24705882352941178
														],
														"pointB": 0.43
													}
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
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SandMEsh",
							"x": 1.2433899999999998,
							"y": 0.0025900000000000367,
							"z": 0.13949499999999992,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -17.840045638310716,
									"rotationZ": 36.46387872750811,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 5,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 10,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.1666666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"alphaKill": false,
															"textureWrap": true
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
														"alpha": 5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44706363959092527,
																		"dt": -0.43935220941158515
																	},
																	"nextHandle": {
																		"dv": -1.035,
																		"dt": 1.015201416015625
																	}
																},
																{
																	"time": 1.515,
																	"value": 0.1,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.8809936523437502,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.8092248535156257,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0011111111111110628,
																		"dt": -0.845
																	},
																	"nextHandle": {
																		"dv": -4.850962043289239e-16,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012389767304249124,
																		"dt": -0.4999870612133972
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.695
																	}
																},
																{
																	"time": 1.275,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.425
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.9843398999600195,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07018770099514808,
																		"dt": -0.5753869969311751
																	},
																	"nextHandle": {
																		"dv": 0.07018770099514808,
																		"dt": 0.5753869969311751
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftSpeedY",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.0666666666666667,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03525641025640969,
																		"dt": -0.5849999999999999
																	},
																	"nextHandle": {
																		"dv": -0.028604487838585567,
																		"dt": 0.4350742600248863
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
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
															0.7019607843137254,
															0.6509803921568628,
															0.5490196078431373
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": 4287252259
																	},
																	{
																		"position": 0.578125,
																		"color": 4290018879
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4392156862745098,
															0.21568627450980393,
															0.09803921568627451
														],
														"pointA": 0,
														"colorB": [
															0.44313725490196076,
															0.34509803921568627,
															0.24705882352941178
														],
														"pointB": 0.43
													}
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
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SandMEsh",
							"enabled": false,
							"x": 1.2433899999999998,
							"y": 0.0025900000000000367,
							"z": 0.13949499999999992,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -17.840045638310716,
									"rotationZ": 36.46387872750811,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2173730468750001,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7608756510416667
																	}
																},
																{
																	"time": 2.1384118652343758,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 2.5,
														"uvScaleY": 5,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.4485058593750001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.0583146133120103,
																		"dt": -0.9301843261718761
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5274597167968742
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.7999999999999998,
																		"dt": -1.071337890625001
																	},
																	"nextHandle": {
																		"dv": -0.03749999999999987,
																		"dt": 0.4583874511718746
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2173730468750001,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.7608756510416667
																	}
																},
																{
																	"time": 2.1384118652343758,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0.22,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 10,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.1666666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.4485058593750001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.0583146133120103,
																		"dt": -0.9301843261718761
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5274597167968742
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 2.8338340604618155,
																		"dt": -0.32746526920892094
																	},
																	"nextHandle": {
																		"dv": -2.8125,
																		"dt": 0.325
																	}
																},
																{
																	"time": 1.5,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03525641025640969,
																		"dt": -0.5849999999999999
																	},
																	"nextHandle": {
																		"dv": -0.028604487838585567,
																		"dt": 0.4350742600248863
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.7999999999999998,
																		"dt": -1.071337890625001
																	},
																	"nextHandle": {
																		"dv": -0.03749999999999987,
																		"dt": 0.4583874511718746
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"enabled": false,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
															"alphaKill": false,
															"textureWrap": true
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44706363959092527,
																		"dt": -0.43935220941158515
																	},
																	"nextHandle": {
																		"dv": -1.035,
																		"dt": 1.015201416015625
																	}
																},
																{
																	"time": 1.515,
																	"value": 0.1,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0.7669213867187501,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.8092248535156257,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0011111111111110628,
																		"dt": -0.845
																	},
																	"nextHandle": {
																		"dv": -4.850962043289239e-16,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012389767304249124,
																		"dt": -0.4999870612133972
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.695
																	}
																},
																{
																	"time": 1.275,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.425
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0.4485058593750001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.0583146133120103,
																		"dt": -0.9301843261718761
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5274597167968742
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.7999999999999998,
																		"dt": -1.071337890625001
																	},
																	"nextHandle": {
																		"dv": -0.03749999999999987,
																		"dt": 0.4583874511718746
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 1,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 1.7999999999999998,
																		"dt": -1.071337890625001
																	},
																	"nextHandle": {
																		"dv": -0.03749999999999987,
																		"dt": 0.4583874511718746
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
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
															0.7019607843137254,
															0.6509803921568628,
															0.5490196078431373
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"enabled": false,
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": 4287252259
																	},
																	{
																		"position": 0.578125,
																		"color": 4290018879
																	}
																],
																"resolution": 64
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4392156862745098,
															0.21568627450980393,
															0.09803921568627451
														],
														"pointA": 0,
														"colorB": [
															0.44313725490196076,
															0.34509803921568627,
															0.24705882352941178
														],
														"pointB": 0.43
													}
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
									}
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
									1,
									0.01568627450980392,
									0.01568627450980392
								]
							}
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"x": -1.44389,
					"scaleX": 50,
					"scaleY": 50,
					"scaleZ": 50,
					"rotationX": 89.99999999999999,
					"rotationZ": 89.99999999999999,
					"color": -16777216,
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
									"colorMask": 255
								}
							},
							"color": [
								0,
								0,
								0,
								1
							]
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"x": -1.01367,
					"y": 0.41854,
					"z": 1.06105,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "object",
							"name": "SandMEsh",
							"x": 1.2433899999999998,
							"y": 0.0025900000000000367,
							"z": 0.13949499999999992,
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -17.840045638310716,
									"rotationZ": 36.46387872750811,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "AfterTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"textureWrap": true,
															"emissive": 4
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0.5,
														"width": 0.92,
														"uvScaleX": 5,
														"uvScaleY": 10,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.6509803921568628,
															0.30196078431372547,
															0.11764705882352941
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
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
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "AfterTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"textureWrap": true
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Gradients/Cyl05u_A.jpg"
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_02_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.45,
														"saturation": 0.42,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 10,
														"texture": "Fx/Alphas/Dust03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
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
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.1666666666666667
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 1.1666666666666667
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.12000000000000001,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7176470588235294,
															0.611764705882353,
															0.403921568627451
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.5411764705882353,
															0.2784313725490196,
															0.13725490196078433
														],
														"pointA": 1,
														"colorB": [
															0.7058823529411764,
															0.49411764705882355,
															0.24705882352941178
														],
														"pointB": 0
													}
												}
											]
										},
										{
											"type": "model",
											"name": "SandSwoosh",
											"source": "Fx/UI/SandSwoosh.fbx",
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "AfterTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"alphaKill": false,
															"textureWrap": true
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.44706363959092527,
																		"dt": -0.43935220941158515
																	},
																	"nextHandle": {
																		"dv": -1.035,
																		"dt": 1.015201416015625
																	}
																},
																{
																	"time": 1.515,
																	"value": 0.1,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.27,
														"saturation": 0,
														"width": 0.73,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/TS_Dust_01_1024.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.8809936523437502,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.8092248535156257,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0011111111111110628,
																		"dt": -0.845
																	},
																	"nextHandle": {
																		"dv": -4.850962043289239e-16,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3.5,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.012389767304249124,
																		"dt": -0.4999870612133972
																	},
																	"nextHandle": {
																		"dv": -0.01388888888888884,
																		"dt": 0.695
																	}
																},
																{
																	"time": 1.275,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.425
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.5750000000000001
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
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
														"useScale": false,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.9843398999600195,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.07018770099514808,
																		"dt": -0.5753869969311751
																	},
																	"nextHandle": {
																		"dv": 0.07018770099514808,
																		"dt": 0.5753869969311751
																	}
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.20022583007812503,
																	"value": 1.9843398999600195,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.45999999999999996
																	}
																},
																{
																	"time": 2.4839367675781263,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03307233166600032,
																		"dt": -1.5
																	},
																	"nextHandle": {
																		"dv": -0.012688346385286826,
																		"dt": 0.5754816373438887
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": 0,
																	"mode": 0
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
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0.74,
														"shiftSpeedX": 0,
														"shiftSpeedY": 0
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "shiftSpeedY",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1.0666666666666667,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.5,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03525641025640969,
																		"dt": -0.5849999999999999
																	},
																	"nextHandle": {
																		"dv": -0.028604487838585567,
																		"dt": 0.4350742600248863
																	}
																},
																{
																	"time": 3,
																	"value": -1.25,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "shiftY",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.022454687251498025,
																		"dt": -0.4999910361333458
																	},
																	"nextHandle": {
																		"dv": -0.03750000000000009,
																		"dt": 0.835
																	}
																},
																{
																	"time": 2.488936767578126,
																	"value": -1.25,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -1.3450000000000002
																	},
																	"nextHandle": {
																		"dv": -7.992491575198273e-16,
																		"dt": 0.435090976476535
																	}
																},
																{
																	"time": 3.498936767578126,
																	"value": -1.25,
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
															0.7019607843137254,
															0.6509803921568628,
															0.5490196078431373
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorMap",
													"source": "shaders/ColorMap.hx",
													"props": {
														"USE_ALPHA": true,
														"colorA": [
															0.4392156862745098,
															0.21568627450980393,
															0.09803921568627451
														],
														"pointA": 0,
														"colorB": [
															0.44313725490196076,
															0.34509803921568627,
															0.24705882352941178
														],
														"pointB": 0.43
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.45
													}
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
										"alpha": 0.85
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