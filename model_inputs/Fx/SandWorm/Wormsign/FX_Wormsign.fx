{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.3999999999999999,
			"scaleX": 0.5,
			"scaleY": 0.5,
			"scaleZ": 0.5,
			"children": [
				{
					"type": "model",
					"name": "FX_Mesh_Disc_LittleWave",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.3999999999999999,
					"scaleX": 40.00000000000003,
					"scaleY": 40.00000000000003,
					"scaleZ": 40,
					"rotationZ": 81.82,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
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
								0.5215686274509804
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
								"texture": "Fx/Gradients/Cyl07u_A.png",
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
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.20500000000000002,
											"value": 0.51,
											"mode": 2
										},
										{
											"time": 0.41000000000000003,
											"value": 0.8999999999999999,
											"mode": 2
										},
										{
											"time": 0.615,
											"value": 0.5499999999999999,
											"mode": 2
										},
										{
											"time": 0.885,
											"value": 0.9199999999999999,
											"mode": 2
										},
										{
											"time": 1.1099999999999999,
											"value": 0.52,
											"mode": 2
										},
										{
											"time": 1.3299999999999998,
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
								"scaleX": 2,
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
					"name": "FX_Mesh_Disc_Wave",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"x": 1.0599999999999998,
					"y": 0.385,
					"z": 0.3999999999999999,
					"scaleX": 85,
					"scaleY": 85,
					"scaleZ": 40,
					"rotationZ": 81.8,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
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
								"texture": "Fx/Gradients/Gradient_Spotlight.png",
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
					"name": "FX_Mesh_Disc_LittleSand",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.3999999999999999,
					"scaleX": 20,
					"scaleY": 20,
					"scaleZ": 40,
					"rotationZ": 125.45000000000002,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
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
								0.32941176470588235
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
								"alpha": 0.8,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl07u_A.png",
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
								"progress": 0.7,
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
											"time": 0.255,
											"value": 0.29817281331535683,
											"mode": 2
										},
										{
											"time": 0.48500000000000004,
											"value": 0.8731728133153569,
											"mode": 2
										},
										{
											"time": 0.76,
											"value": 0.38567281331535685,
											"mode": 2
										},
										{
											"time": 0.99,
											"value": 0.9731728133153568,
											"mode": 2
										},
										{
											"time": 1.265,
											"value": 0.31067281331535684,
											"mode": 2
										},
										{
											"time": 1.53,
											"value": 0.8356728133153568,
											"mode": 2
										},
										{
											"time": 1.795,
											"value": 0.2731728133153568,
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
								"scaleX": 2,
								"scaleY": 1,
								"shiftX": 0,
								"shiftY": 0,
								"shiftSpeedX": 0,
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
					"type": "model",
					"name": "FX_Mesh_Disc_BigSand",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.3999999999999999,
					"scaleX": 70,
					"scaleY": 70,
					"scaleZ": 70,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
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
								0.3803921568627451
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
								"uScale": 3,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl07u_A.png",
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
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/perlin2.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.1,
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
											"time": 2.5100000000000002,
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
								"scaleX": 3,
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
					"type": "model",
					"name": "FX_Mesh_Disc_BigSand_2",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.3999999999999999,
					"scaleX": 70,
					"scaleY": 70,
					"scaleZ": 70,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
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
								0.32156862745098036
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
								"uScale": 3,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/Cyl07u_A.png",
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
								"progress": 0.68,
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
								"scaleY": 1,
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
					"name": "FX_Mesh_Disc_Distort",
					"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
					"z": 0.3999999999999999,
					"scaleX": 70.00000000000003,
					"scaleY": 70.00000000000003,
					"scaleZ": 40,
					"rotationZ": 81.82,
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
								"texture": "Fx/Gradients/Gradient_Spotlight.png",
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
								"intensity": 0.03
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}