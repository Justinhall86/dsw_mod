{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "Slashes",
			"children": [
				{
					"type": "polygon",
					"name": "Slash",
					"scaleX": 4.2,
					"scaleY": 4.2,
					"scaleZ": 4.2,
					"rotationX": 54.4,
					"rotationY": -23.300000000000004,
					"rotationZ": 6.400000000000001,
					"kind": 1,
					"args": [
						24,
						229.09,
						0.57,
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
									"culling": "None",
									"colorMask": 255
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square02.jpg",
								"onDecal": false
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
									1,
									1,
									1
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": true
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
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.056896387643721624,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.0772718818968174,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
								"useSourceUVs": false,
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
									1,
									0
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
									"keyMode": 1,
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.429333443046102,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.2099206961497198,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.1388888888888889,
												"dt": -0.615
											},
											"nextHandle": {
												"dv": -0.043250236625664115,
												"dt": 0.19151204777844172
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "SlashContraste",
					"scaleX": 4.2,
					"scaleY": 4.2,
					"scaleZ": 4.2,
					"rotationX": 54.4,
					"rotationY": -23.30000000000001,
					"rotationZ": 6.400000000000002,
					"kind": 1,
					"args": [
						24,
						229.09,
						0.57,
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
									"culling": "None",
									"colorMask": 255
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square02.jpg",
								"onDecal": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4515208894384699,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4617246443810017,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.4958875719578584,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5060913269003886,
											"value": 0.016666666666666663,
											"mode": 2
										},
										{
											"time": 1.5366435152210225,
											"value": 0,
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
									0.058823529411764705,
									0.058823529411764705,
									0.058823529411764705
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
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.056896387643721624,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.0772718818968174,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
								"useSourceUVs": false,
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
									1,
									0
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
									"keyMode": 1,
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.019495536960616868,
												"dt": -0.49970960337454456
											},
											"nextHandle": {
												"dv": 0.01736111111111105,
												"dt": 0.445
											}
										},
										{
											"time": 0.45994470787369557,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.2099206961497198,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.1388888888888889,
												"dt": -0.615
											},
											"nextHandle": {
												"dv": -0.043250236625664115,
												"dt": 0.19151204777844172
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
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.27,
								"saturation": 1,
								"width": 0.44,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								],
								"uvScaleSpeed": [
									0,
									0
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "polygon",
					"name": "SlashImpact",
					"scaleX": 4.2,
					"scaleY": 4.2,
					"scaleZ": 4.2,
					"rotationX": 54.4,
					"rotationY": -23.300000000000004,
					"rotationZ": 6.400000000000001,
					"kind": 1,
					"args": [
						24,
						229.09,
						0.57,
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
									"culling": "None",
									"colorMask": 255,
									"emissive": 3
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 1
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": true,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 1,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square02.jpg",
								"onDecal": false
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4719283993235319,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4821321542660628,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5162950818429197,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.52649883678545,
											"value": 0.016666666666666663,
											"mode": 2
										},
										{
											"time": 1.5366435152210225,
											"value": 0,
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.7,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": true
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
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.056896387643721624,
											"value": -2.425986213684083,
											"mode": 2
										},
										{
											"time": 1.0772718818968174,
											"value": 1.067704238891602,
											"mode": 0,
											"prevHandle": {
												"dv": 2.220446049250313e-16,
												"dt": -0.5599999999999999
											},
											"nextHandle": {
												"dv": -9.460471999616726e-16,
												"dt": 0.3316719842180907
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
								"useSourceUVs": false,
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
									1,
									0
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
									"keyMode": 1,
									"keys": [
										{
											"time": -0.10818588116757355,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.04818175693045633,
												"dt": -0.49954845585497076
											},
											"nextHandle": {
												"dv": -0.03472222222222221,
												"dt": 0.36
											}
										},
										{
											"time": 0.429333443046102,
											"value": 1.0416666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9895833333333335,
												"dt": -0.04999999999999993
											},
											"nextHandle": {
												"dv": -1.0069444444444446,
												"dt": 0.05500000000000005
											}
										},
										{
											"time": 1.2099206961497198,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.1388888888888889,
												"dt": -0.615
											},
											"nextHandle": {
												"dv": -0.043250236625664115,
												"dt": 0.19151204777844172
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