{
	"type": "fx",
	"cullingRadius": 0,
	"children": [
		{
			"type": "object",
			"name": "group",
			"enabled": false,
			"x": 0.011685,
			"y": -0.055165,
			"z": 1.4640449999999998,
			"children": [
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 1
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
									"mode": 2
								},
								{
									"time": 0.35000000000000003,
									"value": 0.75,
									"mode": 0,
									"prevHandle": {
										"dv": -0.25,
										"dt": -0.18500000000000005
									},
									"nextHandle": {
										"dv": 0.21729853154995651,
										"dt": 0.1608009133469679
									}
								},
								{
									"time": 0.9249999999999999,
									"value": 0.9791666666666666,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.19166666666666665
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5833333333333335
									}
								},
								{
									"time": 2.555,
									"value": 0.3020833333333333,
									"mode": 0,
									"prevHandle": {
										"dv": 0.22916666666666663,
										"dt": -0.5449999999999999
									},
									"nextHandle": {
										"dv": -0.18204510539513763,
										"dt": 0.432936359739708
									}
								},
								{
									"time": 4,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc_LittleWave",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_3.fbx",
					"x": -0.0233729719447835,
					"y": 0.11032657967356894,
					"scaleX": 20.00000000000003,
					"scaleY": 20.00000000000003,
					"scaleZ": 20,
					"rotationZ": 163.82,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/waveNormal2.jpg",
							"materialName": "any",
							"color": [
								1,
								1,
								1,
								0.7019607843137254
							]
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
								"alpha": 0.77,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": false,
								"wrap": true,
								"progress": 0.69,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.05,
									-0.05
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.38,
											"value": 0.5499999999999999,
											"mode": 2
										},
										{
											"time": 1.06,
											"value": 0.9199999999999999,
											"mode": 2
										},
										{
											"time": 1.6099999999999999,
											"value": 0.5599999999999999,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
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
								"shiftY": 0,
								"shiftSpeedX": 0.002,
								"shiftSpeedY": -0.02
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
								"power": 2
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc_Distort",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_3.fbx",
					"x": -0.0233729719447835,
					"y": 0.11032657967356894,
					"scaleX": 35.000000000000036,
					"scaleY": 35.000000000000036,
					"scaleZ": 20,
					"rotationZ": 163.82,
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
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png",
							"materialName": "any"
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
								"alpha": 0.71,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
							"props": {
								"amount": 0.8,
								"color": [
									0.8745098039215686,
									0.5215686274509804,
									0.24313725490196078
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
								"progress": 0.58,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.05,
									-0.2
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.31000000000000005,
											"value": 0.7277777777777771,
											"mode": 2
										},
										{
											"time": 0.6799999999999999,
											"value": 0.9431018518518519,
											"mode": 2
										},
										{
											"time": 0.97,
											"value": 0.767777777777777,
											"mode": 2
										},
										{
											"time": 1.305,
											"value": 0.9631018518518519,
											"mode": 2
										},
										{
											"time": 1.8099999999999996,
											"value": 0.7377777777777771,
											"mode": 2
										},
										{
											"time": 2.295,
											"value": 0.9631018518518519,
											"mode": 2
										},
										{
											"time": 2.6299999999999994,
											"value": 0.777777777777777,
											"mode": 2
										},
										{
											"time": 2.995,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "width",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.31000000000000005,
											"value": 0.7277777777777771,
											"mode": 2
										},
										{
											"time": 0.6799999999999999,
											"value": 0.9431018518518519,
											"mode": 2
										},
										{
											"time": 0.97,
											"value": 0.767777777777777,
											"mode": 2
										},
										{
											"time": 1.305,
											"value": 0.9631018518518519,
											"mode": 2
										},
										{
											"time": 1.8099999999999996,
											"value": 0.7377777777777771,
											"mode": 2
										},
										{
											"time": 2.295,
											"value": 0.9631018518518519,
											"mode": 2
										},
										{
											"time": 2.6299999999999994,
											"value": 0.777777777777777,
											"mode": 2
										},
										{
											"time": 2.995,
											"value": 1,
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
								"scaleX": 2,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": -0.03
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
								"power": 2
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DistortionMap",
							"source": "shaders/DistortionMap.hx",
							"props": {
								"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
								"intensity": 0.04
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc_BigSand_2",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_3.fbx",
					"x": -0.0233729719447835,
					"y": 0.11032657967356894,
					"scaleX": 40,
					"scaleY": 40,
					"scaleZ": 40,
					"rotationZ": -179.5,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png",
							"materialName": "any",
							"color": [
								1,
								1,
								1,
								0.6784313725490196
							]
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
								"alpha": 0.83,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
							"props": {
								"amount": 0.8,
								"color": [
									0.8745098039215686,
									0.5215686274509804,
									0.24313725490196078
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
								"useScale": false,
								"wrap": true,
								"progress": 0.58,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/Wave_01.jpg",
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.74,
											"value": 0.28528659976010085,
											"mode": 2
										},
										{
											"time": 1.665,
											"value": 0.9731728133153568,
											"mode": 2
										},
										{
											"time": 2.4400000000000004,
											"value": 0.2731728133153568,
											"mode": 2
										},
										{
											"time": 2.995,
											"value": 1,
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
								"scaleX": 2,
								"scaleY": 2,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": -0.01,
								"shiftSpeedY": 0.01
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
								"power": 2
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc_Wave",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_3.fbx",
					"x": -0.0233729719447835,
					"y": 0.11032657967356894,
					"scaleX": 39.99999999999999,
					"scaleY": 39.99999999999999,
					"scaleZ": 20,
					"rotationZ": 163.79999999999998,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/waveNormal.jpg",
							"materialName": "any",
							"color": [
								1,
								1,
								1,
								0.7490196078431373
							]
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
								"alpha": 0.71,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
							"props": {
								"amount": 0.8,
								"color": [
									0.8745098039215686,
									0.5215686274509804,
									0.24313725490196078
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
								"useScale": false,
								"wrap": true,
								"progress": 0.67,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.05,
									-0.2
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.28500000000000003,
											"value": 0.51,
											"mode": 2
										},
										{
											"time": 0.6699999999999999,
											"value": 0.8999999999999999,
											"mode": 2
										},
										{
											"time": 0.945,
											"value": 0.5499999999999999,
											"mode": 2
										},
										{
											"time": 1.295,
											"value": 0.9199999999999999,
											"mode": 2
										},
										{
											"time": 1.785,
											"value": 0.52,
											"mode": 2
										},
										{
											"time": 2.285,
											"value": 0.9199999999999999,
											"mode": 2
										},
										{
											"time": 2.605,
											"value": 0.5599999999999999,
											"mode": 2
										},
										{
											"time": 2.995,
											"value": 1,
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
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": -0.02
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
								"power": 2
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "FX_Mesh_Disc_BigSand",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_3.fbx",
					"x": 0.093491887779134,
					"y": -0.4413063186942757,
					"z": 2.220446049250313e-16,
					"scaleX": 35.00000000000003,
					"scaleY": 35.00000000000003,
					"scaleZ": 35,
					"rotationZ": 171.99999999999997,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "Forward",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/water-normal.png",
							"materialName": "any",
							"color": [
								1,
								1,
								1,
								0.6313725490196078
							]
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
								"alpha": 0.83,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
							"props": {
								"amount": 0.8,
								"color": [
									0.8745098039215686,
									0.5215686274509804,
									0.24313725490196078
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
								"useScale": false,
								"wrap": true,
								"progress": 0.59,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/perlin2.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.1,
									-0.1
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.49000000000000005,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.125
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.13166666666666663
											}
										},
										{
											"time": 1.595,
											"value": 0.34585553198382113,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10499999999999998
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.14500000000000002
											}
										},
										{
											"time": 3.2248046875000007,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.14500000000000002
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.11333333333333336
											}
										},
										{
											"time": 3.9865527343750005,
											"value": 1,
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
								"shiftY": 0,
								"shiftSpeedX": 0.01,
								"shiftSpeedY": -0.01
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
								"power": 2
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "shader",
					"name": "sandColor",
					"source": "shaders/ColorMult.hx",
					"props": {
						"amount": 1,
						"color": [
							0.8196078431372549,
							0.6980392156862745,
							0.4588235294117647
						]
					},
					"isInstance": true
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.1,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "model",
					"name": "FX_Mesh_Disc",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign_4.fbx",
					"z": -0.39341,
					"scaleX": 150,
					"scaleY": 150,
					"scaleZ": 150,
					"rotationZ": -180,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "DecalPass",
									"blend": "Alpha",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"parallax": 0,
									"alphaKill": false,
									"textureWrap": true,
									"culling": "None"
								}
							},
							"wrapRepeat": true,
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"materialName": "any",
							"mainPassName": "decal"
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
								"alpha": 2.5,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"wrap": true,
								"invert": true,
								"replace": false,
								"alpha": 1.2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 3,
								"scaleY": 3,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0.006,
								"shiftSpeedY": 0
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
								"progress": 0.23,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0.08,
									0
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
								"useScale": false,
								"wrap": true,
								"progress": 0.23,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand_gaussian.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.08,
									0
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
							"name": "VertexDisplacement",
							"source": "shaders/VertexDisplacement.hx",
							"props": {
								"X": true,
								"Y": true,
								"Z": true,
								"texScaleX": 1,
								"texScaleY": 1,
								"tex": "Fx/Alphas/sand_gaussian.png",
								"intensity": 1,
								"scrollSpeed": [
									0,
									0.05
								]
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "intensity",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 2,
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
											"time": 4,
											"value": 0.5,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleX",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 2
										},
										{
											"time": 1.5,
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
											"time": 3,
											"value": 0.8,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "texScaleY",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.5,
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
											"time": 3,
											"value": 0.9,
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
								"range": 1,
								"power": 0.5
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "polygon",
					"name": "polygon",
					"editorOnly": true,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				}
			]
		}
	]
}