{
	"type": "fx",
	"duration": 66,
	"cullingRadius": 300,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 500,
			"scaleY": 500,
			"scaleZ": 500,
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
			"rotationZ": -45,
			"children": [
				{
					"type": "advancedDecal",
					"name": "advancedDecal_floor",
					"scaleX": 240,
					"scaleY": 240,
					"scaleZ": 168,
					"rotationZ": -89.99999999999999,
					"albedoMap": "Fx/Alphas/T_OrbitalStrike_04.png",
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.08235294117647059,
									0.058823529411764705,
									0.047058823529411764
								]
							}
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
											"mode": 0,
											"prevHandle": {
												"dv": 8.785944329274772e-17,
												"dt": -0.5000181935461755
											},
											"nextHandle": {
												"dv": 0.0013373516586964729,
												"dt": 0.3655502669221128
											}
										},
										{
											"time": 5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 62.99828286248051,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.4244094111906766e-16,
												"dt": -1.007205154020468
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.632265043519439
											}
										},
										{
											"time": 65.99828286248051,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.4482074169814574
											},
											"nextHandle": {
												"dv": -2.828439480288303e-16,
												"dt": 1
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "UVDistortion",
							"source": "shaders/UVDistortion.hx",
							"props": {
								"noiseTexture": "Fx/noise/FireAlpha.png",
								"directionalNoise": false,
								"intensity": 0.0025,
								"scrollSpeed": [
									0,
									-0.75
								],
								"scale": [
									4,
									4
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "intensity",
									"keys": [
										{
											"time": 1.5,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.5427335466892895,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.4,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0,
									"value": 1.25,
									"mode": 2
								},
								{
									"time": 12,
									"value": 1.2,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0016955869240642407,
										"dt": -3.79612862908402
									},
									"nextHandle": {
										"dv": -1.9942103762197622e-16,
										"dt": 20.016967827023407
									}
								},
								{
									"time": 53,
									"value": 1.2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -13.666666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 4.327683860742724
									}
								},
								{
									"time": 65.98305158222817,
									"value": 1.25,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": -75,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.9858384172116521
									}
								},
								{
									"time": 65,
									"value": 70,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1
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