{
	"type": "fx",
	"cullingRadius": 0,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Soft_Template",
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0.2,
						"randomColor1": [
							1,
							1,
							1,
							0.7803921568627451
						],
						"randomColor2": [
							0.9215686274509803,
							0.9215686274509803,
							0.9215686274509803,
							0.27058823529411763
						],
						"emitAngle": 0,
						"emitRate": 1,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"useRandomColor": true,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png"
					},
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 3
									},
									"isInstance": true
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
											"keyMode": 0,
											"keys": [
												{
													"time": -0.0050000000000000044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.05,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008786899796430459,
														"dt": -0.03490382642970474
													},
													"nextHandle": {
														"dv": -0.22055555555555562,
														"dt": 0.8749999999999999
													}
												},
												{
													"time": 0.95,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7725490196078432,
											0.7725490196078432,
											0.7725490196078432
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0.3,
										"power": 1
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/perlin2.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0
										],
										"uvScaleSpeed": [
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.8483515290485304,
														"dt": -0.43041364341432775
													},
													"nextHandle": {
														"dv": -1.1333333333333333,
														"dt": 0.575
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "Level",
									"source": "shaders/Level.hx",
									"enabled": false,
									"props": {
										"levelMin": 0.5,
										"levelMax": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.73,
									"dirIntensity": 0.68,
									"dirSpan": 0.75,
									"envBlend": 0.5,
									"envColorSet": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.030499999999999996,
									"value": 0.7015973422238919,
									"mode": 2
								},
								{
									"time": 0.10642857142857144,
									"value": 0.9482369146005512,
									"mode": 0,
									"prevHandle": {
										"dv": -0.10685270825476992,
										"dt": -0.08805109354652937
									},
									"nextHandle": {
										"dv": 0.38204884426652885,
										"dt": 0.31357142857142856
									}
								},
								{
									"time": 1,
									"value": 1.3869709475957928,
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