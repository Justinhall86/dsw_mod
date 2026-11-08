{
	"type": "fx",
	"cullingRadius": 10,
	"blendFactor": 1,
	"children": [
		{
			"type": "model",
			"name": "Railgun",
			"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
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
			"name": "FXRoot",
			"y": -0.10452,
			"z": -2.53592,
			"rotationX": -90,
			"children": [
				{
					"type": "object",
					"name": "Reactor",
					"y": -1,
					"children": [
						{
							"type": "trails",
							"name": "trails_R",
							"x": 1.25526,
							"y": -0.25349,
							"z": 0.04928,
							"startWidth": 0.25,
							"minSpeed": 3,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
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
											0,
											0.2627450980392157,
											0.45098039215686275
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_L",
							"x": -1.25526,
							"y": -0.25349,
							"z": 0.04928,
							"startWidth": 0.25,
							"minSpeed": 3,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
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
											0,
											0.2627450980392157,
											0.45098039215686275
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_Middle",
							"y": 0.7359120000000003,
							"z": -0.19713600000000003,
							"rotationZ": -89.99999999999999,
							"startWidth": 0.25,
							"lifetime": 1.5,
							"minSpeed": 3,
							"maxSpeed": 100,
							"uvRepeat": "EClamp",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.01,
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
											0,
											0.2627450980392157,
											0.45098039215686275
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_R",
							"x": 1.2552600000000003,
							"y": -0.18397799999999997,
							"z": 0.04928400000000001,
							"rotationX": -78.9,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
									"y": 0.00596,
									"scaleX": 0.35,
									"scaleY": 1.28,
									"scaleZ": 0.7,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
									"y": 0.00596,
									"scaleX": 0.45,
									"scaleY": 1.65,
									"scaleZ": 1.1,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor_L",
							"x": -1.2552599999999998,
							"y": -0.18397799999999975,
							"z": 0.04928400000000001,
							"rotationX": -78.9,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
									"y": 0.00596,
									"scaleX": 0.35,
									"scaleY": 1.28,
									"scaleZ": 0.7,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/Reactor_TaperedRectangle.fbx",
									"y": 0.00596,
									"scaleX": 0.45,
									"scaleY": 1.65,
									"scaleZ": 1.1,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Reactor",
							"y": 0.7359120000000003,
							"z": -0.19713600000000003,
							"scaleX": 0.36000000000000004,
							"scaleY": 0.5,
							"scaleZ": 0.6800000000000002,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "Reactor_Little",
									"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
									"z": 0.17419,
									"scaleX": 2.6,
									"scaleY": 0.87,
									"scaleZ": 2.3,
									"rotationX": 90,
									"rotationZ": -90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 1.8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.7,
												"uvScaleY": 0.7,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													3,
													2
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.3529411764705882,
													0.9921568627450981
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Reactor_Big",
									"source": "Fx/Meshes_Common/Reactor_rectangle.fbx",
									"z": 0.17419,
									"scaleX": 3,
									"scaleZ": 3.4,
									"rotationX": 90,
									"rotationZ": -90,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 1,
												"width": 0.2,
												"uvScaleX": 0.6,
												"uvScaleY": 0.6,
												"texture": "Fx/noise/T_Noise_Voronoi_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1.5,
													1
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
												"progress": 0.32,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": -1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													-0.01
												],
												"uvShiftSpeed": [
													2,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.2,
													0.5568627450980392
												]
											},
											"isInstance": true
										},
										{
											"type": "object",
											"name": "group"
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
			"type": "constraint",
			"name": "constraint",
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Railgun.root.JNT_Root"
		}
	]
}