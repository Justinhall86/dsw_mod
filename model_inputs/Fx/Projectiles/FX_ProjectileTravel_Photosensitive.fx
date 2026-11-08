{
	"type": "fx",
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"children": [
				{
					"type": "model",
					"name": "Reactor_Little",
					"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
					"x": -0.7759400000000001,
					"y": -1.722932907455288e-16,
					"scaleX": 0.8360000000000001,
					"scaleY": 0.8360000000000001,
					"scaleZ": 2.7390000000000003,
					"rotationY": -89.99999999999999,
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
									"emissive": 0.5
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
								"progress": 0.2,
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
								"amount": 0.87,
								"color": [
									0.16470588235294117,
									0.2784313725490196,
									1
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "halphSphere",
					"source": "Fx/Meshes_Common/Missile.fbx",
					"scaleX": 0.33,
					"scaleY": 0.33,
					"scaleZ": 0.33,
					"rotationZ": 90.00000000000001,
					"children": [
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "PBR",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Back",
									"colorMask": 255,
									"depthTest": "LessEqual"
								}
							}
						},
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
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": -0.0050000000000000044,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.039999999999999994,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.03847676217770362,
												"dt": -0.03334652722067646
											},
											"nextHandle": {
												"dv": -0.5333333333333333,
												"dt": 0.4617283950617284
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.41135802469135807
											},
											"nextHandle": {
												"dv": 0.012980169199833783,
												"dt": 0.3199852081262777
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0.27450980392156865,
									0.20392156862745098,
									0.1568627450980392
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": false,
								"bias": 0.1,
								"scale": 1,
								"power": 1,
								"color": [
									1,
									0.11764705882352941,
									0
								]
							}
						}
					]
				},
				{
					"type": "shader",
					"name": "NightEmissive",
					"source": "shaders/NightEmissive.hx",
					"props": {
						"amount": 0.75,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				},
				{
					"type": "model",
					"name": "Reactor_Little",
					"source": "Fx/Meshes_Common/CylinderCone_BottomPiv.fbx",
					"x": -1.43876,
					"scaleX": 1.02,
					"scaleY": 1.02,
					"scaleZ": 2.6,
					"rotationY": -90,
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
									"emissive": 1
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
								"progress": 0.12,
								"saturation": 1,
								"width": 0.59,
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
								"progress": 0.24,
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
									1,
									0.27058823529411763,
									0.0784313725490196
								]
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}